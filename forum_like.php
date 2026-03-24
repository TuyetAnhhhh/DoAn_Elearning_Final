<?php
session_start();
include 'includes/db.php';

// 1. Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// 2. Kiểm tra ID bài viết
if (isset($_GET['id'])) {
    $topic_id = intval($_GET['id']); // Lấy ID bài viết
    $user_id = $_SESSION['user_id'];

    // 3. Kiểm tra xem người này đã like bài này chưa?
    $check_sql = "SELECT * FROM forum_likes WHERE topic_id = $topic_id AND user_id = $user_id";
    $rs = $conn->query($check_sql);

    if ($rs->num_rows > 0) {
        // A. NẾU ĐÃ LIKE RỒI -> XÓA LIKE (UNLIKE)
        $conn->query("DELETE FROM forum_likes WHERE topic_id = $topic_id AND user_id = $user_id");
    } else {
        // B. NẾU CHƯA LIKE -> THÊM LIKE
        $conn->query("INSERT INTO forum_likes (topic_id, user_id) VALUES ($topic_id, $user_id)");
    }
}

// 4. Xử lý xong thì quay lại trang bài viết cũ
header("Location: forum_view.php?id=" . $topic_id);
exit();
?>