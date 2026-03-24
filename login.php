<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Tìm user theo email
    $sql = "SELECT * FROM users WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        // --- SỬA LẠI CỘT 'password_hash' CHO ĐÚNG DB CỦA BẠN ---
        if (password_verify($password, $row['password_hash'])) {
            
            // Lưu session
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $row['name']; // Lấy cột 'name'
            $_SESSION['role'] = $row['role'];

            // Điều hướng
            if($row['role'] == 'teacher' || $row['role'] == 'admin'){
                header("Location: admin/index.php");
            } else {
                header("Location: index.php");
            }
            exit();
        } else {
            $error = "Mật khẩu không đúng!";
        }
    } else {
        $error = "Email không tồn tại!";
    }
}
?>

<div class="row justify-content-center">
    <div class="col-md-5">
        <div class="card shadow mt-5">
            <div class="card-body p-5">
                <h3 class="text-center text-primary mb-4">Đăng nhập</h3>
                <?php if($error): ?>
                    <div class="alert alert-danger"><?php echo $error; ?></div>
                <?php endif; ?>
                
                <form method="POST" action="">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mật khẩu</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                </form>
                <hr>
                <div class="text-center">
                    Chưa có tài khoản? <a href="register.php">Đăng ký mới</a>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>