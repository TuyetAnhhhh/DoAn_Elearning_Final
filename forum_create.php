<?php
session_start();
include 'includes/db.php';

// --- KHÔNG include header ở đây để tránh lỗi chuyển trang ---

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$msg = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = htmlspecialchars($_POST['title']);
    $content = htmlspecialchars($_POST['content']);
    $user_id = $_SESSION['user_id'];

    if(!empty($title) && !empty($content)){
        
        // 1. TẠO BÀI VIẾT TRƯỚC (Để lấy ID bài viết)
        $title_safe = $conn->real_escape_string($title);
        $content_safe = $conn->real_escape_string($content);

        // Lưu ý: Cột 'image' cũ trong bảng forum_topics giờ bỏ trống hoặc dùng làm ảnh đại diện thôi
        $sql = "INSERT INTO forum_topics (user_id, title, content, created_at) 
                VALUES ('$user_id', '$title_safe', '$content_safe', NOW())";

        if ($conn->query($sql) === TRUE) {
            $last_topic_id = $conn->insert_id; // <--- LẤY ID CỦA BÀI VỪA ĐĂNG

            // 2. XỬ LÝ UPLOAD NHIỀU ẢNH
            if (isset($_FILES['topic_image'])) {
                $target_dir = "assets/uploads/forum/";
                if (!file_exists($target_dir)) mkdir($target_dir, 0777, true);

                $countfiles = count($_FILES['topic_image']['name']);

                // Vòng lặp duyệt qua từng file
                for($i = 0; $i < $countfiles; $i++){
                    $filename = $_FILES['topic_image']['name'][$i];
                    
                    // Nếu có file (tên không rỗng)
                    if(!empty($filename)){
                        $new_filename = time() . "_" . $i . "_" . basename($filename); // Thêm số $i để không trùng
                        $target_file = $target_dir . $new_filename;
                        
                        // Upload file
                        if(move_uploaded_file($_FILES['topic_image']['tmp_name'][$i], $target_file)){
                            // Lưu vào bảng forum_images
                            $sql_img = "INSERT INTO forum_images (topic_id, image_path) VALUES ('$last_topic_id', '$new_filename')";
                            $conn->query($sql_img);
                        }
                    }
                }
            }

            echo "<script>alert('Đăng bài thành công!'); window.location.href='forum.php';</script>";
            exit();

        } else {
            $msg = "<div class='alert alert-danger'>Lỗi Database: " . $conn->error . "</div>";
        }
    } else {
        $msg = "<div class='alert alert-danger'>Vui lòng nhập đầy đủ tiêu đề và nội dung.</div>";
    }
}
?>

<?php include 'includes/header.php'; ?>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Tạo chủ đề thảo luận mới</h4>
                </div>
                <div class="card-body">
                    <?php echo $msg; ?>
                    <form method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Tiêu đề:</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Nội dung:</label>
                            <textarea name="content" class="form-control" rows="5" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Hình ảnh đính kèm (Chọn nhiều ảnh):</label>
                            <input type="file" name="topic_image[]" class="form-control" accept="image/*" multiple>
                            <div class="form-text">Nhấn giữ phím Ctrl (hoặc Command) để chọn nhiều ảnh cùng lúc.</div>
                        </div>

                        <button type="submit" class="btn btn-primary">Đăng bài</button>
                        <a href="forum.php" class="btn btn-secondary">Hủy</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include 'includes/footer.php'; ?>