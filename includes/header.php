<?php
// Gọi session để quản lý đăng nhập
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống E-learning Tin 12</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
    <style>
        /* 1. Cài đặt chung */
        body {
            font-family: 'Nunito', sans-serif !important;
            background-color: #f0f4f8 !important; /* Màu nền xám xanh dịu mắt */
        }

        /* 2. Menu Gradient (Tím - Xanh) */
        .navbar-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            box-shadow: 0 4px 20px rgba(118, 75, 162, 0.25);
        }
        
        .navbar-brand {
            font-weight: 800;
            font-size: 1.4rem;
            letter-spacing: 0.5px;
        }

        .nav-link {
            font-weight: 600;
            transition: all 0.2s;
        }
        .nav-link:hover {
            transform: translateY(-2px);
            color: #ffd700 !important; /* Màu vàng khi di chuột vào */
        }

        /* 3. Nút bấm đẹp */
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            border: none !important;
            border-radius: 50px !important; /* Bo tròn viên thuốc */
            padding: 8px 20px !important;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        /* 4. Thẻ Card (Bài học) */
        .card {
            border: none !important;
            border-radius: 15px !important;
            background: #ffffff;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(118, 75, 162, 0.15);
        }
        
        /* Chữ tiêu đề Gradient */
        h1, h2.text-primary, h4.text-primary, h5.card-title {
            color: #764ba2 !important; /* Màu tím đậm */
            font-weight: 800;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.php">
            <i class="bi bi-mortarboard-fill me-2"></i>Tin học 12
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="index.php">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="forum.php">Diễn đàn</a></li>
                
                <?php if (isset($_SESSION['user_id'])): ?>
                    <li class="nav-item dropdown ms-3">
                        <a class="nav-link dropdown-toggle btn btn-light text-primary px-3 rounded-pill" href="#" role="button" data-bs-toggle="dropdown" style="background: white; color: #667eea !important;">
                             Hi, <?php echo $_SESSION['username']; ?>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2" style="border-radius: 12px;">
                            <?php if(isset($_SESSION['role']) && $_SESSION['role'] == 'teacher'): ?>
                                <li><a class="dropdown-item py-2" href="admin/index.php"><i class="bi bi-gear-fill me-2 text-warning"></i>Quản trị viên</a></li>
                            <?php endif; ?>
                            <li><a class="dropdown-item py-2" href="profile.php"><i class="bi bi-person-circle me-2 text-info"></i>Hồ sơ cá nhân</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item py-2 text-danger" href="logout.php"><i class="bi bi-box-arrow-right me-2"></i>Đăng xuất</a></li>
                        </ul>
                    </li>
                <?php else: ?>
                    <li class="nav-item">
                        <a class="nav-link btn btn-warning text-dark ms-2 px-3 fw-bold shadow-sm" href="login.php" style="background: #ffd700; border:none; border-radius: 50px;">Đăng nhập</a>
                    </li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4" style="min-height: 600px;">