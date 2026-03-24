<?php
session_start();
include '../includes/db.php';

// 1. Check Teacher Permissions
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'teacher') {
    header("Location: ../index.php");
    exit();
}

// 2. Handle Password Reset
if (isset($_POST['reset_password'])) {
    $uid = intval($_POST['user_id']);
    $new_pass = $_POST['new_pass'];
    
    if (!empty($new_pass)) {
        // Use password_hash for security
        $hashed = password_hash($new_pass, PASSWORD_DEFAULT); 
        $conn->query("UPDATE users SET password_hash='$hashed' WHERE id=$uid");
        echo "<script>alert('Password updated successfully!');</script>";
    }
}

// 3. Fetch Student Data First (Store in array for cleaner HTML loop)
$students = [];
$sql = "SELECT * FROM users WHERE role = 'student' ORDER BY id DESC";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $students[] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Học sinh & Điểm số</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body{font-family:'Nunito',sans-serif; background:#f0f4f8;}
        .progress { margin-bottom: 0; background-color: #e9ecef; }
        .modal-body { max-height: 70vh; overflow-y: auto; }
    </style>
</head>
<body>

<div class="container mt-5 mb-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary fw-bold"><i class="fas fa-users-cog"></i> Quản lý Học sinh</h2>
        <a href="index.php" class="btn btn-secondary">← Quay lại Dashboard</a>
    </div>

    <div class="card shadow border-0 rounded-4">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">ID</th>
                            <th>Họ và Tên</th>
                            <th>Email / Tài khoản</th>
                            <th class="text-center">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (count($students) > 0): ?>
                            <?php foreach ($students as $std): ?>
                            <tr>
                                <td class="ps-4 fw-bold text-secondary">#<?php echo $std['id']; ?></td>
                                <td class="fw-bold text-dark"><?php echo $std['name']; ?></td>
                                <td class="text-muted"><?php echo $std['email']; ?></td>
                                <td class="text-center">
                                    <button class="btn btn-info btn-sm text-white fw-bold me-2 shadow-sm" data-bs-toggle="modal" data-bs-target="#progressModal<?php echo $std['id']; ?>">
                                        <i class="fas fa-chart-line me-1"></i> Xem Điểm & Tiến độ
                                    </button>

                                    <button class="btn btn-warning btn-sm text-dark fw-bold shadow-sm" data-bs-toggle="modal" data-bs-target="#passModal<?php echo $std['id']; ?>">
                                        <i class="fas fa-key"></i>
                                    </button>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <tr><td colspan='4' class='text-center py-4 text-muted'>Chưa có học sinh nào.</td></tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php foreach ($students as $std): ?>

    <div class="modal fade" id="progressModal<?php echo $std['id']; ?>" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-scrollable"> 
            <div class="modal-content">
                <div class="modal-header bg-info text-white">
                    <h5 class="modal-title fw-bold">📊 Kết quả học tập: <?php echo $std['name']; ?></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body bg-light">
                    <table class="table table-bordered table-striped bg-white shadow-sm mb-0">
                        <thead class="table-primary">
                            <tr>
                                <th style="width: 35%">Bài học</th>
                                <th class="text-center" style="width: 10%">Định hướng</th>
                                <th style="width: 30%">Tiến độ xem nội dung</th>
                                <th style="width: 25%">Điểm Trắc nghiệm / Quiz</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        // Fetch all lessons
                        $lessons = $conn->query("SELECT * FROM lessons ORDER BY id ASC");
                        if($lessons->num_rows > 0){
                            while($l = $lessons->fetch_assoc()){
                                $lid = $l['id'];
                                
                                // 1. CALCULATE PROGRESS
                                $sql_total = "SELECT COUNT(*) as cnt FROM activities WHERE lesson_id=$lid AND type != 'label'";
                                $total_act = $conn->query($sql_total)->fetch_assoc()['cnt'];
                                
                                $sql_done = "SELECT COUNT(*) as cnt FROM activity_completions WHERE lesson_id=$lid AND user_id=".$std['id'];
                                $done_act = $conn->query($sql_done)->fetch_assoc()['cnt'];
                                
                                $percent = ($total_act > 0) ? round(($done_act / $total_act) * 100) : 0;
                                
                                $bar_color = ($percent == 100) ? 'bg-success' : 'bg-warning';
                                $track_badge = ($l['track']=='CS') ? 'bg-success' : (($l['track']=='ICT') ? 'bg-primary' : 'bg-secondary');
                                
                                // 2. FETCH QUIZ SCORES FOR THIS LESSON
                                $quiz_html = "";
                                // Find all quizzes linked to this lesson
                                $quizzes = $conn->query("SELECT id, title, content FROM activities WHERE lesson_id=$lid AND type='quiz'");
                                
                                if($quizzes->num_rows > 0){
                                    while($qz = $quizzes->fetch_assoc()){
                                        $real_quiz_id = intval($qz['content']); // 'content' holds the quiz ID from 'quizzes' table
                                        
                                        // Get the student's highest score for this quiz
                                        $s_query = $conn->query("SELECT score FROM quiz_results WHERE quiz_id=$real_quiz_id AND user_id=".$std['id']." ORDER BY score DESC LIMIT 1");
                                        
                                        if($s_row = $s_query->fetch_assoc()){
                                            $score = $s_row['score'];
                                            $s_color = ($score >= 8) ? 'success' : (($score >= 5) ? 'primary' : 'danger');
                                            
                                            $quiz_html .= "<div class='d-flex justify-content-between align-items-center mb-1 border-bottom pb-1'>
                                                            <small class='text-muted me-2'>- {$qz['title']}:</small>
                                                            <span class='badge bg-$s_color fs-6'>$score điểm</span>
                                                           </div>";
                                        } else {
                                            $quiz_html .= "<div class='d-flex justify-content-between align-items-center mb-1'>
                                                            <small class='text-muted me-2'>- {$qz['title']}:</small>
                                                            <span class='badge bg-secondary'>Chưa làm</span>
                                                           </div>";
                                        }
                                    }
                                } else {
                                    $quiz_html = "<span class='text-muted small fst-italic'>Không có bài kiểm tra</span>";
                                }

                                echo "<tr>
                                        <td class='fw-bold text-dark'>{$l['title']}</td>
                                        <td class='text-center'><span class='badge {$track_badge}'>{$l['track']}</span></td>
                                        
                                        <td class='align-middle'>
                                            <div class='d-flex align-items-center'>
                                                <div class='progress flex-grow-1' style='height: 12px;'>
                                                    <div class='progress-bar {$bar_color}' style='width: {$percent}%'></div>
                                                </div>
                                                <span class='ms-2 small fw-bold'>{$percent}%</span>
                                            </div>
                                        </td>

                                        <td class='align-middle'>
                                            $quiz_html
                                        </td>
                                      </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='4' class='text-center'>Chưa có bài học nào.</td></tr>";
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="passModal<?php echo $std['id']; ?>" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="POST">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title fw-bold">🔑 Đổi mật khẩu: <?php echo $std['name']; ?></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="user_id" value="<?php echo $std['id']; ?>">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Mật khẩu mới:</label>
                            <input type="text" name="new_pass" class="form-control" placeholder="Nhập mật khẩu mới..." required>
                        </div>
                        <div class="alert alert-warning small mb-0">
                            <i class="fas fa-exclamation-triangle me-1"></i> Lưu ý: Mật khẩu sẽ thay đổi ngay lập tức.
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" name="reset_password" class="btn btn-warning fw-bold">Lưu thay đổi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<?php endforeach; ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>