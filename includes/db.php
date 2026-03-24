<?php
// Cấu hình cho XAMPP (Máy tính cá nhân)
$servername ="localhost";
$username = "root";
$password = ""; // XAMPP mặc định không có mật khẩu
$dbname = "elearning_project"; // Tên database trên máy bạn (Check lại trong phpMyAdmin xem đúng tên này không nhé)

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);
// Kiểm tra và chỉnh phông chữ tiếng Việt
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
$conn->set_charset("utf8");
?>