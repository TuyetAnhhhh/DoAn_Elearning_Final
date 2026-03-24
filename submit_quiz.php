<?php
session_start();
include 'includes/db.php';

// Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_SESSION['user_id'];
    $quiz_id = intval($_POST['quiz_id']);
    $lesson_id = intval($_POST['lesson_id']);

    // Lấy danh sách câu hỏi từ DB
    $sql = "SELECT * FROM questions WHERE quiz_id = $quiz_id";
    $result = $conn->query($sql);
    
    $total_items = 0;   // Tổng số mục cần trả lời
    $correct_items = 0; // Tổng số mục trả lời đúng

    if ($result->num_rows > 0) {
        while ($q = $result->fetch_assoc()) {
            $qid = $q['id'];
            $type = isset($q['type']) ? $q['type'] : 'mcq';

            // --- 1. TRẮC NGHIỆM (MCQ) & ĐÚNG/SAI ---
            if ($type == 'mcq' || $type == 'true_false' || empty($type)) {
                $total_items++; 
                
                // Kiểm tra đáp án (có xóa khoảng trắng thừa)
                if (isset($_POST['ans'][$qid])) {
                    if (trim($_POST['ans'][$qid]) == trim($q['correct_option'])) {
                        $correct_items++;
                    }
                }
            } 
            // --- 2. NỐI CHÉO (MATCHING) ---
            elseif ($type == 'matching') {
                $pairs = json_decode($q['matching_pairs'], true);
                
                if (is_array($pairs)) {
                    foreach ($pairs as $left => $correct_right) {
                        $total_items++; 
                        $key_hash = md5($left);
                        
                        // Kiểm tra đáp án
                        if (isset($_POST['ans'][$qid][$key_hash]) && $_POST['ans'][$qid][$key_hash] === $correct_right) {
                            $correct_items++;
                        }
                    }
                }
            }
            // --- 3. TỰ LUẬN (ESSAY) ---
            elseif ($type == 'essay') {
                continue; // Không tính điểm tự động
            }
        }
    }

    // --- TÍNH ĐIỂM SỐ ---
    $score = 0;
    if ($total_items > 0) {
        $score = round(($correct_items / $total_items) * 10, 2);
    }

    // --- LƯU KẾT QUẢ VÀO BẢNG quiz_results ---
    // [ĐÃ SỬA LẠI TÊN CỘT]: Dùng 'submitted_at' thay vì 'created_at'
    $stmt = $conn->prepare("INSERT INTO quiz_results (user_id, quiz_id, score, total_questions, submitted_at) VALUES (?, ?, ?, ?, NOW())");
    
    if ($stmt) {
        $stmt->bind_param("iidi", $user_id, $quiz_id, $score, $total_items);
        
        if ($stmt->execute()) {
            // --- ĐÁNH DẤU HOÀN THÀNH TIẾN ĐỘ ---
            $act_query = $conn->query("SELECT id FROM activities WHERE content = '$quiz_id' AND type = 'quiz' AND lesson_id = $lesson_id LIMIT 1");
            if ($act_row = $act_query->fetch_assoc()) {
                $activity_id = $act_row['id'];
                $conn->query("INSERT IGNORE INTO activity_completions (user_id, lesson_id, activity_id) VALUES ($user_id, $lesson_id, $activity_id)");
            }
        } else {
            echo "Lỗi lưu kết quả: " . $stmt->error;
            exit();
        }
    } else {
        echo "Lỗi chuẩn bị truy vấn: " . $conn->error;
        exit();
    }

    // --- HIỂN THỊ GIAO DIỆN KẾT QUẢ ---
    ?>
    <!DOCTYPE html>
    <html lang="vi">
    <head>
        <title>Kết quả bài kiểm tra</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body { background-color: #f0f2f5; font-family: 'Segoe UI', sans-serif; }
            .score-circle {
                width: 150px; height: 150px;
                border-radius: 50%;
                background: <?php echo ($score >= 5) ? '#d1e7dd' : '#f8d7da'; ?>;
                color: <?php echo ($score >= 5) ? '#0f5132' : '#842029'; ?>;
                display: flex; align-items: center; justify-content: center;
                margin: 0 auto;
                font-size: 3rem; font-weight: bold;
                border: 5px solid white;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-sm border-0 rounded-4">
                        <div class="card-body text-center p-5">
                            <?php if ($score >= 8): ?>
                                <i class="fas fa-trophy text-warning fa-3x mb-3"></i>
                                <h2 class="text-success fw-bold">Xuất sắc!</h2>
                            <?php elseif ($score >= 5): ?>
                                <i class="fas fa-check-circle text-success fa-3x mb-3"></i>
                                <h2 class="text-success fw-bold">Đạt yêu cầu!</h2>
                            <?php else: ?>
                                <i class="fas fa-times-circle text-danger fa-3x mb-3"></i>
                                <h2 class="text-danger fw-bold">Cần cố gắng hơn!</h2>
                            <?php endif; ?>

                            <div class="score-circle my-4">
                                <?php echo $score; ?>
                            </div>

                            <p class="fs-5 text-muted">
                                Bạn đã trả lời đúng <strong><?php echo $correct_items; ?></strong> trên tổng số <strong><?php echo $total_items; ?></strong> nội dung (không tính câu tự luận).
                            </p>

                            <hr class="my-4">

                            <div class="d-grid gap-2">
                                <a href="lesson.php?id=<?php echo $lesson_id; ?>" class="btn btn-primary btn-lg rounded-pill shadow-sm">
                                    <i class="fas fa-arrow-left me-2"></i> Quay lại bài học
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    </html>
    <?php
} else {
    header("Location: index.php");
}
?>