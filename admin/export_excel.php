<?php
include('../includes/db.php');

if(isset($_POST['btn_export'])) {
    $quiz_id = $_POST['quiz_id'];

    // 1. ĐỔI ĐUÔI FILE THÀNH .xls (Excel chuẩn)
    $filename = "KetQua_BaiSo_" . $quiz_id . "_Ngay_" . date('d-m-Y') . ".xls";

    // 2. ÉP TRÌNH DUYỆT TẢI VỀ FILE EXCEL CHUẨN
    header("Content-Type: application/vnd.ms-excel; charset=utf-8");
    header("Content-Disposition: attachment; filename=\"$filename\"");
    header("Pragma: no-cache");
    header("Expires: 0");

    // 3. TRUY VẤN DỮ LIỆU
    $sql = "SELECT users.name, users.email, users.class_name, quiz_results.score, quiz_results.submitted_at 
            FROM quiz_results 
            JOIN users ON quiz_results.user_id = users.id 
            WHERE quiz_results.quiz_id = '$quiz_id' 
            ORDER BY users.class_name ASC, users.name ASC";

    $result = mysqli_query($conn, $sql);
    
    if(!$result) {
        die("Lỗi SQL: " . mysqli_error($conn));
    }

    // 4. XUẤT RA GIAO DIỆN BẢNG HTML (Cách này Excel hiển thị Tiếng Việt 100% hoàn hảo)
    echo '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
    echo '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8"></head>';
    echo '<body>';
    
    // Tạo bảng có viền (border="1")
    echo '<table border="1">';
    
    // Dòng Tiêu đề (Có tô màu nền xanh, chữ trắng rất đẹp)
    echo '<tr style="background-color: #198754; color: white; font-weight: bold; text-align: center;">';
    echo '<th>STT</th>';
    echo '<th>Lớp</th>';
    echo '<th>Họ và Tên</th>';
    echo '<th>Email</th>';
    echo '<th>Điểm Số</th>';
    echo '<th>Ngày Nộp Bài</th>';
    echo '</tr>';

    // Đổ dữ liệu vào bảng
    $stt = 1;
    while($row = mysqli_fetch_assoc($result)) {
        // Đổi dấu chấm thành phẩy cho điểm số
        $diem_so = str_replace('.', ',', $row['score']);
        
        echo '<tr>';
        echo '<td style="text-align: center;">' . $stt++ . '</td>';
        echo '<td style="text-align: center;">' . $row['class_name'] . '</td>';
        echo '<td>' . $row['name'] . '</td>';
        echo '<td>' . $row['email'] . '</td>';
        echo '<td style="text-align: center; font-weight: bold; color: red;">' . $diem_so . '</td>';
        echo '<td style="text-align: center;">' . $row['submitted_at'] . '</td>';
        echo '</tr>';
    }

    echo '</table>';
    echo '</body></html>';
    exit();
}
?>