<?php
session_start();
include 'includes/db.php';

// 1. Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// 2. Kiểm tra có ID bài cần xóa không
if (isset($_GET['id'])) {
    $topic_id = $_GET['id'];
    $current_user_id = $_SESSION['user_id'];
    $current_user_role = $_SESSION['role'];

    // 3. Kiểm tra quyền: Chỉ xóa nếu là (Chủ bài viết) HOẶC (Là Giáo viên)
    // Lấy thông tin người tạo bài viết đó
    $sql_check = "SELECT user_id FROM forum_topics WHERE id = $topic_id";
    $rs = $conn->query($sql_check);
    
    if($rs->num_rows > 0){
        $topic = $rs->fetch_assoc();
        $owner_id = $topic['user_id'];

        // Nếu là Chính chủ hoặc là Teacher thì cho xóa
        if ($current_user_id == $owner_id || $current_user_role == 'teacher') {
            
            $sql_delete = "DELETE FROM forum_topics WHERE id = $topic_id";
            
            if ($conn->query($sql_delete) === TRUE) {
                // Xóa xong quay về diễn đàn
                header("Location: forum.php");
                exit();
            } else {
                echo "Lỗi: " . $conn->error;
            }
        } else {
            echo "<script>alert('Bạn không có quyền xóa bài này!'); window.location.href='forum.php';</script>";
        }
    }
} else {
    header("Location: forum.php");
}
?>