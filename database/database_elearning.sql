-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 23, 2026 lúc 08:03 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `elearning_project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `activities`
--

INSERT INTO `activities` (`id`, `lesson_id`, `title`, `type`, `content`, `created_at`, `display_order`) VALUES
(8, 4, 'Video Khái niệm HTML', 'video', 'https://youtu.be/nariwBqtRBo', '2025-12-20 07:08:14', 5),
(9, 4, 'Củng cố_ Phần 2', 'quiz', '2', '2025-12-20 07:24:18', 9),
(10, 4, 'Video Cấu trúc tệp HTML ', 'video', 'https://youtu.be/_XeZsmKGY2Q', '2025-12-20 07:34:19', 8),
(12, 4, 'HD2_Thảo luận diễn đàng', 'label', 'Các em hãy vào phần diễn đàng để cùng nhau thảo luận về cấu trúc tệp HTML', '2025-12-20 07:51:34', 10),
(14, 4, 'HD1_Video tương tác', 'label', 'Em hãy copy link này, mở sang tab khác để tham gia xem và làm video tương tác nhé!\r\nhttps://app.lumi.education/run/MYwpOG', '2025-12-20 07:57:54', 3),
(15, 4, 'Hoạt động 2: Phần 2_Cấu trúc tệp HTML', 'header', '', '2025-12-20 07:59:15', 7),
(16, 4, 'Hoạt động 2: Phần 3_Tìm hiểu về các phần mềm soạn thảo HTML ', 'header', '', '2025-12-20 07:59:49', 11),
(17, 4, 'Bài đọc về phần mềm soạn thảo', 'file', '1766217641_Nội dung phần mềm soạn thảo văn bản.pdf', '2025-12-20 08:00:41', 12),
(18, 4, 'HD2: Phần 3_Thảo luận diễn đàng', 'label', 'Em hãy truy cập vào diễn đàn và trả lời các câu hỏi sau:', '2025-12-20 08:01:47', 13),
(20, 4, 'Trắc nghiệm củng cố', 'quiz', '3', '2025-12-20 08:36:57', 14),
(22, 4, 'PPT_tóm tắt lý thuyết', 'file', '1766220140_PPT_Tóm tắt lý thuyết .pptx.pdf', '2025-12-20 08:42:20', 1),
(23, 4, 'HOẠT ĐỘNG 3: PHÂN TÍCH CẤU TRÚC FILE HTML', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfw-u1bGpo3SgB3sQxabtay_VT89T-qIxiKSrGK3LFG-IJ66Q/formResponse', '2025-12-20 08:44:26', 16),
(24, 4, 'Rubric_Đánh giá phần tìm hiểu phân tích cấu trúc file HTML', 'file', '1766220389_rubric pht2-2.pdf', '2025-12-20 08:46:29', 18),
(25, 4, 'Hoạt động3: PHÂN TÍCH VÀ SỬA LỖI MÃ HTML', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSeN-mNepOSHurAuaNwmtFmGVaNvkTul-Zl40iMHb78KdYA-mg/formResponse', '2025-12-20 08:47:30', 17),
(26, 4, 'Kiểm tra cuối bài ', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSeVdNa2_GcLUfdTbkepJooJMQBNX6imH9MFTpq1CGiH8x44iw/formResponse', '2025-12-20 08:48:42', 19),
(27, 6, 'Giới thiệu chung', 'file', '1766319180_GIỚI THIỆU CHUNG .pdf', '2025-12-21 12:13:00', 0),
(28, 6, 'HD 1: Diễn đàng', 'label', 'Trước khi đi sâu hơn vào phần bài học hãy những  hiểu biết của bản thân thông qua thảo luận cùng nhau ở diễn đàng Bài 2_ Hoạt động 1 nhé !!!', '2025-12-21 12:15:07', 3),
(29, 6, 'Hoạt động 2_Phần 1', 'video', 'https://youtu.be/IRJ3mnUchww', '2025-12-21 12:18:54', 4),
(30, 6, 'PPT: Tìm hiểu tên và các thẻ chứa thuộc tính', 'file', '1766319645_Thuộc tính HTML.pptx.pdf', '2025-12-21 12:20:45', 6),
(31, 6, 'HD2: Phần 1_Diễn đàng', 'label', 'Hãy cùng nhau thảo luận xem thuộc tính và chức năng của thuộc tính trong thẻ \r\nCác em hãy truy cập diễn đàng để cùng nhau tìm hiểu', '2025-12-21 12:22:46', 7),
(32, 6, 'Hoạt động 2_Phần 1: Kiểm tra ngắn', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScV_EsQY6h5nP7Sb_ze68xvXXDjWab1Z-P4_khXI_R2KzLaAA/formResponse', '2025-12-21 12:24:24', 8),
(34, 6, 'Hoạt động 2_Phần 2: Video_Định dạng văn bản_Định dạng tiêu đề ', 'video', 'https://youtu.be/Df-PCWGXA34', '2025-12-21 12:26:39', 10),
(35, 6, 'Hoạt động 2_Phần2: Video_Định dạng văn bản_Định dạng đoạn văn bản', 'video', 'https://youtu.be/DHEURH1aIwQ', '2025-12-21 12:27:44', 11),
(37, 6, 'Hoạt động 2_Phần 2: Video_Định dạng phông chữ_Định dạng kiểu chữ, kiểu chữ', 'video', 'https://youtu.be/Rd-85yWMNSk', '2025-12-21 12:29:05', 12),
(38, 6, 'Hoạt động 2_Phần 2: Video_Định dạng phông chữ_Định dạng phông chữ', 'video', 'https://youtu.be/ZGiffqBE56A', '2025-12-21 12:29:24', 13),
(39, 6, 'PPT_Tóm tắt lý thuyết bài 2', 'file', '1766320213_PPT_Tóm tắ lý thuyết bài 2.pptx.pdf', '2025-12-21 12:30:13', 1),
(40, 6, 'Hoạt động 3: Diễn đàng', 'label', 'Hãy truy cập vào diễn đàng và thảo luận hoạt động 3 này nhé', '2025-12-21 12:31:28', 16),
(41, 6, 'Hoạt động 4: hướng dẫn tạo và lưu file HTML  GG colab', 'file', '1766320503_HƯỚNG DẪN TẠO VÀ LƯU FILE HTML TRÊN GOOGLE COLAB.docx.pdf', '2025-12-21 12:35:03', 18),
(42, 6, 'Hoạt động 4: Thực hành nhiệm vụ', 'file', '1766320555_PDF_ PHIẾU NHIẸM VỤ.pdf', '2025-12-21 12:35:55', 19),
(44, 6, 'Hoạt động 4: Nộp sản phẩm', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScTLYwSt8Pcxr_uwAwnz-XFguTqhsOpRc9L2SA8t5GUavi97Q/viewform', '2025-12-21 12:37:41', 20),
(45, 6, 'Ôn tập cuối bài', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdPs76magpMH05Vm5jQ5LBM-TU8ZWjXbMuKY5VEC0YhtIDqtA/formResponse', '2025-12-21 12:38:30', 22),
(46, 4, 'Hoạt động 1: Khởi động', 'header', '', '2025-12-30 02:38:12', 2),
(47, 7, 'Giới thiệu chung', 'file', '1767253938_GIỚI THIỆU CHUNG.pdf', '2026-01-01 07:52:18', 0),
(48, 7, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-01 07:53:06', 2),
(49, 7, 'HD1_Diễn Đàng', 'label', 'Trước khi vào bài học các em hãy tìm hiểu và chia sẻ những hiểu biết của mình ở diễn đàng Bài 3_HD1', '2026-01-01 07:55:46', 3),
(50, 7, 'Hoạt động 2_Phần 1: Tạo danh sách', 'header', '', '2026-01-01 08:00:10', 4),
(51, 7, 'Danh sách có thứ tự', 'video', 'https://youtu.be/0EnbOPOUM3w\r\n', '2026-01-01 08:00:40', 5),
(52, 7, 'Danh sách không có thứ tự', 'video', 'https://youtu.be/QPZfqPQc5vE', '2026-01-01 08:01:26', 6),
(53, 7, 'Danh sách mô tả', 'video', 'https://youtu.be/YcrKJWroR0U', '2026-01-01 08:01:49', 7),
(54, 7, 'Danh sách lồng nhau', 'video', 'https://youtu.be/OTqd-liicKc', '2026-01-01 08:02:06', 8),
(55, 7, 'Bài kiểm tra thường xuyên _Phần 1', 'quiz', '4', '2026-01-01 08:08:52', 9),
(56, 7, 'Hoạt động 2_Phần 2: Bảng', 'header', '', '2026-01-01 08:09:57', 10),
(57, 7, 'Cấu trúc và tạo bảng', 'video', 'https://youtu.be/9i0g2Q3PAmw', '2026-01-01 08:10:23', 11),
(58, 7, 'Định dạng bảng', 'video', 'https://youtu.be/Lx34LSfrvlY', '2026-01-01 08:10:38', 12),
(59, 7, 'Định dạng bảng (sử dụng thuộc tính style)', 'video', 'https://youtu.be/3WTLtugH8qk', '2026-01-01 08:11:00', 13),
(60, 7, 'HD2_Diễn Đàng', 'label', 'Em hãy truy cập vào diễn đàn thảo luận các câu hỏi:', '2026-01-01 08:11:49', 14),
(61, 7, 'Bài kiểm tra thường xuyên_Phần 2', 'quiz', '5', '2026-01-01 08:22:51', 15),
(62, 7, 'PPT_Tóm tắt lý thuyết Bài 3', 'file', '1767255843_PPT_Tóm tắt lý thuyết_Bài 3.pptx.pdf', '2026-01-01 08:24:03', 1),
(63, 7, 'Hoạt động 3: Thực hành_Phần 1', 'header', '', '2026-01-01 08:25:14', 16),
(64, 7, 'Nhiệm vụ 1', 'file', '1767255938_PDF NHIỆM VỤ 1 .pdf', '2026-01-01 08:25:38', 17),
(65, 7, 'Nộp_Nhiệm vụ 1', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfHpQJpq_ByLKwEgQc9t02Ou8d6rmEP5P22FrATZWZEj0zguA/viewform', '2026-01-01 08:26:16', 18),
(66, 7, 'Hoạt động 3: Thực hành_Phần 2', 'header', '', '2026-01-01 08:26:43', 19),
(67, 7, 'Nhiệm vụ 2', 'file', '1767256041_PHIẾU NHIỆM VỤ 2.pdf', '2026-01-01 08:27:21', 20),
(68, 7, 'Nộp_Nhiệm vụ 2', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfeQfXm-0XLSZ6WS1rucKefL2AYqBD6tqE6CNsgkX3XfTPWjA/viewform', '2026-01-01 08:27:42', 21),
(69, 7, 'Ôn tập Bài 3: Tạo danh sách, Bảng', 'google_form', 'https://docs.google.com/forms/d/103asquge9p-w5jUtzfhtGBHm5hpKJwZryzVHF4uBOt8/edit', '2026-01-01 08:31:03', 23),
(70, 7, 'Cuối khóa', 'header', '', '2026-01-01 08:31:17', 22),
(71, 8, 'HD1_Video tương tác', 'label', 'Em hãy copy link này, mở sang tab khác để tham gia xem và làm video tương tác nhé!\r\nhttps://app.lumi.education/run/MTdLco\r\n', '2026-01-01 08:34:50', 3),
(72, 8, 'Giới thiệu chung', 'file', '1768213204_PDF giới thiệu chung.pdf', '2026-01-01 09:04:12', 0),
(73, 8, 'PPT_Tóm tắt lý thuyết', 'file', '1767258290_PPT_LT BÀI 4.pptx.pdf', '2026-01-01 09:04:50', 1),
(74, 8, 'Hoạt động 1: Khởi động', 'label', '', '2026-01-01 09:05:08', 2),
(75, 8, 'Hoạt động 2: Phần 1_Tìm hiểu về đặc điểm của siêu văn bản và đường dẫn', 'header', '', '2026-01-01 09:05:52', 4),
(76, 8, 'Bài giảng về siêu văn bản và đường dẫn', 'video', 'https://youtu.be/j8rl-sdt9Uw', '2026-01-01 09:06:38', 5),
(77, 8, 'HD2: Phần 1_Diễn đàng', 'label', 'Các em hãy truy cập vào diễn đàng để cùng nhau tìm hiểu và thảo luận về:  Phân biệt đường dẫn\r\n', '2026-01-01 09:07:48', 6),
(78, 8, 'Bài kiểm tra thường xuyên_Phần 1', 'quiz', '6', '2026-01-01 09:17:18', 7),
(79, 8, 'Hoạt động 2: Phần 2_Các loại liên kết', 'header', '', '2026-01-01 09:18:28', 8),
(80, 8, 'Các loại liên kết', 'video', 'https://youtu.be/jRYO-KLqd0Y', '2026-01-01 09:18:51', 9),
(81, 8, 'Các loại liên kết (tiếp theo)', 'video', 'https://youtu.be/Sen1UTDejXo', '2026-01-01 09:19:11', 10),
(82, 8, 'Bài kiểm tra thường xuyên_Phần 2', 'quiz', '7', '2026-01-01 09:23:13', 11),
(83, 8, 'Hoạt động 3: Tạo liên kết trong cùng trang', 'header', '', '2026-01-01 09:23:44', 12),
(84, 8, ' Tài liệu hướng dẫn tải Visual code', 'file', '1767259707_Hướng dẫn sử dụng ViSual Studio Code.pdf', '2026-01-01 09:28:27', 13),
(85, 8, 'Tài liệu hướng dẫn sử VISUAL STUDIO CODE ', 'file', '1767259781_Hướng dẫn sử dụng Visual Studio Code.pdf', '2026-01-01 09:29:41', 14),
(86, 8, 'Hoạt động 3: Thực hành _Phần 1: Tạo liên kết trong cùng trang', 'header', '', '2026-01-01 09:31:46', 15),
(87, 8, 'Nhiệm vụ_Phần 1', 'file', '1767259934_PDF phiếu nhiệm vụ 1.pdf', '2026-01-01 09:32:14', 16),
(88, 8, 'Nộp_nhiệm vụ_phần 1', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScToCE96kqJ_xkv3yRdwcZ6MKsM_II4vyzksRcJxGyZKIh_zw/viewform', '2026-01-01 09:33:25', 17),
(89, 8, 'Hoạt động 3: Thực hành _Phần 2: Tạo liên kết sang trang khác', 'header', '', '2026-01-01 09:34:07', 18),
(90, 8, 'Nhiệm vụ_Phần 2', 'file', '1767260075_NHIỆM VỤ 2.pdf', '2026-01-01 09:34:35', 19),
(91, 8, 'Nộp_Nhiệm vụ 2', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfgZPxUroB4mJZX9dBlSSMNTQdkyhhbigQG1XYbA2fwjOrU-A/viewform', '2026-01-01 09:35:18', 20),
(92, 8, 'Hoạt động 4: Vận dụng', 'header', '', '2026-01-01 09:39:44', 21),
(93, 8, 'Nhiệm vụ tổng hợp', 'file', '1767260410_PHIẾU NHIỆM VỤ 3.pdf', '2026-01-01 09:40:10', 22),
(94, 8, 'Nộp_nhiệm vụ tổng hợp', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfd7XBU3HjTXGbAc5NqCgiwE3pdiDY_7SRKncd8rjsB_mJBEQ/viewform', '2026-01-01 09:40:41', 23),
(95, 8, 'Ôn tập cuối bài', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdfGliuGTnu0F2JIesePDA5FmLtHRzJkdf5NsShybPQdrqQnQ/viewform', '2026-01-01 09:42:07', 24),
(96, 9, 'Giới thiệu chung', 'file', '1767363760_GIỚI THIỆU CHUNG.pdf', '2026-01-02 14:22:40', 0),
(97, 9, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-02 14:24:13', 2),
(98, 9, 'HD 1_Diễn đàng', 'label', 'Trước khi đi vào nội dung bài học các em hãy chia sẻ những gì mình hiểu biết và trải nghiệm ở diễn đàng.', '2026-01-02 14:24:28', 3),
(99, 9, 'Hoạt động 2: Phần 1_Tìm hiểu về cách chèn tệp ảnh vào trang web ', 'header', '', '2026-01-02 14:27:16', 4),
(100, 9, 'Hoạt động 2: Phần 2_Tìm hiểu chèn âm thanh và video vào trang web ', 'header', '', '2026-01-02 14:27:38', 8),
(101, 9, 'Hoạt động 2: Phần 3_Tìm hiểu về tạo khung nội tuyến trong trang web', 'header', '', '2026-01-02 14:28:07', 12),
(102, 9, 'Chèn tệp ảnh và trang web', 'video', 'https://youtu.be/zoexdwzqNOg', '2026-01-02 14:28:38', 5),
(103, 9, 'HD2: Phần 1_DIỄN ĐÀN THẢO LUẬN \"THỬ THÁCH TRÌNH DUYỆT\"', 'label', 'Chủ đề thảo luận: Học sinh chọn 1 trong 2 câu hỏi sau để trả lời trên diễn đàn:\r\n', '2026-01-02 14:29:41', 6),
(104, 9, 'Bài kiểm tra thường xuyên_Phần 1', 'quiz', '8', '2026-01-02 14:41:19', 7),
(105, 9, 'Chèn audio', 'video', 'https://youtu.be/UH3wftIrC3U', '2026-01-02 14:42:33', 9),
(106, 9, 'Chèn video', 'video', 'https://youtu.be/4TqfVUkfBww', '2026-01-02 14:43:11', 10),
(107, 9, 'Bài kiểm tra thường xuyên_Phần 2', 'quiz', '9', '2026-01-02 14:47:47', 11),
(108, 9, 'Tạo khung nội tuyến trong video', 'video', 'https://youtu.be/HaTkptn9qLo', '2026-01-02 14:49:02', 13),
(109, 9, 'Bài kiểm tra thường xuyên_Phần 3', 'quiz', '10', '2026-01-02 14:53:37', 14),
(110, 9, 'PPT_Tóm tắt lý thuyết', 'file', '1767365657_PPT_TÓM TẮT LY_BÀI 5.pptx.pdf', '2026-01-02 14:54:17', 1),
(111, 9, 'Hoạt động 3: Vận dụng', 'header', '', '2026-01-02 14:57:13', 15),
(112, 9, 'Nhiệm vụ 1', 'file', '1767365856_PHIẾU NHIỆM VỤ 1.pdf', '2026-01-02 14:57:36', 16),
(113, 9, 'Nộp_Nhiệm vụ 1', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScW2Gwoys4bNjINbrK8SPev_NSA5hsXAY9-ZJ7COryKhg6i4A/viewform', '2026-01-02 14:58:09', 17),
(114, 9, 'Nhiệm vụ 2', 'file', '1767365914_PHIẾU NHIỆM VỤ 2.pdf', '2026-01-02 14:58:34', 18),
(115, 9, 'Nộp_Nhiệm vụ 2', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScNSBHJr-55e0OGz90-1Rwh5cOIf4QdLzViFgkPjNKQnrpNgw/viewform', '2026-01-02 14:58:59', 19),
(116, 9, 'Hoạt động Tổng kết', 'header', '', '2026-01-02 14:59:43', 20),
(117, 9, 'Ôn tập cuối bài', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfUYMks1l7m35rPLZUWTaXBf1ZvrnHyRYe8hc1s6q9hajttUA/viewform', '2026-01-02 15:00:10', 21),
(118, 11, 'Giới thiệu chung', 'file', '1767451050_GT CHUNG.pdf', '2026-01-03 14:37:30', 0),
(119, 11, 'PPT_Tóm tắt lý thuyết', 'file', '1767451082_PPT_TOM TAT LT_BÀI 6.pptx.pdf', '2026-01-03 14:38:02', 1),
(120, 11, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-03 14:39:06', 2),
(121, 11, 'HD1_Diễn đàng', 'label', 'Trước khi vào nội dung bài học các em hãy cùng nhau thảo luận và chia sẻ hiểu biết ở phần diễn đàng Bài 6_HD1', '2026-01-03 14:40:01', 3),
(122, 11, 'Hoạt động 2: Phần 1_Tìm hiểu về nhập dữ liệu thông qua biểu mẫu ', 'header', '', '2026-01-03 15:11:23', 4),
(123, 11, 'Tài liệu: Phần 1_Tìm hiểu về nhập dữ liệu thông qua biểu mẫu ', 'file', '1767453120_PDF LT.pdf', '2026-01-03 15:12:00', 5),
(124, 11, 'Tạo biểu mẫu đăng nhập', 'video', 'https://youtu.be/RHXobG0Rnbc', '2026-01-03 15:15:23', 7),
(125, 11, 'Bài kiểm tra thường xuyên_Phần 1', 'quiz', '11', '2026-01-03 15:24:49', 8),
(126, 11, 'Hoạt động 2: Phần 2_Tìm hiểu một số điều khiển hỗ trợ nhập dữ liệu thông dụng và nút lệnh', 'header', '', '2026-01-03 15:25:53', 9),
(127, 11, 'Nhập kí tự', 'video', 'https://youtu.be/5R2gpqeZcQk', '2026-01-03 15:26:39', 10),
(128, 11, 'Bài trắc nghiệm nối cột', 'quiz', '12', '2026-01-03 15:29:14', 11),
(129, 11, 'Nhập lựa chọn', 'video', 'https://youtu.be/LI3NY4iNECY', '2026-01-03 15:30:38', 12),
(130, 11, 'Nút lệnh gửi dữ liệu ', 'video', 'https://youtu.be/-8PuYRCA-0Q', '2026-01-03 15:33:22', 13),
(131, 11, 'Hoạt động 2: Phần 3_Tìm hiểu về một số lưu ý trong thiết kế biểu mẫu ', 'header', '', '2026-01-03 15:34:20', 14),
(132, 11, 'Tài liệu_Tìm hiểu về một số lưu ý trong thiết kế biểu mẫu ', 'file', '1767454505_PDF tài liệu.pdf', '2026-01-03 15:35:05', 15),
(133, 11, 'Bài kiểm tra thường xuyên_Phần 3', 'quiz', '13', '2026-01-03 15:40:23', 16),
(134, 12, 'Giới thiệu chung', 'file', '1768213456_PDF giới thiệu chung.pdf', '2026-01-03 15:44:51', 1),
(135, 12, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-03 15:45:32', 2),
(137, 12, 'Hoạt động 1: Video tương tác', 'label', 'Em hãy copy link này, mở sang tab khác để tham gia xem và làm video tương tác nhé!\r\n\r\nhttps://app.lumi.education/run/Syb7dn', '2026-01-03 15:46:45', 4),
(138, 12, 'Hoạt động 2: Ôn lại kiến thức', 'header', '', '2026-01-03 15:47:48', 5),
(139, 12, 'Tài liệu ôn tập', 'file', '1767455282_ÔN TẬP KIẾN THỨC TẠO BIỂU MẪU.pdf', '2026-01-03 15:48:02', 6),
(140, 12, 'Hoạt động 3: Thực hành', 'header', '', '2026-01-03 15:48:27', 7),
(141, 12, 'Nhiệm vụ 1', 'file', '1767455332_3.1. PDF NHIỆM VỤ 1.pdf', '2026-01-03 15:48:52', 8),
(142, 12, 'Nộp_Nhiệm vụ 1', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSeMin_3q1k-ZjwfSaVi17F2QKP0g3UPYZMJU0X9zHk2H0hr8A/viewform', '2026-01-03 15:49:15', 9),
(143, 12, 'Nhiệm vụ 2', 'file', '1767455377_3.2. PDF NHIỆM VỤ 2.pdf', '2026-01-03 15:49:37', 10),
(144, 12, 'Nộp_Nhiệm vụ 2', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfSmFTMC-oXNs3F19F9ltEqdiSqOq-Lh8tZrn6359ktaWj-NA/viewform', '2026-01-03 15:50:01', 11),
(145, 12, 'Nhiệm vụ 3', 'file', '1767455439_3.3. PDF.pdf', '2026-01-03 15:50:39', 12),
(146, 12, 'Nộp_Nhiệm vụ 3', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdNBaG1GIyR-2-DqE68auMYV2fqjMUU7OWvkWL3qep-P0YJkg/viewform', '2026-01-03 15:50:49', 13),
(147, 14, 'Giới thiệu chung', 'file', '1767455709_PDF Giới thiệu chung.pdf', '2026-01-03 15:55:09', 1),
(148, 14, 'PPT_Tóm tắt lý thuyết', 'file', '1767455757_PPT_TÓM TẮT LÝ THUYẾT_BÀI 8.pptx.pdf', '2026-01-03 15:55:57', 2),
(149, 14, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-03 15:56:31', 3),
(150, 14, 'HD1_Diễn đàng', 'label', 'Các em hãy vào diễn đàng để thảo luận câu hỏi', '2026-01-03 15:57:04', 4),
(151, 14, 'Hoạt động 2: Bảng định dạng CSS', 'header', '', '2026-01-03 16:07:06', 5),
(152, 14, 'Khái niệm giới thiệu định dạng CSS', 'video', 'https://youtu.be/a9woPTjgllk\r\n', '2026-01-03 16:07:31', 6),
(153, 14, 'Hoạt động 2: Phần 1_Khai báo bộ chọn phần tử và áp dụng CSS', 'header', '', '2026-01-03 16:08:03', 7),
(154, 14, 'Quy tắc bộ chọn phần tử', 'video', 'https://youtu.be/p9g8gOMJwcI', '2026-01-03 16:08:21', 8),
(155, 14, 'ÁP DỤNG  internal', 'video', 'https://youtu.be/ptFVBvGymwA', '2026-01-03 16:08:43', 9),
(156, 14, 'ÁP DỤNG external', 'video', 'https://youtu.be/jfWEx6JmqaY', '2026-01-03 16:09:09', 10),
(157, 14, 'ÔN TẬP KHAI BÁO VÀ ÁP DỤNG CSS', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdBxLTTI-3RcYdEhPelhTxSkeH62JRCSrkNp2vmPzKnIieSNg/formResponse', '2026-01-03 16:09:41', 11),
(158, 14, 'Hoạt động 2: Phần 2_Một số thuộc tính định dạng CSS ', 'header', '', '2026-01-03 16:10:12', 12),
(159, 14, 'Thuộc tính CSS', 'video', 'https://youtu.be/BIN3jRoP5qs', '2026-01-03 16:10:30', 13),
(160, 14, 'HD2_Diễn đàng', 'label', 'Các em hãy vào diễn đàng để thảo luận câu hỏi ở HD2_Phần 2', '2026-01-03 16:11:16', 14),
(161, 14, 'Bài kiểm tra thường xuyên_Phần 2', 'quiz', '14', '2026-01-03 16:18:59', 15),
(162, 14, 'Hoạt động 3: Củng cố kiến thức về các thuộc tính cơ bản ', 'header', '', '2026-01-03 16:20:30', 16),
(163, 14, 'Nhiệm vụ ', 'file', '1767457255_PDF phiếu nhiệm vụ.pdf', '2026-01-03 16:20:55', 17),
(164, 14, 'Nộp_nhiệm vụ', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfSOypSzVnmU_jYQgDRVE9mF3AxpZye7af1OzPAEaqPE8IIzg/viewform', '2026-01-03 16:21:18', 18),
(165, 14, 'Ôn tập cuối khóa', 'header', '', '2026-01-03 16:22:00', 19),
(166, 14, 'Ôn tập', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScmQrpmf0FVEjogwKemDM_RzpJhvdSJHaWp4FebTE8fhrLJRg/viewform', '2026-01-03 16:22:18', 20),
(167, 15, 'Giới thiệu chung', 'file', '1767457520_PDF giới thiệu chung.pdf', '2026-01-03 16:25:20', 0),
(168, 15, 'HD1_kiểm tra nhanh', 'quiz', '15', '2026-01-04 04:02:04', 2),
(169, 15, 'Hoạt động 1: Khởi động ', 'header', '', '2026-01-04 04:03:11', 1),
(170, 15, 'Hoạt động 2: Ôn tập kiến thức', 'header', '', '2026-01-04 04:04:01', 3),
(171, 15, 'Tài liệu ôn tập', 'file', '1767499466_PDF ôn tập lý thuyết.pdf', '2026-01-04 04:04:26', 4),
(172, 15, 'Hoạt động 3: Thực hành', 'header', '', '2026-01-04 04:05:38', 5),
(173, 15, 'Nhiệm vụ 1', 'file', '1767499572_PHIẾU NHIỆM VỤ 1.pdf', '2026-01-04 04:06:12', 6),
(174, 15, 'Nộp_Nhiệm vụ 1', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdBOjE8lADHKOgwUHoCv8XYilLz30I3AM3-QG3MIwImhLvizg/viewform', '2026-01-04 04:06:31', 7),
(175, 15, 'Nhiệm vụ 2', 'file', '1767499622_phiếu nhiệm vụ 2.pdf', '2026-01-04 04:07:02', 8),
(176, 15, 'Nộp_Nhiệm vụ 2', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdBOjE8lADHKOgwUHoCv8XYilLz30I3AM3-QG3MIwImhLvizg/viewform', '2026-01-04 04:07:47', 9),
(177, 15, 'Nhiệm vụ 3', 'file', '1767499693_PDF phiếu nhiệm vụ 3.pdf', '2026-01-04 04:08:13', 10),
(178, 15, 'Nộp_Nhiệm vụ 3', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfU3VyeZnVsM62L2ewNGA_ytvDviZZybZNSqAFEO56fuv8wCQ/viewform', '2026-01-04 04:08:32', 11),
(179, 11, 'Trang đăng nhập', 'video', 'https://youtu.be/lRNG3DUKeNw', '2026-01-04 04:11:56', 6),
(180, 11, 'Ôn tập kiến thức cuối bài', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdIVK7DZq9-2Y4-m4SbEsw49cqqlmlO4n7KuW6lWi99WPX2ow/viewform', '2026-01-04 04:12:31', 18),
(181, 11, 'Hoạt động 3: Ôn tập', 'header', '', '2026-01-04 04:12:48', 17),
(182, 4, 'Hoạt động 2: Phần 1_ Thẻ và phần tử HTML', 'header', '', '2026-01-04 04:57:45', 4),
(183, 4, 'Bài tập tự luận_Phần 1 ', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSf1Dbp2zK4x9v34nKu5eoXwZizsUC257IUhCXjbetYbrxa-eg/formResponse', '2026-01-04 04:59:56', 6),
(184, 4, 'Hoạt động 3: Vận dụng', 'header', '', '2026-01-04 05:03:32', 15),
(185, 6, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-04 05:06:35', 2),
(186, 6, 'Hoạt động 2: Phần 1_ Tìm hiểu về thuộc tính thẻ trong HTML ', 'header', '', '2026-01-04 05:07:05', 5),
(187, 6, 'Hoạt động 2: Phần 2_Tìm hiểu về các thẻ định dạng trình bày văn bản, phông chữ ', 'header', '', '2026-01-04 05:09:17', 9),
(188, 6, 'Bài kiểm tra matching nhanh', 'quiz', '16', '2026-01-04 05:19:53', 14),
(189, 6, 'Hoạt động 3: ', 'header', '', '2026-01-04 05:20:44', 15),
(190, 6, 'Hoạt động 4: Vận dụng', 'header', '', '2026-01-04 05:21:02', 17),
(192, 6, 'Ôn tập', 'header', '', '2026-01-04 05:21:49', 21),
(193, 16, 'Giới thiệu chung', 'file', '1767504297_PDF GIỚI THIỆU CHUNG.docx.pdf', '2026-01-04 05:24:57', 0),
(194, 16, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-04 05:25:55', 2),
(195, 16, 'Lưu ý', 'label', 'Các em cần copy đường link dưới và chạy ra ngoài tab khác để thực hiện được hoạt động này:\r\nhttps://app.lumi.education/run/cl8trj', '2026-01-04 05:26:26', 3),
(197, 16, 'Hoạt động 2: Phần 1_Bộ chọn lớp ', 'header', '', '2026-01-04 05:30:05', 4),
(198, 16, 'Video_Giới thiệu', 'video', 'https://youtu.be/R0Tn5UmiKJ4', '2026-01-04 05:30:28', 5),
(199, 16, 'Video_Bộ chọn lớp', 'video', 'https://youtu.be/rC7u1nYKMSw', '2026-01-04 05:30:53', 6),
(200, 16, 'HD2_Diễn đàng', 'label', 'Các em hãy truy cập diễn đàng để thảo luận và trả lời câu hỏi ở HD2_phần 1', '2026-01-04 05:31:37', 7),
(201, 16, 'Kiểm tra nhanh', 'quiz', '17', '2026-01-04 05:39:03', 8),
(202, 16, 'Hoạt động 2: Phần 2_Bộ chọn định danh', 'header', '', '2026-01-04 05:39:43', 9),
(203, 16, 'Video_Bộ chọn ID', 'video', 'https://youtu.be/nXNQQG7sIW0', '2026-01-04 05:40:01', 10),
(204, 16, 'HD 2_Diễn đàng', 'label', 'Các em hãy truy cập diễn đàng để thảo luận và trả lời câu hỏi ở HD 2_phần 2', '2026-01-04 05:40:31', 11),
(205, 16, 'Hoạt động 3: Vận dụng', 'header', '', '2026-01-04 05:43:41', 12),
(206, 16, 'Nhiệm vụ 1', 'file', '1767505502_PDF PHIẾU NHIỆM VỤ 1.pdf', '2026-01-04 05:45:02', 13),
(207, 16, 'Nộp_Nhiệm vụ 1', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSddZDN2OAfx6h6tFecCJuMlPU7j33Btn39V8XKuhRAR4jFArQ/viewform', '2026-01-04 05:45:30', 14),
(208, 16, 'Nhiệm vụ 2', 'file', '1767505568_PDF PHIẾU NHIỆM VỤ 2 (1).pdf', '2026-01-04 05:46:08', 15),
(209, 16, 'Nộp_Nhiệm vu 2', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdGNmtD5Qq_Q6xlC8L6eTXXTUpjQRTqcoT31QBmzAsMbxAWOQ/viewform', '2026-01-04 05:46:42', 16),
(210, 16, 'Ôn tập cuối bài', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSd7o9EhfdZP4NLUdk1d2epgKuJ7kEYCSPRl0mPLdbbuibiotg/viewform', '2026-01-04 05:47:32', 17),
(211, 16, 'PPT_Tóm tắt lý thuyết', 'file', '1767505923_PPT_TÓM TẮT LT BÀI 10.pptx.pdf', '2026-01-04 05:52:03', 1),
(212, 17, 'Giới thiệu chung', 'file', '1767506101_PDF GIỚI THIỆU CHUNG.pdf', '2026-01-04 05:55:01', 0),
(213, 17, 'PPT_Tóm tắt lý thuyết', 'file', '1767506127_PPT_LT BÀI 11.pptx.pdf', '2026-01-04 05:55:27', 1),
(214, 17, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-04 05:56:15', 2),
(215, 17, 'HD1_Diễn đàng', 'label', 'Các em hãy qua trang diễn đàng thảo luận và trả lời câu hỏi ở HD1 ', '2026-01-04 05:56:45', 3),
(216, 17, 'Hoạt động 2: Phần 1_Một hình hộp trong trình bày phần tử HTML ', 'header', '', '2026-01-04 05:59:47', 4),
(217, 17, 'HD2_Diễn đàng', 'label', 'Các em hãy qua trang diễn đàng thảo luận và trả lời ở HD2_phần 1\r\n', '2026-01-04 06:01:10', 5),
(218, 17, 'Video mô hình hộp ', 'video', 'https://youtu.be/R0TEl5xYONI', '2026-01-04 06:02:58', 6),
(219, 17, 'Bài kiểm tra nhanh', 'quiz', '18', '2026-01-04 06:15:33', 7),
(220, 17, 'Hoạt động 2: Phần 2_ Hiển thị phần tử theo khối, theo dòng ', 'header', '', '2026-01-04 06:16:53', 8),
(221, 17, 'Video hiển thị theo khối, dòng', 'video', 'https://youtu.be/wAeuzstOxnI\r\n', '2026-01-04 06:17:28', 9),
(222, 17, 'Củng cố kiến thức', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScUa00mWubPgajtlgQQ1Eusv-Jm72mKHhmDb9ZbQ47ypkRw8g/formResponse', '2026-01-04 06:18:01', 10),
(223, 17, 'Hoạt động 2: Phần 3_ Bố cục trang web', 'header', '', '2026-01-04 06:19:43', 11),
(224, 17, 'Video bố cục của trang web', 'video', 'https://youtu.be/Nky8Re-Nuv8', '2026-01-04 06:20:41', 12),
(225, 17, 'Infographic:  Bố cục trang web', 'file', '1767507774_Bố cục trang web.png', '2026-01-04 06:22:54', 13),
(226, 17, 'Trắc nghiệm nhanh', 'quiz', '19', '2026-01-04 06:29:44', 14),
(227, 17, 'Hoạt động 3: Vận dụng', 'header', '', '2026-01-04 06:30:51', 15),
(228, 17, 'Nhiệm vụ', 'file', '1767508288_PDF PHIẾU NHIỆM VỤ.pdf', '2026-01-04 06:31:28', 16),
(229, 17, 'Nộp_nhiệm vụ', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSd2PB-pPGiysdS_93vtCCOTL27WOdsdC1tvzukaMLN-dx9uwg/viewform', '2026-01-04 06:32:24', 17),
(230, 17, 'Ôn tập cuối khóa', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScY_E8-MPBkjqMKxlXbKEK5n7b8fA5r6PyyOhVASnSz4ltdvw/viewform', '2026-01-04 06:33:14', 19),
(231, 17, 'Hoạt động ôn tập', 'header', '', '2026-01-04 06:33:41', 18),
(232, 18, 'Giới thiệu chung', 'file', '1767508617_PDF GIỚI THIỆU CHUNG (1).pdf', '2026-01-04 06:36:57', 0),
(233, 18, 'Lưu ý các em copy đường link vào trình duyệt ngoài để tham gia trò chơi', 'label', 'https://app.lumi.education/run/I5m0Br', '2026-01-04 07:09:51', 2),
(234, 18, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-04 07:10:06', 1),
(235, 18, 'Hoạt động 2:  Phân tích bố cục website (Header, Banner, Slogan, Content, Footer).', 'header', '', '2026-01-04 07:11:09', 3),
(236, 18, 'Infographic box modle', 'file', '1767510692_Box model.png', '2026-01-04 07:11:32', 4),
(237, 18, 'PPT_CẤU TRÚC VÀ CHỨC NĂNG CHÍNH ', 'file', '1767510714_PPT_CẤU TRÚC VÀ CHỨC NĂNG CHÍNH .pptx.pdf', '2026-01-04 07:11:54', 5),
(238, 18, 'Củng cố nhanh về bố cục website', 'quiz', '20', '2026-01-04 07:19:30', 6),
(239, 18, 'Hoạt động 3: Phần 1_Tạo tệp CSS', 'header', '', '2026-01-04 07:20:27', 7),
(240, 18, 'Nhiệm vụ_Phần 1', 'file', '1767511266_PDF NHIỆM VỤ 1.pdf', '2026-01-04 07:21:06', 8),
(241, 18, 'Nộp_Nhiệm vụ Phần 1', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdm2qJcabMrEEOPhaq79IsOPufVEuv5je0nVpxkFZvWDvQnrQ/viewform', '2026-01-04 07:21:37', 9),
(242, 18, 'Hoạt động 3: Phần 2_Tạo các tệp HTML ', 'header', '', '2026-01-04 07:22:00', 10),
(243, 18, 'Nhiệm vụ_Phần 2', 'file', '1767511354_PDF NHIỆM VỤ 2.pdf', '2026-01-04 07:22:34', 11),
(244, 18, 'Nộp_Nhiệm vụ Phần 2', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScyRTnrEuGWt3HYIyumF9I3zcDW90a_6FPUdH6zeb8oBrIyPQ/viewform', '2026-01-04 07:23:53', 12),
(245, 18, 'Hoạt động 4: DỰ ÁN SÁNG TẠO WEBSITE CLB', 'header', '', '2026-01-04 07:24:23', 13),
(246, 18, 'Yêu cầu của dự án', 'file', '1767511495_PDF PHIẾU NHIỆM VỤ.pdf', '2026-01-04 07:24:55', 14),
(247, 18, 'Nộp sản phẩm', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSeGICeX44Fq9Y-Hc-yXkHcad_ze2iVSPnds8ulEDcmF8dKI6g/viewform', '2026-01-04 07:25:14', 15),
(248, 19, 'Giới thiệu chung', 'file', '1767612670_giới thiệu chung.pdf', '2026-01-05 11:31:10', 0),
(249, 19, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-05 11:31:33', 2),
(250, 19, 'HD1_Diễn đàng', 'label', 'Trước khi tìm hiểu sâu hơn về học máy các em hãy cùng nhau thảo luận và trả lời câu hỏi ở Diễn đàng Bài 1: HD1 (CS)', '2026-01-05 11:32:50', 3),
(251, 19, 'Hoạt động 2: Phần 1_Khái niệm về học máy ', 'header', '', '2026-01-05 11:37:49', 4),
(252, 19, 'Hoạt động 2: Phần 2_Học có giám sát', 'header', '', '2026-01-05 11:38:03', 8),
(253, 19, 'Hoạt động 2: Phần 4_Một số ứng dụng của học máy', 'header', '', '2026-01-05 11:38:26', 15),
(254, 19, 'HD2: Phần 1_Diễn đàng', 'label', 'Các em hãy vào diễn đàng để trả lời các câu hỏi ở HD2: Phần 1 (CS)', '2026-01-05 11:39:29', 5),
(255, 19, 'Video: Khái niệm Học máy', 'video', 'https://youtu.be/8Wyz19vpHDM', '2026-01-05 11:40:39', 6),
(256, 19, 'Bài kiểm nhanh', 'quiz', '21', '2026-01-05 11:45:30', 7),
(257, 19, 'Video: Học có giám sát', 'video', 'https://youtu.be/I8R5RkF7aQA', '2026-01-05 11:46:09', 9),
(258, 19, 'HD2: Phần 2_Diễn đàng', 'label', 'Các em hãy vào diễn đàng để trả lời các câu hỏi ở HD2: Phần 2 (CS)', '2026-01-05 11:46:55', 10),
(259, 19, 'Củng cố bài học nhanh', 'quiz', '22', '2026-01-05 11:51:24', 11),
(260, 19, 'HD2: Phần 3_Diễn đàng', 'label', 'Các em hãy vào diễn đàng để trả lời các câu hỏi ở HD2: Phần 3 (CS)', '2026-01-05 11:52:09', 13),
(261, 19, 'Video: Học không giám sát', 'video', 'https://youtu.be/-vn6TFVxoA8', '2026-01-05 11:53:17', 14),
(262, 19, 'Hoạt động 2: Phần 3_Học không giám sát', 'header', '', '2026-01-05 11:54:20', 12),
(263, 19, 'HD2: Phần 4_Diễn đàng', 'label', 'Các em hãy vào diễn đàng để trả lời các câu hỏi ở HD2: Phần 4 (CS)', '2026-01-05 11:55:10', 16),
(264, 19, 'Video: Một số ứng dụng của học máy', 'video', 'https://youtu.be/2Zj0YN6VVUg', '2026-01-05 11:56:09', 17),
(265, 19, 'PPT_Tóm tắt lý thuyết', 'file', '1767614203_PPT_LT.pptx.pdf', '2026-01-05 11:56:43', 1),
(266, 19, 'Củng cố bài học', 'quiz', '23', '2026-01-05 12:20:41', 18),
(267, 20, 'Giới thiệu chung', 'file', '1767784193_PDF giới thiệu chung.pdf', '2026-01-07 11:09:53', 0),
(268, 20, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-07 11:10:09', 2),
(269, 20, 'Lưu ý:', 'label', 'Các em cần sao chép đường link sao trình duyệt khác để tham gia trò chơi: https://app.lumi.education/run/q8vDia ', '2026-01-07 11:11:24', 3),
(270, 20, 'Hoạt động 2: Phần 1_Khoa học dữ liệu ', 'header', '', '2026-01-07 11:12:44', 4),
(271, 20, 'HD2: Phần 1_ Diễn đàng', 'label', 'Trước khi chúng ta bước vào nội dung bài học các em hãy chia sẻ những hiểu biết của mình về cụm từ khoá  “Các lĩnh vực nghiên cứu của khoa học dữ liệu”, ở diễn đàng Bài 2_Hoạt động 2_Phần 1 (CS)', '2026-01-07 11:14:12', 5),
(272, 20, 'Video_Khái niệm khoa học dữ liệu', 'video', 'https://youtu.be/079jhXNNUS0', '2026-01-07 11:15:33', 6),
(273, 20, 'Bài kiểm tra nhanh', 'quiz', '24', '2026-01-07 11:20:04', 7),
(274, 20, 'Hoạt động 2: Phần 2_Một số thành tựu của khoa học dữ liệu ', 'header', '', '2026-01-07 11:20:27', 8),
(275, 20, 'Tài liệu về một số thành tựu của khoa học dữ liệu ', 'file', '1767784879_Tài liệu về một số thành tựu của khoa học dữ liệu .pdf', '2026-01-07 11:21:19', 9),
(276, 20, 'HD2: Phần 2_Diễn đàng', 'label', 'Các em hãy vào diễn đàng bài 2: Hoạt động 2_Phần 2 (CS) để trả lời các câu hỏi.', '2026-01-07 11:22:42', 10),
(277, 20, 'PPT_Tóm tắt lý thuyết', 'file', '1767785085_PPT_LT BÀI 2 CS.pptx.pdf', '2026-01-07 11:24:45', 1),
(278, 20, 'Hoạt động 3: Luyện tập', 'header', '', '2026-01-07 11:25:19', 11),
(279, 20, 'Củng cố bài học nhanh', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfNX7zlVdrLZ6oS4fAVj179o6-Qt3msbTuvrmJuzQXv_nRZ8w/formResponse', '2026-01-07 11:25:53', 12),
(280, 20, 'Hoạt động 4: Vận dung', 'header', '', '2026-01-07 11:26:13', 13),
(281, 20, 'Nhiệm vụ ', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfNX7zlVdrLZ6oS4fAVj179o6-Qt3msbTuvrmJuzQXv_nRZ8w/formResponse', '2026-01-07 11:26:32', 14),
(282, 20, 'Nộp_Nhiệm vụ', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSe7ezrFf8DCd28GEe_bRI71FKsnB1K7AYjE9ezZZvTKfpQH_A/viewform', '2026-01-07 11:26:51', 15),
(283, 20, 'Ôn tập kiến thức', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScLz1SFaq1cCO0qyE8EIeqy_Y6SrFUtk-06qeu9O6vOxaRaaw/viewform', '2026-01-07 11:27:54', 16),
(284, 21, 'Giới thiệu chung', 'file', '1767785615_PDF giới thiệu chung.pdf', '2026-01-07 11:33:35', 0),
(285, 21, 'Hoạt động 1: Khởi động ', 'header', '', '2026-01-07 11:34:44', 2),
(286, 21, 'HD1: Diễn đàng ', 'label', 'Trước khi vào bài học các em hãy vào diễn đàng Bài 3: Hoạt động 1 (CS) để thảo luận câu hỏi\r\n', '2026-01-07 11:35:39', 3),
(287, 21, 'Hoạt động 2: Phần 1_Các đặc trưng của dữ liệu ', 'header', '', '2026-01-07 11:36:54', 4),
(288, 21, 'Video_Các đặc trưng của dữ liệu', 'video', 'https://youtu.be/8E-G6s2mRAw', '2026-01-07 11:37:29', 5),
(289, 21, 'Bài kiểm tra nhanh', 'quiz', '25', '2026-01-08 07:15:55', 6),
(290, 21, 'Hoạt động 2: Phần 2_Phân tích dữ liệu, phát triển tri thức', 'header', '', '2026-01-08 07:16:29', 7),
(291, 21, 'Video_Phân tích dữ liệu, phát triển tri thức', 'video', 'https://youtu.be/KXbKWb82-mo', '2026-01-08 07:16:59', 8),
(292, 21, 'HD2: Diễn đàng', 'label', 'Các em hãy vào diễn đàng để thảo luận câu hỏi ở Bài 3: Hoạt động 2_Phần 2 (CS) ', '2026-01-08 07:17:53', 9),
(293, 21, 'Bài kiểm tra nhanh', 'quiz', '26', '2026-01-08 07:23:02', 10),
(294, 21, 'Hoạt động 2: Phần 3_Vai trò của máy tính và thuật toán ưu việt của khoa học dữ liệu ', 'header', '', '2026-01-08 07:23:27', 11),
(295, 21, 'Video_Vai trò của khoa học dữ liệu', 'video', 'https://youtu.be/hDvHv29b_xw', '2026-01-08 07:24:08', 12),
(296, 21, 'Bài kiểm tra nhanh', 'quiz', '27', '2026-01-08 07:28:02', 13),
(297, 21, 'PPT_Tóm tắt lý thuyết', 'file', '1767857318_PPT_LT_BAI 3 CS.pptx.pdf', '2026-01-08 07:28:38', 1),
(298, 21, 'Hoạt động 3: Luyện tập', 'header', '', '2026-01-08 07:29:17', 14),
(299, 21, 'Bài tập củng cố', 'assignment', 'Em hãy vẽ sơ đồ tư duy tổng hợp nội dung kiến thức của bài học \r\nNộp file: Bai 3 (CSS)_HD3_Họ tên_Lớp.pdf\r\n', '2026-01-08 07:30:30', 15),
(300, 21, 'Bài tự luận ngắn', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdLS6yneiZnSPIud7QpvFN1w-TV7vpONbKbZM7I8sPkN1r_bA/formResponse', '2026-01-08 07:33:49', 16),
(301, 21, 'Hoạt động 4: Vận dụng', 'header', '', '2026-01-08 07:34:15', 17),
(302, 21, 'HD4: Diễn đàng', 'label', 'Các em hãy vào diễn đàng để thảo luận câu hỏi ở Bài 3: Hoạt động 4 (CS) ', '2026-01-08 07:34:40', 18),
(303, 21, 'Ôn tập cuối bài', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSck5SdXlVLPR_knVyVkL8QfxHsnzsm5lybYe-etvaDOspU69g/viewform', '2026-01-08 07:35:28', 19),
(304, 22, 'Giới thiệu chung', 'file', '1767858001_PDF giới thiệu chung.pdf', '2026-01-08 07:40:01', 0),
(305, 22, 'Lưu ý:', 'label', 'Các em cần sao chép đường link sao trình duyệt khác để tham gia trò chơi: \r\nhttps://app.lumi.education/run/EkbO5x', '2026-01-08 07:40:52', 2),
(306, 22, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-08 07:41:03', 1),
(307, 22, 'Hoạt động 2: Phần 1_Trích xuất dữ liệu', 'header', '', '2026-01-08 07:42:19', 3),
(308, 22, 'PPT: Phần 1_trích xuất dữ liệu', 'file', '1767858186_PPT BÀI 4_HD TRÍCH XUẤT DL_HĐ2_PHÀN 1.pptx.pdf', '2026-01-08 07:43:06', 6),
(309, 23, 'Giới thiệu chung', 'file', '1767858618_PDF GIỚI THIỆU.pdf', '2026-01-08 07:50:18', 0),
(310, 23, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-08 07:50:40', 2),
(311, 23, 'Video tương tác', 'label', 'Các em cần copy đường link vào tab khác để xem video:\r\nhttps://app.lumi.education/run/D2km0O', '2026-01-08 07:52:44', 3),
(312, 23, 'Hoạt động 2: Phần 1_Mô phỏng và phần mềm mô phỏng ', 'header', '', '2026-01-08 07:53:58', 4),
(313, 23, 'Video_Mô phỏng và phần mềm mô phỏng ', 'video', 'https://youtu.be/fsi4FIJq4Ro', '2026-01-08 07:54:22', 5),
(314, 23, 'Kiểm tra nhanh', 'quiz', '28', '2026-01-08 07:58:51', 6),
(315, 23, 'Hoạt động 2: Phần 2_Phần mềm mô phỏng trong một số lĩnh vực ', 'header', '', '2026-01-08 07:59:12', 7),
(316, 23, 'HD2: Phần 2_Diễn đàng', 'label', 'Hãy truy cập vào diễn đàng Bài 5: Hoạt động 2_Phần 2 (CS) để thảo luận câu hỏi', '2026-01-08 08:00:16', 8),
(317, 23, 'Video_ Một số phần mềm mô phỏng trong một số lĩnh vực ', 'video', 'https://youtu.be/AOA6fywEVLU', '2026-01-08 08:01:27', 9),
(318, 23, 'Kiểm tra nhanh', 'quiz', '29', '2026-01-08 08:14:24', 10),
(319, 23, 'PPT_Tóm tắt lý thuyết', 'file', '1767860091_PPT_BAI5 CS.pptx.pdf', '2026-01-08 08:14:51', 1),
(320, 23, 'Hoạt động 3: Luyện tập', 'header', '', '2026-01-08 08:15:16', 11),
(321, 23, 'Nhiệm vụ ', 'file', '1767860150_PDF Phiếu nhiệm vụ.pdf', '2026-01-08 08:15:50', 12),
(322, 23, 'Nộp_Nhiệm vụ', 'assignment', 'Các em nộp bài tập ở đây và đặt tên theo cú pháp:\r\nBài 5_Hoạt động 3_ HọTen_Lớp(CS).pdf', '2026-01-08 08:17:51', 13),
(323, 23, 'Hoạt động 4: Vận dụng', 'header', '', '2026-01-08 08:18:09', 14),
(324, 23, 'Bài tập vận dụng', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfgta--AB6y_K10LhmMkIVlxZpLv5LkxlMZY75FbzNfudq_5A/viewform', '2026-01-08 08:18:44', 15),
(325, 23, 'ÔN TẬP CUỐI BÀI', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSeBcYEBE6DavB67xhcqVO2kjr0o2ZQEKb320X4Y38J-fdie3g/viewform', '2026-01-08 08:19:09', 16),
(326, 24, 'Giới thiệu chung', 'file', '1767860483_Giới thiệu chung-18.pdf', '2026-01-08 08:21:23', 1),
(327, 24, 'Hoạt động 1: Khởi động', 'header', '', '2026-01-08 08:21:48', 2),
(328, 24, 'HD 1: Diễn đàng', 'label', 'Các em hãy vào diễn đàng Bài 6: Hoạt động 1 (CS) để thảo luận câu hỏi', '2026-01-08 08:22:33', 3),
(329, 24, 'Hoạt động 2: Giới thiệu phần mềm Geogebra', 'header', '', '2026-01-08 08:23:22', 4),
(330, 24, 'Tài liệu về phần mềm Geogebra', 'file', '1767860630_Giới thiệu phần mềm Geogebra.pdf', '2026-01-08 08:23:50', 5),
(331, 24, 'Kiểm tra nhanh', 'quiz', '30', '2026-01-08 08:27:41', 6),
(332, 24, 'Hoạt động 3: Phần 1_Thể hiện trực quan một số định lý hình học bằng phần mềm Geogebra', 'header', '', '2026-01-08 08:28:06', 7),
(333, 24, 'Tài liệu hướng dẫn cài đặt phần mềm Geogebra', 'file', '1767860930_Hướng dẫn cài đặt.pdf', '2026-01-08 08:28:50', 8),
(334, 24, 'Nhiệm vụ 1', 'file', '1767860949_Nhiệm vụ 1.pdf', '2026-01-08 08:29:09', 9),
(335, 24, 'NỘP_Nhiệm vụ 1', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSdBKbNmEBWWDoEna_a0UpL5w_RA7dGgQuoNhkzUe3KHhgosgg/viewform', '2026-01-08 08:29:44', 10),
(336, 24, 'Hoạt động 3: Phần 2_Tìm một quy luật hình học bằng mô phỏng của Geogebra ', 'header', '', '2026-01-08 08:30:19', 11),
(337, 24, 'Nhiệm vụ 2', 'file', '1767862046_Nhiệm vụ 2.pdf', '2026-01-08 08:47:26', 12),
(338, 24, 'NỘP_Nhiệm vụ 2', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSfMbukzEZkMDrB4AHXZ1KdRwZiX9POcTq08R8VnX8G3WaXHBA/viewform', '2026-01-08 08:48:11', 13),
(339, 24, 'Hoạt động 3: Phần 3_Dùng geogebra để hiển thị trực quan mặt phẳng, mặc bậc 2 và phần giao khi cắt nhau', 'header', '', '2026-01-08 08:48:59', 14),
(340, 24, 'Nhiệm vụ 3', 'file', '1767862234_NHIỆM VỤ 3.pdf', '2026-01-08 08:50:34', 15),
(341, 24, 'NỘP_nhiệm vụ 3', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLScIrTjdOkxyaTvwyUFmPxr7_tWsDFD5w4GdoS_vdPY-uVvguA/viewform', '2026-01-08 08:51:04', 16),
(342, 4, 'Giới thiệu chung ', 'file', '1768213061_PDF Giới thiệu chung_ BÀI 1 .docx.pdf', '2026-01-12 10:17:41', 0),
(343, 22, 'TỔNG QUAN VỀ PHÂN TÍCH DỮ LIỆU VÀ TRÍCH XUẤT THÔNG TIN', 'file', '1768213704_PDF tham khảo.pdf', '2026-01-12 10:28:24', 4),
(344, 22, 'Kiểm tra ngắn', 'quiz', '31', '2026-01-12 10:33:39', 5),
(345, 22, 'Hoạt động 2: Phần 2_CÔNG CỤ FORECAST SHEET TRONG EXCEL', 'header', '', '2026-01-12 10:35:14', 7),
(346, 22, 'CÔNG CỤ FORECAST SHEET TRONG EXCEL', 'file', '1768214135_CÔNG CỤ FORECAST SHEET TRONG EXCEL.pdf', '2026-01-12 10:35:35', 8),
(347, 22, 'kiểm tra ngắn', 'quiz', '32', '2026-01-12 10:39:47', 9),
(348, 22, 'Hoạt động 3: Phần 1_Trích xuất thông tin về ước tính kỳ hạn vay từ dữ liệu cho trước ', 'header', '', '2026-01-12 10:40:34', 10),
(349, 22, 'PPT_Trích xuất thông tin về ước tính kỳ hạn vay từ dữ liệu cho trước ', 'file', '1768214464_PPT BÀI 4_HD TRÍCH XUẤT DL_HĐ2_PHÀN 1.pptx.pdf', '2026-01-12 10:41:04', 11),
(350, 22, 'Nhiệm vụ 1', 'file', '1768214492_Nhiệm vụ 1.pdf', '2026-01-12 10:41:32', 12),
(351, 22, 'NỘP_SẢN PHẨM NHIỆM VỤ 1 ', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSflDyniEn6GWORsM9HuzevhJBZd5YKLk8jAX6wv7NcWXW72Hw/viewform', '2026-01-12 10:41:52', 13),
(352, 22, 'Nhiệm vụ 2', 'file', '1768214554_nhiệm vụ 2.pdf', '2026-01-12 10:42:34', 14),
(353, 22, 'NỘP_SẢN PHẨM NHIỆM VỤ 2  ', 'google_form', 'https://docs.google.com/forms/d/e/1FAIpQLSf9uoWiBuwq2N6oF3BROuzh2jBs55hJWn9Fyes7KAl8gdVljw/viewform', '2026-01-12 10:43:03', 15),
(354, 22, 'HD3_Diễn đàng', 'label', 'Các em hãy vào diễn đàng Bài 4: Hoạt động 3 (CS) để thảo luận câu hỏi', '2026-01-12 10:45:58', 16);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity_completions`
--

CREATE TABLE `activity_completions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `completed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `activity_completions`
--

INSERT INTO `activity_completions` (`id`, `user_id`, `lesson_id`, `activity_id`, `completed_at`) VALUES
(1, 4, 4, 14, '2025-12-23 21:55:09'),
(2, 4, 4, 5, '2025-12-23 21:55:11'),
(3, 4, 4, 22, '2025-12-23 21:55:15'),
(4, 4, 4, 8, '2025-12-23 21:55:17'),
(5, 4, 4, 10, '2025-12-23 21:55:21'),
(6, 4, 4, 9, '2025-12-23 21:55:26'),
(7, 4, 4, 12, '2025-12-23 21:55:32'),
(8, 4, 4, 16, '2025-12-23 21:55:36'),
(9, 4, 4, 17, '2025-12-23 21:55:43'),
(10, 4, 4, 18, '2025-12-23 21:55:46'),
(11, 2, 4, 8, '2025-12-24 20:57:26'),
(12, 2, 4, 9, '2025-12-24 21:10:42'),
(13, 2, 4, 15, '2025-12-30 09:29:22'),
(14, 2, 4, 12, '2025-12-30 09:29:24'),
(15, 2, 7, 51, '2026-01-01 15:00:48'),
(16, 2, 7, 55, '2026-01-01 15:09:08'),
(17, 2, 7, 61, '2026-01-01 15:22:58'),
(18, 2, 7, 68, '2026-01-01 15:27:52'),
(19, 2, 7, 67, '2026-01-01 15:27:58'),
(20, 2, 7, 65, '2026-01-01 15:27:59'),
(21, 2, 8, 91, '2026-01-01 16:36:20'),
(22, 2, 8, 90, '2026-01-01 16:36:22'),
(23, 2, 8, 84, '2026-01-01 16:36:25'),
(24, 2, 8, 80, '2026-01-01 16:36:27'),
(25, 2, 8, 95, '2026-01-01 16:42:15'),
(26, 2, 9, 104, '2026-01-02 21:41:47'),
(27, 2, 9, 110, '2026-01-02 21:54:47'),
(28, 2, 9, 117, '2026-01-02 22:00:21'),
(29, 2, 11, 128, '2026-01-03 22:29:29'),
(30, 2, 15, 168, '2026-01-04 11:02:18'),
(31, 2, 6, 188, '2026-01-04 12:20:04'),
(32, 2, 15, 173, '2026-01-04 12:22:29'),
(33, 2, 16, 196, '2026-01-04 12:26:53'),
(34, 2, 16, 195, '2026-01-04 12:28:46'),
(35, 2, 16, 206, '2026-01-04 12:46:17'),
(36, 2, 16, 208, '2026-01-04 12:46:19'),
(37, 2, 14, 156, '2026-01-05 18:19:26'),
(38, 2, 14, 155, '2026-01-05 18:19:29'),
(39, 2, 14, 154, '2026-01-05 18:19:30'),
(40, 2, 14, 163, '2026-01-05 18:19:33'),
(41, 2, 15, 171, '2026-01-05 18:19:57'),
(42, 2, 15, 174, '2026-01-05 18:20:01'),
(43, 2, 15, 176, '2026-01-05 18:20:15'),
(44, 2, 15, 178, '2026-01-05 18:20:17'),
(45, 2, 16, 207, '2026-01-05 18:20:30'),
(46, 2, 18, 232, '2026-01-05 18:20:45'),
(47, 2, 18, 238, '2026-01-05 18:20:53'),
(48, 2, 19, 266, '2026-01-05 19:21:00'),
(50, 4, 19, 266, '2026-01-07 18:02:44'),
(52, 2, 20, 269, '2026-01-07 18:12:03'),
(53, 2, 21, 299, '2026-01-08 14:30:44'),
(54, 2, 12, 137, '2026-01-08 14:51:28'),
(55, 2, 9, 105, '2026-01-12 17:21:09'),
(56, 4, 4, 183, '2026-01-15 13:58:41'),
(57, 4, 4, 26, '2026-01-15 14:00:00'),
(58, 4, 23, 325, '2026-01-15 14:00:54'),
(59, 4, 23, 322, '2026-01-15 14:00:56'),
(60, 2, 17, 218, '2026-03-05 00:01:03'),
(61, 5, 7, 62, '2026-03-05 08:01:27'),
(62, 5, 7, 49, '2026-03-05 08:01:34'),
(63, 5, 7, 51, '2026-03-05 08:01:36'),
(64, 5, 7, 55, '2026-03-05 08:01:40'),
(65, 5, 11, 125, '2026-03-05 08:01:48'),
(67, 7, 9, 107, '2026-03-15 11:05:52'),
(70, 7, 4, 22, '2026-03-17 09:30:31'),
(71, 7, 4, 9, '2026-03-17 09:31:01'),
(73, 17, 11, 125, '2026-03-23 14:01:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `lesson_id`, `user_id`, `content`, `created_at`) VALUES
(1, 4, 2, 'Hoạt động 1: Truy cập vào diễn đàn, em hãy trả lời 2 câu hỏi', '2025-12-18 08:26:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forum_images`
--

CREATE TABLE `forum_images` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `forum_images`
--

INSERT INTO `forum_images` (`id`, `topic_id`, `image_path`) VALUES
(3, 8, '1766217242_0_z7346707879428_e2faf9c687dccfeb55de50e2735b0365.jpg'),
(4, 10, '1766319458_0_z7350376998085_6c0f417423f32882ea027f2aea21cfbc.jpg'),
(5, 10, '1766319458_1_z7350377053956_fe8616708b6c12a9f1e09788dc31bd24.jpg'),
(6, 12, '1766320401_0_z7350430834754_46a1fd66aeff90931172c5b9b0ec0274.jpg'),
(7, 15, '1767258536_0_z7387726272844_d15609e6f522ffef66a27ab3b0209b72.jpg'),
(8, 22, '1767456376_0_z7394688071226_6e3adade75968d579420a5843feeef36.jpg'),
(9, 22, '1767456376_1_z7394688071242_1d431306c3b449a471221b27e9d26d02.jpg'),
(10, 27, '1767506538_0_z7395783735922_44233a1137955752691d15dae847dbc7.jpg'),
(11, 28, '1767612929_0_z7400156353209_bf2fff602785dd7ac57078f64857aa44.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forum_likes`
--

CREATE TABLE `forum_likes` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forum_replies`
--

CREATE TABLE `forum_replies` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `forum_replies`
--

INSERT INTO `forum_replies` (`id`, `topic_id`, `user_id`, `content`, `created_at`) VALUES
(2, 28, 7, 'Nếu con người thực hiện thì nhiệm vụ trên là dễ \r\nTheo em, máy tính có thể tự động thực hiện nhiệm vụ trên thay con người. Lập trình để máy tính làm công việc này là khó.', '2026-03-17 02:41:04'),
(3, 40, 7, 'Nó có hơi khó nhưng tìm hiểu thì rất thú vị ạ', '2026-03-17 02:42:40'),
(4, 22, 7, 'Hình thứ 2 vì đẹp mặt và rõ ràng hơn ', '2026-03-17 02:47:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forum_threads`
--

CREATE TABLE `forum_threads` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forum_topics`
--

CREATE TABLE `forum_topics` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `forum_topics`
--

INSERT INTO `forum_topics` (`id`, `user_id`, `title`, `content`, `created_at`, `image`) VALUES
(8, 2, 'Bài 1: Phần 2_Cấu trúc tệp HTML', 'Dựa vào hình trên em hãy trả lời các câu hỏi sau:\r\nCâu 1: Chỉ ra các thẻ mở – thẻ đóng – thẻ đơn – thẻ đôi trong hình 1.\r\nCâu 2: Phân tích vị trí các thẻ lồng nhau.\r\nCâu 3: Vẽ sơ đồ cấu trúc file HTML.\r\n', '2025-12-20 07:54:02', NULL),
(9, 2, 'Bài 1: Phần 3_Tìm hiểu về các phần mềm soạn thảo HTML', 'Câu 1: Trình soạn thảo HTML là gì?\r\nCâu 2: Ưu và nhược điểm của 2 trình soạn thảo HTML mà em đã được học. \r\nCâu 3: Chức năng cơ bản của trình soạn thảo HTML là gì?\r\n', '2025-12-20 08:02:22', NULL),
(10, 2, 'Bài 2: Hoạt động 1', 'Quan sát 2 hình ảnh sau:\r\nEm hãy trả lời các câu sau:\r\nCâu 1. Theo em, văn bản nào trình bày đẹp hơn?\r\nCâu 2. Vì sao em chọn văn bản đó?\r\nCâu 3. Văn bản ở hình b có những yếu tố định dạng nào?', '2025-12-21 12:17:38', NULL),
(11, 2, 'Bài 2: Hoạt động 2', 'Nhận dạng thuộc tính và chức năng của thuộc tính trong thẻ\r\n1) Nhận dạng thẻ nào có thuộc tỉnh?\r\n\r\n&lt;p align=&quot;center&quot;&gt;Đoạn văn giữa trang&lt;/p&gt;\r\n\r\n&lt;img src=&quot;cat.jpg&quot; alt=&quot;Hình con mèo&quot; width=&quot;200&quot;&gt;\r\n\r\n&lt;body bgcolor=&quot;lightblue&quot;&gt;\r\n\r\n2) Chỉ ra và nêu tác dụng của thuộc tính đó là gì? Giá trị của thuộc tính đó là gì?\r\n\r\nYêu cầu: Học sinh trả lời câu hỏi và tải lên diễn đàn\r\n', '2025-12-21 12:23:20', NULL),
(12, 2, 'Bài 3: Hoạt động 3', 'Em hãy quan sát đoạn văn bản trong trong hình sau: \r\n\r\nDựa vào hình ảnh trên hãy trả lời các câu hỏi sau:\r\nĐoạn văn có những thành phần gì? (tiêu đề, đoạn văn, dòng in nghiêng…)\r\n- Các thẻ định dạng đã dùng?\r\n- Thẻ nào là thẻ đơn, thẻ nào là thẻ đôi?\r\n- Ý nghĩa của từng thẻ?\r\n', '2025-12-21 12:33:21', NULL),
(13, 2, 'Bài 3: Hoạt động 1', 'Em hãy đọc 2 đoạn văn bản sau:\r\nĐoạn 1:\r\n“Hôm nay trường tổ chức nhiều hoạt động như khởi động thi đấu văn nghệ thể thao trò chơi tập thể và yêu cầu mỗi lớp chuẩn bị đầy đủ đúng thời gian 7 giờ 30 tại sân trường.”\r\nĐoạn 2:\r\n“Hôm nay trường tổ chức:\r\nKhởi động\r\n    - Thi đấu văn nghệ\r\n    - Thi đấu thể thao\r\n    - Trò chơi tập thể\r\n    Thời gian: 7:30\r\n    Địa điểm: Sân trường”\r\n\r\nDựa vào 2 đoạn văn bản trên, em hãy trả lời các câu hỏi sau:\r\nCâu 1: Hai đoạn văn bản trên đoạn văn bản nào dễ đọc hơn? Vì sao?\r\nCâu 2: Dựa theo hiểu biết của mình, em hãy giải thích lý do vì sao khi xây dựng trang web cần trình bày nội dung rõ ràng, có cấu trúc?\r\n', '2026-01-01 07:57:26', NULL),
(14, 2, 'Bài 3: Hoạt động 2', 'Em hãy truy cập vào diễn đàn thảo luận và trả lời câu sau:\r\n\r\nTheo em, khi tạo bảng trong HTML, những thuộc tính nào thường được sử dụng?\r\nHãy liệt kê và nêu ngắn gọn tác dụng của từng thuộc tính.\r\n', '2026-01-01 08:12:28', NULL),
(15, 2, 'Bài 4: Hoạt động 2_Phần 1', '                                                                            Phân biệt đường dẫn\r\nTrong các đường dẫn dưới đây em hãy cho biết đường dẫn nào là đường dẫn tương đối, đường dẫn nào là đường dẫn tuyệt đối. Hãy giải thích lý do chọn.\r\n', '2026-01-01 09:08:56', NULL),
(17, 2, 'Bài 5: Hoạt động 1', 'Thảo luận trên diễn đàn:\r\n“Dựa vào những trải nghiệm từng có, em hãy cho cô biết: Có những điểm nào khiến em hứng thú hơn khi xem các trang web so với đọc sách?”\r\n\r\n', '2026-01-02 14:25:20', NULL),
(18, 2, 'Bài 5: Hoạt động 2_Phần 1:DIỄN ĐÀN THẢO LUẬN &quot;THỬ THÁCH TRÌNH DUYỆT&quot;', 'Chủ đề thảo luận: Học sinh chọn 1 trong 2 câu hỏi sau để trả lời trên diễn đàn:\r\n\r\nLựa chọn 1: Thử thách &quot;Thánh soi&quot; \r\nDưới đây là mã HTML của một bạn học sinh đang bị lỗi: \r\n\r\n  &lt;img srcc=&quot;avatar.jpg&quot; alt=Anh dai dien&gt;\r\n\r\n- Em hãy chỉ ra ít nhất 2 lỗi sai trong dòng mã trên.\r\n- Hãy viết lại dòng mã đúng để hiển thị ảnh avatar.jpg với văn bản thay thế là &quot;Ảnh đại diện&quot;.\r\n\r\nLựa chọn 2: Thử thách &quot;Chuyên gia phân tích&quot; \r\n- Theo em, tại sao chúng ta bắt buộc nên có thuộc tính alt khi chèn ảnh?\r\n- Hãy nêu một lý do phổ biến nhất khiến ảnh không hiển thị được trên trình duyệt (dù đã viết đúng thẻ &lt;img&gt;).\r\n\r\n', '2026-01-02 14:31:00', NULL),
(21, 2, 'Bài 6: Hoạt động 1', 'Em hãy quan sát hình sau đây (Hình 1) và thảo luận trả lời câu hỏi sau:\r\n\r\n&quot;Khi đăng ký tài khoản Facebook hoặc nhập email Google, em đang tương tác với thành phần gì trên trang web? Thành phần đó dùng để làm gì?&quot;\r\n', '2026-01-03 14:56:27', '1767452186_z7394523437082_8424f8a6eb99548271d3538b9bc20a6a.jpg'),
(22, 2, 'Bài 8: Hoạt động 1', 'Em hãy quan sát 2 hình ảnh CV sau và trả lời câu hỏi bên dưới tại diễn đàn: \r\n\r\nCâu hỏi: Nếu là nhà tuyển dụng, em chọn đọc CV ở hình nào? Vì sao?&quot;\r\n\r\n', '2026-01-03 16:06:16', NULL),
(23, 2, 'Bài 8: Hoạt động 2_Phần 2', 'Thảo luận diễn đàn:\r\nNgoài định dạng màu sắc, phông chữ, đường viền đã được học, em hãy tìm hiểu thêm về một số định dạng thuộc tính khác trong CSS và đăng trên diễn đàn\r\n', '2026-01-03 16:11:57', NULL),
(24, 2, 'Bài 10: Hoạt động 2_Phần 1', 'Em hãy truy cập diễn đàn và trả lời các câu hỏi sau:\r\nCâu hỏi 1: Bộ chọn lớp (class selector) là gì? Bộ chọn lớp dùng để làm gì trong CSS?\r\nCâu hỏi 2: Hãy viết cú pháp của bộ chọn lớp trong CSS và cách gán lớp cho phần tử HTML.\r\nCâu hỏi 3: Trong những trường hợp nào nên sử dụng bộ chọn lớp thay vì định dạng trực tiếp từng phần tử HTML?\r\nCâu hỏi 4: Một lớp CSS có thể được áp dụng cho bao nhiêu phần tử HTML? Vì sao điều này giúp thiết kế trang web hiệu quả hơn?\r\nCâu hỏi 5: Hãy nêu một ví dụ minh họa cho việc sử dụng bộ chọn lớp để định dạng nhiều phần tử HTML giống nhau (trình bày bằng mã HTML và CSS đơn giản).\r\n\r\n', '2026-01-04 05:32:17', NULL),
(25, 2, 'Bài 10: Hoạt động 2_Phần 2', 'Em hãy truy cập vào diễn đàn và trả lời các câu hỏi sau:\r\nCâu 1. Bộ chọn định danh (id selector) là gì? Bộ chọn định danh dùng để làm gì trong CSS?\r\nCâu 2. Hãy nêu cú pháp của bộ chọn định danh trong CSS và cách gán id cho phần tử HTML.\r\nCâu 3. Trong những trường hợp nào nên sử dụng bộ chọn định danh thay vì bộ chọn lớp?\r\nCâu 4. Trình bày quy tắc sử dụng id trong HTML. Vì sao mỗi id chỉ được gán cho một phần tử?\r\nCâu 5. Hãy nêu một ví dụ minh họa cho việc sử dụng bộ chọn định danh để định dạng một phần tử HTML cụ thể (trình bày bằng mã HTML và CSS đơn giản).\r\n', '2026-01-04 05:41:04', NULL),
(26, 2, 'Bài 11: Hoạt động 1', 'Truy cập vào link của 2 trang web sau:\r\nTrang web\r\n\r\nBộ Giáo dục và Đào tạo\r\nhttps://moet.gov.vn/\r\n\r\nBáo điện tử Tiền Phong \r\nhttps://tienphong.vn/\r\n\r\nThảo luận diễn đàn. \r\nEm hãy cho biết, bố cục của hai trang web này có giống nhau không?\r\nNếu giống, hãy nêu ít nhất 2 điểm giống nhau.\r\nNếu khác, hãy nêu ít nhất 2 điểm khác nhau.\r\n\r\n', '2026-01-04 05:57:34', NULL),
(27, 2, 'Bài 11: Hoạt động 2_Phần 1', 'Thảo luận diễn đàn:\r\nQuan sát hình 1, em biết được gì về cấu trúc logic của mô hình hộp trong trình bày phần tử HTML gồm những phần nào?\r\n', '2026-01-04 06:02:18', NULL),
(28, 2, 'Bài 1: Hoạt động 1 (CS)', 'Cho hình 1 và 3 nhãn phân loại là “vuông”, “tròn”, “tam giác”. Cần dán nhãn phân loại cho từng đối tượng trong hình 1. \r\n\r\nEm hãy trả lời các câu hỏi sau:\r\nNếu con người thực hiện thì nhiệm vụ trên là dễ hay khó\r\nTheo em, máy tính có thể tự động thực hiện nhiệm vụ trên thay con người hay không? Lập trình để máy tính làm công việc này là dễ hay khó.\r\n', '2026-01-05 11:35:29', NULL),
(29, 2, 'Bài 1: Hoạt động 2_Phần 1 (CS)', 'Thảo luận diễn đàn trả lời các câu sau:\r\n\r\n- Thuật toán học máy hoạt động như thế nào?\r\n- Các mô hình học máy được tạo ra như thế nào?\r\n', '2026-01-05 11:40:00', NULL),
(30, 2, 'Bài 1: Hoạt động 2_Phần 2 (CS)', 'Thảo luận diễn đàn: \r\n\r\n- Tập dữ liệu huấn luyện học có giám sát là gì?\r\n- Học có giám sát được thực hiện như thế nào?\r\n- Học có giám sát được dùng để giải quyết những bài toán nào?\r\n', '2026-01-05 11:47:25', NULL),
(31, 2, 'Bài 1: Hoạt động 2_Phần 3 (CS)', 'Thảo luận diễn đàn:\r\n\r\n- Cho một số quả, theo em máy tính có thể trả lời được có máy loại quả hay không? Lý do vì sao em lại suy nghĩ như vậy.\r\n', '2026-01-05 11:52:47', NULL),
(32, 2, 'Bài 1: Hoạt động 2_Phần 4 (CS)', 'Thảo luận diễn đàn:\r\n\r\n- Dựa vào sự hiểu biết của mình, em hãy nêu một số ứng dụng của học máy?\r\n', '2026-01-05 11:55:37', NULL),
(33, 2, 'Bài 2: Hoạt động 2_Phần 1 (CS)', 'Thảo luận diễn đàn:\r\nKhi tìm kiếm với cụm từ khoá “Các lĩnh vực nghiên cứu của khoa học dữ liệu” thì có thể nhận được kết quả gồm có: Khai phá dữ , thống kê, học máy, phân tích,... Em hãy nêu tên một lĩnh vực mà em hiểu biết nhất và cho biết lĩnh vực này nghiên cứu gì?\r\n', '2026-01-07 11:14:43', NULL),
(34, 2, 'Bài 2: Hoạt động 2_Phần 2 (CS)', 'Dựa vào tài liệu đã đọc về một số thành tựu của khoa học dữ liệu. Em hãy theo luận trên diễn đàn các câu hỏi sau:\r\n    Câu 1: Em hãy cho biết thành tựu nào của khoa học dữ liệu mà em ấn tượng nhất? Vì sao em ấn tượng với thành tựu đó?\r\n    Câu 2:  Em hãy cho biết một thành tựu khác của khoa học dữ liệu mà em biết.\r\n', '2026-01-07 11:23:35', NULL),
(35, 2, 'Bài 3: Hoạt động 1 (CS)', 'Thảo luận diễn đàn:\r\n\r\nHiện nay người ta nói nhiều đến “Dữ liệu lớn”. Em hãy lấy một ví dụ về dữ liệu lớn mà em biết.\r\n', '2026-01-07 11:36:09', NULL),
(36, 2, 'Bài 3: Hoạt động 2_Phần 2 (CS)', 'Truy cập vào diễn đàn, em hãy thảo luận vấn đề sau:\r\n\r\nTrong môn toán nội dung “Thống kê và xác suất” có phần “Phân tích và xử lý dữ liệu” với yêu cầu vận dụng các kiến thức để giải quyết một số bài toán thực tế. Em hãy nêu một số vấn đề thực tế có thể giải quyết bằng phân tích và xử lý dữ liệu thống kê, theo em đây có phải là phát hiện tri thức không? \r\n', '2026-01-08 07:18:36', NULL),
(37, 2, 'Bài 3: Hoạt động 4 (CS)', 'Truy cập vào diễn đàn và trả lời câu sau:\r\n\r\nEm hãy nêu một ví dụ khác các ví dụ đã nêu trong bài cho một trong 5 chữ V về đặc trưng của dữ liệu lớn \r\n', '2026-01-08 07:35:05', NULL),
(38, 2, 'Bài 5: Hoạt động 2_Phần 2 (CS)', 'Thảo luận diễn đàn: \r\n\r\nHãy kể một số phần mềm mô phỏng mà em từng sử dụng trong học tập cùng với kiến thức kỹ năng mà em thu nhận được từ đó.\r\n', '2026-01-08 08:00:56', NULL),
(39, 2, 'Bài 6: Hoạt động 1 (CS)', 'Thảo luận diễn đàn:\r\n\r\nKhi nó nói đến phần mềm Geogebra, em biết được gì về phần mềm này?\r\n', '2026-01-08 08:22:59', NULL),
(40, 2, 'Bài 4: Hoạt động 3 (CS)', 'Chia sẻ diễn đàn:\r\nEm hãy viết 3–5 dòng nêu trải nghiệm của bản thân khi sử dụng Excel (Forecast Worksheet) để trích rút thông tin và dự báo dữ liệu:\r\n– Điều em làm được\r\n– Khó khăn gặp phải (nếu có)\r\n– Điều em rút ra được từ hoạt động\r\n', '2026-01-12 10:46:28', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `pdf_link` varchar(255) DEFAULT NULL,
  `colab_link` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `track` varchar(10) DEFAULT 'ICT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `description`, `video_link`, `pdf_link`, `colab_link`, `created_by`, `created_at`, `track`) VALUES
(4, 'Bài 1: HTML VÀ CẤU TRÚC TRANG WEB', 'Nêu được khái niệm và chức năng của ngôn ngữ HTML \r\n\r\nHiểu và giải thích được cấu trúc của một trang web và file HTML\r\n\r\nNêu được các phần mềm soạn thảo ngôn ngữ HTML, các ưu nhược điểm của từng phần mềm, từ đó lựa chọn được phần mềm soạn thảo phù hợp với nhiệm vụ và điều kiện thực tế \r\n', '', NULL, '', NULL, '2025-12-18 14:39:50', 'ICT'),
(6, 'Bài 2: ĐỊNH DẠNG VĂN BẢN', 'Hiểu được ý nghĩa của các thuộc tính thẻ.\r\nBiết được cấu trúc các thẻ định dạng văn bản.\r\nBiết được cấu trúc các thẻ định dạng phông chữ.\r\nSử dụng được các thẻ HTML định dạng được tiêu đề, đoạn văn, phông chữ và kiểu chữ cho văn bản.\r\n       ', '', NULL, '', NULL, '2025-12-21 19:11:24', 'ICT'),
(7, 'Bài 3: TẠO DANH SÁCH, BẢNG', 'Hiểu được ý nghĩa của danh sách và bảng trong trình bày văn bản.\r\nBiết được cấu trúc các thẻ tạo danh sách và tạo bảng.\r\nSử dụng được các thẻ tạo được danh sách và bảng.\r\n', '', NULL, '', NULL, '2026-01-01 14:50:55', 'ICT'),
(8, 'BàI 4: TẠO LIÊN KẾT', 'Biết được siêu văn bản và các loại đường dẫn (URL) \r\nSử dụng thẻ HTML để tạo được các loại liên kết\r\nVận dụng sử dụng HTML tạo liên kết \r\n', '', NULL, '', NULL, '2026-01-01 15:34:13', 'ICT'),
(9, 'Bài 5: CHÈN TẬP TIN ĐA PHƯƠNG TIỆN VÀ KHUNG NỘI TUYẾN VÀO TRANG WEB', 'Sử dụng được các thẻ HTML để thêm ảnh, video và âm thanh và khung nội tuyến vào trang web.\r\nVận dụng chèn tệp đa phương tiện và khung nội tuyến\r\n', '', NULL, '', NULL, '2026-01-02 21:21:26', 'ICT'),
(11, 'Bài 6: TẠO BIỂU MẪU', 'Trình bày được khái niệm biểu mẫu.\r\nNhận biết được một số điều khiển hỗ trợ nhập dữ liệu trên trang web.\r\nNêu được một số quy định trong thiết kế biểu mẫu.\r\n', '', NULL, '', NULL, '2026-01-02 22:02:38', 'ICT'),
(12, 'Bài 7: THỰC HÀNH TẠO BIỂU MẪU', 'Tạo được biểu mẫu phù hợp với yêu cầu nhập dữ liệu\r\nBiết đề xuất  và phân tích được một số giải pháp thiết kế giao diện hợp lý, thẩm mỹ và thuận tiện cho người dùng.\r\nChủ động tìm hiểu thêm kiến thứ\r\n', '', NULL, '', NULL, '2026-01-03 22:43:48', 'ICT'),
(14, 'Bài 8: LÀM QUEN VỚI CSS', 'Hiểu được mục đích sử dụng CSS.\r\nKhai báo được bộ chọn phần tử và áp dụng CSS.\r\nTrình bày được các thuộc tính định dạng về màu sắc, phông chữ, đường viền trong CSS.\r\n', '', NULL, '', NULL, '2026-01-03 22:53:00', 'ICT'),
(15, 'Bài 9: THỰC HÀNH ĐỊNH DẠNG MỘT SỐ CSS', 'Thực hiện được thao tác khai báo định dạng CSS trong file .css.\r\nSử dụng được bảng định dạng đã được khai báo tại file .css.\r\nSử dụng được các thuộc tính cơ bản như font chữ, kích cỡ chữ, màu sắc, tiêu đề.\r\n', '', NULL, '', NULL, '2026-01-03 23:24:47', 'ICT'),
(16, 'Bài 10: BỘ CHỌN LỚP, BỘ CHỌN ĐỊNH DANH', 'Nêu được cú pháp của bộ chọn lớp. \r\nNêu được cú pháp bộ chọn định danh. \r\nSử dụng được bộ chọn lớp và bộ chọn định danh. \r\n', '', NULL, '', NULL, '2026-01-04 12:24:01', 'ICT'),
(17, 'Bài 11: MÔ HÌNH HỘP VÀ BỐ CỤC TRANG WEB ', 'Mô tả được mô hình hộp trong trình bày phần tử HTML. \r\nBiết được cách hiển thị phần tử theo khối, theo dòng. \r\nNhận diện được các thành phần cơ bản trong bố cục trang web. \r\n', '', NULL, '', NULL, '2026-01-04 12:50:31', 'ICT'),
(18, 'BÀI 12: THỰC HÀNH TỔNG HỢP THIẾT KẾ TRANG WEB', 'Vận dụng tổng hợp các kiến thức đã học về các thẻ HTML và định dạng văn bản với CSS để xây dựng và hoàn thiện một trang web', '', NULL, '', NULL, '2026-01-04 13:35:39', 'ICT'),
(19, 'Bài 1: (CS) GIỚI THIỆU VỀ HỌC MÁY ', 'Hiểu khái niệm Học máy \r\nPhân biệt được dữ liệu có nhãn/không nhãn; mô hình học có giám sát/không giám sát.\r\nNêu được vai trò và ứng dụng thực tế của Học máy (lọc thư rác, dịch thuật, chẩn đoán bệnh.\r\n', '', NULL, '', NULL, '2026-01-05 18:30:05', 'CS'),
(20, 'Bài 2: (CS) GIỚI THIỆU VỀ KHOA HỌC DỮ LIỆU ', 'Giải thích được khái niệm Khoa học dữ liệu.\r\nHiểu được sơ lược mục tiêu của Khoa học dữ liệu.\r\nNêu được một số thành tựu của Khoa học dữ liệu.\r\n', '', NULL, '', NULL, '2026-01-07 18:07:29', 'CS'),
(21, 'Bài 3: (CS) GIỚI THIỆU VỀ KHOA HỌC DỮ LIỆU (tiếp theo)', 'Biết được khái niệm.\r\nHiểu được các đặc trưng của dữ liệu lớn.\r\nHiểu được vai trò của máy tính.\r\nBiết được tính ưu việt trong việc sử dụng thuật toán hiệu quả để xử lý dữ liệu.\r\n', '', NULL, '', NULL, '2026-01-07 18:29:17', 'CS'),
(22, 'Bài 4: (CS) THỰC HÀNH PHÂN TÍCH DỮ LIỆU ', 'Nêu được trải nghiệm của bản thân trong việc trích rút thông tin và tri thức hữu ích từ dữ liệu đã có.\r\nThực hiện rút trích thông tin và tri thức hữu ích từ bộ dữ liệu bằng phần mềm bảng tính Excel.\r\n', '', NULL, '', NULL, '2026-01-08 14:39:34', 'CS'),
(23, 'Bài 5: (CS) MÔ PHỎNG ĐƯỢC SỬ DỤNG TRONG NHIỀU LĨNH VỰC', 'Chỉ ra được khái niệm và những lợi ích của mô phỏng\r\nGiới thiệu được một số lĩnh vực trong đời sống có sử dụng kĩ thuật mô phỏng cũng như một số vấn đề thực tế có thể cần dùng kĩ thuật mô phỏng để giải quyết\r\n', '', NULL, '', NULL, '2026-01-08 14:49:53', 'CS'),
(24, 'Bài 6: (CS) THỰC HÀNH VỀ MÔ PHỎNG ', 'Sử dụng được phần mềm GeoGebra.\r\nBiết được lợi ích của phần mềm này.\r\n', '', NULL, '', NULL, '2026-01-08 15:20:37', 'CS');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` text DEFAULT NULL,
  `option_b` text DEFAULT NULL,
  `option_c` text DEFAULT NULL,
  `option_d` text DEFAULT NULL,
  `correct_option` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT 'mcq',
  `matching_pairs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `type`, `matching_pairs`) VALUES
(3, 2, ' HTML được viết tắt của từ nào?\r\n', 'Hyperlinks and Text Marking Language', 'Hyper Text Markup Language', 'Home Tool Markup Language', 'High-level Text Marking Language', 'b', 'mcq', NULL),
(4, 2, ' HTML dùng để làm gì?', 'Lập trình game', 'Tạo cấu trúc và nội dung trang web', 'Thiết kế đồ họa', 'Chạy ứng dụng điện thoại', 'b', 'mcq', NULL),
(5, 2, '“Thẻ HTML” là gì?\r\n', 'Một đoạn văn bản', 'Một hình ảnh trên trang web', 'Một ký hiệu đánh dấu nội dung trong HTML', 'Một chương trình phần mềm', 'c', 'mcq', NULL),
(6, 2, 'Cấu trúc đầy đủ của một thẻ đôi trong HTML là:\r\n', '<tag> … </tag>', '<tag> … <tag/>', '<tag> … <tag>', '<tag/> … <tag>', 'a', 'mcq', NULL),
(7, 2, ' HTML có bao nhiêu loại thẻ chính?', '1', '2', '3', '4', 'b', 'mcq', NULL),
(8, 2, ' Thẻ đơn (self-closing tag) là thẻ như thế nào?\r\n', 'Có thẻ mở và thẻ đóng', 'Không có thẻ đóng', 'Có nhiều nội dung con', 'Không chứa văn bản', 'b', 'mcq', NULL),
(10, 2, 'Phần tử HTML (HTML Element) gồm những gì?\r\n', 'Chỉ thẻ mở', 'Thẻ mở + nội dung + thẻ đóng', 'Chỉ thẻ đóng', 'Văn bản bất kỳ', 'b', 'mcq', NULL),
(11, 2, ' Nội dung nằm giữa thẻ mở và thẻ đóng trong HTML được gọi là gì?\r\n', 'Thuộc tính (Attribute)', 'Phần tử HTML', 'Nội dung của phần tử', 'Thẻ đơn', 'c', 'mcq', NULL),
(12, 2, 'Ví dụ nào sau đây thể hiện đúng một phần tử HTML hoàn chỉnh?\r\n', '<p>Xin chào<p', '<p>Xin chào</p>', '<p/>Xin chào</p>', '<p>Xin chào<p/>', 'b', 'mcq', NULL),
(14, 2, 'Ví dụ nào sau đây là thẻ đơn?', '<p>', '<h1>', '<img/>', '<div>', 'c', 'mcq', NULL),
(15, 3, 'Trình soạn thảo HTML (HTML Editor) là gì?\r\n', 'Phần mềm dùng để thiết kế ảnh', 'Phần mềm dùng để viết và chỉnh sửa mã HTML', 'Phần mềm để chạy trang web như trình duyệt', 'Phần mềm để viết tài liệu văn bản thông thường', 'b', 'mcq', NULL),
(16, 3, 'Phần mềm nào dưới đây KHÔNG phải là trình soạn thảo mã nguồn?\r\n', 'Notepad++', 'VS Code', 'Microsoft Paint', 'Sublime Text', 'c', 'mcq', NULL),
(17, 3, 'Ưu điểm lớn nhất của VS Code là gì?\r\n', 'Rất nặng, khó sử dụng', 'Hỗ trợ nhiều extension và tự động hoàn tất code', 'Chỉ chạy trên Windows', 'Không cho phép xem web trực tiếp', 'b', 'mcq', NULL),
(18, 3, 'Notepad++ có đặc điểm gì?', 'Nặng và phức tạp', 'Nhẹ, miễn phí, hỗ trợ tô màu cú pháp', 'Chỉ dùng được trên Mac', 'Không hỗ trợ viết HTML', 'b', 'mcq', NULL),
(19, 3, 'Điểm hạn chế của Sublime Text là gì?', 'Không có bản miễn phí', 'Bản miễn phí thường xuyên hiện thông báo mua bản quyền', 'Rất khó sử dụng', 'Không chạy được trên Windows', 'b', 'mcq', NULL),
(20, 3, 'Phần mềm nào có tính năng Live Server giúp xem trang web ngay khi lưu?', 'Notepad', 'Paint', 'VS Code', 'Word', 'c', 'mcq', NULL),
(21, 3, 'Brackets có ưu điểm nổi bật nào?\r\n', 'Tốc độ chạy chậm', 'Giao diện rối, khó dùng', 'Tích hợp tính năng Live Preview xem web trực tiếp', 'Không hỗ trợ HTML', 'c', 'mcq', NULL),
(22, 3, 'Phần mềm nào phù hợp nhất cho học sinh mới học HTML?\r\n', 'VS Code', 'Photoshop', 'Word', 'AutoCAD', 'a', 'mcq', NULL),
(23, 3, 'Chức năng tô màu cú pháp (syntax highlighting) trong trình soạn thảo HTML có tác dụng gì?', 'Làm trang web chạy nhanh hơn', 'Giúp phân biệt các thành phần mã HTML bằng màu sắc, dễ đọc và ít sai sót', 'Tự động đăng trang web lên Internet', 'Chỉ dùng để trang trí giao diện phần mềm', 'b', 'mcq', NULL),
(24, 3, 'Vì sao không nên dùng Word để soạn thảo mã HTML?', 'Vì Word không lưu được file', 'Vì Word không hỗ trợ định dạng chữ', 'Vì Word tự chèn định dạng, không phù hợp để viết mã nguồn HTML', 'Vì Word chỉ dùng cho lập trình nâng cao', 'c', 'mcq', NULL),
(25, 4, 'Thẻ nào dùng để tạo danh sách có thứ tự?\r\n', '<ul>', '<ol>', '<dl>', '<li>', 'b', 'mcq', NULL),
(26, 4, 'Thẻ nào dùng để tạo một mục trong danh sách?\r\n', '<dt>', ' <dd>', '<li>', '<item>', 'c', 'mcq', NULL),
(27, 4, 'Danh sách mô tả sử dụng bộ thẻ nào?\r\n', '<ol>, <li>', '<ul>, <li>', '<dl>, <dt>, <dd>', '<list>, <item>', 'c', 'mcq', NULL),
(28, 4, 'Thẻ nào sai trong đoạn mã sau?\r\n<ol>\r\n    <item>Mục 1</item>\r\n</ol>\r\n\r\n', '<ol>', '<item>', '</ol>', ' Không có thẻ sai', 'b', 'mcq', NULL),
(29, 4, 'Thẻ nào KHÔNG thuộc danh sách mô tả?\r\n', '<dl>', '<dt>', '<dd>', '<li>', 'd', 'mcq', NULL),
(30, 4, 'Đâu là thứ tự đúng của cấu trúc danh sách có thứ tự?', '<ol> → <li> → </li> → </ol>', ' <ol> → </ol> → <li> → </li>', '<li> → <ol> → </li> → </ol>', ' <ol> → <li> → </ol> → </li>', 'a', 'mcq', NULL),
(31, 4, 'Thứ tự đúng của danh sách mô tả là gì?\r\n', '<dl> → <dt> → <dd> → </dl>', '<dl> → <dd> → <dt> → </dl>', '<dt> → <dd> → <dl> → </dl>', '<dl> → <dt> → </dl> → <dd>', 'a', 'mcq', NULL),
(32, 4, 'Thẻ nào được dùng để tạo một mục trong danh sách không có thứ tự (<ul>)?\r\n', '<dt>', '<dd>', '<li>', '<item>', 'c', 'mcq', NULL),
(33, 4, 'Trong danh sách mô tả, thẻ nào dùng để khai báo thuật ngữ?\r\n', '<dd>', '<li>', '<term>', '<dt>', 'd', 'mcq', NULL),
(34, 4, 'Chọn lỗi sai trong đoạn mã sau:\r\n<ul>\r\n    <li>Ăn sáng\r\n    <li>Đi học</li>\r\n</ul>\r\n', 'Thiếu thẻ đóng </li> cho mục đầu tiên', 'Không được dùng <ul> trong danh sách', 'Thiếu thẻ đóng </ul>', 'Không có lỗi', 'a', 'mcq', NULL),
(40, 5, 'Thẻ nào tạo một hàng trong bảng?\r\n', '<tr>', '</tr>', '<row>', '<line>', 'a', 'mcq', NULL),
(41, 5, 'Thẻ nào dùng để tạo ô dữ liệu?\r\n', '<td>', '<th>', '</td>', '<cell>', 'a', 'mcq', NULL),
(42, 5, 'Thẻ nào dùng cho tiêu đề của bảng?\r\n', '<td>', '<th>', '<head>', '<>', 'b', 'mcq', NULL),
(43, 5, ' (Tìm lỗi trong đoạn mã)\r\nĐoạn mã sau sai ở đâu?\r\n<table>\r\n    <tr>\r\n        <td>Tên</td>\r\n        <td>Lớp</td>\r\n    </tr>\r\n    <tr>\r\n        <td>Anh</td>\r\n</table>\r\n', 'Thiếu thẻ </table>', 'Thiếu một thẻ </tr>', 'Thiếu thẻ <th>', 'Sai toàn bộ', 'b', 'mcq', NULL),
(44, 5, 'Trong bảng, số lượng <td> trong mỗi hàng nên thế nào?\r\n', 'Có thể khác nhau tùy thích', 'Nên bằng nhau để bảng không lệch', 'Nên nhiều hơn ở hàng đầu', 'Không có quy tắc nào', 'b', 'mcq', NULL),
(45, 5, 'Đoạn bảng nào đúng?\r\n\r\n', '<table> <td>An</td> <td>11A1</td> </table>', '<table> <tr><td>An</td><td>11A1</td></tr> </table>', '<table> <tr><tr><td>An</td></tr></tr> </table>', 'Tất cả đều sai', 'b', 'mcq', NULL),
(47, 5, 'Hoàn thành dòng tiêu đề bảng sau:\r\n<tr>\r\n    <th>Tên</th>\r\n    ______\r\n</tr>\r\n', '<td>Lớp</td>', ' <head>Lớp</head>', '<th>Lớp</th>', '<title>Lớp</title>', 'c', 'mcq', NULL),
(48, 6, 'Siêu văn bản (Hypertext) khác văn bản thông thường ở đặc điểm quan trọng nào? \r\n', ' Có chứa các hình ảnh minh họa. ', 'Chứa các liên kết (hyperlink) trỏ đến tài liệu khác. ', 'Được viết bằng nhiều phông chữ khác nhau. ', 'Chỉ có thể xem được trên điện thoại.', 'b', 'mcq', NULL),
(49, 6, 'Thành phần nào cho phép người dùng di chuyển từ trang web này sang trang web khác? \r\n', 'Thanh cuộn. ', 'Tiêu đề trang web. ', 'Đường dẫn liên kết. ', 'Tên của tệp tin.', 'c', 'mcq', NULL),
(50, 6, 'Đường dẫn tuyệt đối (Absolute Path) là gì? \r\n', ' Là đường dẫn tính từ thư mục hiện hành. ', 'Là đường dẫn chỉ chứa tên tệp tin. ', 'Là địa chỉ đầy đủ bao gồm cả giao thức (http/https) hoặc ổ đĩa gốc. ', 'Là đường dẫn ngắn gọn nhất.', 'c', 'mcq', NULL),
(51, 6, 'Đường dẫn tương đối (Relative Path) được xác định dựa trên: \r\n', 'Tên miền của trang web. ', ' Vị trí của tệp tin hiện tại so với tệp tin đích. ', 'Tốc độ đường truyền internet. ', 'Ngày tạo tệp tin.', 'b', 'mcq', NULL),
(52, 6, 'Trong đường dẫn tương đối, ký hiệu \"../\" dùng để làm gì?', 'Truy cập vào thư mục con. ', 'Quay trở lại thư mục cấp trên (thư mục cha). ', 'Xóa tệp tin hiện tại. ', ' Liên kết đến trang chủ Google.', 'b', 'mcq', NULL),
(53, 6, 'Đâu là ví dụ của một đường dẫn tuyệt đối? \r\n', ' images/logo.png ', ' index.html', 'https://www.google.com/index.html ', '../style.css', 'c', 'mcq', NULL),
(54, 6, 'Tại sao khi thiết kế website nội bộ, người ta ưu tiên dùng đường dẫn tương đối? \r\n', 'Vì nó chạy nhanh hơn.', 'Để website vẫn hoạt động đúng khi di chuyển toàn bộ thư mục sang máy tính khác.', ' Vì nó bảo mật hơn.', 'Vì trình duyệt không cho phép dùng đường dẫn tuyệt đối.', 'b', 'mcq', NULL),
(55, 6, 'Nếu tệp \"baihoc.html\" và ảnh \"pic.png\" nằm cùng trong một thư mục, đường dẫn tương đối để chèn ảnh là: \r\n', '../pic.png', ' pic.png ', '/pic.png', ':/pic.png', 'b', 'mcq', NULL),
(56, 6, 'Hệ thống siêu văn bản khổng lồ lớn nhất hiện nay là gì? \r\n', 'Một ổ đĩa cứng máy tính.', 'Mạng lưới World Wide Web (WWW). ', 'Một bộ sách giáo khoa. ', ' Một mạng nội bộ văn phòng.', 'b', 'mcq', NULL),
(57, 6, 'Phát biểu nào sau đây SAI về siêu văn bản? ', 'Siêu văn bản chỉ chứa văn bản thuần túy, không chứa ảnh hay video. ', 'Siêu văn bản cho phép người dùng đọc nội dung không tuần tự. ', 'Siêu văn bản là nền tảng tạo nên các trang web.', 'Siêu văn bản chứa các liên kết để kết nối các trang lại với nhau.', 'a', 'mcq', NULL),
(58, 7, 'Thẻ nào sau đây được sử dụng để tạo một liên kết trong HTML?\r\n', '<a>', '<link>', '<href>', '<connect>', 'a', 'mcq', NULL),
(59, 7, 'Thuộc tính nào của thẻ <a> dùng để chỉ định địa chỉ (URL) của trang web cần liên kết tới?\r\n', 'src', 'href', 'link', 'alt', 'b', 'mcq', NULL),
(60, 7, 'Trong đoạn mã <a href=\"https://google.com\">Tìm kiếm</a>, phần văn bản \"Tìm kiếm\" được gọi là gì?\r\n', 'Văn bản hiển thị liên kết (Anchor text)', 'Địa chỉ đích', 'Thuộc tính bổ trợ', 'Tiêu đề trang web', 'a', 'mcq', NULL),
(61, 7, 'Để liên kết mở ra trong một thẻ (tab) mới, ta sử dụng thuộc tính target với giá trị nào?', '_self', '_top', '_blank', '_parent', 'c', 'mcq', NULL),
(62, 7, 'Cấu trúc đúng để tạo một liên kết đến trang web \"https://www.google.com/search?q=dantri.com.vn\" là:\r\n', '<a link=\"https://dantri.com.vn\">Báo Dân trí</a>', '<a href=\"https://dantri.com.vn\">Báo Dân trí</a>', '<href=\"https://dantri.com.vn\">Báo Dân trí</a>', '<a url=\"https://dantri.com.vn\">Báo Dân trí</a>', 'b', 'mcq', NULL),
(63, 7, 'Liên kết ngoài (External Link) là gì?\r\n', 'Liên kết dẫn đến một vị trí khác trong cùng một trang web.', 'Liên kết dẫn đến một trang web thuộc tên miền khác.', 'Liên kết dẫn đến một tệp tin hình ảnh trong máy tính.', 'Liên kết dùng để định dạng màu sắc cho văn bản.', 'b', 'mcq', NULL),
(64, 7, 'Khi di chuyển con trỏ chuột vào một liên kết trên trình duyệt, con trỏ thường chuyển thành hình gì?\r\n', 'Hình mũi tên', 'Hình vòng tròn quay', 'Hình bàn tay có ngón trỏ chỉ lên', 'Hình dấu cộng', 'c', 'mcq', NULL),
(65, 7, 'Nếu một thẻ <a> không có thuộc tính href, điều gì sẽ xảy ra?', 'Trình duyệt sẽ báo lỗi lập trình.', 'Văn bản vẫn hiển thị nhưng không thể nhấn vào để chuyển trang.', 'Trang web sẽ tự động đóng lại.', 'Liên kết sẽ dẫn đến trang chủ của Google.', 'b', 'mcq', NULL),
(66, 7, 'Thuộc tính title trong thẻ <a> có tác dụng gì?\r\n', 'Quy định màu sắc của liên kết.', 'Hiển thị thông tin bổ sung khi di chuột qua liên kết.', 'Thay đổi phông chữ của đoạn văn bản liên kết.', 'Bắt buộc người dùng phải nhập mật khẩu.', 'b', 'mcq', NULL),
(67, 7, 'Một liên kết có thể được tạo cho đối tượng nào sau đây?\r\n', 'Chỉ văn bản.', 'Chỉ hình ảnh.', 'Cả văn bản và hình ảnh.', 'Chỉ các đoạn video.', 'c', 'mcq', NULL),
(68, 8, 'Thẻ nào sau đây được sử dụng để chèn hình ảnh vào trang web HTML? \r\n', '<image> ', '<img>', '<picture>', ' <src>', 'b', 'mcq', NULL),
(69, 8, 'Thẻ <img> thuộc loại thẻ nào? ', 'Thẻ cặp (có thẻ mở và thẻ đóng). ', 'Thẻ chứa (bao bọc nội dung văn bản). ', 'Thẻ đơn (không cần thẻ đóng). ', 'Thẻ định dạng danh sách.', 'c', 'mcq', NULL),
(70, 8, 'Thuộc tính nào là BẮT BUỘC phải có để chỉ định đường dẫn đến tệp ảnh?', 'alt', 'link', 'href ', 'src', 'd', 'mcq', NULL),
(71, 8, 'Thuộc tính alt trong thẻ <img> có ý nghĩa gì? ', 'Thay đổi kích thước ảnh.', 'Tạo đường viền cho ảnh. ', ' Cung cấp văn bản thay thế nếu ảnh không hiển thị được. ', 'Căn lề cho hình ảnh trên trang web.', 'c', 'mcq', NULL),
(72, 8, 'Trong HTML5, cách viết nào sau đây là chuẩn cú pháp để chèn ảnh? \r\n', '<img src=', '<img href=', '<img source=', '<img link=', 'a', 'mcq', NULL),
(73, 8, 'Nếu tệp ảnh hoa.jpg nằm trong thư mục images, và tệp HTML nằm ở thư mục gốc, đường dẫn src nào sau đây là đúng? \r\n', 'src=\"hoa.jpg\"', 'src=\"images/hoa.jpg\" ', 'src=\"/hoa.jpg\" ', 'src=\"images\\hoa.jpg\"', 'b', 'mcq', NULL),
(74, 8, 'Để điều chỉnh chiều rộng của ảnh là 300 pixel trực tiếp trong thẻ <img>, bạn sử dụng thuộc tính nào? \r\n', 'width=\"300\"', 'height=\"300\" ', 'size=\"300\" ', 'length=\"300\"', 'a', 'mcq', NULL),
(75, 8, ' Khi bạn chỉ thiết lập một thuộc tính width (chiều rộng) cho ảnh, trình duyệt sẽ xử lý chiều cao (height) như thế nào? \r\n', 'Để chiều cao bằng 0. ', 'Giữ nguyên chiều cao gốc khiến ảnh bị méo. ', 'Tự động điều chỉnh theo tỉ lệ của ảnh gốc để không bị méo.', ' Báo lỗi và không hiển thị ảnh.', 'c', 'mcq', NULL),
(76, 8, 'Các định dạng tệp ảnh nào sau đây thường được sử dụng phổ biến nhất trên trang web? \r\n', '.jpg, .png, .gif', '.exe, .doc, .mp3 ', '.txt, .pdf, .zip ', '.html, .css, .js', 'a', 'mcq', NULL),
(77, 9, 'Để chèn video hoặc âm thanh vào trang web, ta sử dụng những thẻ HTML nào? (Nhớ)\r\n', '<video> và <audio>', ' <img> và <source>', ' <embed> và <object>', '<media> và <clip>', 'a', 'mcq', NULL),
(78, 9, 'Định dạng tệp video phổ biến nhất được hỗ trợ bởi hầu hết trình duyệt là gì? (Nhớ)', 'avi và mov ', 'flv và wmv', 'mp4 và webm', ' mkv và ts', 'c', 'mcq', NULL),
(79, 9, 'Theo nội dung, định dạng tệp âm thanh phổ biến được hỗ trợ bởi hầu hết trình duyệt là gì? \r\n', 'mp3, aac và flac', ' mp3, wav và ogg', 'wma, midi và alac', 'aiff, ogg và wav', 'b', 'mcq', NULL),
(80, 9, 'Thuộc tính nào của thẻ <video> là thuộc tính boolean, không cần có giá trị, dùng để hiển thị các thanh điều khiển như nút phát/tạm dừng, điều khiển âm lượng...? \r\n', 'autoplay', 'width', 'controls', 'poster', 'c', 'mcq', NULL),
(81, 9, 'Thuộc tính autoplay có tác dụng gì khi chèn video/âm thanh?\r\n', 'Giúp trình duyệt tự động tìm và hiển thị tệp tin ở định dạng khác nhau nếu tệp gốc không chạy được.', 'Buộc trình duyệt hiển thị một ảnh đại diện trước khi chạy video.', 'Khiến trình duyệt tự động phát ngay video/âm thanh ngay khi hiển thị.', 'Thiết lập chiều rộng và chiều cao cho khung hiển thị video.', 'c', 'mcq', NULL),
(82, 9, 'Thuộc tính nào có thể bị một số trình duyệt như Google Chrome bỏ qua (không tự động phát) nếu không có thuộc tính muted đi kèm? ', 'controls', 'poster', 'width', 'autoplay', 'd', 'mcq', NULL),
(83, 9, 'Thuộc tính nào của thẻ <video> dùng để cung cấp đường dẫn đến tệp ảnh, dùng để hiển thị khi video chưa chạy?', 'src', 'poster	', ' image', 'thumbnail', 'b', 'mcq', NULL),
(84, 9, ' Thuộc tính nào sau đây không được thẻ <audio> hỗ trợ, nhưng thẻ\r\n<video> thì có? \r\n\r\n', 'controls', 'autoplay', 'poster', 'src', 'c', 'mcq', NULL),
(85, 9, 'Trong trường hợp có nhiều video hoặc nhiều tệp âm thanh tương ứng với các định dạng khác nhau, ta sử dụng thẻ nào để chỉ định các loại định dạng khác nhau? ', '<img>', '<p>', '<link>', ' <source>', 'd', 'mcq', NULL),
(86, 9, ' Thuộc tính cơ bản nào sau đây không được đề cập là thuộc tính cơ bản của thẻ <video> ? \r\n', 'src', 'width', 'height	', 'alt', 'd', 'mcq', NULL),
(87, 10, 'Khái niệm cơ bản của thẻ <iframe> là gì? \r\n', 'Khung hiển thị nội dung của cùng một trang web.', 'Khung nhìn chưa tài nguyên web khác trong web hiện tại (inline frame).', 'Công cụ tạo siêu liên kết giữa các trang web.', 'Thẻ dùng để tạo bảng và chia cột cho trang web.', 'b', 'mcq', NULL),
(88, 10, 'Tên viết tắt của thẻ <iframe> là gì? \r\n', 'Inside Frame', ' Internal File', 'Inline Frame', 'Include Frame', 'c', 'mcq', NULL),
(89, 10, 'Công dụng chính của <iframe> được đề cập trong đoạn văn là gì? ', 'Tải nhanh các tài nguyên bên ngoài.', 'Chuẩn mực để chèn các nội dung quảng cáo.', 'Mã hóa dữ liệu trang web.', 'Tạo các hiệu ứng động cho trang web.', 'b', 'mcq', NULL),
(90, 10, 'Thuộc tính src của thẻ <iframe> dùng để làm gì? \r\n', 'Đặt tên cho khung nội tuyến.', 'Chỉ định kiểu đường viền của khung.', 'Xác định đường dẫn tới nội dung hiển thị trong khung nội tuyến.', 'Thiết lập chế độ cuộn (scroll) cho khung.', 'c', 'mcq', NULL),
(91, 10, 'Thuộc tính nào sau đây được dùng để thiết lập kích thước (chiều rộng và chiều cao) cho khung nội tuyến? \r\n', 'size', 'dimensions', 'width, height', 'scale', 'c', 'mcq', NULL),
(92, 10, 'Theo đoạn văn, các nền tảng lớn cung cấp đoạn mã <iframe> để làm gì? \r\n', 'Định dạng lại nội dung của họ.', 'Dễ dàng sao chép và dán vào trang web khác để nhúng nội dung.', 'Bảo mật thông tin người dùng.', 'Tối ưu hóa tốc độ tải trang.', 'b', 'mcq', NULL),
(93, 10, 'Thuộc tính nào của thẻ <a> (siêu liên kết) thường được dùng kết hợp với\r\n<iframe> để hiển thị nội dung liên kết trong khung nội tuyến?', 'href', ' id', ' target', 'class', 'c', 'mcq', NULL),
(94, 10, 'Mục đích của việc sử dụng thuộc tính target trong thẻ <a> khi kết hợp với <iframe> là gì? \r\n', 'Chỉ định màu nền cho khung nội tuyến.', 'Chỉ định nơi mở tài liệu được liên kết (tức là trong khung nội tuyến).', 'Thiết lập thời gian chờ trước khi tài liệu được tải.', 'Tăng cường bảo mật cho nội dung được nhúng.', 'b', 'mcq', NULL),
(95, 10, 'Điều gì xảy ra khi bạn nhúng một đoạn mã <iframe> vào trang web của mình? \r\n', 'Trình duyệt sẽ hiển thị một khung nhìn chứa tài nguyên web khác được chỉ định.', 'Trang web bị lỗi do tài nguyên trùng lặp.', 'Trang web tự động chuyển hướng đến nguồn của <iframe>.', 'Nội dung của trang web chính bị thay đổi.', 'a', 'mcq', NULL),
(96, 10, 'Việc nhúng nội dung từ YouTube hoặc bản đồ từ Google Maps vào trang web của bạn thường sử dụng công cụ nào?\r\n', 'Thẻ <script>', 'Thẻ <div>', 'Thẻ <iframe>', ' Thẻ <p>', 'c', 'mcq', NULL),
(97, 11, 'Thành phần nào sau đây là nơi người dùng trực tiếp gõ thông tin văn bản vào biểu mẫu?\r\n', 'Nút lệnh (Button).', 'Ô nhập văn bản (Text box).', 'Nhãn (Label).', 'Thanh cuộn (Scrollbar).', 'b', 'mcq', NULL),
(98, 11, 'Trong biểu mẫu đăng nhập, tại sao khi nhập mật khẩu ta thường thấy các dấu chấm tròn hoặc dấu sao thay vì chữ cái?\r\n', 'Vì hệ thống bị lỗi hiển thị.', 'Để tiết kiệm diện tích trên màn hình.', 'Để bảo mật, không cho người bên cạnh nhìn thấy mật khẩu.', 'Vì máy tính không hiểu được chữ cái trong ô mật khẩu.', 'c', 'mcq', NULL),
(99, 11, 'Để bảo mật thông tin, khi người dùng gõ Mật khẩu, các ký tự phải được ẩn đi và thay bằng các dấu chấm tròn hoặc dấu sao. Loại input nào có khả năng tự động che chữ như vậy?\r\n', 'type=\"text\" ', 'type=\"button\"', 'type=\"password\" ', ' type=\"checkbox\"', 'c', 'mcq', NULL),
(100, 11, 'Khi em làm một mẫu đăng ký để bạn bè điền Họ và tên hoặc Địa chỉ nhà, em cần một ô trống cho phép người dùng tự do gõ chữ và số vào. Em sẽ chọn loại nhập liệu nào?\r\n', 'type=\"checkbox\" .', 'type=\"text\"', 'type=\"radio\" (Nút chọn một).', 'type=\"submit\" (Nút gửi đi).', 'b', 'mcq', NULL),
(101, 11, 'Thành phần \"Vùng văn bản\" (Text area) khác gì so với \"Ô nhập văn bản\" (Text box)?\r\n', ' Chỉ cho phép nhập số.', 'Chỉ cho phép chọn nội dung có sẵn.', 'Dùng để nhấn gửi dữ liệu đi.', 'Cho phép nhập nội dung dài, gồm nhiều dòng (như địa chỉ, ý kiến).', 'd', 'mcq', NULL),
(102, 11, 'Theo quy trình trong video mô phỏng, dữ liệu chỉ thực sự được gửi đi khi người dùng thực hiện thao tác nào?\r\n', 'Gõ xong tên đăng nhập.', 'Di chuyển chuột trên trang web.', 'Nhấn vào nút \"Đăng nhập\" (hoặc nút Gửi).', ' Click chuột vào ô mật khẩu.', 'c', 'mcq', NULL),
(103, 11, '\"Nhãn\" (Label) trong biểu mẫu có vai trò gì trong quá trình nhập dữ liệu?\r\n', 'Là nơi để người dùng nhập thông tin.', 'Dùng để ghi chú, hướng dẫn người dùng biết cần nhập gì vào ô bên cạnh.', 'Dùng để gửi dữ liệu về máy chủ.', ' Dùng để xóa toàn bộ dữ liệu đã nhập.', 'b', 'mcq', NULL),
(104, 11, ' Sau khi nhấn nút Gửi, dữ liệu từ các ô điều khiển trên biểu mẫu sẽ được chuyển đến đâu?\r\n', 'Chuyển đến phần mềm xử lý trên máy chủ (Server).', 'Chuyển vào bộ nhớ tạm của bàn phím.', 'Chuyển thành một tệp hình ảnh.', 'Chuyển trực tiếp sang máy tính của người dùng khác.', 'a', 'mcq', NULL),
(105, 11, 'Nếu người dùng nhập sai thông tin vào biểu mẫu (ví dụ để trống ô bắt buộc), thành phần nào thường xuất hiện để phản hồi?\r\n', 'Một video mới.', 'Thông báo lỗi hoặc yêu cầu nhập lại.', ' Nút tắt máy tính.', 'Trang web tự động đóng lại.', 'b', 'mcq', NULL),
(106, 11, 'Tên định danh (thuộc tính Name) của các ô nhập liệu có ý nghĩa gì khi gửi dữ liệu?\r\n', 'Để máy chủ nhận diện đúng dữ liệu của từng ô (ví dụ: đâu là \"user\", đâu là \"pass\").', 'Để máy tính tự động điền tên người dùng.', 'Để làm cho ô nhập liệu trông đẹp hơn.', 'Không có ý nghĩa gì trong việc nhập dữ liệu.', 'a', 'mcq', NULL),
(107, 12, 'Hãy nối các từ khoá sau đây tương ứng với chức năng:\r\n', '', '', '', '', '', 'matching', '{\"text\":\"Nhập nhiều dòng\",\"textarea\":\"Gắn nhãn mô tả cho input\",\"password\":\"Nhập 1 dòng văn bản\",\"label\":\"Nhập mật khẩu (hiện dấu •)\"}'),
(108, 13, 'Tại sao bố cục một cột (Single Column) thường được ưu tiên hơn bố cục nhiều cột trong thiết kế biểu mẫu? \r\n', 'Vì nó giúp biểu mẫu trông dài và chuyên nghiệp hơn. ', 'Vì mắt người dùng di chuyển theo đường thẳng từ trên xuống, giúp giảm nỗ lực nhận thức và hoàn thành nhanh hơn.', 'Vì nó tiết kiệm diện tích trang web khi hiển thị trên máy tính. ', 'Vì bố cục nhiều cột không thể hiển thị được trên các thiết bị di động.', 'b', 'mcq', NULL),
(109, 13, 'Việc sử dụng Placeholder (chữ gợi ý mờ) để thay thế hoàn toàn cho Label (nhãn cố định) gây ra trở ngại gì cho người dùng? \r\n', 'Người dùng dễ quên mình đang nhập thông tin gì sau khi chữ gợi ý biến mất, gây khó khăn cho việc kiểm tra lại.', 'Làm biểu mẫu trông quá đơn giản và thiếu thẩm mỹ. ', 'Khiến dung lượng tệp PDF hoặc trang web bị tăng lên đáng kể. ', 'Không gây trở ngại gì, đây là phong cách thiết kế tối giản được khuyến khích.', 'a', 'mcq', NULL),
(110, 13, 'Vị trí đặt nhãn (Label) nào được các chuyên gia UX đánh giá là tối ưu nhất cho tốc độ xử lý thông tin? \r\n', 'Đặt bên trái ô nhập liệu (Left-aligned). ', 'Đặt bên phải ô nhập liệu (Right-aligned).', 'Đặt phía trên ô nhập liệu (Top-aligned). ', 'Chỉ sử dụng biểu tượng thay cho nhãn văn bản.', 'c', 'mcq', NULL),
(111, 13, 'Khi gặp một biểu mẫu có quá nhiều trường thông tin phức tạp, giải pháp nào là hiệu quả nhất? ', 'Cố gắng thu nhỏ cỡ chữ để hiển thị tất cả thông tin trên một màn hình duy nhất.', 'Xóa bớt các trường thông tin quan trọng để người dùng đỡ nản lòng.', ' Chia biểu mẫu thành các nhóm logic hoặc chia thành nhiều bước (Multi-step form). ', 'Để mặc định tất cả các trường đều là \"Tùy chọn\".', 'c', 'mcq', NULL),
(112, 13, 'Nguyên tắc \"Inline Validation\" (Xác thực tức thì) mang lại lợi ích gì? \r\n', 'Giúp hệ thống tự động điền thông tin cho người dùng.', ' Giảm bớt số lượng trường mà người dùng cần phải nhập. ', 'Chỉ báo lỗi sau khi người dùng đã nhấn nút \"Gửi\" cuối cùng.', 'Thông báo lỗi hoặc xác nhận thành công ngay khi người dùng vừa thao tác xong tại từng ô nhập liệu. ', 'd', 'mcq', NULL),
(113, 13, 'Để giảm bớt áp lực tâm lý cho người dùng, nhà thiết kế nên làm gì đối với các trường thông tin? \r\n', 'Đánh dấu tất cả các ô bắt buộc bằng dấu sao đỏ (*) và cảnh báo liên tục. ', 'Chỉ ghi chú chữ (Tùy chọn) vào những trường không nhất thiết phải nhập. ', 'Để trống hoàn toàn, người dùng sẽ tự hiểu ô nào không nhập được thì bỏ qua', 'Luôn yêu cầu người dùng nhập lại thông tin hai lần để đảm bảo chính xác.', 'b', 'mcq', NULL),
(114, 13, 'Thiết lập loại bàn phím phù hợp cho từng ô nhập liệu trên di động (ví dụ: hiện phím số cho ô Số điện thoại) có tác dụng gì?\r\n', 'Tăng cường khả năng bảo mật thông tin cá nhân của người dùng. ', 'Giúp ứng dụng tiết kiệm pin và dung lượng dữ liệu. ', 'Giúp người dùng thao tác nhanh hơn, giảm bớt các bước chuyển đổi bàn phím thủ công.', 'Làm cho biểu mẫu tự động thay đổi màu sắc theo chủ đề của điện thoại.', 'c', 'mcq', NULL),
(115, 13, ' Một thông báo lỗi (Error Message) được coi là hiệu quả khi đáp ứng tiêu chí nào? ', 'Sử dụng các thuật ngữ kỹ thuật để giải thích cơ chế lỗi của hệ thống.', ' Chỉ cần hiển thị màu đỏ ở ô nhập liệu để người dùng tự tìm lỗi. ', 'Cụ thể, mang tính xây dựng và chỉ dẫn rõ ràng cách để người dùng khắc phục lỗi đó. ', 'Càng ngắn gọn và chung chung càng tốt (Ví dụ: \"Lỗi hệ thống\").', 'c', 'mcq', NULL),
(116, 13, 'ại sao văn bản trên nút bấm (CTA) nên cụ thể thay vì chỉ dùng chữ \"Gửi\" chung chung? \r\n', 'Vì người dùng cần biết chính xác kết quả của hành động họ sắp thực hiện (ví dụ: \"Tạo tài khoản\", \"Tải tài liệu\"). ', 'Vì chữ \"Gửi\" thường quá ngắn và không gây được ấn tượng thị giác.', 'Vì quy định quốc tế bắt buộc các nút bấm phải có từ 2 từ trở lên', 'Vì chữ \"Gửi\" có thể bị các bộ lọc thư rác chặn lại.', 'a', 'mcq', NULL),
(117, 13, ' Sau khi người dùng hoàn tất việc gửi biểu mẫu, bước nào dưới đây là cần thiết nhất? ', 'Tự động tải lại trang biểu mẫu trống để người dùng nhập lại từ đầu. ', 'Quay trở lại trang chủ ngay lập tức để tiết kiệm thời gian của người dùng', 'Yêu cầu người dùng chụp màn hình lại để làm bằng chứng đã gửi.', 'Hiển thị thông báo xác nhận thành công hoặc chuyển hướng đến trang cảm ơn rõ ràng. ', 'd', 'mcq', NULL),
(118, 14, 'Thuộc tính CSS nào dùng để thay đổi màu chữ của văn bản?\r\n', ' background-color', 'border-color', 'color', ' font-style', 'c', 'mcq', NULL),
(119, 14, 'Thuộc tính CSS nào dùng để thay đổi phông chữ của văn bản?\r\n', 'font-family', 'font-size', ' text-align', 'color', 'a', 'mcq', NULL),
(120, 14, 'Đoạn mã CSS nào sau đây đặt cỡ chữ là 18px cho đoạn văn?\r\n', ' p { font: 18px; }', 'p { font-size: 18px; }', 'p { size: 18px; }', 'p { text-size: 18px; }', 'b', 'mcq', NULL),
(121, 14, 'Thuộc tính nào dùng để đặt màu nền cho phần tử HTML?\r\n', 'color', 'background', 'background-color', 'border-color', 'c', 'mcq', NULL),
(122, 14, 'Đoạn mã nào sau đây tạo đường viền liền (solid) cho phần tử?\r\n', 'border: 1px;', 'border: solid;', 'border: 1px solid black;', ' border: black solid;', 'c', 'mcq', NULL),
(123, 14, 'Trong khai báo border: 2px dashed red;, thứ tự đúng của các thành phần là:\r\n', 'Màu – độ dày – kiểu', 'Độ dày – kiểu – màu', 'Kiểu – màu – độ dày', 'Kiểu – độ dày – màu', 'b', 'mcq', NULL),
(124, 14, 'Thuộc tính CSS nào dùng để làm chữ in nghiêng?\r\n', 'font-weight', 'font-style', 'text-decoration', 'font-family', 'b', 'mcq', NULL),
(125, 14, 'Thuộc tính CSS nào dùng để làm chữ đậm?', 'font-weight', 'text-transform', 'font-style', 'border-style', 'a', 'mcq', NULL),
(126, 14, 'Giá trị nào sau đây KHÔNG phải là kiểu đường viền hợp lệ?\r\n', 'solid', 'dashed', 'double', 'rounded', 'd', 'mcq', NULL),
(127, 14, 'Đoạn mã CSS nào sau đây đúng cú pháp để định dạng chữ màu xanh và có đường viền?\r\n', 'p { color = blue; border: 1px solid; }', 'p { color: blue; border: solid 1px black; }', 'p { font-color: blue; border: 1 solid black; }', 'p { color: blue border: 1px solid black; }', 'b', 'mcq', NULL),
(128, 15, 'Để định dạng cho một nhóm nhiều phần tử khác nhau, ta nên sử dụng bộ chọn nào?\r\n', 'Bộ chọn phần tử.', 'Bộ chọn lớp (Class selector).', ' Bộ chọn định danh (ID selector).', 'Bộ chọn toàn cục.', 'b', 'mcq', NULL),
(129, 15, ' Ký hiệu nào dùng để bắt đầu một bộ chọn định danh (ID Selector) trong file CSS?\r\n', 'Dấu thăng (#)', ' Dấu chấm (.)', 'Dấu và (&)', 'Dấu sao (*)', 'a', 'mcq', NULL),
(130, 15, 'Cách chèn CSS nào được viết riêng trong một file đuôi .css và liên kết vào HTML bằng thẻ <link>?\r\n', ' Inline CSS.', 'Internal CSS.', 'External CSS.', 'Cả 3 cách trên.', 'c', 'mcq', NULL),
(132, 15, 'Thuộc tính nào dùng để thay đổi phông chữ (ví dụ: chuyển sang Arial, Times New Roman)?\r\n', 'font-style', ' font-weight', 'font-family', 'text-decoration', 'c', 'mcq', NULL),
(133, 15, ' Để tạo đường viền nét đứt cho một khung hình, ta sử dụng giá trị nào cho thuộc tính border-style?\r\n', 'solid', ' dashed', 'double', 'none', 'b', 'mcq', NULL),
(134, 15, 'Thuộc tính nào dùng để tạo khoảng cách giữa nội dung văn bản và đường viền của nó?', 'margin', 'spacing', 'border-width', 'padding', 'd', 'mcq', NULL),
(135, 15, 'Giá trị nào của thuộc tính text-align giúp văn bản được căn đều cả hai bên lề?\r\n', 'center', ' left', 'right', 'justify', 'd', 'mcq', NULL),
(137, 15, 'Khi sử dụng Internal CSS, mã định dạng phải được đặt bên trong cặp thẻ nào?', '<script>', '<style>', '<link>', '<css>', 'b', 'mcq', NULL),
(139, 15, 'Giả sử có mã HTML: <p class=\"van-ban\">. Quy tắc CSS nào sau đây là đúng để đổi màu chữ thành đỏ cho thẻ này?\r\n', 'p { color: red; }', '.van-ban { color: red; }', 'p.van-ban { color: red; }', 'Tất cả các đáp án trên đều đúng.', 'd', 'mcq', NULL),
(140, 15, 'Thứ tự đúng của một quy tắc CSS đơn giản là gì?', '{Thuộc tính: Giá trị;} Bộ chọn', 'Bộ chọn {Thuộc tính: Giá trị;}', 'Bộ chọn (Thuộc tính: Giá trị;)', 'Bộ chọn {Giá trị: Thuộc tính;}', 'b', 'mcq', NULL),
(141, 16, 'Matching các tên thẻ, chức năng,  ứng cho các thẻ định dạng kiểu chữ ', '', '', '', '', '', 'matching', '{\"<b>\":\"Hiển thị chữ in nghiêng\",\"<i>\":\"Hiển thị chữ in đậm \",\"<u>\":\"Gạch chân nội dung\",\"<mark>\":\"Làm nổi bật (tô nền vàng) nội dung\"}'),
(142, 16, 'Matching các tên thẻ, chức năng,  ứng cho các thẻ định dạng kiểu chữ ', '', '', '', '', '', 'matching', '{\"<small>\":\"Làm chữ nhỏ hơn bình thường\",\"<strong>\":\"Nhấn mạnh nội dung quan trọng (in đậm + ngữ nghĩa)\"}'),
(143, 16, 'Matching các tên giá trị thuộc tính style và chức năng', '', '', '', '', '', 'matching', '{\"Color\":\"Đặt màu chữ\",\"font-size\":\"Đặt kích thước chữ\",\"font-style\":\"Làm nghiêng văn bản\",\"font-align\":\"Căn chỉnh vị trí văn bản\"}'),
(144, 16, 'Matching các tên giá trị thuộc tính style và chức năng\r\n\r\n', '', '', '', '', '', 'matching', '{\"background-color\":\"Đặt màu nền cho phần tử\",\"text-decoration\":\"Trang trí chữ (gạch chân, gạch ngang, …)\"}'),
(145, 17, 'Bộ chọn lớp trong CSS được ký hiệu bằng dấu nào?\r\n', '#', '.', '*', '@', 'b', 'mcq', NULL),
(146, 17, 'Cú pháp nào sau đây là đúng cho bộ chọn lớp trong CSS?\r\n', '#box { color: red; }', '.box { color: red; }', 'box { color: red; }', '@box { color: red; }', 'b', 'mcq', NULL),
(147, 17, 'Thuộc tính nào dùng để gán lớp cho phần tử HTML?\r\n', 'name', 'id', 'class', 'style', 'c', 'mcq', NULL),
(148, 17, 'Đoạn mã HTML nào gán lớp noidung cho đoạn văn?\r\n', '<p id=\"noidung\">', '<p class=\"noidung\">', '<p style=\"noidung\">', '<p name=\"noidung\">', 'b', 'mcq', NULL),
(149, 17, 'Một bộ chọn lớp có thể áp dụng cho:\r\n', 'Chỉ một phần tử', 'Hai phần tử', ' Nhiều phần tử HTML', 'Chỉ thẻ <div>', 'c', 'mcq', NULL),
(150, 17, 'Khi nào nên sử dụng bộ chọn lớp?\r\n', ' Khi chỉ định dạng cho một phần tử duy nhất', 'Khi muốn định dạng nhiều phần tử giống nhau', 'Khi muốn tạo liên kết', 'Khi chèn hình ảnh', 'b', 'mcq', NULL),
(151, 17, 'Đoạn CSS nào sau đây định dạng tất cả phần tử có class=\"title\"?\r\n', '#title { font-size: 20px; }', ' .title { font-size: 20px; }', 'title { font-size: 20px; }', '*title { font-size: 20px; }', 'b', 'mcq', NULL),
(152, 17, 'Phát biểu nào ĐÚNG về bộ chọn lớp?\r\n', 'Mỗi lớp chỉ dùng cho một phần tử', 'Tên lớp được đặt sau dấu #', ' Một lớp có thể dùng cho nhiều phần tử', 'Bộ chọn lớp không dùng trong CSS', 'c', 'mcq', NULL),
(153, 17, 'Ưu điểm của việc sử dụng bộ chọn lớp là gì?\r\n', 'Làm mã HTML dài hơn', 'Giảm khả năng tái sử dụng', 'Chỉ dùng cho hình ảnh', 'Giúp quản lý và định dạng trang web hiệu quả', 'd', 'mcq', NULL),
(154, 17, 'Cho đoạn mã:\r\n\r\n<p class=\"note\">Ghi chú 1</p>\r\n<p class=\"note\">Ghi chú 2</p>\r\n\r\nCSS nào sau đây sẽ định dạng cả hai đoạn văn?\r\n', ' #note { color: red; }', '.note { color: red; }', 'p { color: red; }', ' note { color: red; }', 'b', 'mcq', NULL),
(155, 18, 'Hãy nối cột thuộc tính CSS đúng với phần mô tả tương ứng với thuộc tính đó cho các vùng hiển thị của mô hình hộp\r\n', '', '', '', '', '', 'matching', '{\"padding\":\"Xác định kích thước vùng đệm (khoảng cách giữa nội dung và đường viền).\",\"border-style\":\"Xác định kiểu trình bày đường viền bao quanh (ví dụ: nét liền, nét đứt).\",\"margin\":\"Xác định kích thước vùng lề (khoảng cách bên ngoài đường viền với các phần tử khác).\",\"width\":\"Xác định chiều rộng vùng nội dung.\"}'),
(156, 18, 'Mô hình hộp (box model) trong HTML/CSS dùng để làm gì?\r\n', 'Xác định cấu trúc tổng thể của trang web', 'Mô tả cách trình bày và chiếm không gian của một phần tử HTML', 'Tạo hiệu ứng động cho trang web', 'Xác định liên kết giữa các trang web', 'b', 'mcq', NULL),
(157, 18, 'Theo mô hình hộp, một phần tử HTML được cấu tạo từ các thành phần nào sau đây (từ trong ra ngoài)?\r\n', 'Content – Border – Padding – Margin', 'Margin – Border – Padding – Content', 'Content – Padding – Border – Margin', ' Padding – Content – Border – Margin', 'c', 'mcq', NULL),
(158, 18, 'Thành phần nào trong mô hình hộp chứa nội dung chính của phần tử HTML?\r\n', 'Margin', 'Border', 'Padding', 'Content', 'd', 'mcq', NULL),
(159, 18, 'Padding trong mô hình hộp có vai trò gì?\r\n', 'Tạo khoảng cách giữa các phần tử HTML', ' Xác định độ dày của đường viền', ' Xác định kích thước trang web', 'Tạo khoảng cách giữa nội dung và đường viền', 'd', 'mcq', NULL),
(160, 18, 'Border trong mô hình hộp là gì?\r\n', 'Khoảng cách bên ngoài phần tử', ' Đường viền bao quanh phần tử', ' Khoảng đệm bên trong phần tử', 'Phần chứa nội dung của phần tử', 'b', 'mcq', NULL),
(161, 18, 'Margin trong mô hình hộp dùng để:\r\n', 'Tạo khoảng cách giữa nội dung và viền', ' Tạo màu nền cho phần tử', 'Xác định chiều rộng phần tử', 'Tạo khoảng cách giữa phần tử với các phần tử khác', 'd', 'mcq', NULL),
(162, 18, 'Thuộc tính nào sau đây dùng để điều chỉnh khoảng cách bên trong phần tử HTML?\r\n', ' margin', ' border', 'padding', 'padding', 'c', 'mcq', NULL),
(163, 18, 'Thuộc tính nào ảnh hưởng đến khoảng cách giữa hai phần tử HTML?\r\n', 'padding', ' content', 'border', ' margin', 'd', 'mcq', NULL),
(164, 18, 'Trong mô hình hộp, kích thước hiển thị của phần tử chịu ảnh hưởng bởi các thành phần nào?\r\n', ' Content, padding, border và margin', ' Content, padding và border', 'Content và padding', 'Chỉ content', 'd', 'mcq', NULL),
(165, 18, 'Phát biểu nào sau đây là đúng về mô hình hộp?\r\n', 'Mỗi phần tử HTML đều được trình bày theo mô hình hộp', 'Mô hình hộp chỉ áp dụng cho bảng (table)', 'Margin nằm bên trong đường viền', 'Padding nằm bên ngoài phần tử', 'a', 'mcq', NULL),
(166, 19, 'Thành phần nào của trang web thường chứa logo, tên trang và thông tin giới thiệu chung?\r\n', 'Phần nội dung', 'Phần chân trang', 'Phần đầu trang', 'Thanh điều hướng', 'c', 'mcq', NULL),
(167, 19, 'Thanh điều hướng (menu) của trang web có chức năng chính là gì?\r\n', ' Hiển thị thông tin bản quyền', ' Giúp người dùng truy cập các trang khác', 'Chứa nội dung chính của trang', 'Hiển thị thông tin liên hệ', 'b', 'mcq', NULL),
(168, 19, 'Thành phần nào sau đây dùng để cung cấp thông tin chính cho người dùng?\r\n', 'Phần đầu trang', 'Thanh điều hướng', 'Phần chân trang', 'Phần nội dung', 'd', 'mcq', NULL),
(169, 19, 'Thông tin bản quyền và liên hệ thường được đặt ở bộ phận nào của trang web?\r\n', 'Phần đầu trang', 'Thanh điều hướng', 'Phần nội dung', 'Phần chân trang', 'a', 'mcq', NULL),
(170, 19, 'Thành phần nào sau đây không thuộc bố cục cơ bản của một trang web?', ' Cơ sở dữ liệu', 'Thanh điều hướng', 'Đầu trang', 'Phần nội dung', 'a', 'mcq', NULL),
(171, 19, 'Mục đích chính của việc xây dựng bố cục trang web là gì?\r\n', 'Tăng dung lượng trang web', 'Trang trí cho đẹp mắt', 'Giúp người dùng dễ theo dõi và tìm kiếm thông tin', ' Giảm số lượng trang con', 'c', 'mcq', NULL),
(172, 19, 'PHẦN TRẮC NGHIỆM ĐÚNG SAI', '', '', '', '', '', 'matching', '{\" Thanh điều hướng luôn nằm trong phần nội dung.\":\"Sai\",\"Bố cục trang web giúp người dùng dễ dàng tìm kiếm thông tin.\":\"Đúng\",\"Mỗi trang web chỉ có duy nhất một bố cục cố định. \":\"Sai\",\"Phần chân trang thường nằm ở cuối trang web. \":\"Sai\"}'),
(173, 20, 'Hãy nối thẻ lệnh ứng với chức năng của \r\nKỹ thuật HTML và CSS', '', '', '', '', '', 'matching', '{\"Thẻ <link>\":\"Liên kết tệp CSS chung vào các tệp HTML của dự án.\",\"Lớp .Row\":\"Thiết lập để các ô (slogan, nội dung) hiển thị theo hàng ngang.\",\"Lớp .block_3\":\"Định dạng các ô có độ rộng bằng 1\\/3 chiều rộng trang web.\"}'),
(174, 20, 'Hãy nối thẻ lệnh ứng với chức năng của \r\nKỹ thuật HTML và CSS', '', '', '', '', '', 'matching', '{\"Tệp style.css\":\"Chứa toàn bộ định dạng màu sắc, bố cục dùng chung cho cả website.\",\"Thuộc tính float: left\":\"Đẩy các khối nội dung sang trái để xếp cạnh nhau.\",\"Thẻ <form>\":\"Khởi tạo khu vực nhập liệu cho trang Đăng ký thành viên.\"}'),
(175, 20, 'Hãy nối Thành phần Layout với Nội dung hiển thị \r\nBố cục trang web ', '', '', '', '', '', 'matching', '{\"Phần đầu trang (Header)\":\"Chứa Logo, tên Câu lạc bộ và Slogan của trường.\",\"Thanh điều hướng (Nav)\":\"Chứa các nút liên kết: Trang chủ, CLB Thể thao, Nghệ thuật.\",\"Phần nội dung (Main)\":\"Hiển thị chi tiết lịch sinh hoạt và thành tích của CLB.\"}'),
(176, 20, 'Hãy nối Thành phần Layout với Nội dung hiển thị \r\nBố cục trang web ', '', '', '', '', '', 'matching', '{\"Phần chân trang (Footer)\":\"Thông tin liên hệ, địa chỉ văn phòng đoàn trường.\",\"Trang index.html\":\"Trang chủ giới thiệu tổng quan về các nhóm câu lạc bộ.\",\"Trang dang_ki.html\":\"Nơi học sinh điền thông tin cá nhân để tham gia CLB.\"}'),
(177, 21, 'Học máy là một nhánh nghiên cứu của lĩnh vực nào sau đây?\r\n', ' Khoa học dữ liệu thuần túy.', 'Trí tuệ nhân tạo (AI).', 'Lập trình hướng đối tượng.', 'Quản trị mạng máy tính.', 'b', 'mcq', NULL),
(178, 21, 'Theo định nghĩa, học máy giúp máy tính có khả năng gì từ dữ liệu?\r\n', 'Khả năng tự sửa chữa phần cứng.', 'Khả năng sao chép dữ liệu nhanh hơn.', ' Khả năng tự học từ dữ liệu để thực hiện nhiệm vụ.', 'Khả năng lưu trữ dữ liệu không giới hạn.', 'c', 'mcq', NULL),
(179, 21, 'Trong quy trình học máy, bước \"Chuẩn bị dữ liệu\" bao gồm các công việc nào?\r\n', ' Làm sạch, loại bỏ nhiễu và chuyển đổi khuôn dạng dữ liệu.', 'Thu thập dữ liệu từ các nguồn khác nhau.', 'Lựa chọn thuật toán phù hợp với bài toán.', 'Triển khai mô hình vào thực tế.', 'a', 'mcq', NULL),
(180, 21, 'Tập dữ liệu dùng để thuật toán rút ra các thông tin, đặc điểm chung được gọi là gì?', 'Dữ liệu thô.', 'Dữ liệu kiểm tra.', 'Dữ liệu huấn luyện.', 'Dữ liệu ứng dụng.', 'c', 'mcq', NULL),
(181, 21, 'Mục đích của việc sử dụng \"Dữ liệu kiểm tra\" trong quy trình học máy là gì?', 'Để bổ sung cho dữ liệu huấn luyện còn thiếu.', 'Để đánh giá mức độ đáp ứng yêu cầu của mô hình.', 'Để máy tính bắt đầu quá trình học lại.', ' Để làm sạch các dữ liệu bị nhiễu.', 'b', 'mcq', NULL),
(182, 21, 'Nếu kết quả đánh giá mô hình chưa đạt yêu cầu, người thiết kế cần thực hiện bước nào?', 'Triển khai ngay ứng dụng.', 'Tiếp tục cải thiện mô hình bằng cách chỉnh tham số hoặc thêm dữ liệu.', 'Xóa bỏ toàn bộ dữ liệu đã thu thập.', 'Chuyển sang sử dụng phần mềm văn phòng.', 'b', 'mcq', NULL),
(183, 21, 'Đâu là một loại thuật toán học máy được đề cập trong nội dung bài học?\r\n', 'Thuật toán Mạng nơ-ron.', 'Thuật toán tìm kiếm nhị phân.', 'Thuật toán sắp xếp nhanh (QuickSort).', 'Thuật toán mã hóa dữ liệu.', 'a', 'mcq', NULL),
(184, 21, 'Sau khi mô hình được huấn luyện thành công và đánh giá đạt yêu cầu, bước tiếp theo là?\r\n', 'Thu thập lại dữ liệu từ đầu.', ' Thay đổi thuật toán huấn luyện.', 'Triển khai ứng dụng mô hình vào bài toán thực tế.', 'Gắn lại nhãn cho dữ liệu.', 'c', 'mcq', NULL),
(185, 21, 'Mô hình học máy thực hiện thuật toán trên tập dữ liệu huấn luyện để làm gì?\r\n', 'Để tăng dung lượng bộ nhớ của máy tính.', 'Để máy tính có thể tự kết nối internet.', 'Để tạo ra các hình ảnh nghệ thuật ngẫu nhiên.', 'Tự động phát hiện ra các mối quan hệ có trong dữ liệu.', 'd', 'mcq', NULL),
(186, 21, 'Quy trình học máy thường gồm bao nhiêu bước chính theo sơ đồ bài học?\r\n', '3 bước.', '4 bước.', '5 bước.', '2 bước.', 'c', 'mcq', NULL),
(187, 22, 'Đặc điểm chính giúp phân biệt Học có giám sát với các loại học khác là gì?\r\n', 'Dữ liệu đầu vào cực kỳ lớn.', 'Máy tính tự nghĩ ra quy tắc mà không cần dữ liệu.', 'Tập dữ liệu huấn luyện gồm các mẫu đã được gắn nhãn.', ' Không cần sử dụng thuật toán toán học.', 'c', 'mcq', NULL),
(188, 22, ' Bài toán \"Phân loại\" trong học có giám sát được sử dụng nhằm mục đích gì?', ' Để xóa bỏ các dữ liệu trùng lặp trong hệ thống.', ' Xây dựng mô hình để dự đoán nhãn cho các mẫu dữ liệu mới.', 'Để máy tính tự động tạo ra các nhãn mới ngẫu nhiên.', 'Chỉ để sắp xếp dữ liệu theo thứ tự thời gian.', 'b', 'mcq', NULL),
(189, 22, 'Trong bài toán lọc thư rác, thông tin như \"địa chỉ người gửi\" hay \"tiêu đề thư\" được gọi là:\r\n', 'Nhãn đầu ra.', 'Các thuộc tính đặc trưng.', ' Kết quả dự đoán.', 'Dữ liệu nhiễu', 'b', 'mcq', NULL),
(190, 22, 'Học có giám sát tập trung tìm ra mối quan hệ giữa hai yếu tố nào?\r\n', 'Giữa dữ liệu đầu vào và nhãn đầu ra tương ứng.', 'Giữa CPU và bộ nhớ RAM.', 'Giữa người lập trình và máy tính.', 'Giữa các tệp tin trong cùng một thư mục.', 'a', 'mcq', NULL),
(191, 22, 'Đâu là một ứng dụng điển hình của Học có giám sát?\r\n', 'Nén ảnh để giảm dung lượng.', 'Tự động nhóm khách hàng theo sở thích ẩn.', 'Lọc thư rác và Chẩn đoán bệnh.', 'Sắp xếp các thư mục trên màn hình máy tính.', 'c', 'mcq', NULL),
(192, 22, 'Việc sử dụng \"Dữ liệu kiểm tra\" trong học có giám sát là cần thiết vì:\r\n', ' Để máy tính có thêm dữ liệu để học lại.', 'Để làm sạch các nhãn bị sai trong dữ liệu huấn luyện.', 'Để tăng tốc độ xử lý của thuật toán.', ' Để đánh giá mô hình có dự đoán chính xác trên dữ liệu mới hay không.', 'd', 'mcq', NULL),
(193, 22, 'Mục tiêu cuối cùng của việc huấn luyện một mô hình phân loại là:\r\n', 'Làm cho máy tính chạy nhanh nhất có thể.', 'Giảm thiểu số lượng nhãn bị gắn sai đến mức ngưỡng chấp nhận được.', 'Tạo ra hàng triệu nhãn khác nhau cho cùng một đối tượng.', 'Loại bỏ hoàn toàn sự can thiệp của con người.', 'b', 'mcq', NULL),
(194, 22, 'Việc gắn nhãn \"vuông\", \"tròn\" cho các hình vẽ thuộc loại học nào?\r\n', 'Học không giám sát.', 'Học có giám sát.', ' Học tăng cường.', 'Lập trình truyền thống.', 'b', 'mcq', NULL),
(195, 22, 'Khi một mô hình học có giám sát \"nhận diện khuôn mặt\" để mở khóa điện thoại, \"khuôn mặt chủ nhân\" đóng vai trò là gì?\r\n', 'Một nhãn phân loại đã được học.', 'Một dữ liệu không nhãn.', ' Một phần cứng hệ thống.', ' Một thuật toán.', 'a', 'mcq', NULL),
(196, 22, 'Nếu nhãn trong dữ liệu huấn luyện bị sai hàng loạt, mô hình học máy sẽ:', 'Không bị ảnh hưởng vì máy tính rất thông minh.', ' Xóa bỏ toàn bộ dữ liệu huấn luyện đó.', 'Học sai quy luật và đưa ra các dự đoán không chính xác.', 'Tự động nhận biết và sửa lại nhãn cho đúng.', 'c', 'mcq', NULL),
(197, 23, 'Bước thứ 2 trong quy trình học máy là gì?\r\n', 'Chuẩn bị dữ liệu', 'Xây dựng mô hình', 'Thu thập dữ liệu', 'Triển khai ứng dụng mô hình', 'a', 'mcq', ''),
(198, 23, 'Thuật toán hồi quy tuyến tính phù hợp để để giải quyết bài toán nào sau đây:', 'Nhận diện khuôn mặt', 'Dự đoán thị trường chứng khoán', 'Lập mô hình mối quan hệ giữa nhiệt độ và sự giãn nở của thuỷ ngân kim loại trong nhiệt kế', 'Xây dựng chiến lược kinh doanh', 'c', 'mcq', ''),
(199, 23, 'Phương án nào sau đây là một kỹ thuật đọc không giám sát:\r\n', 'Hồi quy logistic', 'Cây quyết định', 'Mạng nơ - ron', 'Mật độ xác suất', 'd', 'mcq', ''),
(200, 23, 'Phương án nào sau đây là một ứng dụng của nhận dạng giọng nói?', 'Phát hiện gian lận', 'Chuyển đổi văn bản thành giọng nói', 'Tự động hóa quản lý tài liệu trong ngân hàng ', 'Chẩn đoán bệnh', 'b', 'mcq', ''),
(206, 23, 'LỰA CHỌN ĐÚNG/SAI:\r\nPhát biểu về học máy sau đây là đúng hay sai:\r\nHọc không giám sát sử dụng dữ liệu huấn luyện không có nhãn\r\n', '', '', '', '', 'True', 'true_false', ''),
(207, 23, 'LỰA CHỌN ĐÚNG/SAI:\r\nPhát biểu về học máy sau đây là đúng hay sai:\r\nHọc có giám sát dành cho huấn luyện máy tính phân cụm\r\n', '', '', '', '', 'False', 'true_false', ''),
(208, 23, 'LỰA CHỌN ĐÚNG/SAI:\r\nPhát biểu về học máy sau đây là đúng hay sai:\r\nHọc có giám sát và không giám sát đều giúp máy tính giải quyết cùng một bài toán như nhau\r\n', '', '', '', '', 'False', 'true_false', ''),
(209, 23, 'LỰA CHỌN ĐÚNG/SAI:\r\nPhát biểu về học máy sau đây là đúng hay sai:\r\nHọc có giám sát sử dụng dữ liệu kiểm tra để đánh giá kết quả huấn luyện\r\n', '', '', '', '', 'True', 'true_false', ''),
(210, 23, ' Học máy là gì? Sự khác nhau giữa học có giám sát và học không giám sát là gì?', '', '', '', '', '', 'essay', ''),
(211, 23, 'Hãy kể một vài ứng dụng cụ thể trong đó có thể sử dụng học máy để thực hiện nhiệm vụ phân loại và phân cụm \r\n', '', '', '', '', '', 'essay', ''),
(212, 24, 'Mục tiêu cốt lõi của Khoa học dữ liệu là gì? \r\n', 'Chỉ để lưu trữ dữ liệu an toàn trên đám mây.', 'Sử dụng máy tính để giải trí và kết nối mạng xã hội. ', 'Khám phá tri thức từ dữ liệu để hỗ trợ ra quyết định và giải quyết vấn đề.', ' Sửa chữa các lỗi phần cứng và cài đặt phần mềm máy tính.', 'c', 'mcq', ''),
(213, 24, 'Quy trình thực hiện một dự án khoa học dữ liệu điển hình thường gồm bao nhiêu bước? \r\n', '4 bước. ', '6 bước. ', '4 bước. ', '3 bước. ', 'b', 'mcq', ''),
(214, 24, 'Bước đầu tiên \"Xác định vấn đề\" trong dự án khoa học dữ liệu nhằm mục đích gì? \r\n', 'Để chọn loại ngôn ngữ lập trình sẽ sử dụng. ', ' Để vẽ ngay các biểu đồ minh họa đẹp mắt. ', 'Để mua thêm ổ cứng lưu trữ dữ liệu.', 'Để xác định mục tiêu cụ thể và những câu hỏi cần trả lời bằng dữ liệu. ', 'd', 'mcq', ''),
(215, 24, 'Tại sao bước \"Chuẩn bị dữ liệu\" lại rất quan trọng và chiếm nhiều thời gian? ', ' Vì dữ liệu thô thường có lỗi, không nhất quán hoặc thiếu thông tin. ', 'Vì đây là bước để trang trí cho dữ liệu đẹp hơn. ', 'Vì cần phải xóa hết dữ liệu cũ để nhập dữ liệu mới. ', 'Vì máy tính chỉ xử lý được các con số từ 1 đến 10.', 'a', 'mcq', ''),
(216, 24, ' Hoạt động \"Khám phá dữ liệu\" thường sử dụng công cụ nào để tìm ra nguyên nhân hoặc quy luật? \r\n', 'Các phần mềm thiết kế đồ họa 3D. ', 'Soạn thảo văn bản bằng Microsoft Word. ', 'Các thuật toán thống kê và biểu đồ trực quan hóa dữ liệu. ', 'Công cụ tìm kiếm Google để đọc tin tức.', 'c', 'mcq', ''),
(217, 24, 'Trong bước \"Thu thập dữ liệu\", chúng ta có thể lấy thông tin từ đâu? ', 'Chỉ lấy từ sách giáo khoa cũ. ', ' Chỉ lấy từ suy luận cá nhân. ', 'Từ việc đoán mò các con số.', 'Từ cảm biến, Internet, khảo sát thực tế hoặc các cơ sở dữ liệu có sẵn. ', 'c', 'mcq', ''),
(218, 24, 'Khẳng định nào sau đây là ĐÚNG về khoa học dữ liệu? \r\n', 'Khoa học dữ liệu chỉ liên quan đến việc gõ văn bản nhanh. ', 'Khoa học dữ liệu là sự kết hợp của Toán học, Công nghệ thông tin và Kiến thức chuyên môn. ', 'Khoa học dữ liệu không cần đến kiến thức toán học. ', 'Khoa học dữ liệu chỉ dùng để dự báo thời tiết, không dùng cho giáo dục.', 'b', 'mcq', ''),
(219, 24, 'Ý nghĩa của bước \"Đánh giá và giải thích\" là gì? \r\n', ' Kiểm chứng xem kết quả phân tích có đáng tin cậy và trả lời được vấn đề ban đầu không. ', 'Để thay đổi dữ liệu sao cho giống với ý muốn cá nhân.', 'Để chuyển dữ liệu từ file PDF sang file Excel.', 'Để kết thúc dự án và đi nghỉ ngơi. ', 'a', 'mcq', ''),
(220, 24, ' \"Đề xuất giải pháp cụ thể dựa trên kết quả phân tích\" thuộc bước nào trong quy trình? \r\n', ' Bước 2: Thu thập dữ liệu.', 'Bước 4: Phân tích dữ liệu. ', 'Bước 5: Đánh giá. ', 'Bước 6: Ra quyết định và triển khai.', 'd', 'mcq', ''),
(221, 24, 'Một báo cáo khoa học dữ liệu chuyên nghiệp cần đảm bảo yếu tố nào?\r\n', 'Càng dài càng tốt, không cần biểu đồ. ', 'Có căn cứ từ dữ liệu thực tế, lập luận logic và trình bày rõ ràng. ', ' Chỉ cần nêu cảm nhận cá nhân, không cần số liệu. ', 'Sử dụng thật nhiều thuật ngữ tiếng Anh khó hiểu.', 'b', 'mcq', ''),
(222, 25, 'Thuật ngữ \"Big Data\" dùng để chỉ loại dữ liệu nào?\r\n', ' Dữ liệu có thể lưu trữ trong 1 file Excel duy nhất.', 'Dữ liệu có khối lượng rất lớn, đa dạng và phức tạp.', 'Dữ liệu chỉ gồm các con số.', 'Dữ liệu đã được in ra giấy.', 'b', 'mcq', ''),
(223, 25, 'Đặc trưng nào nói về sự tăng trưởng nhanh chóng về kích thước của dữ liệu?\r\n', 'Volume (Khối lượng)', 'Variety (Đa dạng)', 'Veracity (Xác thực)', 'Value (Giá trị)', 'a', 'mcq', ''),
(224, 25, 'Việc dữ liệu bao gồm cả văn bản, âm thanh, hình ảnh và video thể hiện đặc trưng nào?', 'Velocity (Tốc độ)', ' Variety (Đa dạng)', 'Volume (Khối lượng)', ' Value (Giá trị)', 'b', 'mcq', ''),
(225, 25, 'Đặc trưng \"Velocity\" trong dữ liệu lớn đề cập đến điều gì?\r\n', 'Độ lớn của bộ nhớ máy tính.', 'Độ tin cậy của thông tin.', 'Tốc độ tạo ra và xử lý dữ liệu.', 'Giá trị kinh tế của dữ liệu.', 'c', 'mcq', ''),
(226, 25, 'Tại sao \"Veracity\" (Tính xác thực) lại là một thách thức của dữ liệu lớn?\r\n', 'Vì dữ liệu quá ít.', 'Vì dữ liệu quá đắt tiền.', 'Vì dữ liệu chỉ có một định dạng duy nhất.', 'Vì dữ liệu được thu thập từ nhiều nguồn, khó kiểm soát độ chính xác.', 'd', 'mcq', ''),
(227, 25, 'Đặc trưng nào được coi là mục tiêu cuối cùng của việc phân tích dữ liệu lớn?\r\n', 'Volume', 'Variety', 'Value', 'Velocity', 'a', 'mcq', ''),
(228, 25, 'Một tập hợp dữ liệu lớn thường được đo bằng đơn vị nào sau đây?\r\n', 'Byte hoặc Kilobyte.', ' Megabyte.', 'Terabyte, Petabyte hoặc lớn hơn.', 'Bit.', 'c', 'mcq', ''),
(229, 25, 'Dữ liệu từ các cảm biến giao thông gửi về máy chủ liên tục từng giây thể hiện đặc trưng nào rõ rệt nhất?\r\n', 'Variety', 'Velocity', 'Volume', 'Veracity', 'b', 'mcq', ''),
(230, 25, 'Chữ V nào đại diện cho tính không đồng nhất của dữ liệu (có cấu trúc và phi cấu trúc)?\r\n', 'Volume', 'Variety', ' Velocity', 'Value', 'b', 'mcq', ''),
(231, 25, 'Khi một hệ thống phân tích dữ liệu giúp doanh nghiệp tăng 20% lợi nhuận, đó là minh chứng cho đặc trưng nào?\r\n', 'Veracity', ' Volume', 'Value', 'Velocity', 'c', 'mcq', ''),
(232, 26, 'Phân tích dữ liệu là quá trình gì?\r\n', 'Kiểm tra, làm sạch, chuyển đổi và mô hình hóa dữ liệu để tìm thông tin hữu ích.', 'Xóa bỏ hoàn toàn dữ liệu cũ để nhập dữ liệu mới.', 'Chỉ đơn thuần là việc vẽ biểu đồ.', 'Việc lưu trữ dữ liệu vào ổ cứng.', 'a', 'mcq', ''),
(233, 26, 'Quy trình \"Phát hiện tri thức\" (KDD) bao gồm bước nào sau đây?\r\n', 'Chỉ bao gồm thu thập dữ liệu.', ' Trích xuất tri thức từ dữ liệu (bao gồm khai phá dữ liệu).', 'Chỉ bao gồm việc bán dữ liệu.', 'Việc soạn thảo văn bản.', 'b', 'mcq', ''),
(234, 26, 'Khai phá dữ liệu (Data Mining) nằm ở vị trí nào?\r\n', 'Là bước đầu tiên của thu thập dữ liệu.', ' Là một bước trọng tâm trong quy trình phát hiện tri thức.', 'Là bước sau khi đã có tri thức.', ' Không liên quan đến khoa học dữ liệu.', 'b', 'mcq', '');
INSERT INTO `questions` (`id`, `quiz_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `type`, `matching_pairs`) VALUES
(235, 26, 'Kỹ thuật \"Phân loại\" (Classification) giúp ích gì?\r\n', 'Xếp dữ liệu vào các nhóm đã được xác định từ trước.', 'Chia dữ liệu thành các phần bằng nhau về kích thước.', 'Xóa các dữ liệu bị lỗi.', 'Tăng tốc độ đường truyền mạng.', 'a', 'mcq', ''),
(236, 26, ' Đâu là ví dụ của kỹ thuật Phân loại?\r\n', 'Việc thay đổi mật khẩu máy tính.', 'Việc đếm số lượng học sinh trong lớp.', 'Việc sao lưu dữ liệu sang USB.', 'Hệ thống tự động phân loại email là \"Thư rác\" hoặc \"Thư thường\".', 'd', 'mcq', ''),
(237, 26, 'Kỹ thuật \"Phân cụm\" (Clustering) khác Phân loại ở điểm nào?\r\n', 'Phân cụm cần biết trước tên các nhóm.', ' Phân cụm chạy chậm hơn phân loại.', ' Phân cụm tự động nhóm các đối tượng tương tự nhau mà không cần biết trước tên nhóm.', 'Phân cụm chỉ dùng cho dữ liệu hình ảnh.', 'c', 'mcq', ''),
(238, 26, 'Phân tích dự đoán (Predictive Analytics) nhằm mục đích gì?\r\n', ' Xem lại những gì đã xảy ra trong quá khứ.', 'Xóa các dữ liệu không cần thiết.', 'Sử dụng dữ liệu lịch sử để dự báo những gì có thể xảy ra trong tương lai.', 'Chỉnh sửa định dạng file.', 'c', 'mcq', ''),
(239, 26, 'Trong khai phá dữ liệu, người ta thường dùng phương pháp giao thoa giữa hai lĩnh vực nào?', 'Vật lý và Hóa học.', 'Học máy (Machine Learning) và Thống kê.', 'Văn học và Lịch sử.', ' Đồ họa và Âm nhạc.', 'b', 'mcq', ''),
(240, 26, 'Việc phân tích dữ liệu bán hàng để tìm ra xu hướng mua sắm của khách hàng vào dịp Tết là ví dụ của:\r\n', 'Làm sạch dữ liệu.', ' Nhập liệu.', 'Phát hiện tri thức.', 'Lưu trữ dữ liệu.', 'c', 'mcq', ''),
(241, 26, 'Mục tiêu cuối cùng của phân tích dữ liệu là để:\r\n', 'Có thật nhiều ổ cứng.', 'Đưa ra các kết luận, dự đoán phục vụ ra quyết định.', 'Làm đẹp giao diện phần mềm.', 'Giúp máy tính chạy nhanh hơn.', 'b', 'mcq', ''),
(242, 27, 'Tại sao con người không thể phân tích dữ liệu lớn bằng cách thủ công?\r\n', 'Vì con người không thích làm việc.', 'Vì khối lượng dữ liệu quá khổng lồ và tốc độ thay đổi quá nhanh.', 'Vì dữ liệu lớn không có chữ viết.', 'Vì dữ liệu lớn chỉ nằm trên internet.', 'b', 'mcq', ''),
(243, 27, 'Vai trò chính của máy tính trong Khoa học dữ liệu là gì?\r\n', 'Chỉ để trang trí văn phòng.', 'Thay thế hoàn toàn con người trong việc đưa ra ý tưởng.', 'Công cụ thiết yếu để lưu trữ, quản lý và xử lý lượng dữ liệu khổng lồ.', 'Chỉ dùng để kết nối mạng.', 'c', 'mcq', ''),
(244, 27, '\"Siêu máy tính\" (Supercomputer) hỗ trợ gì cho dữ liệu lớn?\r\n', 'Có tốc độ hàng nghìn tỷ phép tính/giây để xử lý các thuật toán phức tạp.', 'Giúp học sinh chơi game mượt hơn.', 'Có màn hình lớn hơn máy tính thường.', 'Dùng để soạn thảo văn bản nhanh hơn.', 'a', 'mcq', ''),
(245, 27, 'Thuật toán song song (Parallel Computing) là gì?', 'Thực hiện nhiều phép tính/tiến trình đồng thời để tăng tốc độ xử lý.', 'Chạy hai máy tính cạnh nhau.', 'Việc copy dữ liệu từ máy này sang máy khác.', ' Thuật toán chỉ dùng cho các phép tính cộng.', 'a', 'mcq', ''),
(246, 27, 'Việc triển khai tính toán trên \"máy tính cụm\" (Cluster) giúp giải quyết vấn đề gì?\r\n\r\n', 'Làm cho máy tính nhỏ gọn hơn.', 'Tận dụng sức mạnh của nhiều máy tính kết nối lại để xử lý dữ liệu lớn.', 'Tiết kiệm tiền mua máy tính.', 'Giúp máy tính bền hơn.', 'b', 'mcq', ''),
(247, 27, 'Thành phần nào của máy tính giúp lưu trữ hàng Petabyte dữ liệu?', 'Các hệ thống ổ đĩa và bộ nhớ dung lượng cực lớn.', 'Màn hình máy tính.', 'Bộ loa máy tính.', 'Chuột và bàn phím.', 'a', 'mcq', ''),
(248, 27, 'Tại sao thuật toán ưu việt lại quan trọng hơn một thuật toán thông thường?', 'Vì nó giúp tìm ra tri thức chính xác hơn và tiết kiệm thời gian, tài nguyên.', 'Vì nó dễ viết hơn.', 'Vì nó luôn luôn miễn phí.', 'Vì nó không cần máy tính để chạy.', 'a', 'mcq', ''),
(249, 27, 'Trong một dự án Khoa học dữ liệu, máy tính cần thiết ở giai đoạn nào?\r\n', ' Chỉ giai đoạn thu thập.', ' Chỉ giai đoạn phân tích.', ' Chỉ giai đoạn chuẩn bị.', ' Tất cả các giai đoạn từ thu thập, chuẩn bị đến phân tích.', 'd', 'mcq', ''),
(250, 27, 'Thuật toán song song thường được triển khai trên môi trường nào?\r\n', 'Máy tính bỏ túi.', 'Các hệ thống máy tính cụm hoặc siêu máy tính.', 'Máy nghe nhạc.', 'Đồng hồ thông minh.', 'b', 'mcq', ''),
(251, 27, 'Kết quả của việc kết hợp máy tính mạnh và thuật toán ưu việt là gì?\r\n', ' Làm cho dữ liệu lớn biến mất.', ' Khiến con người không cần học tin học nữa.', 'Phát hiện được tri thức hữu ích từ khối dữ liệu khổng lồ trong thời gian ngắn.', 'Làm cho internet nhanh hơn.', 'c', 'mcq', ''),
(252, 28, 'Định nghĩa phỏng? \r\n', 'Là việc quay video lại một hiện tượng thực tế. ', 'Là phương pháp dùng mô hình toán học và máy tính để bắt chước hoạt động của một hệ thống thực. ', 'Là quá trình chụp ảnh các hành tinh trong hệ Mặt Trời. ', 'Là việc vẽ lại sơ đồ cấu tạo của một thiết bị.', 'b', 'mcq', ''),
(253, 28, 'Tại sao người ta thường sử dụng mô phỏng trong nghiên cứu khoa học và kỹ thuật? \r\n', 'Vì mô phỏng luôn cho kết quả chính xác 100% so với thực tế. ', 'Để thay thế hoàn toàn các thí nghiệm thực tế. ', 'Vì thực hiện thí nghiệm thực tế có thể nguy hiểm, tốn kém hoặc không thể thực hiện được. ', 'Vì phần mềm mô phỏng luôn miễn phí. ', 'c', 'mcq', ''),
(254, 28, 'Trong lĩnh vực hàng không, mô phỏng được ứng dụng chủ yếu để làm gì? \r\n', ' Để hành khách xem giải trí trên máy bay. ', 'Để phi công tập lái trong buồng lái giả lập mà không sợ gây tai nạn thật. ', 'Để tính toán giá vé máy bay tự động.', 'Để thay thế đội ngũ tiếp viên hàng không. ', 'b', 'mcq', ''),
(255, 28, 'Phần mềm mô phỏng giúp con người quan sát các hiện tượng thiên văn (như Nhật thực, Nguyệt thực) có lợi ích gì? \r\n', ' Giúp quan sát các hiện tượng xảy ra trong thời gian dài chỉ trong vài phút.', 'Giúp thay đổi quỹ đạo của các hành tinh.', 'Giúp biến các hành tinh thành vật thể thật trên Trái Đất. ', 'Giúp chúng ta điều khiển được Mặt Trời.', 'a', 'mcq', ''),
(256, 28, 'Trong lĩnh vực Y tế, mô phỏng giúp bác sĩ điều gì?\r\n', 'Thay thế hoàn toàn việc khám bệnh trực tiếp.', 'Thực hành phẫu thuật trên mô hình ảo trước khi thực hiện trên bệnh nhân.', 'Tự động chữa khỏi mọi bệnh tật mà không cần dùng thuốc. ', 'Giảm thời gian học tập của sinh viên y khoa xuống còn 1 năm.', 'b', 'mcq', ''),
(257, 28, 'Đặc điểm quan trọng nhất của một phần mềm mô phỏng hiệu quả là gì? ', ' Có âm thanh và nhạc nền hay. ', 'Có giao diện nhiều màu sắc sặc sỡ. ', 'Phải tuân theo các quy luật vật lý và logic của hệ thống thực tế. ', 'Phải chạy được trên tất cả các loại điện thoại cũ. ', 'c', 'mcq', ''),
(258, 28, 'Đâu là một ví dụ về mô phỏng trong lĩnh vực quân sự? \r\n', 'Xem phim tài liệu về lịch sử chiến tranh. ', 'Sử dụng mạng xã hội để liên lạc giữa các đơn vị.', 'Đọc tin tức về quân sự trên báo chí.', 'Diễn tập chiến thuật trên sa bàn số hoặc hệ thống thực tế ảo. ', 'd', 'mcq', ''),
(259, 28, 'Việc dự báo đường đi của bão bằng máy tính được gọi là gì? \r\n', 'Mô phỏng hiện tượng thời tiết. ', 'Chụp ảnh thời tiết từ vệ tinh.', 'Vẽ bản đồ hành chính địa phương.', ' Trò chơi điện tử về thiên tai.', 'a', 'mcq', ''),
(260, 28, 'Khi sử dụng phần mềm Solar System 3D Simulator, lợi ích lớn nhất đối với học sinh là gì? \r\n', 'Giúp học sinh thuộc lòng tên các hành tinh nhanh nhất. ', 'Giúp học sinh tương tác, xoay chuyển và quan sát hệ Mặt Trời ở những góc độ không thể thấy bằng mắt thường. ', 'Giúp học sinh học tiếng Anh chuyên ngành thiên văn.', '. Giúp máy tính của học sinh chạy nhanh hơn.', 'b', 'mcq', ''),
(261, 28, 'Nhận định nào sau đây là SAI về mô phỏng? \r\n', ' Mô phỏng giúp tiết kiệm chi phí thử nghiệm.', 'Mô phỏng giúp con người chuẩn bị tốt hơn cho các tình huống khẩn cấp. ', 'Mô phỏng có thể thay thế hoàn toàn mọi trải nghiệm trong cuộc sống thực. ', 'Mô phỏng là công cụ đắc lực trong giáo dục hiện đại. ', 'c', 'mcq', ''),
(262, 29, 'Lĩnh vực nào sử dụng mô phỏng để giúp con người tránh rủi ro tính mạng khi đào tạo vận hành thiết bị đắt tiền? \r\n', 'Nghiên cứu lý thuyết văn học. ', 'Hàng không (huấn luyện phi công trong buồng lái giả lập). ', ' Quản lý văn thư lưu trữ. ', 'Sáng tác âm nhạc và hội họa.', 'b', 'mcq', ''),
(263, 29, 'Trong lĩnh vực giáo dục, mô phỏng: \r\n', 'Giúp học sinh hiểu rõ hơn về các hiện tượng khoa học mà khó quan sát thực tế. ', 'Chỉ được sử dụng trong các môn khoa học tự nhiên. ', 'Làm tăng chi phí dạy học đáng kể. ', 'Chỉ hỗ trợ giáo viên, không có phần mềm cho học sinh.', 'a', 'mcq', ''),
(264, 29, 'Trong nghiên cứu kỹ thuật, thử nghiệm va chạm xe ô tô bằng mô phỏng giúp:', 'Tăng tốc độ tối đa của xe trên đường thực tế. ', 'Thay đổi màu sơn xe tự động theo thời tiết. ', 'Đánh giá độ an toàn của xe mà không cần phá hủy nhiều xe thật.', 'Giảm hoàn toàn các vụ tai nạn giao thông ngoài đời thực.', 'c', 'mcq', ''),
(265, 29, 'Ứng dụng mô phỏng nào giúp dự báo đường đi của bão dựa trên dữ liệu khí tượng? \r\n', ' Mô phỏng thị trường chứng khoán toàn cầu. ', 'Mô phỏng khí tượng và dự báo thời tiết.', 'Mô phỏng quá trình lắp ráp linh kiện điện tử. ', ' Mô phỏng thiết kế nội thất công trình.', 'b', 'mcq', ''),
(266, 29, 'Tại sao mô phỏng lại cực kỳ quan trọng trong đào tạo Y tế (phẫu thuật)?\r\n', 'Giúp bác sĩ không cần học các kiến thức về giải phẫu. ', ' Giúp thay thế hoàn toàn bác sĩ bằng các robot tự vận hành. ', ' Làm cho tất cả các loại thuốc trở nên miễn phí. ', 'Cho phép bác sĩ thực hành trên mô hình ảo trước khi thực hiện trên cơ thể người.', 'd', 'mcq', ''),
(267, 29, ' Lợi ích chính của diễn tập ảo trong lĩnh vực quân sự là: \r\n', 'Tiết kiệm chi phí đạn dược, nhiên liệu và đảm bảo an toàn cho binh sĩ. ', 'Giúp binh sĩ có thêm thời gian giải trí với máy tính.', 'Thay thế hoàn toàn các hoạt động rèn luyện thể lực.', 'Giúp quân đội không cần bảo trì các loại vũ khí thật.', 'a', 'mcq', ''),
(268, 29, 'Ứng dụng mô phỏng Hệ Mặt Trời (Solar System Simulator) thuộc lĩnh vực nào? ', 'Thiết kế hạ tầng giao thông đô thị.', 'Thiên văn học và giáo dục khoa học. ', 'Nghiên cứu sinh học tế bào.', 'Quản lý tài chính doanh nghiệp.', 'b', 'mcq', ''),
(269, 29, 'Trong xây dựng, mô phỏng tác động của động đất lên tòa nhà cao tầng giúp: \r\n', ' Làm cho tòa nhà có màu sắc đẹp mắt hơn. ', 'Kiểm tra độ bền và khả năng chịu lực của cấu trúc công trình. ', 'Xóa bỏ hoàn toàn chi phí mua nguyên vật liệu xây dựng. ', 'Rút ngắn thời gian xin giấy phép xây dựng.', 'b', 'mcq', ''),
(270, 29, 'Khi mô phỏng hệ thống giao thông phức tạp, mục đích chính là: \r\n', ' Tự động thu phí tất cả các phương tiện trên đường.', 'Làm cho tất cả các xe đều chạy với tốc độ bằng nhau.', 'Tìm ra các điểm nghẽn và tối ưu hóa thời gian đèn tín hiệu.', 'Thay thế toàn bộ biển báo giao thông bằng màn hình LED.', 'c', 'mcq', ''),
(271, 29, 'Điểm chung của phần mềm mô phỏng trong các lĩnh vực là: \r\n', 'Tất cả đều là các trò chơi điện tử để giải trí. ', 'Chỉ chạy được trên các máy siêu máy tính của chính phủ.', 'Luôn luôn cho kết quả sai lệch hoàn toàn so với thực tế. ', 'Sử dụng máy tính để bắt chước thực tế nhằm nghiên cứu, dự đoán hoặc đào tạo.', 'd', 'mcq', ''),
(272, 30, 'Điểm đặc biệt nhất giúp GeoGebra khác biệt với các phần mềm vẽ hình thông thường là gì? ', 'Chỉ dùng để tính toán số học. ', 'Khả năng kết hợp chặt chẽ giữa hình học và biểu thức đại số ', 'Chỉ có thể sử dụng trên máy tính để bàn. ', 'Là phần mềm trả phí rất đắt tiền.', 'b', 'mcq', ''),
(273, 30, 'GeoGebra tích hợp những lĩnh vực toán học nào trong một gói phần mềm duy nhất?\r\n', 'Hình học, Đại số, Bảng tính. ', 'Đồ thị, Thống kê, Giải tích. ', 'Chỉ hình học phẳng và hình học không gian.', 'Tất cả các phương án trên ', 'd', 'mcq', ''),
(274, 30, 'Trong GeoGebra, điều gì xảy ra khi bạn thay đổi một đối tượng hình học trên màn hình? \r\n', 'Biểu thức đại số tương ứng vẫn giữ nguyên. ', 'Biểu thức đại số tương ứng sẽ tự động thay đổi để phản ánh sự biến đổi đó. ', 'Phần mềm sẽ báo lỗi và yêu cầu vẽ lại.', ' Hình vẽ sẽ biến mất.', 'b', 'mcq', ''),
(275, 30, 'Công cụ \"Graphic Calculator\" trong GeoGebra hỗ trợ tốt nhất cho việc gì? \r\n', 'Vẽ các hình khối 3D phức tạp.', 'Vẽ đồ thị hàm số và phân tích các thông số như cực trị, giao điểm. ', 'Đo độ dài đoạn thẳng trong thực tế.', 'Soạn thảo văn bản toán học.', 'b', 'mcq', ''),
(276, 30, 'Lợi ích của tính năng \"GeoGebra Geometry\" đối với việc học hình học là gì? ', 'Giúp học sinh vẽ hình nhanh hơn vẽ tay.', 'Có sẵn các hình vẽ để học sinh chép vào vở. ', 'Cho phép di chuyển các thành phần để quan sát sự thay đổi và khám phá các quy luật hình học. ', 'Tự động làm bài tập về nhà cho học sinh.', 'c', 'mcq', ''),
(277, 30, 'Khi sử dụng \"3D Graphing Calculator\", thao tác nào giúp người dùng hình dung các hàm số không gian tốt nhất?\r\n', 'Chỉ nhìn cố định vào màn hình từ một phía', 'Tự do xoay, di chuyển và phóng to/thu nhỏ đồ thị trong không gian 3 chiều.', 'Nhập lại phương trình nhiều lần.', 'Chụp ảnh màn hình.', 'b', 'mcq', ''),
(278, 30, 'Để kiểm tra xem một hình hình học đã được dựng đúng quy luật hay chưa, thao tác nào là quan trọng nhất? \r\n', 'Di chuyển các điểm, đoạn thẳng để quan sát sự thay đổi tương ứng (tính động). ', 'Dùng thước kẻ đo lại trên màn hình máy tính. ', 'Nhìn bằng mắt thường xem hình có đẹp không. ', 'Lưu file và mở lại nhiều lần.', 'a', 'mcq', ''),
(279, 30, 'Giao diện của phần mềm GeoGebra được đánh giá như thế nào? \r\n', 'Trực quan, dễ sử dụng, các công cụ được sắp xếp logic phù hợp cho cả người mới. ', 'Rất phức tạp, chỉ dành cho chuyên gia toán học. ', 'Chỉ toàn là các dòng lệnh khô khan. ', 'Khó tiếp cận, cần rất nhiều thời gian để làm quen.', 'a', 'mcq', ''),
(280, 30, 'Tính năng nào của GeoGebra giúp người học hiểu rõ hơn các khái niệm trừu tượng? \r\n', 'Tính năng lưu trữ và chia sẻ file. ', 'Tính năng đo lường diện tích và độ dài. ', ' Sự kết hợp giữa biểu thức đại số và hình ảnh trực quan.', 'Giao diện thân thiện và màu sắc đa dạng.', 'c', 'mcq', ''),
(281, 30, ' Tại sao GeoGebra được coi là công cụ hỗ trợ đắc lực cho việc tự học toán?', 'Vì nó thay thế hoàn toàn vai trò của giáo viên.', 'Vì nó tạo môi trường tương tác giúp học sinh tự khám phá, trải nghiệm và hiểu sâu kiến thức.', 'Vì nó giúp học sinh không cần học lý thuyết nữa. ', 'Vì nó có thể giải được mọi bài toán trên thế giới một cách tự động.', 'b', 'mcq', ''),
(282, 31, 'Mục đích chính của công cụ What-If Analysis trong Excel là gì? \r\n', 'Để trang trí bảng tính và định dạng màu sắc.', 'Để thử nghiệm các giá trị đầu vào khác nhau và quan sát sự thay đổi của kết quả. ', ' Để xóa các dữ liệu bị trùng lặp trong bảng. ', 'Để bảo vệ file Excel không cho người khác truy cập.', 'b', 'mcq', ''),
(283, 31, 'Trong hàm PMT, tham số \"rate\" cần lưu ý điều gì nếu thanh toán theo tháng? ', 'Giữ nguyên lãi suất theo năm của ngân hàng. ', ' Phải lấy lãi suất năm chia cho 12 để ra lãi suất theo tháng. ', 'Lấy lãi suất năm nhân với 12. ', ' Chỉ cần nhập số tiền gốc cần vay.', 'b', 'mcq', ''),
(284, 31, 'Công cụ \"Goal Seek\" được sử dụng hiệu quả nhất trong trường hợp nào? \r\n', 'Khi muốn xem kết quả của 10 mức lãi suất khác nhau cùng lúc.', ' Khi đã biết kết quả mục tiêu và cần tìm giá trị đầu vào tương ứng. ', 'Khi cần tính tổng tất cả các cột dữ liệu. ', 'Khi muốn tạo biểu đồ hình cột.', 'b', 'mcq', ''),
(285, 31, ' Khi sử dụng hàm PMT, tham số \"nper\" đại diện cho điều gì? \r\n', ' Lãi suất hàng tháng. ', 'Số tiền gốc đang vay. ', 'Tổng số kỳ hạn thanh toán trong suốt quá trình vay. ', 'Giá trị còn lại của tài sản sau khi vay.', 'c', 'mcq', ''),
(286, 31, 'Công cụ nào của What-If Analysis cho phép hiển thị một bảng so sánh kết quả khi thay đổi 1 hoặc 2 biến đầu vào? \r\n', ' Scenario Manager', ' Goal Seek. ', ' Data Table. ', ' Solver.', 'c', 'mcq', ''),
(287, 31, 'Nếu kết quả hàm PMT hiển thị giá trị âm (màu đỏ trong ngoặc), điều này có ý nghĩa gì trong tài chính? \r\n', ' Đó là dòng tiền chi ra (số tiền bạn phải trả đi).', 'Phép tính bị lỗi công thức. ', 'Lãi suất đang ở mức âm. ', 'Ngân hàng đang nợ lại bạn tiền.', 'a', 'mcq', ''),
(288, 31, 'Điểm khác biệt lớn nhất của Scenario Manager so với Goal Seek là gì? \r\n', ' Scenario Manager chỉ tính được các phép nhân', 'Scenario Manager có thể lưu và so sánh nhiều nhóm kịch bản đầu vào khác nhau cùng lúc.', 'Scenario Manager dùng để vẽ đồ thị 3D. ', 'Scenario Manager không cần dùng đến công thức.', 'b', 'mcq', ''),
(289, 31, 'Để tìm ra \"Lãi suất tối đa tôi có thể chịu được nếu mỗi tháng chỉ trả được 10 triệu\", bạn nên dùng công cụ nào?\r\n', 'Data Table. ', 'Sort & Filter.', 'Goal Seek.', 'Sum và Average.', 'c', 'mcq', ''),
(290, 31, 'Trong một \"Bảng dữ liệu 2 biến\" (Data Table), các biến đầu vào thường được sắp xếp như thế nào? \r\n', 'Nằm chồng lên nhau trong cùng một ô. ', 'Một biến nằm theo hàng (Row input) và một biến nằm theo cột (Column input). ', 'Nằm ở hai trang tính (Sheet) khác nhau. ', 'Chỉ hiển thị kết quả dưới dạng biểu đồ tròn.', 'b', 'mcq', ''),
(291, 31, 'Việc trích xuất thông tin từ dữ liệu đầu vào giúp ích gì cho con người? \r\n', 'Giúp lưu trữ dữ liệu gọn gàng hơn. ', 'Giúp máy tính chạy nhanh hơn. ', 'Giúp đưa ra các quyết định chính xác dựa trên các dự báo khoa học. ', ' Giúp chuyển đổi file Excel sang PDF dễ dàng.', 'c', 'mcq', ''),
(292, 32, 'Forecast Sheet trong Excel dùng để làm gì?\r\n', 'Tạo bảng tính thông thường', 'Dự báo dữ liệu dựa trên dữ liệu theo thời gian', 'Lọc dữ liệu', 'Tạo biểu đồ hình tròn', 'b', 'mcq', ''),
(293, 32, 'Forecast Sheet thuộc nhóm công cụ nào sau đây?\r\n', 'Hàm tính toán', 'Công cụ trực quan', 'Công cụ định dạng văn bản', ' Công cụ vẽ hình', 'b', 'mcq', ''),
(294, 32, 'Dữ liệu phù hợp để sử dụng Forecast Sheet là:\r\n', 'Dữ liệu văn bản', ' Dữ liệu hình ảnh', 'Dữ liệu theo thời gian', 'Dữ liệu ngẫu nhiên không thứ tự', 'c', 'mcq', ''),
(295, 32, 'Forecast Sheet tạo ra kết quả nào sau đây?\r\n', 'Chỉ một giá trị dự báo', 'Chỉ bảng dữ liệu', 'Chỉ biểu đồ', 'Bảng dự báo và biểu đồ', 'd', 'mcq', ''),
(296, 32, 'Cột dữ liệu nào là bắt buộc khi sử dụng Forecast Sheet?\r\n', ' Cột tên', 'Cột thời gian', 'Cột ghi chú', 'Cột văn bản', 'b', 'mcq', ''),
(297, 32, 'Forecast Sheet giúp người dùng không cần làm việc nào sau đây?\r\n', ' Nhập dữ liệu', 'Quan sát biểu đồ', 'Viết công thức dự báo', 'Phân tích kết quả', 'c', 'mcq', ''),
(298, 32, 'Kết quả dự báo của Forecast Sheet có đặc điểm gì?\r\n', 'Luôn chính xác tuyệt đối', 'Mang tính ước lượng', 'Không phụ thuộc dữ liệu cũ', ' Không thay đổi theo dữ liệu', 'b', 'mcq', ''),
(299, 32, 'Forecast Sheet thường được sử dụng trong lĩnh vực nào?\r\n', 'Thiết kế đồ họa', ' Khoa học dữ liệu', 'Soạn thảo văn bản', 'Lập trình hệ thống', 'b', 'mcq', ''),
(300, 32, 'So với hàm FORECAST, Forecast Sheet có ưu điểm gì?\r\n', 'Phức tạp hơn', 'Cần nhớ cú pháp', ' Trực quan và dễ sử dụng', 'Chỉ dùng cho chuyên gia', 'c', 'mcq', ''),
(301, 32, 'Mục đích chính của Forecast Sheet trong học tập là gì?', 'Trang trí bảng tính', 'Giải trí', 'Phân tích và dự đoán xu hướng dữ liệu', 'Tạo văn bản', 'c', 'mcq', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `quizzes`
--

INSERT INTO `quizzes` (`id`, `lesson_id`, `title`, `created_by`, `created_at`) VALUES
(2, NULL, 'BÀI 1: CŨNG CỐ_TÌM HIỂU VỀ THẺ HTML ', NULL, '2025-12-20 14:17:43'),
(3, NULL, 'BÀI 1:CŨNG CỐ _Tìm hiểu về các phần mềm soạn thảo HTML ', NULL, '2025-12-20 15:28:56'),
(4, NULL, 'Bài 3: Hoạt động 2_Phần 1: Danh sách', NULL, '2026-01-01 15:02:55'),
(5, NULL, 'Bài 3: Hoạt động 2_Phần 2: Bảng', NULL, '2026-01-01 15:13:29'),
(6, NULL, 'Bài 4: Hoạt động 2_Phần 1: siêu liên kết', NULL, '2026-01-01 16:11:13'),
(7, NULL, 'Bài 4: Hoạt động 2_Phần 2: các loại liên kết', NULL, '2026-01-01 16:19:56'),
(8, NULL, 'Bài 5: Hoạt động 2_Phần 1', NULL, '2026-01-02 21:37:15'),
(9, NULL, 'Bài 5: Hoạt động 2_Phần 2', NULL, '2026-01-02 21:43:41'),
(10, NULL, 'Bài 5: Hoạt động 2_Phần 3', NULL, '2026-01-02 21:49:36'),
(11, NULL, 'Bài 6: Hoạt động 2_Phần 1', NULL, '2026-01-03 22:16:49'),
(12, NULL, 'Bài 6: Hoạt động 2_Phần 2', NULL, '2026-01-03 22:27:44'),
(13, NULL, 'Bài 6: Hoạt động2_Phần 3', NULL, '2026-01-03 22:36:01'),
(14, NULL, 'Bài 8: Hoạt động 2_Phần 2 ', NULL, '2026-01-03 23:14:07'),
(15, NULL, 'Bài 9: Hoạt động 1', NULL, '2026-01-03 23:25:55'),
(16, NULL, 'Bài 2: Hoạt động 2_Phần 2', NULL, '2026-01-04 12:10:55'),
(17, NULL, 'Bài 10: Hoạt động 3_Phần 1 ', NULL, '2026-01-04 12:33:39'),
(18, NULL, 'Bài 11: Hoạt động 2_Phần 1', NULL, '2026-01-04 13:06:32'),
(19, NULL, 'Bài 11: Hoạt động 2_Phần 3', NULL, '2026-01-04 13:24:57'),
(20, NULL, 'Bài 12: Hoạt động 2', NULL, '2026-01-04 14:13:31'),
(21, NULL, 'Bài 1: Hoạt động 2_Phần 1 (CS)', NULL, '2026-01-05 18:41:13'),
(22, NULL, 'Bài 1: Hoạt động 2_Phần 2 (CS)', NULL, '2026-01-05 18:47:51'),
(23, NULL, 'Bài 1: Hoạt động 3 (CS)', NULL, '2026-01-05 19:06:17'),
(24, NULL, 'Bài 2: Hoạt động 2_Phần 1 (CS)', NULL, '2026-01-07 18:16:10'),
(25, NULL, ' Bài 3: Hoạt động 2_Phần 1 (CS)', NULL, '2026-01-07 18:38:21'),
(26, NULL, 'Bài 3: Hoạt động 2_Phần 2 (CS)', NULL, '2026-01-08 14:19:37'),
(27, NULL, ' Bài 3: Hoạt động 2_Phần 3 (CS)', NULL, '2026-01-08 14:24:26'),
(28, NULL, 'Bài 5: Hoạt động 1_Phần 1(CS)', NULL, '2026-01-08 14:55:09'),
(29, NULL, 'Bài 5: Hoạt động 2_Phần 2(CS)', NULL, '2026-01-08 15:09:02'),
(30, NULL, 'Bài 6: Hoạt động 1', NULL, '2026-01-08 15:24:32'),
(31, NULL, 'Bài 4: Hoạt động 2_Phần 1 (CS)', NULL, '2026-01-12 17:29:56'),
(32, NULL, 'Bài 4: Hoạt động 2_Phần 2 (CS)', NULL, '2026-01-12 17:36:25'),
(33, NULL, 'Trắc nghiệm Bài 1', NULL, '2026-03-17 09:56:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_option` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `score` float NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_questions` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quiz_results`
--

INSERT INTO `quiz_results` (`id`, `user_id`, `quiz_id`, `score`, `submitted_at`, `total_questions`) VALUES
(2, 2, 2, 8, '2025-12-22 01:57:29', 0),
(3, 2, 23, 8.75, '2026-01-05 12:36:26', 8),
(4, 4, 23, 6.25, '2026-01-07 11:03:05', 8),
(5, 5, 11, 2, '2026-03-05 01:02:04', 10),
(6, 7, 9, 3, '2026-03-15 04:06:10', 10),
(7, 2, 16, 7.5, '2026-03-15 04:11:20', 12),
(8, 7, 2, 6, '2026-03-17 02:32:11', 10),
(9, 17, 11, 10, '2026-03-23 07:02:29', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quiz_submissions`
--

CREATE TABLE `quiz_submissions` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `submitted_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `submissions`
--

CREATE TABLE `submissions` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_url` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `score` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `submissions`
--

INSERT INTO `submissions` (`id`, `lesson_id`, `activity_id`, `user_id`, `file_url`, `submitted_at`, `score`) VALUES
(17, 21, 299, 2, 'https://drive.google.com/drive/u/0/folders/1h5-_gRsfwF3mdohs2WrZPOd1JUiF8xBj', '2026-01-08 07:30:57', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `role` enum('teacher','student') DEFAULT NULL,
  `class_name` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`, `class_name`, `created_at`, `avatar`) VALUES
(1, 'Hồ Xuân Giang', 'tuyetanh.@gmail.com', '$2y$10$iybeOwQ1BIXvlNDS/H4rMuqHwlvf/YYGQu9yV3R4gsdf4VHRZfDSW', 'student', '12A1', '2025-11-13 14:14:07', NULL),
(2, 'Nguyễn Võ Tuyết Anh', 'tuyetanh.0867@gmail.com', '$2y$10$p3taV7.3Ru/SoDzX3mE6ZO21g1leBiCxNdOOAqZtFYQFI2o/O4YR2', 'teacher', NULL, '2025-11-13 14:15:53', NULL),
(3, 'Phùng Thị Tuyết Ngân', 'Ngan@gmail.com', '$2y$10$qTf9DcC2UJk5cIs/fl8OSu.c4.gXiHdEv1r532oyhf7v691ntjshy', 'student', NULL, '2025-11-14 09:03:03', NULL),
(4, 'Nguyễn Võ Đông Quỳnh', 'quynh@123gmail.com', '$2y$10$8iA/W7QxUICmy6MUz1nzR.zfw8w7f/FYeJ0CjFpmnbbC36tNK1aUy', 'student', '12A1', '2025-12-05 17:19:58', NULL),
(5, 'Nguyễn Thị Nguyệt', 'hs5@demo.com', '$2y$10$uM.YwhvWmXhav.Vou8hCVuN/F2LUTt0er/LYUJwjM51uUraVhDPMe', 'student', '12A2', '2026-03-05 08:00:15', NULL),
(6, 'Nguyễn Hoàng Anh', 'hs6@demo.com', '$2y$10$q4azod2uqgriE0ARwEAcq.RpaPI6y3UkhI2HOTe0dvUu8kWHAWNO2', 'student', '12A1', '2026-03-07 14:08:18', NULL),
(7, 'Nguyễn Văn An', '12101@truong.edu.vn', '$2y$10$rVZH1sSs5X11j/XhVS14TeUIk3F6tmqJdd/YY8oeewtVpqt6OBxoq', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(8, 'Trần Thị Bích', '12102@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(9, 'Lê Hoàng Cường', '12103@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(10, 'Phạm Minh Đức', '12104@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(11, 'Hoàng Thị Em', '12105@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(12, 'Nguyễn Võ Tuyết Mai', '12106@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(13, 'Đặng Hải Triều', '12107@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(14, 'Phùng Thanh Độ', '12108@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(15, 'Lê Quang Huy', '12109@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(16, 'Trần Tiểu Vy', '12110@truong.edu.vn', '$2y$10$uOEBZd1F.ye3hqLGG6J0/eqU4arQsHzEa25kJvwaWr4eR.X7LWaa.', 'student', '12A1', '2026-03-15 11:03:30', NULL),
(17, 'Vũ Văn Dũng', '12201@truong.edu.vn', '$2y$10$lMa5ckNIPzMS833RwyQLq.7KBnb63ktdnoYTx2XwtnBEMM.XCOwcq', 'student', '12A2', '2026-03-15 11:04:20', NULL),
(18, 'Đặng Thị Giang', '12202@truong.edu.vn', '$2y$10$3xJWCX7ZOeUON5MMAvwM4eJRgalR92VILaAa8t9BNthaVN2clibe2', 'student', '12A2', '2026-03-15 11:04:20', NULL),
(19, 'Bùi Văn Hải', '12203@truong.edu.vn', '$2y$10$3xJWCX7ZOeUON5MMAvwM4eJRgalR92VILaAa8t9BNthaVN2clibe2', 'student', '12A2', '2026-03-15 11:04:20', NULL),
(20, 'Đỗ Thị Hồng', '12204@truong.edu.vn', '$2y$10$3xJWCX7ZOeUON5MMAvwM4eJRgalR92VILaAa8t9BNthaVN2clibe2', 'student', '12A2', '2026-03-15 11:04:20', NULL),
(21, 'Ngô Văn Hùng', '12205@truong.edu.vn', '$2y$10$3xJWCX7ZOeUON5MMAvwM4eJRgalR92VILaAa8t9BNthaVN2clibe2', 'student', '12A2', '2026-03-15 11:04:20', NULL),
(22, 'Nguyễn Kim Anh', '12206@truong.edu.vn', '$2y$10$3xJWCX7ZOeUON5MMAvwM4eJRgalR92VILaAa8t9BNthaVN2clibe2', 'student', '12A2', '2026-03-15 11:04:20', NULL),
(23, 'Phạm Ngọc Thạch', '12207@truong.edu.vn', '$2y$10$3xJWCX7ZOeUON5MMAvwM4eJRgalR92VILaAa8t9BNthaVN2clibe2', 'student', '12A2', '2026-03-15 11:04:20', NULL),
(24, 'Lý Tiểu Long', '12208@truong.edu.vn', '$2y$10$3xJWCX7ZOeUON5MMAvwM4eJRgalR92VILaAa8t9BNthaVN2clibe2', 'student', '12A2', '2026-03-15 11:04:20', NULL),
(25, 'Dương Thị Hạnh', '12301@truong.edu.vn', '$2y$10$Rj1TF9VSwonrFbhJtVwRPOdSoAzdpLZmnBvRxtucOQcOJbFiT/.Je', 'student', '12A3', '2026-03-15 11:04:28', NULL),
(26, 'Lý Văn Khánh', '12302@truong.edu.vn', '$2y$10$Rj1TF9VSwonrFbhJtVwRPOdSoAzdpLZmnBvRxtucOQcOJbFiT/.Je', 'student', '12A3', '2026-03-15 11:04:28', NULL),
(27, 'Lương Thị Lan', '12303@truong.edu.vn', '$2y$10$Rj1TF9VSwonrFbhJtVwRPOdSoAzdpLZmnBvRxtucOQcOJbFiT/.Je', 'student', '12A3', '2026-03-15 11:04:28', NULL),
(28, 'Đoàn Văn Minh', '12304@truong.edu.vn', '$2y$10$X2tO7HTiK.7temdbRZllO.sIXKZaHyMXYqlpNJXFs1rKLVEfjcYye', 'student', '12A3', '2026-03-15 11:04:28', NULL),
(29, 'Võ Thị Ngọc', '12305@truong.edu.vn', '$2y$10$9Gy6/tuuKG5nRYPujE2l.uR2EPboazaYDeSnnpgsDL0YZzZSCbbtK', 'student', '12A3', '2026-03-15 11:04:28', NULL),
(30, 'Trương Trọng Thi', '12306@truong.edu.vn', '$2y$10$Rj1TF9VSwonrFbhJtVwRPOdSoAzdpLZmnBvRxtucOQcOJbFiT/.Je', 'student', '12A3', '2026-03-15 11:04:28', NULL),
(31, 'Đinh Phương Trình', '12307@truong.edu.vn', '$2y$10$Rj1TF9VSwonrFbhJtVwRPOdSoAzdpLZmnBvRxtucOQcOJbFiT/.Je', 'student', '12A3', '2026-03-15 11:04:28', NULL),
(32, 'Nguyễn Thị Lan', '12111@truong.edu.vn', '$2y$10$JStJNAMZveGZomo42fzaJeFfPWbXrh.hxljZYmkD9pvVMsGW3ERDu', 'student', '12A1', '2026-03-21 14:49:47', NULL),
(33, 'Nguyễn Ngọc Anh', '12112@truong.edu.vn', '$2y$10$99f.Zm3t4oBsszpYWuavB.8FgDzfKPnbIrHuEQcQ7qoHXn6rAgf8.', 'student', '12A1', '2026-03-21 15:05:34', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Chỉ mục cho bảng `activity_completions`
--
ALTER TABLE `activity_completions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`activity_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `forum_images`
--
ALTER TABLE `forum_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Chỉ mục cho bảng `forum_likes`
--
ALTER TABLE `forum_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `forum_replies`
--
ALTER TABLE `forum_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Chỉ mục cho bảng `forum_threads`
--
ALTER TABLE `forum_threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `forum_topics`
--
ALTER TABLE `forum_topics`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Chỉ mục cho bảng `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Chỉ mục cho bảng `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Chỉ mục cho bảng `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Chỉ mục cho bảng `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;

--
-- AUTO_INCREMENT cho bảng `activity_completions`
--
ALTER TABLE `activity_completions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `forum_images`
--
ALTER TABLE `forum_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `forum_likes`
--
ALTER TABLE `forum_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `forum_replies`
--
ALTER TABLE `forum_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `forum_threads`
--
ALTER TABLE `forum_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `forum_topics`
--
ALTER TABLE `forum_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT cho bảng `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `forum_images`
--
ALTER TABLE `forum_images`
  ADD CONSTRAINT `forum_images_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `forum_likes`
--
ALTER TABLE `forum_likes`
  ADD CONSTRAINT `forum_likes_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD CONSTRAINT `forum_posts_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `forum_threads` (`id`),
  ADD CONSTRAINT `forum_posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `forum_replies`
--
ALTER TABLE `forum_replies`
  ADD CONSTRAINT `forum_replies_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `forum_threads`
--
ALTER TABLE `forum_threads`
  ADD CONSTRAINT `forum_threads_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  ADD CONSTRAINT `forum_threads_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`);

--
-- Các ràng buộc cho bảng `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD CONSTRAINT `quiz_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_results_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `quiz_submissions`
--
ALTER TABLE `quiz_submissions`
  ADD CONSTRAINT `quiz_submissions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `quiz_submissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
