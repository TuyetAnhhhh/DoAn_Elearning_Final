<?php
session_start();
include '../includes/db.php';

// Kiểm tra quyền giáo viên
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'teacher') {
    header("Location: ../index.php");
    exit();
}

$msg = "";

// Xử lý khi bấm nút Lưu
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $desc = $_POST['description'];
    // Lấy các trường cũ nếu có (hoặc bỏ đi nếu bạn đã chuyển sang dùng bảng activities riêng)
    // Ở đây mình vẫn giữ để code chạy được với bảng lessons cũ của bạn
    $colab = isset($_POST['colab_link']) ? $_POST['colab_link'] : '';
    $video = isset($_POST['video_link']) ? $_POST['video_link'] : '';
    
    // --- LẤY ĐỊNH HƯỚNG TỪ FORM ---
    $track = $_POST['track'];

    // Câu lệnh SQL thêm bài học (Đã thêm cột track)
    // Lưu ý: Nếu bảng lessons của bạn chưa có cột colab_link/video_link thì bỏ chúng đi khỏi câu lệnh
    $sql = "INSERT INTO lessons (title, description, track, colab_link, video_link, created_at) 
            VALUES ('$title', '$desc', '$track', '$colab', '$video', NOW())";

    if ($conn->query($sql) === TRUE) {
        $last_id = $conn->insert_id;
        $msg = "<div class='alert alert-success'>
                    Thêm bài học thành công! <br>
                    <a href='lesson_content.php?id=$last_id' class='btn btn-sm btn-primary mt-2'>Soạn nội dung chi tiết ngay</a>
                    <a href='index.php' class='btn btn-sm btn-secondary mt-2 ms-2'>Quay lại danh sách</a>
                </div>";
    } else {
        $msg = "<div class='alert alert-danger'>Lỗi: " . $conn->error . "</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm bài học mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4>Thêm Bài Học Mới (Chủ đề F)</h4>
                    </div>
                    <div class="card-body">
                        <?php echo $msg; ?>
                        <form method="POST">
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold">Định hướng:</label>
                                <select name="track" class="form-select" required>
                                    <option value="Common">📚 Dùng chung (Cả ICT & CS)</option>
                                    <option value="ICT">💻 Định hướng ICT (Công nghệ thông tin)</option>
                                    <option value="CS">🧮 Định hướng CS (Khoa học máy tính)</option>
                                </select>
                                <div class="form-text">Chọn đúng định hướng để bài học hiển thị ở danh sách tương ứng.</div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Tên bài học:</label>
                                <input type="text" name="title" class="form-control" required placeholder="VD: Bài 3: Giới thiệu về Python">
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mô tả ngắn:</label>
                                <textarea name="description" class="form-control" rows="3"></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Link Google Colab (Nếu có):</label>
                                <input type="text" name="colab_link" class="form-control" placeholder="https://colab.research.google.com/...">
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Link Video (Nếu có):</label>
                                <input type="text" name="video_link" class="form-control" placeholder="Link Youtube...">
                            </div>

                            <button type="submit" class="btn btn-success w-100">Lưu bài học</button>
                            <a href="index.php" class="btn btn-secondary w-100 mt-2">Hủy bỏ</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>