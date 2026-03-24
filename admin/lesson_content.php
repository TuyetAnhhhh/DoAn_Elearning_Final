<?php
session_start();
include '../includes/db.php';

// Kiểm tra quyền
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'teacher') {
    header("Location: ../index.php");
    exit();
}

// Lấy ID bài học
if (!isset($_GET['id'])) {
    header("Location: index.php");
    exit();
}
$lesson_id = intval($_GET['id']);
$lesson = $conn->query("SELECT * FROM lessons WHERE id=$lesson_id")->fetch_assoc();

// ======================================================
// 1. XỬ LÝ THÊM MỚI (ADD)
// ======================================================
if (isset($_POST['add_activity'])) {
    $title = $_POST['title'];
    $type = $_POST['type'];
    $content = "";

    if ($type == 'file') {
        if (isset($_FILES['file_upload']) && $_FILES['file_upload']['error'] == 0) {
            $filename = time() . "_" . $_FILES['file_upload']['name'];
            move_uploaded_file($_FILES['file_upload']['tmp_name'], "../uploads/" . $filename);
            $content = $filename;
        }
    } else {
        $content = $_POST['content_input'];
    }

    $max_order_query = $conn->query("SELECT MAX(display_order) as max_ord FROM activities WHERE lesson_id=$lesson_id");
    $row_ord = $max_order_query->fetch_assoc();
    $next_order = $row_ord['max_ord'] + 1;

    $stmt = $conn->prepare("INSERT INTO activities (lesson_id, type, title, content, display_order) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("isssi", $lesson_id, $type, $title, $content, $next_order);
    $stmt->execute();
    
    header("Location: lesson_content.php?id=$lesson_id");
    exit();
}

// ======================================================
// 2. XỬ LÝ CẬP NHẬT (EDIT)
// ======================================================
if (isset($_POST['edit_activity'])) {
    $act_id = $_POST['act_id'];
    $title = $_POST['title'];
    $type = $_POST['type'];
    
    $old_act = $conn->query("SELECT content FROM activities WHERE id=$act_id")->fetch_assoc();
    $content = $old_act['content'];

    if ($type == 'file') {
        if (isset($_FILES['file_upload']) && $_FILES['file_upload']['error'] == 0) {
            $filename = time() . "_" . $_FILES['file_upload']['name'];
            move_uploaded_file($_FILES['file_upload']['tmp_name'], "../uploads/" . $filename);
            $content = $filename;
        }
    } else {
        $content = $_POST['content_input'];
    }

    $stmt = $conn->prepare("UPDATE activities SET title=?, type=?, content=? WHERE id=?");
    $stmt->bind_param("sssi", $title, $type, $content, $act_id);
    $stmt->execute();

    header("Location: lesson_content.php?id=$lesson_id");
    exit();
}

// 3. Xử lý Xóa
if (isset($_GET['delete_act'])) {
    $act_id = $_GET['delete_act'];
    $conn->query("DELETE FROM activities WHERE id=$act_id");
    header("Location: lesson_content.php?id=$lesson_id");
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Soạn nội dung bài học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
    <style>
        body { background-color: #f8f9fc; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        
        /* --- TẠO MÀU TÍM GRADIENT --- */
        .bg-theme {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%) !important;
            color: white !important;
        }
        .text-theme {
            color: #764ba2 !important;
        }
        
        /* Nút bấm màu tím */
        .btn-theme {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            border: none;
            color: white;
            transition: all 0.3s ease;
        }
        .btn-theme:hover {
            background: linear-gradient(90deg, #764ba2 0%, #667eea 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(118, 75, 162, 0.4);
        }

        /* Nút sửa nhỏ */
        .btn-icon-edit {
            color: #667eea;
            background: #e0e7ff;
            border-radius: 50%;
            width: 32px; height: 32px;
            display: inline-flex; align-items: center; justify-content: center;
        }
        .btn-icon-edit:hover { background: #667eea; color: white; }

        .btn-icon-delete {
            color: #dc3545;
            background: #ffe3e6;
            border-radius: 50%;
            width: 32px; height: 32px;
            display: inline-flex; align-items: center; justify-content: center;
        }
        .btn-icon-delete:hover { background: #dc3545; color: white; }

        .cursor-move { cursor: move; color: #a0aec0; }
        .list-group-item.sortable-ghost { opacity: 0.4; background-color: #f0f0f0; }
        .item-label { background-color: #f3e8ff !important; border-left: 4px solid #764ba2 !important; }
        
        /* Style riêng cho Header (Mới thêm) */
        .item-header { background-color: #e8f5e9 !important; border-left: 4px solid #198754 !important; font-weight: bold; }
    </style>
</head>
<body class="p-4">

<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Soạn nội dung: <span class="text-theme fw-bold"><?php echo $lesson['title']; ?></span></h3>
        <a href="index.php" class="btn btn-outline-secondary rounded-pill px-4">← Quay lại Dashboard</a>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card shadow border-0 sticky-top" style="top: 20px;">
                <div class="card-header bg-theme fw-bold py-3">
                    <i class="fas fa-plus-circle me-2"></i> Thêm hoạt động mới
                </div>
                <div class="card-body">
                    <form method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary small text-uppercase">Tên hoạt động</label>
                            <input type="text" name="title" class="form-control" placeholder="Vd: Bài kiểm tra..." required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold text-secondary small text-uppercase">Loại hoạt động</label>
                            <select name="type" class="form-select" id="typeSelect" onchange="changeInputType('add')">
                                <option value="video">Video (Youtube)</option>
                                <option value="colab">Google Colab</option>
                                <option value="text">Bài đọc (Lý thuyết)</option>
                                <option value="file">📂 Tài liệu (PDF, Word)</option>
                                <option value="assignment">📝 Bài tập (Nộp file)</option>
                                <option value="quiz">🧩 Bài trắc nghiệm (Quiz)</option>
                                <option value="label" style="font-weight:bold; color:#764ba2;">📌 Nhãn / Ghi chú</option>
                                <option value="google_form" style="font-weight:bold; color:#d63384;">📝 Google Form</option>
                                <option value="edpuzzle" style="font-weight:bold; color:#fbbf24;">🧩 Video tương tác (Edpuzzle)</option>
                                <option value="header" style="font-weight:bold; color:#198754; background-color:#e8f5e9;">🗂️ Tiêu đề Chương / Mục lớn</option>
                            </select>
                        </div>

                        <div class="mb-3" id="inputUrlGroup_add">
                            <label class="form-label fw-bold text-secondary small text-uppercase">Nội dung / Link</label>
                            <textarea name="content_input" class="form-control" rows="4" placeholder="Nhập nội dung..."></textarea>
                            <div class="form-text text-muted small mt-1 d-none" id="quizHint_add">Nhập ID bộ đề Quiz.</div>
                        </div>

                        <div class="mb-3 d-none" id="inputFileGroup_add">
                            <label class="form-label fw-bold text-secondary small text-uppercase">Chọn tệp tin</label>
                            <input type="file" name="file_upload" class="form-control">
                        </div>

                        <button type="submit" name="add_activity" class="btn btn-theme w-100 fw-bold py-2 rounded-pill">
                            + Thêm vào bài học
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card shadow border-0">
                <div class="card-header bg-white fw-bold d-flex justify-content-between py-3">
                    <span class="text-dark"><i class="fas fa-list me-2 text-theme"></i> Danh sách nội dung</span>
                    <small class="text-muted fst-italic fw-normal"><i class="fas fa-arrows-alt me-1"></i>Kéo thả để sắp xếp</small>
                </div>
                
                <ul class="list-group list-group-flush" id="activityList">
                    <?php
                    $acts = $conn->query("SELECT * FROM activities WHERE lesson_id=$lesson_id ORDER BY display_order ASC");
                    if ($acts->num_rows > 0) {
                        while($row = $acts->fetch_assoc()){
                            $icon = "fa-file-alt"; $badge = "bg-secondary"; $type_name = "KHÁC"; $extra_class = "";
                            
                            // Tùy chỉnh màu Badge
                            if($row['type']=='video') { $icon="fa-youtube"; $badge="bg-danger"; $type_name="VIDEO"; }
                            elseif($row['type']=='colab') { $icon="fa-code"; $badge="bg-warning text-dark"; $type_name="COLAB"; }
                            elseif($row['type']=='text') { $icon="fa-book"; $badge="bg-info text-dark"; $type_name="BÀI ĐỌC"; }
                            elseif($row['type']=='file') { $icon="fa-file-pdf"; $badge="bg-success"; $type_name="FILE"; }
                            elseif($row['type']=='quiz') { $icon="fa-puzzle-piece"; $badge="bg-success"; $type_name="QUIZ"; }
                            elseif($row['type']=='assignment') { $icon="fa-pen-square"; $badge="bg-primary"; $type_name="BÀI TẬP"; }
                            elseif($row['type']=='label') { $icon="fa-info-circle"; $badge="bg-light text-dark border"; $type_name="LABEL"; $extra_class = "item-label"; }
                            elseif($row['type']=='google_form') { $icon="fa-clipboard-list"; $badge="bg-primary"; $type_name="GOOGLE FORM"; }
                            elseif($row['type']=='edpuzzle') { $icon="fa-puzzle-piece"; $badge="bg-warning text-dark"; $type_name="EDPUZZLE"; }
                            // [MỚI THÊM] Logic hiển thị Header
                            elseif($row['type']=='header') { $icon="fa-heading"; $badge="bg-success"; $type_name="HEADER"; $extra_class = "item-header"; }
                    ?>
                        <li class="list-group-item d-flex justify-content-between align-items-center py-3 <?php echo $extra_class; ?>" data-id="<?php echo $row['id']; ?>">
                            <div class="d-flex align-items-center" style="max-width: 75%;">
                                <div class="cursor-move me-3 p-2"><i class="fas fa-bars fa-lg"></i></div>
                                <div>
                                    <h6 class="mb-0 fw-bold text-dark text-break">
                                        <i class="fas <?php echo $icon; ?> me-2 text-muted"></i>
                                        <?php echo htmlspecialchars($row['title']); ?>
                                    </h6>
                                    <span class="badge <?php echo $badge; ?> rounded-pill" style="font-size: 0.65rem;"><?php echo $type_name; ?></span>
                                    <?php if($row['type']=='label' || $row['type']=='header'): ?>
                                        <small class="text-muted d-block mt-1 fst-italic text-truncate">
                                            "<?php echo substr(strip_tags($row['content']), 0, 50); ?>..."
                                        </small>
                                    <?php endif; ?>
                                </div>
                            </div>
                            
                            <div>
                                <button type="button" class="btn btn-icon-edit me-1 border-0" 
                                        onclick='openEditModal(<?php echo json_encode($row); ?>)' title="Chỉnh sửa">
                                    <i class="fas fa-pen" style="font-size: 12px;"></i>
                                </button>

                                <a href="lesson_content.php?id=<?php echo $lesson_id; ?>&delete_act=<?php echo $row['id']; ?>" 
                                   class="btn btn-icon-delete border-0" 
                                   onclick="return confirm('Xóa mục này?');" title="Xóa">
                                    <i class="fas fa-trash" style="font-size: 12px;"></i>
                                </a>
                            </div>
                        </li>
                    <?php 
                        }
                    } else { echo "<div class='p-5 text-center text-muted'>Chưa có nội dung nào. Hãy thêm ở bên trái!</div>"; }
                    ?>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content border-0">
            <div class="modal-header bg-theme text-white">
                <h5 class="modal-title fw-bold"><i class="fas fa-edit me-2"></i> Chỉnh sửa hoạt động</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="act_id" id="edit_act_id">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Tên hoạt động</label>
                        <input type="text" name="title" id="edit_title" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Loại hoạt động</label>
                        <select name="type" class="form-select" id="edit_type" onchange="changeInputType('edit')">
                            <option value="video">Video (Youtube)</option>
                            <option value="colab">Google Colab</option>
                            <option value="text">Bài đọc (Lý thuyết)</option>
                            <option value="file">📂 Tài liệu (PDF, Word)</option>
                            <option value="assignment">📝 Bài tập (Nộp file)</option>
                            <option value="quiz">🧩 Bài trắc nghiệm (Quiz)</option>
                            <option value="label">📌 Nhãn / Ghi chú</option>
                            <option value="google_form">📝 Google Form</option>
                            <option value="edpuzzle" style="font-weight:bold; color:#fbbf24;">🧩 Video tương tác (Edpuzzle)</option>
                            <option value="header" style="font-weight:bold; color:#198754; background-color:#e8f5e9;">🗂️ Tiêu đề Chương / Mục lớn</option>
                        </select>
                    </div>

                    <div class="mb-3" id="inputUrlGroup_edit">
                        <label class="form-label fw-bold">Nội dung / Link</label>
                        <textarea name="content_input" id="edit_content" class="form-control" rows="4"></textarea>
                        <div class="form-text text-muted d-none" id="quizHint_edit">Nhập ID bộ đề Quiz.</div>
                    </div>

                    <div class="mb-3 d-none" id="inputFileGroup_edit">
                        <label class="form-label fw-bold">Thay đổi tệp tin (Nếu cần)</label>
                        <input type="file" name="file_upload" class="form-control">
                        <small class="text-muted fst-italic mt-1 d-block">Để trống nếu muốn giữ tệp tin cũ.</small>
                    </div>

                    <div class="d-flex justify-content-end pt-2">
                        <button type="button" class="btn btn-light border me-2 rounded-pill px-3" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" name="edit_activity" class="btn btn-theme fw-bold rounded-pill px-4">Lưu thay đổi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 1. Hàm điều khiển hiển thị input
    function changeInputType(mode) {
        var type = document.getElementById(mode === 'add' ? 'typeSelect' : 'edit_type').value;
        var urlGroup = document.getElementById('inputUrlGroup_' + mode);
        var fileGroup = document.getElementById('inputFileGroup_' + mode);
        var quizHint = document.getElementById('quizHint_' + mode);

        if (type === 'file') {
            urlGroup.classList.add('d-none');
            fileGroup.classList.remove('d-none');
        } else {
            urlGroup.classList.remove('d-none');
            fileGroup.classList.add('d-none');
        }

        if (type === 'quiz') { quizHint.classList.remove('d-none'); } 
        else { quizHint.classList.add('d-none'); }
    }

    // 2. Hàm mở Modal Edit
    function openEditModal(data) {
        document.getElementById('edit_act_id').value = data.id;
        document.getElementById('edit_title').value = data.title;
        document.getElementById('edit_type').value = data.type;
        
        if (data.type !== 'file') {
            document.getElementById('edit_content').value = data.content;
        } else {
            document.getElementById('edit_content').value = "";
        }

        changeInputType('edit');
        var myModal = new bootstrap.Modal(document.getElementById('editModal'));
        myModal.show();
    }

    // 3. Kéo thả (Sortable)
    var el = document.getElementById('activityList');
    var sortable = new Sortable(el, {
        handle: '.cursor-move',
        animation: 150,
        ghostClass: 'sortable-ghost',
        onEnd: function (evt) {
            var order = sortable.toArray(); 
            var formData = new FormData();
            order.forEach(function(id, index) { formData.append('order[' + index + ']', id); });
            fetch('ajax_reorder.php', { method: 'POST', body: formData });
        }
    });
</script>
</body>
</html>