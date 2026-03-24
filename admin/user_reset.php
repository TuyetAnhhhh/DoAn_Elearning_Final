<?php
session_start();
include '../includes/db.php';

// Kiểm tra quyền Giáo viên
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'teacher') {
    header("Location: ../index.php");
    exit();
}

$msg = "";
$student_name = "";

// Lấy ID học sinh từ URL
if (isset($_GET['id'])) {
    $student_id = $_GET['id'];
    
    // Lấy tên học sinh để hiển thị cho chắc ăn
    $sql_get = "SELECT name FROM users WHERE id = $student_id";
    $res = $conn->query($sql_get);
    if($res->num_rows > 0){
        $student_name = $res->fetch_assoc()['name'];
    }
} else {
    header("Location: users.php");
    exit();
}

// Xử lý khi Giáo viên bấm nút Lưu
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $new_pass = $_POST['new_password'];
    
    if (!empty($new_pass)) {
        // Mã hóa mật khẩu mới
        $hashed_password = password_hash($new_pass, PASSWORD_DEFAULT);
        
        // Cập nhật vào Database
        $sql_update = "UPDATE users SET password_hash = '$hashed_password' WHERE id = $student_id";
        
        if ($conn->query($sql_update) === TRUE) {
            $msg = "<div class='alert alert-success'>Đã đổi mật khẩu cho em <b>$student_name</b> thành công!</div>";
        } else {
            $msg = "<div class='alert alert-danger'>Lỗi: " . $conn->error . "</div>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cấp lại mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-warning text-dark fw-bold">
                    🔑 Cấp lại mật khẩu
                </div>
                <div class="card-body">
                    <h5 class="mb-3">Học sinh: <span class="text-primary"><?php echo $student_name; ?></span></h5>
                    
                    <?php echo $msg; ?>
                    
                    <form method="POST">
                        <div class="mb-3">
                            <label class="form-label">Nhập mật khẩu mới cho học sinh:</label>
                            <input type="text" name="new_password" class="form-control" placeholder="Ví dụ: 123456" required>
                            <div class="form-text">Hãy nhập mật khẩu đơn giản rồi báo lại cho học sinh.</div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Lưu mật khẩu mới</button>
                    </form>
                    
                    <div class="mt-3 text-center">
                        <a href="users.php" class="text-decoration-none">← Quay lại danh sách</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>