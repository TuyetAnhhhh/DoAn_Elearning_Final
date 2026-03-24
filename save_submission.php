<?php
session_start();
include 'includes/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $lesson_id = $_POST['lesson_id'];
    $activity_id = $_POST['activity_id']; // <--- MỚI: Nhận ID hoạt động
    
    // Link Drive lưu folder
    $file_url = "https://drive.google.com/drive/u/0/folders/1h5-_gRsfwF3mdohs2WrZPOd1JUiF8xBj"; 
    
    // Câu lệnh SQL mới có thêm activity_id
    $sql = "INSERT INTO submissions (lesson_id, activity_id, user_id, file_url) VALUES ('$lesson_id', '$activity_id', '$user_id', '$file_url')";
    
    if($conn->query($sql)){
        echo "Success";
    } else {
        echo "Error: " . $conn->error;
    }
}
?>