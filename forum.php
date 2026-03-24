<?php
session_start();
include 'includes/db.php';

// Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// ======================================================
// 1. XỬ LÝ TẠO CHỦ ĐỀ (HỖ TRỢ NHIỀU FILE CÙNG LÚC)
// ======================================================
if (isset($_POST['create_topic'])) {
    $title = htmlspecialchars($_POST['topic_title']);
    $content = isset($_POST['topic_content']) ? htmlspecialchars($_POST['topic_content']) : "";
    
    // BƯỚC 1: Tạo chủ đề trong bảng chính trước (forum_topics)
    // Lưu ý: Bảng này chỉ lưu nội dung bài viết, không lưu tên ảnh nữa
    $stmt = $conn->prepare("INSERT INTO forum_topics (title, content, user_id, created_at) VALUES (?, ?, ?, NOW())");
    $stmt->bind_param("ssi", $title, $content, $user_id);
    
    if ($stmt->execute()) {
        $new_topic_id = $conn->insert_id; // Lấy ID của chủ đề vừa tạo

        // BƯỚC 2: Xử lý vòng lặp để Upload NHIỀU file vào bảng phụ (forum_images)
        if (isset($_FILES['topic_files'])) {
            $total_files = count($_FILES['topic_files']['name']);
            
            // Đường dẫn lưu ảnh (Khớp với đường dẫn bạn thấy trong Database)
            $target_dir = "assets/uploads/forum/"; 
            
            // Tạo thư mục nếu chưa có
            if (!file_exists($target_dir)) { mkdir($target_dir, 0777, true); }

            // Duyệt qua từng file user đã chọn
            for ($i = 0; $i < $total_files; $i++) {
                // Kiểm tra nếu file không lỗi và có tên file
                if ($_FILES['topic_files']['error'][$i] == 0 && !empty($_FILES['topic_files']['name'][$i])) {
                    
                    // Tạo tên file duy nhất: time_index_tenfile
                    $filename = time() . "_" . $i . "_" . basename($_FILES['topic_files']['name'][$i]);
                    $target_file = $target_dir . $filename;
                    
                    // Di chuyển file vào thư mục upload
                    if(move_uploaded_file($_FILES['topic_files']['tmp_name'][$i], $target_file)){
                        // Lưu tên file vào bảng forum_images
                        $stmt_img = $conn->prepare("INSERT INTO forum_images (topic_id, image_path) VALUES (?, ?)");
                        $stmt_img->bind_param("is", $new_topic_id, $filename);
                        $stmt_img->execute();
                        $stmt_img->close();
                    }
                }
            }
        }
        header("Location: forum.php");
        exit();
    } else {
        echo "<script>alert('Lỗi khi tạo chủ đề: " . $stmt->error . "');</script>";
    }
}

// ======================================================
// 2. XỬ LÝ CHỈNH SỬA
// ======================================================
if (isset($_POST['edit_topic'])) {
    $topic_id = $_POST['topic_id'];
    $title = htmlspecialchars($_POST['topic_title']);
    $content = htmlspecialchars($_POST['topic_content']);
    
    $check = $conn->query("SELECT user_id FROM forum_topics WHERE id=$topic_id")->fetch_assoc();
    if ($_SESSION['role'] == 'teacher' || $check['user_id'] == $user_id) {
        // Kiểm tra xem bảng có cột content không (đề phòng DB cũ)
        $check_col = $conn->query("SHOW COLUMNS FROM forum_topics LIKE 'content'");
        if($check_col->num_rows > 0) {
            $stmt = $conn->prepare("UPDATE forum_topics SET title = ?, content = ? WHERE id = ?");
            $stmt->bind_param("ssi", $title, $content, $topic_id);
        } else {
            $stmt = $conn->prepare("UPDATE forum_topics SET title = ? WHERE id = ?");
            $stmt->bind_param("si", $title, $topic_id);
        }
        $stmt->execute();
    }
    header("Location: forum.php");
    exit();
}

// ======================================================
// 3. XỬ LÝ XÓA
// ======================================================
if (isset($_GET['delete_id'])) {
    $d_id = intval($_GET['delete_id']);
    $check = $conn->query("SELECT user_id FROM forum_topics WHERE id=$d_id")->fetch_assoc();
    if ($_SESSION['role'] == 'teacher' || $check['user_id'] == $user_id) {
        // Xóa chủ đề chính 
        // (Lưu ý: Nếu trong Database bạn chưa set ON DELETE CASCADE cho khóa ngoại,
        // thì cần xóa forum_images và forum_replies trước khi xóa forum_topics)
        $conn->query("DELETE FROM forum_topics WHERE id=$d_id");
        $conn->query("DELETE FROM forum_replies WHERE topic_id=$d_id");
        $conn->query("DELETE FROM forum_images WHERE topic_id=$d_id");
    }
    header("Location: forum.php");
    exit();
}

include 'includes/header.php';
?>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary fw-bold"><i class="bi bi-chat-dots-fill"></i> Diễn đàn thảo luận</h2>
        <button class="btn btn-success fw-bold shadow-sm" data-bs-toggle="modal" data-bs-target="#addTopicModal">
            <i class="bi bi-plus-lg me-1"></i> Tạo chủ đề mới
        </button>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-header bg-white border-bottom">
            <h5 class="mb-0 fw-bold text-muted">Các chủ đề gần đây</h5>
        </div>
        <div class="list-group list-group-flush">
            <?php
            $sql = "SELECT t.*, u.name FROM forum_topics t 
                    JOIN users u ON t.user_id = u.id 
                    ORDER BY t.created_at DESC";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $topic_id = $row['id'];
                    // Đếm số lượng trả lời
                    $count_res = $conn->query("SELECT COUNT(*) as total FROM forum_replies WHERE topic_id = $topic_id");
                    $count = $count_res ? $count_res->fetch_assoc()['total'] : 0;
                    
                    // Kiểm tra xem bài viết có ảnh không (trong bảng forum_images)
                    $check_img = $conn->query("SELECT id FROM forum_images WHERE topic_id = $topic_id LIMIT 1");
                    $has_images = $check_img && $check_img->num_rows > 0;

                    // Giải mã dấu "" để hiển thị đúng
                    $display_title = htmlspecialchars_decode($row['title']);
                    // Kiểm tra cột content có tồn tại không
                    $display_content = isset($row['content']) ? htmlspecialchars_decode($row['content']) : "";
            ?>
                <div class="list-group-item p-3 list-group-item-action">
                    <div class="d-flex justify-content-between align-items-start">
                        <div class="flex-grow-1">
                            <h5 class="mb-1">
                                <a href="forum_view.php?id=<?php echo $row['id']; ?>" class="text-decoration-none fw-bold text-primary">
                                    <?php echo $display_title; ?>
                                </a>
                                <?php if($has_images): ?>
                                    <i class="bi bi-images text-success ms-1" title="Có hình ảnh đính kèm"></i>
                                <?php endif; ?>
                            </h5>
                            <small class="text-muted">
                                Đăng bởi: <strong><?php echo $row['name']; ?></strong> 
                                • <?php echo date('H:i d/m/Y', strtotime($row['created_at'])); ?>
                            </small>
                        </div>
                        
                        <div class="d-flex align-items-center">
                            <span class="badge bg-secondary rounded-pill me-3"><?php echo $count; ?> trả lời</span>
                            
                            <?php if($_SESSION['user_id'] == $row['user_id'] || $_SESSION['role'] == 'teacher'): ?>
                                <div class="btn-group">
                                    <button class="btn btn-outline-primary btn-sm" 
                                            onclick='openEditModal(<?php echo json_encode([
                                                "id" => $row["id"], 
                                                "title" => $display_title,
                                                "content" => $display_content
                                            ]); ?>)'>
                                        <i class="bi bi-pencil"></i> Sửa
                                    </button>
                                    
                                    <a href="forum.php?delete_id=<?php echo $row['id']; ?>" 
                                       class="btn btn-outline-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc muốn xóa chủ đề này không?');">
                                       <i class="bi bi-trash"></i> Xóa
                                    </a>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            <?php
                }
            } else {
                echo "<div class='p-5 text-center text-muted'>Chưa có chủ đề nào.</div>";
            }
            ?>
        </div>
    </div>
</div>

<div class="modal fade" id="addTopicModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <form method="POST" class="modal-content" enctype="multipart/form-data">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title fw-bold">Thêm chủ đề mới</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label fw-bold">Tiêu đề:</label>
                    <input type="text" name="topic_title" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Nội dung:</label>
                    <textarea name="topic_content" class="form-control" rows="5"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Hình ảnh đính kèm (Chọn nhiều ảnh):</label>
                    <input type="file" name="topic_files[]" class="form-control" multiple accept="image/*">
                    <small class="text-muted">Giữ phím <b>Ctrl</b> để chọn nhiều file cùng lúc.</small>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" name="create_topic" class="btn btn-success fw-bold">Đăng bài</button>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="editTopicModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <form method="POST" class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title fw-bold">Chỉnh sửa chủ đề</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="topic_id" id="edit_id">
                <div class="mb-3">
                    <label class="form-label fw-bold">Tiêu đề:</label>
                    <input type="text" name="topic_title" id="edit_title" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Nội dung (Lưu ý: Không sửa được ảnh đã đăng):</label>
                    <textarea name="topic_content" id="edit_content" class="form-control" rows="5"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" name="edit_topic" class="btn btn-primary fw-bold">Lưu thay đổi</button>
            </div>
        </form>
    </div>
</div>

<?php include 'includes/footer.php'; ?>

<script>
    function openEditModal(data) {
        document.getElementById('edit_id').value = data.id;
        document.getElementById('edit_title').value = data.title;
        document.getElementById('edit_content').value = data.content;
        new bootstrap.Modal(document.getElementById('editTopicModal')).show();
    }
</script>