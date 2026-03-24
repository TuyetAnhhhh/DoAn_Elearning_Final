<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';

// 1. Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$msg = "";

// 2. Xử lý Upload Avatar
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['avatar_file'])) {
    $file = $_FILES['avatar_file'];
    $filename = $file['name'];
    $tmp_name = $file['tmp_name'];
    
    // Kiểm tra xem có chọn file không
    if (!empty($filename)) {
        // Lấy đuôi file (jpg, png...)
        $ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));
        $allowed = array('jpg', 'jpeg', 'png', 'gif');
        
        if (in_array($ext, $allowed)) {
            // Tạo tên file mới ngẫu nhiên để không bị trùng
            $new_name = "avatar_" . $user_id . "_" . time() . "." . $ext;
            $upload_path = "uploads/avatars/" . $new_name;
            
            // Di chuyển file vào thư mục
            if (move_uploaded_file($tmp_name, $upload_path)) {
                // Cập nhật vào Database
                $conn->query("UPDATE users SET avatar = '$new_name' WHERE id = $user_id");
                $msg = "<div class='alert alert-success'>Đổi ảnh đại diện thành công!</div>";
            } else {
                $msg = "<div class='alert alert-danger'>Lỗi khi tải ảnh lên! Hãy kiểm tra lại thư mục uploads/avatars</div>";
            }
        } else {
            $msg = "<div class='alert alert-warning'>Chỉ cho phép file ảnh (JPG, PNG, GIF).</div>";
        }
    }
}

// 3. Xử lý Đổi mật khẩu (Giữ nguyên code cũ)
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['change_pass'])) {
    $current_pass = $_POST['current_password'];
    $new_pass = $_POST['new_password'];
    $confirm_pass = $_POST['confirm_password'];

    $sql = "SELECT password_hash FROM users WHERE id = $user_id";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();

    if (password_verify($current_pass, $row['password_hash'])) {
        if ($new_pass === $confirm_pass) {
            $new_hash = password_hash($new_pass, PASSWORD_DEFAULT);
            $conn->query("UPDATE users SET password_hash = '$new_hash' WHERE id = $user_id");
            $msg = "<div class='alert alert-success'>Đổi mật khẩu thành công!</div>";
        } else {
            $msg = "<div class='alert alert-warning'>Mật khẩu mới không khớp!</div>";
        }
    } else {
        $msg = "<div class='alert alert-danger'>Mật khẩu hiện tại không đúng!</div>";
    }
}

// 4. Lấy thông tin user để hiển thị
$sql_info = "SELECT * FROM users WHERE id = $user_id";
$res_info = $conn->query($sql_info);
$user = $res_info->fetch_assoc();

// Logic hiển thị Avatar: Nếu có ảnh trong DB thì lấy, không thì dùng ảnh tự động
$avatar_url = "https://ui-avatars.com/api/?name=" . $user['name'] . "&background=random&size=128";
if (!empty($user['avatar']) && file_exists("uploads/avatars/" . $user['avatar'])) {
    $avatar_url = "uploads/avatars/" . $user['avatar'];
}
?>

<div class="container mt-5 mb-5">
    <div class="row">
        
        <div class="col-md-4 mb-4">
            <div class="card shadow text-center p-4">
                <div class="d-flex justify-content-center mb-3">
                    <img src="<?php echo $avatar_url; ?>" 
                         class="rounded-circle shadow-sm border border-4 border-white object-fit-cover" 
                         width="128" height="128" alt="Avatar">
                </div>
                
                <form method="POST" enctype="multipart/form-data" class="mb-3">
                    <label class="btn btn-sm btn-outline-primary" style="cursor: pointer;">
                        <i class="bi bi-camera"></i> Đổi ảnh
                        <input type="file" name="avatar_file" style="display: none;" onchange="this.form.submit()">
                    </label>
                </form>

                <h4 class="fw-bold text-primary mb-1"><?php echo $user['name']; ?></h4>
                <p class="text-muted mb-2"><?php echo $user['email']; ?></p>
                
                <div>
                    <?php if($user['role'] == 'teacher'): ?>
                        <span class="badge bg-warning text-dark px-3 py-2 rounded-pill">📚 Giáo viên</span>
                    <?php else: ?>
                        <span class="badge bg-info text-dark px-3 py-2 rounded-pill">🎓 Học sinh</span>
                    <?php endif; ?>
                </div>
                
                <hr class="my-4">
                <div class="text-start">
                    <small class="text-muted fw-bold text-uppercase">Thống kê hoạt động</small>
                    <div class="d-flex justify-content-between mt-2 align-items-center">
                        <span><i class="bi bi-calendar-check me-2"></i>Ngày tham gia:</span>
                        <span class="fw-bold"><?php echo date('d/m/Y', strtotime($user['created_at'])); ?></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-white border-bottom-0 py-3">
                    <h5 class="mb-0 fw-bold text-primary"><i class="bi bi-shield-lock me-2"></i>Bảo mật tài khoản</h5>
                </div>
                <div class="card-body p-4">
                    <?php echo $msg; ?>
                    
                    <form method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Mật khẩu hiện tại</label>
                            <input type="password" name="current_password" class="form-control" required>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Mật khẩu mới</label>
                                <input type="password" name="new_password" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Nhập lại mật khẩu mới</label>
                                <input type="password" name="confirm_password" class="form-control" required>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end mt-3">
                            <button type="submit" name="change_pass" class="btn btn-primary px-4">
                                <i class="bi bi-save me-2"></i>Lưu thay đổi
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<?php include 'includes/footer.php'; ?>