<?php
session_start();
include 'includes/db.php';

if (isset($_POST['activity_id']) && isset($_SESSION['user_id'])) {
    $uid = $_SESSION['user_id'];
    $lid = intval($_POST['lesson_id']);
    $aid = intval($_POST['activity_id']);

    // Kiểm tra xem đã hoàn thành chưa, nếu chưa thì thêm vào
    $check = $conn->query("SELECT id FROM activity_completions WHERE user_id=$uid AND activity_id=$aid");
    if ($check->num_rows == 0) {
        $conn->query("INSERT INTO activity_completions (user_id, lesson_id, activity_id) VALUES ($uid, $lid, $aid)");
        echo "success";
    }
}
?>