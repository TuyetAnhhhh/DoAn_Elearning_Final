<?php
session_start();
include '../includes/db.php';

// Kiểm tra quyền
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'teacher') {
    header("Location: ../index.php");
    exit();
}

// 2. Lấy ID bộ đề hiện tại (nếu có)
$quiz_id = isset($_GET['qid']) ? intval($_GET['qid']) : 0;

// =========================================================================
// XỬ LÝ 1: TẠO BỘ ĐỀ MỚI
// =========================================================================
if (isset($_POST['create_quiz'])) {
    $title = htmlspecialchars($_POST['quiz_title']);
    if (!empty($title)) {
        $conn->query("INSERT INTO quizzes (title) VALUES ('$title')");
        $new_id = $conn->insert_id;
        echo "<script>window.location.href='manage_quiz.php?qid=$new_id';</script>";
        exit();
    }
}

// =========================================================================
// [MỚI] XỬ LÝ 2: SỬA TÊN BỘ ĐỀ
// =========================================================================
if (isset($_POST['update_quiz_title'])) {
    $edit_quiz_id = intval($_POST['edit_quiz_id']);
    $new_title = htmlspecialchars($_POST['new_quiz_title']);
    
    if (!empty($new_title)) {
        $stmt = $conn->prepare("UPDATE quizzes SET title = ? WHERE id = ?");
        $stmt->bind_param("si", $new_title, $edit_quiz_id);
        $stmt->execute();
        echo "<script>alert('Đã đổi tên thành công!'); window.location.href='manage_quiz.php?qid=$edit_quiz_id';</script>";
        exit();
    }
}

// =========================================================================
// [MỚI] XỬ LÝ 3: XÓA BỘ ĐỀ
// =========================================================================
if (isset($_GET['delete_quiz_id'])) {
    $del_id = intval($_GET['delete_quiz_id']);
    
    // Xóa câu hỏi
    $conn->query("DELETE FROM questions WHERE quiz_id = $del_id");
    // Xóa kết quả thi
    $conn->query("DELETE FROM quiz_results WHERE quiz_id = $del_id");
    // Xóa bộ đề
    $conn->query("DELETE FROM quizzes WHERE id = $del_id");
    
    echo "<script>alert('Đã xóa bộ đề!'); window.location.href='manage_quiz.php';</script>";
    exit();
}

// =========================================================================
// XỬ LÝ 4: QUẢN LÝ CÂU HỎI (THÊM/SỬA/XÓA CÂU HỎI - GIỮ NGUYÊN)
// =========================================================================

// Xóa câu hỏi
if (isset($_GET['delete_q'])) {
    $q_id = intval($_GET['delete_q']);
    $conn->query("DELETE FROM questions WHERE id=$q_id");
    header("Location: manage_quiz.php?qid=$quiz_id");
    exit();
}

// Thêm/Sửa câu hỏi
if (isset($_POST['save_question'])) {
    $q_text = $_POST['question_text'];
    $type = $_POST['q_type'];

    $oa = $ob = $oc = $od = "";
    $correct = "";
    $json_pairs = "";

    if ($type == 'mcq') {
        $oa = $_POST['option_a']; $ob = $_POST['option_b'];
        $oc = $_POST['option_c']; $od = $_POST['option_d'];
        $correct = $_POST['correct_option'];
    } elseif ($type == 'matching') {
        $left = $_POST['match_left']; $right = $_POST['match_right'];
        $pairs = [];
        for($i=0; $i < count($left); $i++){
            if(!empty($left[$i]) && !empty($right[$i])) { $pairs[$left[$i]] = $right[$i]; }
        }
        $json_pairs = json_encode($pairs, JSON_UNESCAPED_UNICODE);
    } elseif ($type == 'true_false') {
        $correct = isset($_POST['tf_correct']) ? $_POST['tf_correct'] : 'True';
    } elseif ($type == 'essay') {
        $correct = $_POST['essay_guide'];
    }

    if (!empty($_POST['question_id'])) {
        $stmt = $conn->prepare("UPDATE questions SET question_text=?, option_a=?, option_b=?, option_c=?, option_d=?, correct_option=?, matching_pairs=?, type=? WHERE id=?");
        $stmt->bind_param("ssssssssi", $q_text, $oa, $ob, $oc, $od, $correct, $json_pairs, $type, $_POST['question_id']);
    } else {
        $stmt = $conn->prepare("INSERT INTO questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option, matching_pairs, type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("issssssss", $quiz_id, $q_text, $oa, $ob, $oc, $od, $correct, $json_pairs, $type);
    }
    $stmt->execute();
    header("Location: manage_quiz.php?qid=$quiz_id");
    exit();
}

// Lấy dữ liệu sửa câu hỏi
$edit_data = null;
if (isset($_GET['edit_q'])) {
    $edit_id = intval($_GET['edit_q']);
    $result = $conn->query("SELECT * FROM questions WHERE id=$edit_id");
    $edit_data = $result->fetch_assoc();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Quản lý Ngân hàng câu hỏi</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Nunito', sans-serif; background-color: #f8f9fc; min-height: 100vh; display: flex; flex-direction: column; }
        .bg-theme-gradient { background: linear-gradient(90deg, #667eea 0%, #764ba2 100%); }
        .card-custom { border: none; border-radius: 15px; box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1); overflow: hidden; }
        .btn-theme { background-color: #764ba2; color: white; border-radius: 50px; font-weight: 600; }
        .btn-theme:hover { background-color: #5b3785; color: white; }
        .list-group-item.active { background-color: #e0e7ff; color: #4c1d95; border-left: 5px solid #764ba2; border-color: transparent; font-weight: 700; }
        footer { margin-top: auto; background-color: #2d3748; color: #cbd5e0; }
        
        /* CSS MỚI: Hiệu ứng hover cho danh sách bộ đề */
        .quiz-item:hover { background-color: #f8f9fa; }
        .quiz-item:hover .quiz-actions { visibility: visible; }
        .quiz-actions { visibility: hidden; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-theme-gradient py-3 shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.php"><i class="fas fa-graduation-cap me-2"></i> Tin học 12</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto"><li class="nav-item"><a class="nav-link active fw-bold" href="manage_quiz.php">Ngân hàng câu hỏi</a></li></ul>
            <a class="btn btn-light rounded-pill fw-bold text-primary btn-sm px-3" href="index.php">Về Dashboard</a>
        </div>
    </div>
</nav>

<div class="container py-5">
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card card-custom mb-4">
                <div class="card-body">
                    <h5 class="fw-bold text-dark mb-3"><i class="fas fa-plus-circle text-primary"></i> Tạo Bộ đề mới</h5>
                    <form method="POST">
                        <div class="input-group">
                            <input type="text" name="quiz_title" class="form-control" placeholder="Tên bộ đề..." required>
                            <button type="submit" name="create_quiz" class="btn btn-primary"><i class="fas fa-check"></i></button>
                        </div>
                    </form>
                </div>
            </div>
            
            <h6 class="text-uppercase text-secondary fw-bold small mb-3 ms-2">Danh sách bộ đề</h6>
            <div class="list-group shadow-sm rounded-3 overflow-hidden bg-white">
                <?php
                $quizzes = $conn->query("SELECT * FROM quizzes ORDER BY id DESC");
                while($q = $quizzes->fetch_assoc()){
                    $active = ($quiz_id == $q['id']) ? 'active' : '';
                    $isActiveItem = ($quiz_id == $q['id']);
                ?>
                    <div class="list-group-item list-group-item-action py-3 d-flex justify-content-between align-items-center quiz-item <?php echo $active; ?>">
                        <a href='manage_quiz.php?qid=<?php echo $q['id']; ?>' class="text-decoration-none text-truncate flex-grow-1 <?php echo $isActiveItem ? 'text-primary' : 'text-dark'; ?>">
                            <i class='fas fa-file-alt me-2'></i> <?php echo htmlspecialchars($q['title']); ?>
                        </a>
                        
                        <div class="quiz-actions ms-2">
                            <button class="btn btn-sm btn-link text-success p-0 me-2" 
                                    onclick="openRenameModal(<?php echo $q['id']; ?>, '<?php echo addslashes($q['title']); ?>')" 
                                    title="Sửa tên">
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                            <a href="manage_quiz.php?delete_quiz_id=<?php echo $q['id']; ?>" 
                               class="btn btn-sm btn-link text-danger p-0" 
                               onclick="return confirm('CẢNH BÁO: Xóa bộ đề này sẽ xóa toàn bộ câu hỏi bên trong!\nBạn có chắc chắn không?')" 
                               title="Xóa bộ đề">
                                <i class="fas fa-trash"></i>
                            </a>
                        </div>
                    </div>
                <?php 
                }
                ?>
            </div>
        </div>

        <div class="col-md-8">
            <?php if(isset($_GET['qid'])): 
                $qid = $_GET['qid'];
                $curr_quiz = $conn->query("SELECT * FROM quizzes WHERE id=$qid")->fetch_assoc();
            ?>
                <div class="card card-custom h-100">
                    <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center border-bottom">
                        <h5 class="m-0 fw-bold text-primary"><i class="fas fa-edit me-2"></i> <?php echo $curr_quiz['title']; ?></h5>
                        <span class="badge bg-light text-secondary border">ID: <?php echo $qid; ?></span>
                    </div>

                    <div class="card-body p-4">
                        <div class="bg-light p-4 rounded-3 border mb-4">
                            <h6 class="fw-bold text-dark mb-3"><?php echo $edit_data ? '✏️ Chỉnh sửa' : '✨ Thêm câu hỏi mới'; ?></h6>
                            
                            <form method="POST" action="manage_quiz.php?qid=<?php echo $qid; ?>">
                                <input type="hidden" name="question_id" value="<?php echo $edit_data ? $edit_data['id'] : ''; ?>">

                                <div class="mb-3">
                                    <textarea name="question_text" class="form-control shadow-sm" rows="2" placeholder="Nội dung câu hỏi / Yêu cầu..." required><?php echo $edit_data ? $edit_data['question_text'] : ''; ?></textarea>
                                </div>

                                <div class="mb-3">
                                    <label class="fw-bold small text-muted">Loại câu hỏi:</label>
                                    <select name="q_type" id="qType" class="form-select w-auto d-inline-block shadow-sm" onchange="toggleType()">
                                        <option value="mcq" <?php if($edit_data && $edit_data['type']=='mcq') echo 'selected'; ?>>Trắc nghiệm (4 đáp án)</option>
                                        <option value="matching" <?php if($edit_data && $edit_data['type']=='matching') echo 'selected'; ?>>Nối chéo (Matching)</option>
                                        <option value="true_false" <?php if($edit_data && $edit_data['type']=='true_false') echo 'selected'; ?>>Đúng / Sai</option>
                                        <option value="essay" <?php if($edit_data && $edit_data['type']=='essay') echo 'selected'; ?>>Tự luận</option>
                                    </select>
                                </div>

                                <div id="mcqArea">
                                    <div class="row g-2 mb-2">
                                        <div class="col-6"><input type="text" name="option_a" class="form-control shadow-sm" placeholder="Đáp án A" value="<?php echo $edit_data ? $edit_data['option_a'] : ''; ?>"></div>
                                        <div class="col-6"><input type="text" name="option_b" class="form-control shadow-sm" placeholder="Đáp án B" value="<?php echo $edit_data ? $edit_data['option_b'] : ''; ?>"></div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-6"><input type="text" name="option_c" class="form-control shadow-sm" placeholder="Đáp án C" value="<?php echo $edit_data ? $edit_data['option_c'] : ''; ?>"></div>
                                        <div class="col-6"><input type="text" name="option_d" class="form-control shadow-sm" placeholder="Đáp án D" value="<?php echo $edit_data ? $edit_data['option_d'] : ''; ?>"></div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="fw-bold small text-success">Đáp án đúng:</label>
                                        <select name="correct_option" class="form-select w-auto d-inline-block shadow-sm">
                                            <?php $s = $edit_data ? $edit_data['correct_option'] : ''; ?>
                                            <option value="a" <?php if($s=='a') echo 'selected'; ?>>A</option>
                                            <option value="b" <?php if($s=='b') echo 'selected'; ?>>B</option>
                                            <option value="c" <?php if($s=='c') echo 'selected'; ?>>C</option>
                                            <option value="d" <?php if($s=='d') echo 'selected'; ?>>D</option>
                                        </select>
                                    </div>
                                </div>

                                <div id="matchingArea" style="display:none;">
                                    <p class="small text-muted mb-2">Nhập các cặp tương ứng đúng (Hệ thống sẽ tự trộn khi hiển thị).</p>
                                    <?php 
                                        $pairs = ($edit_data && $edit_data['type']=='matching') ? json_decode($edit_data['matching_pairs'], true) : [];
                                        $count = max(4, count($pairs));
                                        $keys = array_keys($pairs);
                                        $vals = array_values($pairs);
                                        for($i=0; $i<$count; $i++): 
                                    ?>
                                    <div class="input-group mb-2">
                                        <span class="input-group-text bg-light text-secondary">Cặp <?php echo $i+1; ?></span>
                                        <input type="text" name="match_left[]" class="form-control shadow-sm" placeholder="Vế trái" value="<?php echo isset($keys[$i]) ? $keys[$i] : ''; ?>">
                                        <span class="input-group-text bg-white border-start-0 border-end-0"><i class="fas fa-arrow-right text-muted"></i></span>
                                        <input type="text" name="match_right[]" class="form-control shadow-sm" placeholder="Vế phải" value="<?php echo isset($vals[$i]) ? $vals[$i] : ''; ?>">
                                    </div>
                                    <?php endfor; ?>
                                </div>

                                <div id="tfArea" style="display:none;">
                                    <div class="alert alert-white border shadow-sm">
                                        <label class="fw-bold text-success me-3">Đáp án đúng là:</label>
                                        <?php $tf = $edit_data ? $edit_data['correct_option'] : 'True'; ?>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="tf_correct" value="True" <?php if($tf=='True') echo 'checked'; ?>>
                                            <label class="form-check-label fw-bold text-primary">Đúng (True)</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="tf_correct" value="False" <?php if($tf=='False') echo 'checked'; ?>>
                                            <label class="form-check-label fw-bold text-danger">Sai (False)</label>
                                        </div>
                                    </div>
                                </div>

                                <div id="essayArea" style="display:none;">
                                    <div class="mb-3">
                                        <label class="fw-bold small text-muted">Gợi ý chấm điểm (Tùy chọn):</label>
                                        <textarea name="essay_guide" class="form-control shadow-sm" rows="3" placeholder="Nhập gợi ý đáp án..."><?php echo $edit_data ? $edit_data['correct_option'] : ''; ?></textarea>
                                    </div>
                                    <div class="alert alert-info py-2 small">
                                        <i class="fas fa-info-circle me-1"></i> Học sinh sẽ nhập câu trả lời dạng văn bản.
                                    </div>
                                </div>

                                <button type="submit" name="save_question" class="btn btn-theme shadow-sm px-4">
                                    <?php echo $edit_data ? 'Lưu thay đổi' : 'Thêm câu hỏi'; ?>
                                </button>
                                <?php if($edit_data): ?> <a href="manage_quiz.php?qid=<?php echo $qid; ?>" class="btn btn-secondary shadow-sm ms-2">Hủy</a> <?php endif; ?>
                            </form>
                        </div>

                        <h6 class="text-secondary fw-bold small text-uppercase mb-3">Danh sách câu hỏi</h6>
                        <div class="vstack gap-3">
                            <?php
                            $qs = $conn->query("SELECT * FROM questions WHERE quiz_id=$qid ORDER BY id ASC");
                            if ($qs->num_rows > 0) {
                                $i = 1;
                                while($row = $qs->fetch_assoc()){
                                    $badgeClass = 'bg-secondary';
                                    $typeName = 'Khác';
                                    if($row['type']=='mcq') { $badgeClass='bg-success'; $typeName='Trắc nghiệm'; }
                                    elseif($row['type']=='matching') { $badgeClass='bg-warning text-dark'; $typeName='Nối chéo'; }
                                    elseif($row['type']=='true_false') { $badgeClass='bg-primary'; $typeName='Đúng/Sai'; }
                                    elseif($row['type']=='essay') { $badgeClass='bg-info text-dark'; $typeName='Tự luận'; }
                            ?>
                                <div class="p-3 bg-white border rounded-3 shadow-sm position-relative">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <span class="badge <?php echo $badgeClass; ?> me-2"><?php echo $typeName; ?></span>
                                            <strong class="text-dark">Câu <?php echo $i++; ?>:</strong> 
                                            <?php echo htmlspecialchars($row['question_text']); ?>
                                        </div>
                                        <div style="min-width: 60px; text-align: right;">
                                            <a href="manage_quiz.php?qid=<?php echo $qid; ?>&edit_q=<?php echo $row['id']; ?>" class="text-primary me-2"><i class="fas fa-edit"></i></a>
                                            <a href="manage_quiz.php?qid=<?php echo $qid; ?>&delete_q=<?php echo $row['id']; ?>" class="text-danger" onclick="return confirm('Xóa?')"><i class="fas fa-trash-alt"></i></a>
                                        </div>
                                    </div>
                                    
                                    <div class="mt-2 ps-3 small text-muted border-start border-3">
                                        <?php if($row['type'] == 'mcq'): ?>
                                            A. <?php echo $row['option_a']; ?> | B. <?php echo $row['option_b']; ?>... <br>
                                            <span class="text-success fw-bold">Đúng: <?php echo strtoupper($row['correct_option']); ?></span>
                                        <?php elseif($row['type'] == 'matching'): 
                                            $pairs = json_decode($row['matching_pairs'], true);
                                            if($pairs) foreach($pairs as $k => $v) echo "▪ $k ⮕ $v <br>";
                                        ?>
                                        <?php elseif($row['type'] == 'true_false'): ?>
                                            Đáp án: <span class="fw-bold <?php echo ($row['correct_option']=='True')?'text-primary':'text-danger'; ?>">
                                                <?php echo ($row['correct_option']=='True') ? 'ĐÚNG' : 'SAI'; ?>
                                            </span>
                                        <?php elseif($row['type'] == 'essay'): ?>
                                            <span class="fst-italic">Gợi ý: <?php echo $row['correct_option']; ?></span>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            <?php 
                                }
                            } else {
                                echo "<div class='text-center text-muted py-5'>Chưa có câu hỏi nào.</div>";
                            }
                            ?>
                        </div>
                    </div>
                </div>
            <?php else: ?>
                <div class="alert alert-light text-center border shadow-sm p-5 card-custom">
                    <h4 class="text-muted fw-bold">Chào mừng trở lại! 👋</h4>
                    <p class="mb-0">Vui lòng chọn một bộ đề bên tay trái để bắt đầu biên soạn.</p>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>

<div class="modal fade" id="renameQuizModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <form method="POST" class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title fw-bold">Đổi tên bộ đề</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="edit_quiz_id" id="edit_quiz_id">
                <div class="mb-3">
                    <label class="form-label">Tên mới:</label>
                    <input type="text" name="new_quiz_title" id="new_quiz_title" class="form-control" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" name="update_quiz_title" class="btn btn-primary fw-bold">Lưu thay đổi</button>
            </div>
        </form>
    </div>
</div>

<footer class="text-center py-4"><div class="container"><p class="mb-0 small text-white-50">&copy; 2025 E-learning.</p></div></footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleType() {
        var type = document.getElementById('qType').value;
        document.getElementById('mcqArea').style.display = 'none';
        document.getElementById('matchingArea').style.display = 'none';
        document.getElementById('tfArea').style.display = 'none';
        document.getElementById('essayArea').style.display = 'none';

        if (type === 'mcq') {
            document.getElementById('mcqArea').style.display = 'block';
        } else if (type === 'matching') {
            document.getElementById('matchingArea').style.display = 'block';
        } else if (type === 'true_false') {
            document.getElementById('tfArea').style.display = 'block';
        } else if (type === 'essay') {
            document.getElementById('essayArea').style.display = 'block';
        }
    }
    toggleType();

    // Hàm mở Modal đổi tên
    function openRenameModal(id, title) {
        document.getElementById('edit_quiz_id').value = id;
        document.getElementById('new_quiz_title').value = title;
        var myModal = new bootstrap.Modal(document.getElementById('renameQuizModal'));
        myModal.show();
    }
</script>
</body>
</html>