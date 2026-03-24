<?php
session_start();
include '../includes/db.php';
include '../includes/header.php';

// KIỂM TRA QUYỀN: Chỉ Giáo viên mới được vào
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'teacher') {
    echo "<script>alert('Bạn không có quyền!'); window.location.href='index.php';</script>";
    exit();
}

$message = "";

if (isset($_POST['btn_create_bulk'])) {
    $class_name = $_POST['class_name']; 
    $raw_data = $_POST['list_names'];   
    
    // Tách từng dòng dữ liệu
    $list_students = explode("\n", str_replace("\r", "", $raw_data));

    $count_success = 0;
    $count_duplicate = 0;
    $mat_khau_chung = "123456";
    $hash_password = password_hash($mat_khau_chung, PASSWORD_DEFAULT);

    foreach ($list_students as $line) {
        $line = trim($line); // Xóa khoảng trắng 2 đầu

        if (!empty($line)) {
            // Tách MSHS và Họ Tên (Dựa vào dấu Tab của Excel hoặc khoảng trắng)
            // Biểu thức chính quy: Lấy cụm từ đầu tiên (không chứa dấu cách) làm MSHS, phần còn lại làm Tên
            if (preg_match('/^(\S+)\s+(.+)$/u', $line, $matches)) {
                $mshs = trim($matches[1]);
                $std_name = trim($matches[2]);
                
                // Dùng MSHS để tạo Email đăng nhập duy nhất
                $email = $mshs . "@truong.edu.vn"; 
                
                // KIỂM TRA TRÙNG LẶP: Nếu MSHS này đã có trong hệ thống thì bỏ qua
                $check_sql = "SELECT id FROM users WHERE email = '$email'";
                $check_rs = mysqli_query($conn, $check_sql);
                
                if (mysqli_num_rows($check_rs) > 0) {
                    $count_duplicate++;
                } else {
                    // Tiến hành tạo tài khoản
                    $sql = "INSERT INTO users (name, email, password_hash, role, class_name) 
                            VALUES ('$std_name', '$email', '$hash_password', 'student', '$class_name')";
                    
                    if (mysqli_query($conn, $sql)) {
                        $count_success++;
                    }
                }
            }
        }
    }

    // Hiển thị thông báo kết quả
    if ($count_success > 0) {
        $message = "<div class='alert alert-success'>
                        <h4><i class='fas fa-check-circle'></i> Thành công!</h4>
                        Đã tạo được <b>$count_success</b> tài khoản mới cho lớp <b>$class_name</b>.<br>
                        Mật khẩu mặc định: <b>123456</b>
                    </div>";
    } elseif ($count_duplicate > 0) {
        $message = "<div class='alert alert-warning'>Không có tài khoản mới được tạo. Có <b>$count_duplicate</b> MSHS đã tồn tại trong hệ thống từ trước!</div>";
    } else {
        $message = "<div class='alert alert-danger'>Lỗi định dạng! Vui lòng copy đúng chuẩn 'MSHS [khoảng cách] Họ và Tên'.</div>";
    }
}
?>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0"><i class="fas fa-users-cog me-2"></i> Thêm Danh sách Học sinh (Theo MSHS)</h4>
                </div>
                <div class="card-body">
                    <?php echo $message; ?>
                    
                    <div class="alert alert-info">
                        <i class="fas fa-info-circle fw-bold"></i> <b>Hướng dẫn dành cho Giáo viên:</b><br>
                        1. Mở file Excel danh sách lớp.<br>
                        2. Bôi đen và Copy cùng lúc 2 cột: <b>"Mã số học sinh"</b> và <b>"Họ và tên"</b>.<br>
                        3. Dán vào ô bên dưới. Học sinh sẽ đăng nhập bằng tài khoản dạng: <code>[MSHS]@truong.edu.vn</code>
                    </div>

                    <form method="POST">
                        <div class="mb-3">
                            <label class="fw-bold">Chọn Lớp học:</label>
                            <select name="class_name" class="form-select" required>
                                <option value="">-- Chọn lớp --</option>
                                <option value="12A1">Lớp 12A1</option>
                                <option value="12A2">Lớp 12A2</option>
                                <option value="12A3">Lớp 12A3</option>
                                <option value="12A4">Lớp 12A4</option>
                                <option value="12A5">Lớp 12A5</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="fw-bold">Dán danh sách MSHS và Họ Tên vào đây:</label>
                            <textarea name="list_names" class="form-control" rows="10" placeholder="Ví dụ:
23001 Nguyễn Văn An
23002 Trần Thị Bích
23003 Lê Hoàng Cường
..." required style="background-color: #f8f9fa; font-family: monospace;"></textarea>
                            <div class="form-text text-danger">Lưu ý: Bắt buộc phải có MSHS đứng trước tên để tránh trùng lặp tài khoản.</div>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" name="btn_create_bulk" class="btn btn-primary btn-lg fw-bold">
                                <i class="fas fa-magic me-2"></i> TIẾN HÀNH TẠO TÀI KHOẢN
                            </button>
                            <a href="index.php" class="btn btn-outline-secondary">Quay về Dashboard</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include '../includes/footer.php'; ?>