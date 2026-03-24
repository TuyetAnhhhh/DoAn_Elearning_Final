<?php
session_start();
include '../includes/db.php';
include '../includes/header.php'; 
?>

<div class="container-fluid mt-4">
    <div class="card shadow">
        <div class="card-header bg-success text-white">
            <h4 class="mb-0"><i class="fa fa-file-excel-o"></i> Xuất Bảng Điểm Ra Excel (CSV)</h4>
        </div>
        <div class="card-body">
            <p>Chọn bài kiểm tra bên dưới để tải về danh sách điểm của toàn bộ học sinh.</p>
            
            <form action="export_excel.php" method="POST">
                <div class="form-group mb-3">
                    <label class="fw-bold">Chọn Bài Kiểm Tra:</label>
                    <select name="quiz_id" class="form-control" required>
                        <option value="">-- Vui lòng chọn bài thi --</option>
                        <?php
                        // CODE ĐÚNG: Lấy id và title từ bảng quizzes
                        $sql = "SELECT * FROM quizzes ORDER BY id DESC"; 
                        $run = mysqli_query($conn, $sql);
                        
                        while($row = mysqli_fetch_array($run)){
                            echo '<option value="'.$row['id'].'">'.$row['title'].'</option>';
                        }
                        ?>
                    </select>
                </div>

                <button type="submit" name="btn_export" class="btn btn-success">
                    <i class="fa fa-download"></i> Tải Danh Sách Điểm
                </button>
            </form>
        </div>
    </div>
</div>

<?php include '../includes/footer.php'; ?>