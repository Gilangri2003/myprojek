-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2020 at 10:29 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expresstes`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_tbl`
--

CREATE TABLE `admin_tbl` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `admin_level` varchar(20) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_tbl`
--

INSERT INTO `admin_tbl` (`id_admin`, `username`, `password`, `name`, `address`, `admin_level`, `datetime`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Aries Dimas Yudhistira', 'jl. warakas 4 GG q7 no. 32', 'Super Admin', '2014-03-30 15:27:07');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `email` varchar(56) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id_contact`, `nama`, `email`, `no_hp`, `pesan`) VALUES
(1, 'fdsfdsfds', 'dsfdsfds@gmail.com', '33', 'ddddddd'),
(2, 'dfgdfgdf', 'sulistiono.widi@gmail.com', '2345678', 'dfgdfgdfgdf'),
(3, 'fxdsfdsfds', 'dfdsfdsf@gmail.com', '5345345345', 'dfgfgdfgdf');

-- --------------------------------------------------------

--
-- Table structure for table `data_brand`
--

CREATE TABLE `data_brand` (
  `ax` varchar(255) NOT NULL,
  `nama_brand` text NOT NULL,
  `tanggal_input` date NOT NULL,
  `Aksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_brand`
--

INSERT INTO `data_brand` (`ax`, `nama_brand`, `tanggal_input`, `Aksi`) VALUES
('1', 'supermie ', '2020-01-26', ''),
('2', 'hypebist', '2020-01-26', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_user`
--

CREATE TABLE `data_user` (
  `id_user` int(11) NOT NULL,
  `Nama_user` text NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Jenis_Kelamin` text NOT NULL,
  `No_hp` varchar(20) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_user`
--

INSERT INTO `data_user` (`id_user`, `Nama_user`, `Alamat`, `email`, `Jenis_Kelamin`, `No_hp`, `password`) VALUES
(1, 'Gilang Ristiawan', 'Jl. Saco cilandak barat', 'gilang@gmail.com', 'laki-laki', '081818926530', 20031998),
(2, 'Hitler ', 'German dekat sungai', 'hitler@gmail.com', 'laki-laki', '911', 0),
(3, 'gunawan', 'wkkwkwk', 'gunawan@gmail.com', 'kwkkwkw', '081818926530', 12345678);

-- --------------------------------------------------------

--
-- Table structure for table `news_tbl`
--

CREATE TABLE `news_tbl` (
  `id_news` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `images` varchar(50) NOT NULL,
  `harga_normal` varchar(20) NOT NULL,
  `harga_diskon` varchar(20) NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_tbl`
--

INSERT INTO `news_tbl` (`id_news`, `title`, `description`, `images`, `harga_normal`, `harga_diskon`, `createdate`) VALUES
(2, 'Sweater', 'cocok dipakai untuk sehari hari dengan bahan yang tidak panas', 'img-15.jpg', 'Rp.300.000', 'Rp.299.000', '2014-03-25 11:21:42'),
(36, 'sepatu hypbist', 'untuk mendaki gunung', 'prod-2.jpg', 'Rp.600.000', 'Rp.599.000', '0000-00-00 00:00:00'),
(37, 'topi', 'topi kece bos', 'avatar3.png', 'Rp.250.000', 'Rp.220.000', '0000-00-00 00:00:00'),
(39, 'baju1', 'dipakai oleh kelas atas wkwk', 'img-11.jpg', 'Rp.400.000', 'Rp.340.000', '0000-00-00 00:00:00'),
(40, 'baju2', 'cocok untuk dipakai di musim kawin', 'img-3.jpg', 'Rp.250.000', 'Rp.220.000', '0000-00-00 00:00:00'),
(41, 'baju', 'baju santai', 'img-7.jpg', 'Rp.600.000', 'Rp.340.000', '0000-00-00 00:00:00'),
(42, 'baju', 'baju santai', 'img-10.jpg', 'Rp.500.000', 'Rp.340.000', '0000-00-00 00:00:00'),
(44, 'baju', 'baju santai', 'img-4.jpg', 'Rp.370.000', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(250) NOT NULL,
  `description_product` text NOT NULL,
  `gambar_product` varchar(250) NOT NULL,
  `price` int(11) NOT NULL,
  `createdate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`id_product`, `name_product`, `description_product`, `gambar_product`, `price`, `createdate`) VALUES
(1, 'Meja Direktur Glory FC 2035', 'Keunggulan: \r\n\r\n1. Desain yang elegan.\r\n2. Dilapisi melamine yang anti air, gores, dan api.\r\n3. Menggunakan bahan yang berkualitas dan kokoh terbuat dari particle board.\r\nBahan: Particle Board\r\nDimensi: W 200 x D 110 x H 76cm\r\nWarna: Coklat \r\nSeri: FC Series\r\n', 'meja_direktur_glory.jpeg', 7480000, '17-01-2018'),
(2, 'Kursi Tamu Claren', 'Cocok untuk Tamu atau di ruang meeting, dengan design yang elegan.\r\nWarna : Hitam\r\nBahan : Synthetic, Stainless', 'Kursi_Tamu_Claren.jpg', 1760000, '17-01-2018'),
(3, 'MEJA MEETING KANTOR VIP MRM 101 (100CM)', 'Meja meeting kantor VIP MRM 101 (100cm)\r\n \r\nProdusen: VIP Furniture\r\n \r\nSertifikat: ISO 9001 No. 43203\r\n \r\nSertifikat ini berstandar internasional dan menyatakan bahwa perusahaan ini telah memenuhi standar quality management system yang ditetapkan.\r\n \r\nKeunggulan :\r\n \r\n1. Pada side panel terdapat pipa besi yang membuat meja semakin kuat dan kokoh.\r\n \r\n2. Model desain yang minimalis dan menarik.\r\n \r\n3. 100% dilapisi PVC yang anti air. \r\n \r\n4. Menggunakan bahan partilcle board yang berkualitas dan tahan lama.\r\n\r\nBahan : Particle board\r\n \r\nDimensi : W 100 x D 100 x H 75cm\r\n \r\nWarna : Wenge black colour', 'meja_meeting_kantor.jpeg', 970000, '17-01-2018'),
(4, 'KURSI HIGHPOINT AUSTIN W 129', 'Manufacture	Highpoint \r\nTipe Kursi	Staff/Manager \r\nBeroda	Ya \r\nHydrolic	Ya \r\nAyunan kursi	Tilting Control \r\nRangka kaki	Plastik (Nylon/PU) \r\nBahan dudukan	Oscar/Fabric \r\nBahan sandaran	Plastic \r\n(WxDxH) 49x50x48-56cm', 'KURSI_HIGHPOINT_AUSTIN.jpeg', 1320000, '17-01-2018'),
(5, 'LACI DORONG ADITECH', 'LACI DORONG ADITECH\r\nDilapisi melamine, particle board\r\nmerek : Laci Kantor Kayu Aditech\r\nKeunggulan:\r\n \r\n1. Menggunakan bahan yang kuat dan kokoh terbuat dari particle board.\r\n \r\n2. Di desain dengan model yang modern dan elegan.\r\n \r\n3. Dilapisi dengan melamine yang anti gores, anti air serta mudah dibersihkan.\r\n \r\n4. Memiliki 2 laci dan 1 file yang menggunakan central lock (kunci sentral).\r\n \r\nBahan : Particle board\r\n \r\nDimensi : W 40 x D 50 x H 65cm\r\n \r\nWarna : Grey, Beech', 'LACI_DORONG_ADITECH.jpeg', 899000, '17-01-2018'),
(6, 'GM CORK BOARD CB 918 STANDARD', ' Papan untuk pengumuman,poster, Terbuat dari bahan lunak, tidak terdapat lubang bekas push pin, Material Cork board ex. Japan Ukuran 90 x 180 cm + Standard', 'CORK_BOARD_CB 918.jpeg', 1315000, '17/01/2018'),
(7, 'PARTISI KANTOR DONATI DWS 3 SEAT SEJAJAR', 'Partisi kantor Donati DWS 3 Seat Sejajar\r\n\r\nKeunggulan: \r\n\r\n1. Bahan yang di gunakan untuk meja terbuat dari particle board yang berkualitas\r\n\r\n2. Model desain yang modern menjadikan ruangan kantor Anda lebih indah.\r\n\r\n3. Dilapisi dengan hpl yang anti gores dan anti air.\r\n\r\n4. Memiliki partisi dengan ketebalan 25mm.\r\n\r\n5. Partisi menggunakan bahan fabric yang memiliki banyak pilihan warna menarik.\r\n\r\nBahan: Particle Board dan Fabric\r\n\r\nWarna Meja: Beech, Cherry, Maple, Walnut & White', 'partisi_kantor_donati_dws.jpeg', 13500000, '17/1/2018'),
(8, 'MEJA KANTOR CARRERA', 'Plywood\r\n\r\nHigh pressure laminate\r\n\r\ndrawer\r\n\r\nwork table', 'MEJA_KANTOR_CARRERA.jpeg', 3500000, '17/01/2018');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indexes for table `data_user`
--
ALTER TABLE `data_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `news_tbl`
--
ALTER TABLE `news_tbl`
  ADD PRIMARY KEY (`id_news`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`id_product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_user`
--
ALTER TABLE `data_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_tbl`
--
ALTER TABLE `news_tbl`
  MODIFY `id_news` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
