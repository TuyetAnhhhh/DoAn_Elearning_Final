<?php
session_start();
include 'includes/db.php';
include 'includes/header.php';

// Logic lọc định hướng (giữ nguyên của bạn)
$current_track = isset($_GET['track']) ? $_GET['track'] : 'ICT';
$track_title = ($current_track == 'CS') ? 'Định hướng (CS)' : 'Định hướng (ICT)';
?>

<div class="p-5 mb-4 bg-light rounded-3 border shadow-sm">
    <div class="container-fluid py-3 text-center">
        <div class="row justify-content-center">
    <div class="col-lg-9">
        <h1 class="fs-1 fw-bolder text-primary mb-3">
            Chủ đề F: Giải quyết vấn đề với sự trợ giúp của máy tính
        </h1>
    </div>
</div>
        <p class="col-md-8 fs-4 mx-auto text-muted">Hệ thống học liệu trực tuyến hỗ trợ học sinh lớp 12.</p>
        <div class="d-flex justify-content-center gap-3 mt-4">
            <a href="index.php?track=ICT" class="btn btn-lg <?php echo ($current_track == 'ICT') ? 'btn-primary' : 'btn-outline-primary'; ?> px-4 shadow-sm">
                <i class="bi bi-laptop me-2"></i> Định hướng ICT
            </a>
            <a href="index.php?track=CS" class="btn btn-lg <?php echo ($current_track == 'CS') ? 'btn-success' : 'btn-outline-success'; ?> px-4 shadow-sm">
                <i class="bi bi-code-slash me-2"></i> Định hướng CS
            </a>
        </div>
    </div>
</div>

<div class="container mb-5">
    <div class="row">
        <div class="d-flex align-items-center mb-4 border-bottom pb-2 border-primary">
            <h3 class="m-0"> Bài học dành cho: <span class="text-danger fw-bold"><?php echo $track_title; ?></span></h3>
        </div>
        
        <?php
        $sql = "SELECT * FROM lessons WHERE track = '$current_track' OR track = 'Common' ORDER BY id ASC";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                // --- TÍNH TOÁN TIẾN ĐỘ ---
                $lid = $row['id'];
                $percent = 0;
                $total_act = 0;
                $completed_act = 0;

                // 1. Đếm tổng số hoạt động trong bài (trừ label ra vì label không cần học)
                $res_total = $conn->query("SELECT COUNT(*) as cnt FROM activities WHERE lesson_id = $lid AND type != 'label'");
                $total_act = $res_total->fetch_assoc()['cnt'];

                // 2. Đếm số hoạt động user đã hoàn thành
                if (isset($_SESSION['user_id'])) {
                    $uid = $_SESSION['user_id'];
                    $res_done = $conn->query("SELECT COUNT(*) as cnt FROM activity_completions WHERE lesson_id = $lid AND user_id = $uid");
                    $completed_act = $res_done->fetch_assoc()['cnt'];
                }

                // 3. Tính phần trăm
                if ($total_act > 0) {
                    $percent = round(($completed_act / $total_act) * 100);
                }
                // --------------------------

                $badge_color = ($row['track'] == 'ICT') ? 'bg-primary' : (($row['track'] == 'CS') ? 'bg-success' : 'bg-secondary');
                $badge_text = ($row['track'] == 'Common') ? 'Dùng chung' : $row['track'];
                ?>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm hover-effect border-0">
                        <div class="card-header bg-transparent border-0 pt-3 d-flex justify-content-between">
                            <span class="badge <?php echo $badge_color; ?>"><?php echo $badge_text; ?></span>
                            
                            <?php if(isset($_SESSION['user_id'])): ?>
                                <?php if($percent == 100): ?>
                                    <span class="badge bg-success"><i class="bi bi-check-circle-fill"></i> Hoàn thành</span>
                                <?php elseif($percent > 0): ?>
                                    <span class="badge bg-warning text-dark">Đang học <?php echo $percent; ?>%</span>
                                <?php else: ?>
                                    <span class="badge bg-light text-muted border">Chưa học</span>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title fw-bold text-dark">
                                <a href="lesson.php?id=<?php echo $row['id']; ?>" class="text-decoration-none text-dark">
                                    <?php echo $row['title']; ?>
                                </a>
                            </h5>
                            <p class="card-text text-secondary small mb-3">
                                <?php echo substr($row['description'], 0, 100) . '...'; ?>
                            </p>

                            <?php if(isset($_SESSION['user_id'])): ?>
                            <div class="progress" style="height: 10px;">
                                <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" 
                                     role="progressbar" 
                                     style="width: <?php echo $percent; ?>%" 
                                     aria-valuenow="<?php echo $percent; ?>" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <small class="text-muted d-block text-end mt-1" style="font-size: 11px;">
                                <?php echo $completed_act; ?>/<?php echo $total_act; ?> hoạt động
                            </small>
                            <?php endif; ?>

                        </div>
                        <div class="card-footer bg-white border-0 pb-3 pt-0">
                            <a href="lesson.php?id=<?php echo $row['id']; ?>" class="btn btn-outline-primary w-100 rounded-pill">
                                <?php echo ($percent > 0) ? 'Tiếp tục học' : 'Vào học ngay'; ?>
                            </a>
                        </div>
                    </div>
                </div>
                <?php
            }
        } else {
            echo '<div class="col-12"><div class="alert alert-warning text-center">Chưa có bài học nào.</div></div>';
        }
        ?>
    </div>
</div>

<?php include 'includes/footer.php'; ?>