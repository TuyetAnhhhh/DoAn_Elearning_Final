<?php
session_start();
include 'includes/db.php';

// --- PHẦN 1: XỬ LÝ LOGIC ---

if(isset($_GET['id'])) {
    $lesson_id = intval($_GET['id']);
    $sql = "SELECT * FROM lessons WHERE id = $lesson_id";
    $result = $conn->query($sql);
    if($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else { header("Location: index.php"); exit(); }
} else { header("Location: index.php"); exit(); }

if (!isset($_SESSION['user_id'])) { header("Location: login.php"); exit(); }

// Xử lý Gửi bình luận
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit_comment'])) {
    $u_id = $_SESSION['user_id'];
    $content = htmlspecialchars($_POST['comment_content']);
    if(!empty($content)){
        $conn->query("INSERT INTO comments (lesson_id, user_id, content) VALUES ('$lesson_id', '$u_id', '$content')");
        header("Location: lesson.php?id=$lesson_id");
        exit();
    }
}

include 'includes/header.php'; 
?>

<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
  <div id="liveToast" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
      <div class="toast-body">
        <i class="bi bi-check-circle-fill me-2"></i> Đã lưu tiến độ học tập!
      </div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>
</div>

<div class="row">
    <div class="col-md-3">
        <div class="list-group mt-3 sticky-top" style="top: 80px; z-index: 1;">
            <div class="list-group-item text-white fw-bold" style="background-color: #7d1bceff;">
                <i class="bi bi-journal-bookmark-fill me-2"></i>Chủ đề F
            </div>
            <?php
            $sql_list = "SELECT id, title FROM lessons ORDER BY id ASC";
            $res_list = $conn->query($sql_list);
            while($l = $res_list->fetch_assoc()){
                $active = ($l['id'] == $lesson_id) ? 'active fw-bold' : '';
                echo '<a href="lesson.php?id='.$l['id'].'" class="list-group-item list-group-item-action '.$active.'">
                        <i class="bi bi-play-circle me-2"></i>'.$l['title'].'
                      </a>';
            }
            ?>
        </div>
    </div>

    <div class="col-md-9">
        
        <div class="card mt-3 shadow-sm border-0 mb-4">
            <div class="card-body">
                <h2 class="card-title text-primary fw-bold"><?php echo $row['title']; ?></h2>
                <hr>
                <p class="lead text-secondary"><?php echo $row['description']; ?></p>
            </div>
        </div>

        <h5 class="fw-bold text-dark mb-3"><i class="bi bi-collection-play me-2"></i>Nội dung chi tiết</h5>
        
        <div class="accordion shadow-sm mb-5 border-0 bg-transparent" id="lessonAccordion">
            <?php
            $sql_act = "SELECT * FROM activities WHERE lesson_id = $lesson_id ORDER BY display_order ASC";
            $res_act = $conn->query($sql_act);
            
            if ($res_act->num_rows > 0) {
                $index = 0;
                while($act = $res_act->fetch_assoc()) {
                    $index++;
                    
                    // HEADER
                    if ($act['type'] == 'header') {
                        echo '<div class="mt-5 mb-3 pt-2 pb-2 position-relative">
                                <div class="d-flex align-items-center">
                                    <span class="bg-white text-primary border border-2 border-primary rounded-circle d-flex align-items-center justify-content-center shadow-sm" 
                                      style="width: 45px; height: 45px; font-size: 1.3rem; z-index: 2;">
                                    <i class="bi bi-bookmark-star-fill"></i>
                                    </span>
                                    <div class="ps-5 pe-4 py-2 flex-grow-1 shadow-sm rounded-pill" 
                                     style="background: linear-gradient(90deg, #667eea 0%, #764ba2 100%); color: white; margin-left: -22px; z-index: 1;">
                                    <h5 class="m-0 fw-bold text-uppercase" style="letter-spacing: 1px; padding-left: 10px;">'.htmlspecialchars($act['title']).'</h5>
                                    </div>
                                </div>
                                '. ($act['content'] ? '<div class="ms-5 ps-3 text-muted small fst-italic mt-1">'.htmlspecialchars($act['content']).'</div>' : '') .'
                              </div>';
                        continue; 
                    }

                    // LABEL
                    if ($act['type'] == 'label') {
                        echo '<div class="p-3 bg-light border rounded shadow-sm my-3 clickable-label" 
                                   style="cursor: pointer; transition: 0.3s; border-left: 4px solid #dc3545 !important;"
                                   onclick="markCompleted('.$act['id'].', this)"
                                   title="Bấm vào để đánh dấu đã thực hiện">
                                <div class="d-flex align-items-start">
                                    <i class="bi bi-exclamation-circle-fill text-danger fs-4 me-3 mt-1"></i>
                                    <div>
                                        <strong class="text-dark d-block mb-2">'.htmlspecialchars($act['title']).'</strong>
                                        <div class="text-secondary">'.nl2br($act['content']).'</div>
                                    </div>
                                </div>
                                <div class="text-end mt-2"><small class="text-muted fst-italic"><i class="bi bi-hand-index-thumb"></i> Bấm vào để đánh dấu đã thực hiện</small></div>
                              </div>';
                        continue; 
                    }

                    $collapseId = "collapse" . $index;
                    $headingId = "heading" . $index;
                    $show = ($index == 1) ? "show" : ""; 
                    $btnCollapsed = ($index == 1) ? "" : "collapsed";
            ?>
                <div class="accordion-item mb-2 border shadow-sm rounded overflow-hidden">
                    <h2 class="accordion-header" id="<?php echo $headingId; ?>">
                        <button class="accordion-button <?php echo $btnCollapsed; ?> fw-bold bg-white" type="button" 
                                data-bs-toggle="collapse" 
                                data-bs-target="#<?php echo $collapseId; ?>"
                                data-act-id="<?php echo $act['id']; ?>">
                            <?php 
                                if($act['type']=='video') echo '<span class="badge bg-danger me-2 shadow-sm">Video</span>';
                                elseif($act['type']=='edpuzzle') echo '<span class="badge bg-warning text-dark me-2 shadow-sm">Edpuzzle</span>';
                                elseif($act['type']=='colab') echo '<span class="badge bg-warning text-dark me-2 shadow-sm">Colab</span>';
                                elseif($act['type']=='file') echo '<span class="badge bg-success me-2 shadow-sm">Tài liệu</span>';
                                elseif($act['type']=='assignment') echo '<span class="badge bg-primary me-2 shadow-sm">📝 Nộp bài</span>';
                                elseif($act['type']=='quiz') echo '<span class="badge bg-success me-2 shadow-sm">Quiz</span>';
                                elseif($act['type']=='google_form') echo '<span class="badge bg-primary me-2 shadow-sm">Google Form</span>';
                                else echo '<span class="badge bg-info text-dark me-2 shadow-sm">Bài đọc</span>';
                                echo htmlspecialchars($act['title']); 
                            ?>
                        </button>
                    </h2>
                    <div id="<?php echo $collapseId; ?>" class="accordion-collapse collapse <?php echo $show; ?>" data-bs-parent="#lessonAccordion">
                        <div class="accordion-body bg-white border-top">
                            
                            <?php if($act['type'] == 'video'): 
                                $video_url = $act['content'];
                                preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $video_url, $match);
                                if (isset($match[1])) {
                                    echo '<div class="ratio ratio-16x9 shadow-sm rounded overflow-hidden">
                                            <iframe src="https://www.youtube.com/embed/'.$match[1].'" allowfullscreen></iframe>
                                          </div>';
                                } else { echo '<div class="alert alert-danger">Link Video lỗi.</div>'; }
                            ?>

                            <?php elseif($act['type'] == 'edpuzzle'): 
                                $ed_content = $act['content'];
                                $embed_src = "";
                                if (strpos($ed_content, '<iframe') !== false) {
                                    preg_match('/src="([^"]+)"/', $ed_content, $matches);
                                    if(isset($matches[1])) $embed_src = $matches[1];
                                } elseif (strpos($ed_content, '/media/') !== false) {
                                    preg_match('/media\/([a-zA-Z0-9]+)/', $ed_content, $matches);
                                    if(isset($matches[1])) $embed_src = "https://edpuzzle.com/embed/media/" . $matches[1];
                                } elseif (strpos($ed_content, '/assignments/') !== false) {
                                    preg_match('/assignments\/([a-zA-Z0-9]+)/', $ed_content, $matches);
                                    if(isset($matches[1])) $embed_src = "https://edpuzzle.com/embed/assignments/" . $matches[1];
                                }

                                if (!empty($embed_src)) {
                                ?>
                                    <div class="ratio ratio-16x9 shadow-sm rounded overflow-hidden border">
                                        <iframe src="<?php echo $embed_src; ?>" frameborder="0" allowfullscreen></iframe>
                                    </div>
                                    <div class="text-center mt-2">
                                        <a href="<?php echo strip_tags($ed_content); ?>" target="_blank" class="btn btn-sm btn-outline-warning text-dark">
                                            <i class="bi bi-box-arrow-up-right"></i> Mở trong tab mới
                                        </a>
                                    </div>
                                <?php 
                                } else {
                                    echo '<div class="alert alert-warning">Không nhận diện được link Edpuzzle.</div>';
                                }
                            ?>

                            <?php elseif($act['type'] == 'google_form'): ?>
                                <div class="ratio ratio-1x1" style="max-height: 800px;">
                                    <iframe src="<?php echo $act['content']; ?>?embedded=true"></iframe>
                                </div>
                                <div class="text-center mt-2"><a href="<?php echo $act['content']; ?>" target="_blank" class="btn btn-outline-primary btn-sm">Mở tab mới</a></div>

                            <?php elseif($act['type'] == 'colab'): ?>
                                <div class="alert alert-warning"><i class="bi bi-exclamation-triangle-fill"></i> Nếu Colab không hiện, bấm nút mở tab mới.</div>
                                <div class="ratio ratio-16x9 border shadow-sm mb-2"><iframe src="<?php echo $act['content']; ?>"></iframe></div>
                                <a href="<?php echo $act['content']; ?>" target="_blank" class="btn btn-primary btn-sm">Mở Colab tab mới ↗</a>

                            <?php elseif($act['type'] == 'file'): 
                                $file_path = (strpos($act['content'], 'uploads/') === 0) ? $act['content'] : "uploads/" . $act['content'];
                                $ext = strtolower(pathinfo($act['content'], PATHINFO_EXTENSION));
                                if(file_exists($file_path)) {
                                    if ($ext == 'pdf') {
                                        echo '<div class="ratio ratio-16x9 border shadow-sm mb-3"><iframe src="'.$file_path.'"></iframe></div>';
                                    } elseif (in_array($ext, ['jpg','png','jpeg'])) {
                                        echo '<div class="text-center"><img src="'.$file_path.'" class="img-fluid rounded shadow-sm" style="max-height:500px"></div>';
                                    } 
                                    echo '<div class="text-center mt-3">
                                            <a href="'.$file_path.'" class="btn btn-outline-danger btn-sm" download onclick="markCompleted('.$act['id'].')">
                                                <i class="bi bi-download"></i> Tải tài liệu về máy (Bấm để xác nhận học xong)
                                            </a>
                                          </div>';
                                } else { echo '<div class="alert alert-danger">File không tồn tại.</div>'; }
                            ?>

                            <?php elseif($act['type'] == 'assignment'): ?>
                                <div class="border rounded p-4 bg-light">
                                    <h5 class="fw-bold text-primary">Yêu cầu bài tập:</h5>
                                    <div class="bg-white p-3 border rounded mb-3"><?php echo nl2br($act['content']); ?></div>
                                    <form class="upload-form" onsubmit="handleUpload(event, this, <?php echo $act['id']; ?>, '<?php echo $act['title']; ?>')">
                                        <div class="input-group mb-3">
                                            <input type="file" class="form-control file-input" required>
                                            <button class="btn btn-success" type="submit">Nộp bài</button>
                                        </div>
                                        <div class="progress-msg text-primary d-none">Đang tải lên...</div>
                                    </form>
                                    <?php
                                    $check_sub = $conn->query("SELECT * FROM submissions WHERE user_id=".$_SESSION['user_id']." AND activity_id=".$act['id']);
                                    if($check_sub->num_rows > 0) echo '<div class="alert alert-success mt-2">Đã nộp bài!</div>';
                                    ?>
                                </div>
                            
                            <?php elseif($act['type'] == 'quiz'): 
                                $quiz_id = intval($act['content']);
                                $qs = $conn->query("SELECT * FROM questions WHERE quiz_id = $quiz_id");
                            ?>
                                <div class="border p-4 bg-white rounded shadow-sm">
                                    <h5 class="text-success fw-bold">Bài kiểm tra</h5>
                                    <form method="POST" action="submit_quiz.php">
                                        <input type="hidden" name="quiz_id" value="<?php echo $quiz_id; ?>">
                                        <input type="hidden" name="lesson_id" value="<?php echo $lesson_id; ?>">
                                        <?php if($qs->num_rows > 0): $qc=0; while($q=$qs->fetch_assoc()): $qc++; ?>
                                            <div class="mb-4 p-4 bg-light rounded border">
                                                <p class="fw-bold text-dark fs-5">
                                                    <span class="badge bg-primary me-2">Câu <?php echo $qc; ?></span> 
                                                    <?php echo htmlspecialchars($q['question_text']); ?>
                                                </p>
                                                
                                                <?php if ($q['type'] == 'mcq' || empty($q['type'])): ?>
                                                    <div class="row">
                                                        <?php foreach(['a','b','c','d'] as $opt): ?>
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-check p-3 bg-white border rounded">
                                                                <input class="form-check-input" type="radio" name="ans[<?php echo $q['id']; ?>]" value="<?php echo $opt; ?>">
                                                                <label class="form-check-label w-100"><?php echo strtoupper($opt); ?>. <?php echo htmlspecialchars($q['option_'.$opt]); ?></label>
                                                            </div>
                                                        </div>
                                                        <?php endforeach; ?>
                                                    </div>

                                                <?php elseif ($q['type'] == 'matching'): 
                                                    $pairs = json_decode($q['matching_pairs'], true);
                                                    $left_items = array_keys($pairs);
                                                    $right_items = array_values($pairs);
                                                    shuffle($right_items);
                                                ?>
                                                    <div class="table-responsive bg-white rounded border p-3">
                                                        <table class="table table-borderless align-middle mb-0">
                                                            <thead><tr class="border-bottom"><th width="45%">Cột A</th><th width="10%"></th><th width="45%">Cột B</th></tr></thead>
                                                            <tbody>
                                                            <?php foreach ($left_items as $left_val): ?>
                                                                <tr>
                                                                    <td><div class="p-2 border rounded bg-light fw-bold"><?php echo htmlspecialchars($left_val); ?></div></td>
                                                                    <td class="text-center text-muted"><i class="bi bi-arrow-right fs-4"></i></td>
                                                                    <td>
                                                                        <select class="form-select border-primary" name="ans[<?php echo $q['id']; ?>][<?php echo md5($left_val); ?>]" required>
                                                                            <option value="" selected disabled>-- Chọn --</option>
                                                                            <?php foreach ($right_items as $r_val): ?>
                                                                                <option value="<?php echo htmlspecialchars($r_val); ?>"><?php echo htmlspecialchars($r_val); ?></option>
                                                                            <?php endforeach; ?>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                            <?php endforeach; ?>
                                                            </tbody>
                                                        </table>
                                                    </div>

                                                <?php elseif ($q['type'] == 'true_false'): ?>
                                                    <div class="d-flex gap-3">
                                                        <div class="form-check p-3 bg-white border rounded flex-fill">
                                                            <input class="form-check-input" type="radio" name="ans[<?php echo $q['id']; ?>]" value="True" id="q<?php echo $q['id']; ?>_t">
                                                            <label class="form-check-label fw-bold text-primary" for="q<?php echo $q['id']; ?>_t">ĐÚNG (True)</label>
                                                        </div>
                                                        <div class="form-check p-3 bg-white border rounded flex-fill">
                                                            <input class="form-check-input" type="radio" name="ans[<?php echo $q['id']; ?>]" value="False" id="q<?php echo $q['id']; ?>_f">
                                                            <label class="form-check-label fw-bold text-danger" for="q<?php echo $q['id']; ?>_f">SAI (False)</label>
                                                        </div>
                                                    </div>

                                                <?php elseif ($q['type'] == 'essay'): ?>
                                                    <div class="mt-2">
                                                        <textarea class="form-control shadow-sm" name="ans[<?php echo $q['id']; ?>]" rows="3" placeholder="Nhập câu trả lời của em tại đây..."></textarea>
                                                    </div>
                                                <?php endif; ?>

                                            </div>
                                        <?php endwhile; else: echo "<p class='text-muted'>Chưa có câu hỏi.</p>"; endif; ?>
                                        <div class="text-end"><button class="btn btn-success fw-bold px-4 py-2">Nộp bài</button></div>
                                    </form>
                                </div>

                            <?php else: ?>
                                <div class="p-3 bg-light rounded border text-dark"><?php echo nl2br($act['content']); ?></div>
                            <?php endif; ?>

                        </div>
                    </div>
                </div>
            <?php 
                } 
            } else { echo "<div class='alert alert-warning text-center'>Đang cập nhật nội dung.</div>"; }
            ?>
        </div>

        <div class="card mt-5 mb-5 shadow-sm bg-light">
            <div class="card-body">
                <h5 class="mb-3 text-primary fw-bold">Thảo luận</h5>
                <form method="POST">
                    <div class="d-flex mb-3">
                        <img src="https://ui-avatars.com/api/?name=<?php echo $_SESSION['username']; ?>" class="rounded-circle me-2" width="40">
                        <textarea name="comment_content" class="form-control" rows="2" placeholder="Nhập bình luận..." required></textarea>
                    </div>
                    <div class="text-end"><button type="submit" name="submit_comment" class="btn btn-primary btn-sm rounded-pill px-4">Gửi</button></div>
                </form>
                <div class="mt-3">
                <?php
                $cmts = $conn->query("SELECT c.*, u.name, u.avatar FROM comments c JOIN users u ON c.user_id=u.id WHERE c.lesson_id=$lesson_id ORDER BY c.created_at DESC");
                while($c = $cmts->fetch_assoc()){
                    $avt = !empty($c['avatar']) ? "uploads/avatars/".$c['avatar'] : "https://ui-avatars.com/api/?name=".$c['name'];
                    echo "<div class='d-flex mb-3'><img src='$avt' class='rounded-circle me-3' width='40' height='40'>
                          <div class='bg-white p-3 rounded shadow-sm w-100'><strong class='text-dark'>".$c['name']."</strong>
                          <p class='mb-0 mt-1'>".nl2br($c['content'])."</p></div></div>";
                }
                ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>

<script>
const scriptURL = 'https://script.google.com/macros/s/AKfycbxI7pRye94qp2lv1Epz7iIaruktznkQljF-pUQ9KYhJ-bYiwq6o1OUonch7km7d8fxg/exec'; 
const lessonTitle = "<?php echo $row['title']; ?>"; 

function markCompleted(actId, element = null) {
    var lessonId = <?php echo $lesson_id; ?>;
    var formData = new FormData();
    formData.append('activity_id', actId);
    formData.append('lesson_id', lessonId);

    fetch('ajax_complete.php', { method: 'POST', body: formData }).then(r => r.text()).then(d => {
        var toastEl = document.getElementById('liveToast');
        var toast = new bootstrap.Toast(toastEl);
        toast.show();
        if(element && element.classList.contains('clickable-label')) {
            var icon = element.querySelector('i.bi-exclamation-circle-fill');
            if(icon) {
                icon.classList.remove('bi-exclamation-circle-fill', 'text-danger');
                icon.classList.add('bi-check-circle-fill', 'text-success');
            }
            element.classList.add('border-success');
            element.classList.remove('border-danger');
        }
    });
}

document.addEventListener("DOMContentLoaded", function() {
    var accordionBtns = document.querySelectorAll('.accordion-button');
    accordionBtns.forEach(function(btn) {
        btn.addEventListener('click', function() {
            if (!this.classList.contains('collapsed')) {
                var actId = this.getAttribute('data-act-id');
                if(actId) markCompleted(actId);
            }
        });
    });
});

function handleUpload(e, form, activityId, activityTitle) {
    e.preventDefault();
    const file = form.querySelector('.file-input').files[0];
    const btn = form.querySelector('button');
    const msg = form.querySelector('progress-msg');
    if (!file) return;
    btn.disabled = true; btn.innerHTML = 'Đang gửi...'; if(msg) msg.classList.remove('d-none');
    markCompleted(activityId);
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
        const payload = { base64: reader.result.split(',')[1], mimeType: file.type, filename: file.name, folderName: lessonTitle + " - " + activityTitle };
        fetch(scriptURL, { method: 'POST', body: JSON.stringify(payload), mode: 'no-cors' })
        .then(() => {
            var fd = new FormData(); fd.append('lesson_id', <?php echo $lesson_id; ?>); fd.append('activity_id', activityId);
            fetch('save_submission.php', { method: 'POST', body: fd }).then(() => { alert("Nộp bài thành công!"); location.reload(); });
        })
        .catch(err => { alert("Lỗi!"); btn.disabled = false; });
    };
}
</script>