<?php
ob_start(); // Thêm hàm này để gom bộ đệm, phòng hờ các khoảng trắng thừa
session_start();
include 'includes/db.php';

// XỬ LÝ CHUYỂN HƯỚNG NẾU KHÔNG CÓ ID (Lúc này chưa có HTML)
if (!isset($_GET['id'])) {
    header("Location: forum.php");
    exit();
}

$topic_id = intval($_GET['id']);
$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : 0;

// --- HÀM TỰ ĐỘNG DÒ TÌM ĐƯỜNG DẪN ẢNH ---
function get_image_url($filename) {
    if (empty($filename)) return "";
    $possible_paths = [
        "assets/uploads/forum/" . $filename,
        "uploads/" . $filename,
        "admin/uploads/" . $filename
    ];
    foreach ($possible_paths as $path) {
        if (file_exists($path)) return $path;
    }
    return ""; 
}

// 1. XỬ LÝ GỬI TRẢ LỜI (Được đặt ở đây, TRƯỚC khi in ra HTML)
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['reply_content'])) {
    if(!isset($_SESSION['user_id'])){
        echo "<script>alert('Bạn cần đăng nhập để trả lời!'); window.location.href='login.php';</script>";
        exit();
    }
    // Dùng htmlspecialchars để mã hóa code HTML thành văn bản an toàn
    $content = htmlspecialchars($_POST['reply_content']);
    if(!empty($content)){
        $my_uid = $_SESSION['user_id'];
        $sql_insert = "INSERT INTO forum_replies (topic_id, user_id, content, created_at) VALUES ('$topic_id', '$my_uid', '$content', NOW())";
        $conn->query($sql_insert);
        
        // Chuyển hướng thành công vì chưa có file giao diện nào được include
        header("Location: forum_view.php?id=$topic_id");
        exit();
    }
}

// 2. LẤY THÔNG TIN CHỦ ĐỀ
$sql_topic = "SELECT t.*, u.name FROM forum_topics t JOIN users u ON t.user_id = u.id WHERE t.id = $topic_id";
$res_topic = $conn->query($sql_topic);
$topic = $res_topic->fetch_assoc();


include 'includes/header.php'; 

if(!$topic) {
    echo "<div class='container mt-5 alert alert-danger'>Bài viết không tồn tại.</div>";
    include 'includes/footer.php';
    exit();
}


$display_title = $topic['title'];
$display_content = isset($topic['content']) ? $topic['content'] : ""; 
?>

<div class="container mt-4 mb-5">
    <a href="forum.php" class="btn btn-outline-secondary mb-3 rounded-pill fw-bold">
        <i class="bi bi-arrow-left me-2"></i>Quay lại diễn đàn
    </a>

    <div class="card shadow-sm border-primary mb-4">
        <div class="card-header bg-primary text-white py-3">
            <h4 class="mb-0 fw-bold"><?php echo $display_title; ?></h4>
        </div>
        <div class="card-body p-4">
            <div class="d-flex align-items-center mb-4 pb-3 border-bottom">
                <img src="https://ui-avatars.com/api/?name=<?php echo $topic['name']; ?>&background=random" class="rounded-circle me-3" width="50" height="50">
                <div>
                    <div class="fw-bold fs-5"><?php echo $topic['name']; ?></div>
                    <div class="text-muted small"><i class="bi bi-clock me-1"></i><?php echo date('H:i d/m/Y', strtotime($topic['created_at'])); ?></div>
                </div>
            </div>

            <div class="card-text fs-5 mb-4" style="white-space: pre-wrap;"><?php echo $display_content; ?></div>

            <div class="row g-2 mt-3 mb-3">
                <?php 
                // 1. Kiểm tra ảnh từ bảng forum_topics (Mới)
                if (!empty($topic['image'])) {
                    $img_url = get_image_url($topic['image']);
                    if (!empty($img_url)) {
                        echo '<div class="col-12"><hr><h6 class="fw-bold text-secondary mb-3"><i class="fas fa-paperclip me-2"></i>Tệp đính kèm:</h6>';
                        $ext = strtolower(pathinfo($img_url, PATHINFO_EXTENSION));
                        if(in_array($ext, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
                            echo '<img src="'.$img_url.'" class="img-fluid rounded border shadow-sm" style="max-height:500px; cursor:pointer;" onclick="window.open(this.src)" title="Bấm để xem ảnh lớn">';
                        } else {
                            echo '<a href="'.$img_url.'" class="btn btn-primary fw-bold" download><i class="bi bi-download me-2"></i>Tải xuống tệp đính kèm</a>';
                        }
                        echo '</div>';
                    }
                }
                
                // 2. Kiểm tra ảnh từ bảng forum_images (Cũ)
                $sql_images = "SELECT * FROM forum_images WHERE topic_id = $topic_id";
                $res_images = $conn->query($sql_images);
                if ($res_images && $res_images->num_rows > 0) {
                    echo '<div class="col-12 mt-3"><h6 class="fw-bold text-secondary"><i class="fas fa-images me-2"></i> Nhấp vào hình ảnh để được hiển thị đầy đủ:</h6></div>';
                    while ($img = $res_images->fetch_assoc()) {
                        $img_url_old = get_image_url($img['image_path']);
                        if (!empty($img_url_old)) {
                            echo '<div class="col-6 col-md-4"><img src="'.$img_url_old.'" class="img-fluid rounded border shadow-sm w-100" style="height: 200px; object-fit: cover; cursor: pointer;" onclick="window.open(this.src)"></div>';
                        }
                    }
                }
                ?>
            </div>
            <hr>
            
            <?php
            $sql_count_like = "SELECT COUNT(*) as total FROM forum_likes WHERE topic_id = $topic_id";
            $res_count = $conn->query($sql_count_like);
            $total_likes = $res_count ? $res_count->fetch_assoc()['total'] : 0;

            $is_liked = false;
            if(isset($_SESSION['user_id'])){
                $my_id = $_SESSION['user_id'];
                $sql_check_me = "SELECT * FROM forum_likes WHERE topic_id = $topic_id AND user_id = $my_id";
                $res_check = $conn->query($sql_check_me);
                if($res_check && $res_check->num_rows > 0) $is_liked = true;
            }
            ?>

            <div class="d-flex align-items-center mt-3">
                <?php if(isset($_SESSION['user_id'])): ?>
                    <a href="forum_like.php?id=<?php echo $topic_id; ?>" class="text-decoration-none me-3">
                        <button class="btn <?php echo $is_liked ? 'btn-danger' : 'btn-outline-danger'; ?> rounded-pill px-4 fw-bold">
                            <i class="bi bi-heart<?php echo $is_liked ? '-fill' : ''; ?> me-1"></i> 
                            <?php echo $is_liked ? 'Đã thích' : 'Thả tim'; ?>
                        </button>
                    </a>
                <?php else: ?>
                    <button class="btn btn-outline-secondary rounded-pill me-3" disabled>🤍 Đăng nhập để thích</button>
                <?php endif; ?>
                
                <span class="fw-bold text-muted">
                    <?php echo $total_likes; ?> người yêu thích
                </span>
            </div>
        </div>
    </div>

    <h5 class="text-primary fw-bold border-bottom pb-2 mb-4"><i class="bi bi-chat-text-fill me-2"></i>Bình luận & Thảo luận</h5>

    <?php
    $sql_replies = "SELECT r.*, u.name FROM forum_replies r JOIN users u ON r.user_id = u.id WHERE r.topic_id = $topic_id ORDER BY r.created_at ASC";
    $res_replies = $conn->query($sql_replies);

    if($res_replies && $res_replies->num_rows > 0){
        while($rep = $res_replies->fetch_assoc()){
        
            $reply_content = $rep['content']; 
    ?>
        <div class="d-flex mb-3">
            <img src="https://ui-avatars.com/api/?name=<?php echo $rep['name']; ?>&background=random" class="rounded-circle me-3" width="45" height="45">
            <div class="card w-100 border-0 bg-light shadow-sm">
                <div class="card-body py-2 px-3">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <strong class="text-dark"><?php echo $rep['name']; ?></strong>
                        <small class="text-muted" style="font-size: 0.8rem;"><?php echo date('H:i d/m/Y', strtotime($rep['created_at'])); ?></small>
                    </div>
                    <p class="mb-0 text-secondary"><?php echo nl2br($reply_content); ?></p>
                </div>
            </div>
        </div>
    <?php 
        } 
    } else {
        echo "<div class='alert alert-light border text-center'>Chưa có bình luận nào.</div>";
    }
    ?>

    <?php if(isset($_SESSION['user_id'])): ?>
    <div class="card mt-4 shadow-sm border-0">
        <div class="card-body bg-light rounded">
            <h6 class="fw-bold mb-3"><i class="bi bi-pencil-fill me-2"></i>Viết câu trả lời:</h6>
            <form method="POST">
                <textarea name="reply_content" class="form-control mb-3 shadow-sm" rows="3" required placeholder="Nhập nội dung..."></textarea>
                <div class="text-end">
                    <button type="submit" class="btn btn-primary fw-bold px-4 rounded-pill">
                        <i class="bi bi-send-fill me-2"></i>Gửi trả lời
                    </button>
                </div>
            </form>
        </div>
    </div>
    <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>