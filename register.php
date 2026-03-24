<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['fullname'];
    $email = $_POST['email'];
    
    // --- [MỚI] LẤY TÊN LỚP TỪ FORM ---
    $class_name = $_POST['class_name']; 
    // ---------------------------------

    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    
    // 1. LẤY MÃ GIÁO VIÊN TỪ FORM
    $teacher_code = $_POST['teacher_code']; 

    // Mặc định là học sinh
    $role = 'student'; 

    // 2. KIỂM TRA MÃ BÍ MẬT (Bạn có thể đổi 'GV_TIN12' thành mã khác tùy ý)
    if ($teacher_code == 'GV_TIN12') {
        $role = 'teacher';
        // Nếu là giáo viên thì lớp có thể để trống hoặc đặt là GV
        if(empty($class_name)) {
            $class_name = "GV";
        }
    }

    // Kiểm tra mật khẩu nhập lại
    if ($password !== $confirm_password) {
        $message = "<div class='alert alert-warning'>Mật khẩu nhập lại không khớp!</div>";
    } else {
        // Kiểm tra email
        $check = "SELECT * FROM users WHERE email = '$email'";
        $rs = $conn->query($check);

        if ($rs->num_rows > 0) {
            $message = "<div class='alert alert-danger'>Email này đã được đăng ký!</div>";
        } else {
            // Mã hóa mật khẩu
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            
            // --- [MỚI] SỬA CÂU LỆNH SQL ĐỂ LƯU THÊM class_name ---
            $sql = "INSERT INTO users (name, email, password_hash, role, class_name) 
                    VALUES ('$name', '$email', '$hashed_password', '$role', '$class_name')";
            // -----------------------------------------------------

            if ($conn->query($sql) === TRUE) {
                if($role == 'teacher'){
                    $message = "<div class='alert alert-success'>🎉 Chào mừng đồng nghiệp! Tài khoản <b>GIÁO VIÊN</b> đã được tạo.<br><a href='login.php'>Đăng nhập ngay</a></div>";
                } else {
                    $message = "<div class='alert alert-success'>Đăng ký thành công! <a href='login.php'>Đăng nhập ngay</a></div>";
                }
            } else {
                $message = "<div class='alert alert-danger'>Lỗi hệ thống: " . $conn->error . "</div>";
            }
        }
    }
}
?>

<div class="row justify-content-center mb-5">
    <div class="col-md-6">
        <div class="card shadow mt-5">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Đăng ký tài khoản</h4>
            </div>
            <div class="card-body">
                <?php echo $message; ?>
                <form method="POST" action="">
                    <div class="mb-3">
                        <label class="form-label">Họ và tên</label>
                        <input type="text" name="fullname" class="form-control" required placeholder="Nguyễn Văn A">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required placeholder="email@example.com">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Chọn Lớp học</label>
                        <select name="class_name" class="form-control" required>
                            <option value="">-- Vui lòng chọn lớp --</option>
                            <option value="GV" style="font-weight: bold; color: blue;">-- Dành cho Giáo Viên --</option>
                            <option value="12A1">12A1</option>
                            <option value="12A2">12A2</option>
                            <option value="12A3">12A3</option>
                            <option value="12A4">12A4</option>
                            <option value="12A5">12A5</option>
                            <option value="12A6">12A6</option>
                            <option value="12A7">12A7</option>
                            <option value="Khác">Lớp Khác</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mật khẩu</label>
                        <input type="password" name="password" id="passInput" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Nhập lại mật khẩu</label>
                        <input type="password" name="confirm_password" id="confirmPassInput" class="form-control" required>
                    </div>

                    <div class="mb-3 p-3 bg-light border rounded">
                        <label class="form-label fw-bold text-danger">Dành cho Giáo viên:</label>
                        <input type="text" name="teacher_code" class="form-control" placeholder="Nhập mã nhà trường cung cấp">
                        <div class="form-text text-muted">Nếu là học sinh, vui lòng bỏ trống ô này.</div>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="showPassCheck" onclick="togglePassword()">
                        <label class="form-check-label" for="showPassCheck">Hiển thị mật khẩu</label>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
                </form>
            </div>
            <div class="card-footer text-center">
                Đã có tài khoản? <a href="login.php">Đăng nhập</a>
            </div>
        </div>
    </div>
</div>

<script>
function togglePassword() {
    var passField = document.getElementById("passInput");
    var confirmField = document.getElementById("confirmPassInput");
    
    if (passField.type === "password") {
        passField.type = "text";
        confirmField.type = "text";
    } else {
        passField.type = "password";
        confirmField.type = "password";
    }
}
</script>

<?php include 'includes/footer.php'; ?>