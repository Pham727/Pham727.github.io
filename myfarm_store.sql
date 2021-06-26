-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 25, 2021 lúc 11:14 AM
-- Phiên bản máy phục vụ: 10.4.16-MariaDB
-- Phiên bản PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `myfarm_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `idCat` int(11) NOT NULL,
  `nameCat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`idCat`, `nameCat`) VALUES
(1, 'trái cây'),
(2, 'rau củ'),
(3, 'đậu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `rating` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`idComment`, `content`, `ten`, `email`, `date`, `rating`, `idProduct`) VALUES
(1, 'Nón đẹp', 'quoc huy', 'kenbi.njr@gmail.com', '2021-03-01 20:06:37', 5, 1),
(2, 'Nón xịn quá', 'Trần Quốc Huy', 'huytqps11190@fpt.edu.vn', '2021-03-01 23:03:11', 3, 2),
(3, 'asd', 'asd', 'kenbi.njr@gmail.cm', '2021-03-01 22:32:55', 5, 4),
(4, 'Nón gì mắc vậy', 'Lê Gia Huy', 'lgh@gmail.com', '2021-03-01 22:41:28', 1, 3),
(5, 'Nón shoei quá đẹp', 'Quốc Huy', 'kenbi.njr@gmail.cm', '2021-03-01 22:43:02', 5, 2),
(6, 'Tôi thích màu xanh của nón <3 ', 'Biker', 'biker@gmail.com', '2021-03-01 23:34:15', 5, 28),
(7, 'Nón xấu mà mắc quá', 'Biker', 'biker@gmail.com', '2021-03-01 23:34:54', 1, 25);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `nameProduct` varchar(50) DEFAULT NULL,
  `amountProduct` int(11) DEFAULT NULL,
  `imgProduct` varchar(250) DEFAULT NULL,
  `priceProduct` double DEFAULT NULL,
  `desProduct` varchar(4000) DEFAULT NULL,
  `idCat` int(11) DEFAULT NULL,
  `showHide` tinyint(1) DEFAULT NULL,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`idProduct`, `nameProduct`, `amountProduct`, `imgProduct`, `priceProduct`, `desProduct`, `idCat`, `showHide`, `views`) VALUES
(1, 'Cà chua bi Đà Lạt', 1, 'ca_chua_bi.jpg', 20000, 'Cà chua bi thường có kích thước nhỏ, dáng tròn hoặc hơi thuôn dài, phần vỏ cà chua bi thường thấy nhất là 2 màu đỏ và vàng cam. Cà chua bị mang vị chua nhẹ và được đánh giá là ngọt hơn cà chua thường.\r\n\r\nCà chua bi giúp cung cấp dinh dưỡng cho cơ thể và chúng còn được sử dụng để làm đẹp da. Giúp xóa các vết nám, tàn nhan đen trên mặt. Giúp chống lão hoá và phòng chống ung thư.\r\nKính chắn gió  trong suốt ngoài và kính râm chống nắng bên trong làm từ polycarbonate chống trầy xước, chống sương mù, chống 100% tia UV.', 1, 1, 100),
(2, 'Đu đủ', 10, 'du_du.jpg', 15000, 'Các đặc tính khí động học được tối đa hóa thông qua hệ thống thông gió rộng rãi.\r\nLớp lót EPS đa mật độ hai lớp giúp tăng cường khả năng hấp thụ và thông gió\r\nBốn kích cỡ vỏ và năm lớp lót EPS có các tùy chọn phù hợp tăng giúp thoải mái phù hợp với hầu hết các kích cỡ đầu', 1, 1, 5),
(3, 'Cherry', 10, 'cherry.jpg', 50000, 'Trái cherry người ta không chỉ ấn tượng về màu đỏ căng bóng cực hấp dẫn mà đọ giòn vị ngọt thanh, thoảng chút vị chua cùng mùi hương thơm ngon còn khiến người ta phải liên tục “nuốt nước bọt”.', 1, 1, 50),
(4, 'Dâu tây', 5, 'dau_tay.jpg', 70000, 'Dâu tây Đà Lạt thường được dùng để ăn tươi, vị chua chua, ngọt ngọt thanh mát thật sự rất quyến rũ là món tráng miệng được ưa thích vô cùng.\r\n\r\nNgoài ra với hương vị đặc chưng và màu sắc tươi sáng của mình dâu tây Đà Lạt còn rất ngon ở những món : hoa quả dầm, sữa chua, yaourt, làm siro, sinh tố hay thậm trí làm nhân bánh, làm mứt cũng đều hấp dẫn cả.\r\n\r\nĐặc biệt chị em rất thích đắp mặt bằng những lát dâu tây mỏng,làm đẹp da thải loại tế bào chết.', 1, 1, 0),
(5, 'Cà rốt', 2, 'ca_rot.jpg', 10000, 'Với hàm lượng chất chống oxy hóa, beta carotene, các vitamin và khoáng chất dồi dào, cà rốt được xem là một trong những thực phẩm cực tốt cho sức khỏe chúng ta. Cà rốt làm tốt vai trò cải thiện thị lực, ngăn chặn tế bào ung thư, tốt cho bệnh tiểu đường, làm đẹp da, giữ dáng thậm chí còn được sử dụng để làm vắc xin chống lại virus HIV.', 2, 1, 0),
(6, 'Cải xanh', 3, 'cai_xanh.jpg', 5000, 'Rau cải xanh (cải bẹ xanh) hay còn gọi với một số tên khác như cải xanh, cải canh, cải cay, giới tử, là một loài thực vật thuộc họ Cải (Brassicaceae). Thân của rau cải xanh to, nhỏ khác nhau tùy theo giống trồng, lá có màu xanh đậm hoặc xanh nõn lá chuối.', 2, 1, 0),
(7, 'Khoai Tây', 5, 'khoai_tay.jpg', 30000, 'khoai tây là một loại củ đa năng, có giá thành tương đối rẻ, dễ trồng, dễ chăm sóc và có hàm lượng chất dinh dưỡng cao, vì vậy nhiều hộ gia đình tại Việt Nam đã lựa chọn khoai tây như một món ăn chính trong các bữa ăn hàng ngày', 2, 1, 0),
(25, 'Bí ngô', 3, 'bi_ngo.jpg', 7000, 'Chưa có mô tả', 1, 8, 22),
(28, 'Cam sành', 3, 'cam_sanh.jpg', 25000, 'Cam sành là loại trái cây vốn được nhiều người yêu thích, đặc biệt là trẻ nhỏ và chị em phụ nữ, bởi cam rất bổ dưỡng và cao cấp. Trái cam sành có đặc điểm mang màu xanh sậm đến khi chín thì ngả màu vàng, dáng tròn dẹt, hương vị chua ngọt, thị trái nhiều nước. Một đặc điểm nữa đó là cam sành có khá nhiều hạt nên thường được dùng phổ biến để vắt cam.', 1, 8, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `ho` varchar(50) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` double DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`idUser`, `ho`, `ten`, `email`, `username`, `password`, `phone`, `address`) VALUES
(1, 'Trần', 'Quốc Huy', 'kenbi.njr@gmail.cm', 'admin', '123', 932393401, ''),
(5, 'Trần', 'Quốc', 'kenbi.njr@gmail.cm', 'huy', '$2b$10$CGHZhN5XMekIKk14pFqwjuJ1apYUHmn6v7qbPBisr3v4CzQoci9US', 333964846, 'Vietnam'),
(6, 'Trần', 'Quốc Huy', 'asd@gmail.com', 'superman', '$2b$10$2g4kPt1ok.F0XlHOm9cGLe6YI3c9EjIXTqouZu9ilXwBptDSDwB.q', 333964846, ''),
(7, 'Trần', 'Quốc Huy', 'kenbi.njr@gmail.cm', 'huy123', '$2b$10$CGHZhN5XMekIKk14pFqwjuJ1apYUHmn6v7qbPBisr3v4CzQoci9US', 932393401, 'Tây Ninh');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`idCat`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idCat` (`idCat`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `idCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `catalog` (`idCat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
