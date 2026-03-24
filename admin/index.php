<?php
session_start();
// Kết nối CSDL
include '../includes/db.php';

// 1. BẢO MẬT: Kiểm tra xem có phải Giáo viên không?
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'teacher') {
    header("Location: ../index.php");
    exit();
}

// ---------------------------------------------------------
// XỬ LÝ 1: CẬP NHẬT THÔNG TIN BÀI HỌC (MỚI THÊM)
// ---------------------------------------------------------
if (isset($_POST['update_lesson_info'])) {
    $l_id = intval($_POST['lesson_id']);
    $l_title = htmlspecialchars($_POST['lesson_title']);
    $l_desc = htmlspecialchars($_POST['lesson_desc']);

    // Cập nhật vào CSDL
    $stmt = $conn->prepare("UPDATE lessons SET title = ?, description = ? WHERE id = ?");
    $stmt->bind_param("ssi", $l_title, $l_desc, $l_id);
    
    if ($stmt->execute()) {
        echo "<script>alert('Cập nhật thành công!'); window.location.href='index.php';</script>";
    } else {
        echo "<script>alert('Lỗi cập nhật: " . $stmt->error . "');</script>";
    }
}

// ---------------------------------------------------------
// XỬ LÝ 2: XÓA BÀI HỌC (GIỮ NGUYÊN)
// ---------------------------------------------------------
if (isset($_GET['delete_lesson'])) {
    $id = intval($_GET['delete_lesson']);

    // B1: Xóa các dữ liệu con liên quan trước (để sạch data)
    $conn->query("DELETE FROM submissions WHERE lesson_id=$id");
    // $conn->query("DELETE FROM lesson_activities WHERE lesson_id=$id"); // Bỏ comment nếu có bảng này

    // B2: Xóa Bài học
    $conn->query("DELETE FROM lessons WHERE id=$id");

    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản trị hệ thống - Tin học 12</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f8f9fc;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* --- Header Gradient --- */
        .bg-theme-gradient {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
        }

        /* --- Dashboard Cards --- */
        .card-dashboard {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            transition: transform 0.2s, box-shadow 0.2s;
            overflow: hidden;
            height: 100%;
            background: white;
        }
        .card-dashboard:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(118, 75, 162, 0.15);
        }
        
        .icon-box {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 15px;
        }
        .bg-blue-light { background-color: #e0e7ff; color: #4338ca; }
        .bg-green-light { background-color: #d1fae5; color: #059669; }
        .bg-yellow-light { background-color: #fef3c7; color: #d97706; }

        /* --- Table Styling --- */
        .table-custom th {
            background-color: #f9fafb;
            color: #6b7280;
            font-weight: 700;
            text-transform: uppercase;
            font-size: 0.85rem;
            border-bottom: 2px solid #e5e7eb;
        }
        
        footer {
            margin-top: auto;
            background-color: #1f2937;
            color: #9ca3af;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-theme-gradient py-3 shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.php">
            <i class="fas fa-cogs me-2"></i> QUẢN TRỊ HỆ THỐNG
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link text-white active fw-bold" href="#">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white opacity-75" href="../index.php" target="_blank">
                        <i class="fas fa-external-link-alt me-1"></i> Xem trang chủ
                    </a>
                </li>
            </ul>

            <div class="dropdown">
                <a class="btn btn-light rounded-pill dropdown-toggle text-primary fw-bold px-3 shadow-sm" href="#" role="button" data-bs-toggle="dropdown">
                    Xin chào, <?php echo isset($_SESSION['username']) ? $_SESSION['username'] : 'Giáo viên'; ?>
                </a>
                <ul class="dropdown-menu dropdown-menu-end mt-2 shadow border-0">
                    <li><a class="dropdown-item" href="../profile.php"><i class="fas fa-user-circle me-2"></i> Hồ sơ cá nhân</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="../logout.php"><i class="fas fa-sign-out-alt me-2"></i> Đăng xuất</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<div class="container py-5">
    
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h3 class="fw-bold" style="color: #4c1d95;">Bảng điều khiển</h3>
            <p class="text-muted">Tổng quan hệ thống quản lý học tập</p>
        </div>
        <a href="add_lesson.php" class="btn btn-primary rounded-pill shadow-sm px-4 fw-bold">
            <i class="fas fa-plus me-2"></i> Tạo bài học mới
        </a>
    </div>

    <div class="row g-4 mb-4">
        <div class="col-md-4">
            <div class="card card-dashboard p-4">
                <div class="d-flex flex-column h-100">
                    <div class="icon-box bg-blue-light">
                        <i class="fas fa-book-open"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Quản lý Học liệu</h5>
                    <p class="text-muted small mb-4">Thêm, sửa, xóa các bài học, video và tài liệu tham khảo cho học sinh.</p>
                    <a href="add_lesson.php" class="btn btn-outline-primary rounded-pill mt-auto fw-bold border-2">
                        Quản lý ngay <i class="fas fa-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-dashboard p-4">
                <div class="d-flex flex-column h-100">
                    <div class="icon-box bg-green-light">
                        <i class="fas fa-tasks"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Ngân hàng Quiz</h5>
                    <p class="text-muted small mb-4">Xây dựng bộ câu hỏi trắc nghiệm, tạo đề kiểm tra theo từng chủ đề.</p>
                    <a href="manage_quiz.php" class="btn btn-outline-success rounded-pill mt-auto fw-bold border-2">
                        Soạn câu hỏi <i class="fas fa-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-dashboard p-4">
                <div class="d-flex flex-column h-100">
                    <div class="icon-box bg-yellow-light">
                        <i class="fas fa-users-cog"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Quản lý Học sinh</h5>
                    <p class="text-muted small mb-4">Xem danh sách lớp học, cấp lại mật khẩu và theo dõi tiến độ.</p>
                   <div class="mt-auto d-flex gap-2">
    <a href="users.php" class="btn btn-outline-warning text-dark rounded-pill fw-bold border-2 flex-grow-1">
        Danh sách
    </a>
    
    <a href="tool_auto_register.php" class="btn btn-warning text-dark rounded-pill fw-bold border-2" title="Tạo nhanh 40 HS">
        <i class="fas fa-magic me-1"></i> Auto Tạo
    </a>
</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-5">
        <div class="col-md-12">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header bg-success text-white py-3">
                    <h5 class="mb-0 fw-bold"><i class="fas fa-file-excel me-2"></i> Xuất Báo Cáo Điểm Số</h5>
                </div>
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-md-9">
                            <p class="mb-2 text-muted">Chọn bài kiểm tra cần lấy điểm, hệ thống sẽ xuất ra file Excel (.csv) cho bạn.</p>
                            
                            <form action="export_excel.php" method="POST" class="d-flex gap-2 align-items-center">
                                <select name="quiz_id" class="form-select form-select-lg" required style="max-width: 450px;">
                                    <option value="">-- Chọn bài kiểm tra cần xuất --</option>
                                    <?php
                                    // Đoạn PHP lấy danh sách bài thi
                                    $sql_q = "SELECT * FROM quizzes ORDER BY id DESC";
                                    $run_q = mysqli_query($conn, $sql_q);
                                    if ($run_q) {
                                        while($row_q = mysqli_fetch_array($run_q)){
                                            echo '<option value="'.$row_q['id'].'">'.$row_q['title'].'</option>';
                                        }
                                    }
                                    ?>
                                </select>
                                
                                <button type="submit" name="btn_export" class="btn btn-success btn-lg text-nowrap shadow-sm">
                                    <i class="fas fa-download me-2"></i> Tải về ngay
                                </button>
                            </form>
                        </div>
                        
                        <div class="col-md-3 text-center text-muted d-none d-md-block">
                            <i class="fas fa-file-csv fa-4x" style="opacity: 0.2; color: #198754;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white py-3 border-bottom d-flex align-items-center">
            <h5 class="m-0 fw-bold text-primary"><i class="fas fa-list-ul me-2"></i> Danh sách bài học hiện có</h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-custom table-hover align-middle m-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4 py-3" style="width: 80px;">ID</th>
                            <th class="py-3">Tên bài học / Chủ đề</th>
                            <th class="text-end pe-4 py-3" style="width: 320px;">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sql = "SELECT * FROM lessons ORDER BY id ASC";
                        $result = $conn->query($sql);
                        
                        if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                // Chuẩn bị dữ liệu cho nút Sửa
                                $id = $row['id'];
                                $title = htmlspecialchars($row['title']);
                                $desc = isset($row['description']) ? htmlspecialchars($row['description']) : "";
                        ?>
                            <tr>
                                <td class="ps-4 fw-bold text-secondary">#<?php echo $id; ?></td>
                                <td>
                                    <span class="fw-bold text-dark d-block"><?php echo $title; ?></span>
                                    <small class="text-muted fst-italic"><?php echo $desc; ?></small>
                                </td>
                                <td class="text-end pe-4">
                                    <button class="btn btn-warning btn-sm rounded-pill px-3 me-1 text-dark fw-bold" 
                                            onclick='openEditLessonModal(<?php echo json_encode(["id"=>$id, "title"=>$title, "desc"=>$desc]); ?>)'>
                                        <i class="fas fa-pencil-alt me-1"></i> Sửa tên
                                    </button>

                                    <a href="lesson_content.php?id=<?php echo $id; ?>" class="btn btn-primary btn-sm rounded-pill px-3 me-1">
                                        <i class="fas fa-edit me-1"></i> Soạn
                                    </a>
                                    
                                    <a href="index.php?delete_lesson=<?php echo $id; ?>" 
                                       class="btn btn-outline-danger btn-sm rounded-pill px-3"
                                       onclick="return confirm('CẢNH BÁO: Bạn có chắc chắn muốn xóa bài học này? Mọi dữ liệu liên quan sẽ bị mất!');">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        <?php
                            }
                        } else {
                            echo "<tr><td colspan='3' class='text-center py-5 text-muted'><i class='fas fa-folder-open fa-2x mb-2'></i><br>Chưa có bài học nào. Hãy tạo mới!</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
</div>

<footer class="text-center py-4 mt-auto">
    <div class="container">
        <p class="mb-0 small">
            &copy; 2025 Hệ thống Quản trị Tin học 12.
        </p>
    </div>
</footer>

<div class="modal fade" id="editLessonModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="POST" class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title fw-bold text-dark"><i class="fas fa-edit me-2"></i>Chỉnh sửa thông tin bài học</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="lesson_id" id="edit_l_id">
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Tên bài học:</label>
                    <input type="text" name="lesson_title" id="edit_l_title" class="form-control" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Mô tả ngắn:</label>
                    <textarea name="lesson_desc" id="edit_l_desc" class="form-control" rows="3" placeholder="Nhập mô tả ngắn về bài học..."></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" name="update_lesson_info" class="btn btn-warning fw-bold text-dark">Lưu thay đổi</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Hàm mở Modal và điền dữ liệu cũ (MỚI)
    function openEditLessonModal(data) {
        document.getElementById('edit_l_id').value = data.id;
        document.getElementById('edit_l_title').value = data.title;
        document.getElementById('edit_l_desc').value = data.desc;
        
        var myModal = new bootstrap.Modal(document.getElementById('editLessonModal'));
        myModal.show();
    }
</script>

</body>
</html>