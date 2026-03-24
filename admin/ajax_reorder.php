<?php
session_start();
include '../includes/db.php';

// Kiểm tra quyền giáo viên
if (!isset($_SESSION['user_id']) || $_SESSION['role'] != 'teacher') {
    exit('Permission denied');
}

// Nhận dữ liệu từ Ajax
if (isset($_POST['order'])) {
    $order = $_POST['order']; // Đây là mảng chứa các ID theo thứ tự mới
    
    // Duyệt qua mảng và cập nhật lại số thứ tự trong database
    foreach ($order as $position => $id) {
        $id = intval($id);
        $pos = intval($position);
        
        // Cập nhật display_order = vị trí mới
        $conn->query("UPDATE activities SET display_order = $pos WHERE id = $id");
    }
    echo "Saved";
}
?>