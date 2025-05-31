-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2025 at 01:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `status`, `date_created`) VALUES
(1, 'Apple', 'Apple Company', 1, '2021-08-30 10:33:53'),
(3, 'Samsung', 'Samsung Company', 1, '2021-08-30 10:34:22'),
(10, 'Xiaomi', 'Offers high-performance smartphones at affordable prices; popular among budget-conscious users in India.', 1, '2025-05-07 23:19:19'),
(11, 'Realme', 'Fast-growing brand with competitive pricing, popular among youth for specs-heavy phones.', 1, '2025-05-07 23:19:34'),
(12, 'OnePlus', 'Known for near-stock Android experience and premium features at lower cost than Samsung or Apple.', 1, '2025-05-07 23:19:47'),
(13, 'Vivo', 'Focused on camera features and offline market; strong presence in mid-range segment.', 1, '2025-05-07 23:20:02'),
(14, 'OPPO', 'Similar to Vivo (same parent company); popular for selfie-focused phones and aggressive pricing.', 1, '2025-05-07 23:20:20'),
(15, 'Nothing', 'New UK-based brand founded by ex-OnePlus co-founder; known for unique design (e.g., transparent backs)', 1, '2025-05-07 23:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Smart Phone', 'Smart Phone Products', 1, '2021-08-30 10:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'Claire', 'Blake', 'Female', '09123456789', 'cblake@gmail.com', 'cd74fae0a3adf459f73bbf187607ccea', 'Sample Address', '2021-08-30 15:32:20'),
(2, 'Jishnu', 'Katta', 'Male', '1234567890', 'abcd@gmail.com', '9c977687b7c88f1699306232f0ef0b60', '', '2025-05-07 21:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `clothes`
--

CREATE TABLE `clothes` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 4,
  `sub_category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 15, 74990, '2025-02-17 12:05:49', NULL),
(2, 2, 20, 69990, '2021-08-30 13:27:26', NULL),
(11, 16, 19, 31900, '2025-05-07 23:48:54', NULL),
(12, 17, 15, 31999, '2025-05-07 23:49:16', NULL),
(13, 18, 20, 35999, '2025-05-07 23:49:37', NULL),
(14, 19, 18, 19999, '2025-05-07 23:49:58', NULL),
(15, 20, 19, 25499, '2025-05-07 23:50:17', NULL),
(16, 21, 16, 23499, '2025-05-07 23:50:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_prices`
--

CREATE TABLE `mobile_prices` (
  `id` int(11) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `condition` enum('Excellent','Good','Fair','Poor') NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobile_prices`
--

INSERT INTO `mobile_prices` (`id`, `brand`, `model`, `condition`, `price`) VALUES
(1, 'Apple', 'iPhone 14 Pro Max', 'Excellent', 80000),
(2, 'Apple', 'iPhone 14 Pro Max', 'Good', 72000),
(3, 'Apple', 'iPhone 14 Pro Max', 'Fair', 60000),
(4, 'Apple', 'iPhone 14 Pro Max', 'Poor', 45000),
(5, 'Apple', 'iPhone 13', 'Excellent', 55000),
(6, 'Apple', 'iPhone 13', 'Good', 48000),
(7, 'Apple', 'iPhone 13', 'Fair', 40000),
(8, 'Apple', 'iPhone 13', 'Poor', 30000),
(9, 'Apple', 'iPhone 12', 'Excellent', 40000),
(10, 'Apple', 'iPhone 12', 'Good', 35000),
(11, 'Apple', 'iPhone 12', 'Fair', 27000),
(12, 'Apple', 'iPhone 12', 'Poor', 20000),
(13, 'Samsung', 'Galaxy S23 Ultra', 'Excellent', 75000),
(14, 'Samsung', 'Galaxy S23 Ultra', 'Good', 68000),
(15, 'Samsung', 'Galaxy S23 Ultra', 'Fair', 58000),
(16, 'Samsung', 'Galaxy S23 Ultra', 'Poor', 45000),
(17, 'Samsung', 'Galaxy S22', 'Excellent', 52000),
(18, 'Samsung', 'Galaxy S22', 'Good', 46000),
(19, 'Samsung', 'Galaxy S22', 'Fair', 38000),
(20, 'Samsung', 'Galaxy S22', 'Poor', 30000),
(21, 'Samsung', 'Galaxy A73', 'Excellent', 25000),
(22, 'Samsung', 'Galaxy A73', 'Good', 22000),
(23, 'Samsung', 'Galaxy A73', 'Fair', 18000),
(24, 'Samsung', 'Galaxy A73', 'Poor', 12000),
(25, 'Xiaomi', 'Redmi Note 12 Pro+', 'Excellent', 18000),
(26, 'Xiaomi', 'Redmi Note 12 Pro+', 'Good', 15000),
(27, 'Xiaomi', 'Redmi Note 12 Pro+', 'Fair', 12000),
(28, 'Xiaomi', 'Redmi Note 12 Pro+', 'Poor', 8000),
(29, 'Xiaomi', 'Mi 11X', 'Excellent', 16000),
(30, 'Xiaomi', 'Mi 11X', 'Good', 13500),
(31, 'Xiaomi', 'Mi 11X', 'Fair', 10000),
(32, 'Xiaomi', 'Mi 11X', 'Poor', 7000),
(33, 'OnePlus', '11R', 'Excellent', 28000),
(34, 'OnePlus', '11R', 'Good', 24000),
(35, 'OnePlus', '11R', 'Fair', 20000),
(36, 'OnePlus', '11R', 'Poor', 15000),
(37, 'OnePlus', 'Nord CE 3 Lite', 'Excellent', 14000),
(38, 'OnePlus', 'Nord CE 3 Lite', 'Good', 12000),
(39, 'OnePlus', 'Nord CE 3 Lite', 'Fair', 9500),
(40, 'OnePlus', 'Nord CE 3 Lite', 'Poor', 7000),
(41, 'Realme', 'Narzo 60 Pro', 'Excellent', 16000),
(42, 'Realme', 'Narzo 60 Pro', 'Good', 14000),
(43, 'Realme', 'Narzo 60 Pro', 'Fair', 11000),
(44, 'Realme', 'Narzo 60 Pro', 'Poor', 8000),
(45, 'Vivo', 'V27 Pro', 'Excellent', 18000),
(46, 'Vivo', 'V27 Pro', 'Good', 16000),
(47, 'Vivo', 'V27 Pro', 'Fair', 13000),
(48, 'Vivo', 'V27 Pro', 'Poor', 9000),
(49, 'Motorola', 'Edge 40', 'Excellent', 19000),
(50, 'Motorola', 'Edge 40', 'Good', 16000),
(51, 'Motorola', 'Edge 40', 'Fair', 13000),
(52, 'Motorola', 'Edge 40', 'Poor', 10000),
(53, 'Google', 'Pixel 7a', 'Excellent', 30000),
(54, 'Google', 'Pixel 7a', 'Good', 26000),
(55, 'Google', 'Pixel 7a', 'Fair', 20000),
(56, 'Google', 'Pixel 7a', 'Poor', 15000),
(57, 'Apple', 'iPhone 11', 'Excellent', 30000),
(58, 'Apple', 'iPhone 11', 'Good', 25000),
(59, 'Apple', 'iPhone 11', 'Fair', 20000),
(60, 'Apple', 'iPhone 11', 'Poor', 15000),
(61, 'Apple', 'iPhone XR', 'Excellent', 20000),
(62, 'Apple', 'iPhone XR', 'Good', 17000),
(63, 'Apple', 'iPhone XR', 'Fair', 13000),
(64, 'Apple', 'iPhone XR', 'Poor', 9000),
(65, 'Apple', 'iPhone SE 2nd Gen', 'Excellent', 15000),
(66, 'Apple', 'iPhone SE 2nd Gen', 'Good', 12000),
(67, 'Apple', 'iPhone SE 2nd Gen', 'Fair', 9000),
(68, 'Apple', 'iPhone SE 2nd Gen', 'Poor', 6000),
(69, 'Samsung', 'Galaxy M13', 'Excellent', 9000),
(70, 'Samsung', 'Galaxy M13', 'Good', 7500),
(71, 'Samsung', 'Galaxy M13', 'Fair', 6000),
(72, 'Samsung', 'Galaxy M13', 'Poor', 4000),
(73, 'Samsung', 'Galaxy A12', 'Excellent', 8000),
(74, 'Samsung', 'Galaxy A12', 'Good', 6500),
(75, 'Samsung', 'Galaxy A12', 'Fair', 5000),
(76, 'Samsung', 'Galaxy A12', 'Poor', 3500),
(77, 'Xiaomi', 'Redmi 10', 'Excellent', 7000),
(78, 'Xiaomi', 'Redmi 10', 'Good', 6000),
(79, 'Xiaomi', 'Redmi 10', 'Fair', 4500),
(80, 'Xiaomi', 'Redmi 10', 'Poor', 3000),
(81, 'Xiaomi', 'Redmi 9A', 'Excellent', 5000),
(82, 'Xiaomi', 'Redmi 9A', 'Good', 4000),
(83, 'Xiaomi', 'Redmi 9A', 'Fair', 3000),
(84, 'Xiaomi', 'Redmi 9A', 'Poor', 2000),
(85, 'Realme', 'C55', 'Excellent', 8000),
(86, 'Realme', 'C55', 'Good', 6500),
(87, 'Realme', 'C55', 'Fair', 5000),
(88, 'Realme', 'C55', 'Poor', 3500),
(89, 'OnePlus', 'Nord N100', 'Excellent', 9000),
(90, 'OnePlus', 'Nord N100', 'Good', 7500),
(91, 'OnePlus', 'Nord N100', 'Fair', 6000),
(92, 'OnePlus', 'Nord N100', 'Poor', 4000),
(93, 'Vivo', 'Y21', 'Excellent', 7000),
(94, 'Vivo', 'Y21', 'Good', 6000),
(95, 'Vivo', 'Y21', 'Fair', 4500),
(96, 'Vivo', 'Y21', 'Poor', 3000),
(97, 'Motorola', 'G60', 'Excellent', 9000),
(98, 'Motorola', 'G60', 'Good', 7500),
(99, 'Motorola', 'G60', 'Fair', 6000),
(100, 'Motorola', 'G60', 'Poor', 4500),
(101, 'Nokia', 'G21', 'Excellent', 7000),
(102, 'Nokia', 'G21', 'Good', 6000),
(103, 'Nokia', 'G21', 'Fair', 4500),
(104, 'Nokia', 'G21', 'Poor', 3000),
(105, 'Oppo', 'A54', 'Excellent', 8000),
(106, 'Oppo', 'A54', 'Good', 6500),
(107, 'Oppo', 'A54', 'Fair', 5000),
(108, 'Oppo', 'A54', 'Poor', 3500);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(3, 1, '', 'cod', 1, 144980, 0, 0, '2025-05-08 20:43:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(6, 3, 1, 1, 74990, 74990),
(7, 3, 2, 1, 69990, 69990);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `name`, `specs`, `status`, `date_created`) VALUES
(1, 1, 1, 0, 'iPhone Pro Max 12', '<ul class=\\\"techspecs-list\\\" role=\\\"list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\"><li role=\\\"listitem\\\" style=\\\"margin: 0px; padding: 0px;\\\">Super Retina XDR display</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">6.7‑inch (diagonal) all‑screen OLED display</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">2778‑by‑1284-pixel resolution at 458 ppi</li></ul><p class=\\\"typography-caption model-caption\\\" style=\\\"margin: 0.8em 0px 0px; padding: 0px; line-height: 1.33337;\\\">The iPhone 12 Pro Max display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.68 inches diagonally (actual viewable area is less).</p><p style=\\\"margin: 0.8em 0px 0px; padding: 0px; line-height: 1.33337;\\\"><br></p><ul class=\\\"techspecs-list\\\" role=\\\"list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\"><li role=\\\"listitem\\\" style=\\\"margin: 0px; padding: 0px;\\\">HDR display</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">True Tone</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Wide color (P3)</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Haptic Touch</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">2,000,000:1 contrast ratio (typical)</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">800 nits max brightness (typical); 1,200 nits max brightness (HDR)</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Fingerprint-resistant oleophobic coating</li><li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Support for display of multiple languages and characters simultaneously</li></ul>', 1, '2021-08-30 12:19:22'),
(2, 3, 1, 0, 'Samsung Galaxy S21 Ultra 5G', '<p><p></p><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\"><span class=\\\"c_model_unit-type1\\\" style=\\\"text-align: left; margin: 0px; padding: 0px; vertical-align: top; display: block; line-height: 1.3;\\\">6.8\\\"</span></p><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Edge Quad HD+</p><dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\"><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Dimensions:</dt><dd style=\\\"text-align: left; margin-top: 10px; margin-right: 0px; margin-bottom: 0px; padding: 0px; vertical-align: top;\\\">75.6x165.1x8.9mm</dd><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Weight:</dt><dd style=\\\"text-align: left; margin-top: 10px; margin-right: 0px; margin-bottom: 0px; padding: 0px; vertical-align: top;\\\">229g(mmW), 227g(sub6)</dd><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Biometric Authentication:</dt></dl><p></p><p></p><dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\"><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Ultrasonic Fingerprint Face recognition</dt></dl></p><h3 class=\\\"c_model_title-type1\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top;\\\">Super Smooth 120Hz Display</h3><p><p></p></p><dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\"><dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\"><p class=\\\"c_model_desc-type1\\\" style=\\\"margin: 8px 0px 0px; padding: 0px; vertical-align: top;\\\">Our smoothest scrolling screen keeps up with all your feeds.</p><h3 class=\\\"c_model_title-type1\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top;\\\">Durability</h3><p class=\\\"c_model_desc-type1\\\" style=\\\"margin: 8px 0px 0px; padding: 0px; vertical-align: top;\\\">Protected by the toughest Gorilla Glass yet and water and dust resistance.<span style=\\\"line-height: 1.2; position: relative; top: 0px; margin: 0px; padding: 0px; vertical-align: top;\\\"><a href=\\\"https://www.samsung.com/ph/smartphones/galaxy-s21-ultra-5g/models/?cid=ph_paid_ppc_google_s-series_always-on_none_text_none_none_AG~Warm%20-%20S21%20Ultra%20-%20Specs_MK~ph_AT~ta_MD~w_AI~&amp;sem-palette-warm#desc-section\\\" class=\\\"click_sup\\\" title=\\\"See disclaimer\\\" style=\\\"outline-offset: 0px; vertical-align: top;\\\">2</a>,&nbsp;<a href=\\\"https://www.samsung.com/ph/smartphones/galaxy-s21-ultra-5g/models/?cid=ph_paid_ppc_google_s-series_always-on_none_text_none_none_AG~Warm%20-%20S21%20Ultra%20-%20Specs_MK~ph_AT~ta_MD~w_AI~&amp;sem-palette-warm#desc-section\\\" class=\\\"click_sup\\\" title=\\\"See disclaimer\\\" style=\\\"outline-offset: 0px; vertical-align: top;\\\">3</a></span></p></dt></dl>', 1, '2021-08-30 13:15:11'),
(16, 15, 1, 0, 'Nothing Phone (2)', '<li data-start=\\\"295\\\" data-end=\\\"331\\\" class=\\\"\\\"><p data-start=\\\"297\\\" data-end=\\\"331\\\" class=\\\"\\\"><strong data-start=\\\"297\\\" data-end=\\\"308\\\">Display</strong>: 6.7\\\" LTPO OLED, 120Hz</p>\r\n</li><li data-start=\\\"332\\\" data-end=\\\"368\\\" class=\\\"\\\">\r\n<p data-start=\\\"334\\\" data-end=\\\"368\\\" class=\\\"\\\"><strong data-start=\\\"334\\\" data-end=\\\"347\\\">Processor</strong>: Snapdragon 8+ Gen 1</p>\r\n</li><li data-start=\\\"369\\\" data-end=\\\"411\\\" class=\\\"\\\">\r\n<p data-start=\\\"371\\\" data-end=\\\"411\\\" class=\\\"\\\"><strong data-start=\\\"371\\\" data-end=\\\"386\\\">RAM/Storage</strong>: 8GB/128GB or 12GB/256GB</p>\r\n</li><li data-start=\\\"412\\\" data-end=\\\"455\\\" class=\\\"\\\">\r\n<p data-start=\\\"414\\\" data-end=\\\"455\\\" class=\\\"\\\"><strong data-start=\\\"414\\\" data-end=\\\"424\\\">Camera</strong>: Dual 50MP (main + ultra-wide)</p>\r\n</li><li data-start=\\\"456\\\" data-end=\\\"503\\\" class=\\\"\\\">\r\n<p data-start=\\\"458\\\" data-end=\\\"503\\\" class=\\\"\\\"><strong data-start=\\\"458\\\" data-end=\\\"469\\\">Battery</strong>: 4700mAh, 45W wired, 15W wireless</p>\r\n</li><li data-start=\\\"504\\\" data-end=\\\"546\\\" class=\\\"\\\">\r\n<p data-start=\\\"506\\\" data-end=\\\"546\\\" class=\\\"\\\"><strong data-start=\\\"506\\\" data-end=\\\"512\\\">OS</strong>: Nothing OS (based on Android 13)</p>\r\n</li><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><li data-start=\\\"547\\\" data-end=\\\"588\\\" class=\\\"\\\">\r\n<p data-start=\\\"549\\\" data-end=\\\"588\\\" class=\\\"\\\"><strong data-start=\\\"549\\\" data-end=\\\"560\\\">Special</strong>: Glyph Interface LED design</p></li>', 1, '2025-05-07 23:27:02'),
(17, 12, 1, 0, 'OnePlus 12R', '<li data-start=\\\"619\\\" data-end=\\\"670\\\" class=\\\"\\\"><p data-start=\\\"621\\\" data-end=\\\"670\\\" class=\\\"\\\"><strong data-start=\\\"621\\\" data-end=\\\"632\\\">Display</strong>: 6.78\\\" AMOLED, 120Hz, 1.5K resolution</p>\r\n</li><li data-start=\\\"671\\\" data-end=\\\"706\\\" class=\\\"\\\">\r\n<p data-start=\\\"673\\\" data-end=\\\"706\\\" class=\\\"\\\"><strong data-start=\\\"673\\\" data-end=\\\"686\\\">Processor</strong>: Snapdragon 8 Gen 2</p>\r\n</li><li data-start=\\\"707\\\" data-end=\\\"749\\\" class=\\\"\\\">\r\n<p data-start=\\\"709\\\" data-end=\\\"749\\\" class=\\\"\\\"><strong data-start=\\\"709\\\" data-end=\\\"724\\\">RAM/Storage</strong>: 8GB/128GB or 16GB/256GB</p>\r\n</li><li data-start=\\\"750\\\" data-end=\\\"811\\\" class=\\\"\\\">\r\n<p data-start=\\\"752\\\" data-end=\\\"811\\\" class=\\\"\\\"><strong data-start=\\\"752\\\" data-end=\\\"762\\\">Camera</strong>: 50MP (Sony IMX890) + 8MP ultra-wide + 2MP macro</p>\r\n</li><li data-start=\\\"812\\\" data-end=\\\"864\\\" class=\\\"\\\">\r\n<p data-start=\\\"814\\\" data-end=\\\"864\\\" class=\\\"\\\"><strong data-start=\\\"814\\\" data-end=\\\"825\\\">Battery</strong>: 5500mAh, 100W SUPERVOOC fast charging</p>\r\n</li><li data-start=\\\"865\\\" data-end=\\\"899\\\" class=\\\"\\\">\r\n<p data-start=\\\"867\\\" data-end=\\\"899\\\" class=\\\"\\\"><strong data-start=\\\"867\\\" data-end=\\\"873\\\">OS</strong>: OxygenOS 14 (Android 14)</p>\r\n</li><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><li data-start=\\\"900\\\" data-end=\\\"952\\\" class=\\\"\\\">\r\n<p data-start=\\\"902\\\" data-end=\\\"952\\\" class=\\\"\\\"><strong data-start=\\\"902\\\" data-end=\\\"913\\\">Special</strong>: Flagship specs at a lower price point</p></li>', 1, '2025-05-07 23:32:30'),
(18, 14, 1, 0, 'OPPO Reno11 Pro 5G', '<li data-start=\\\"990\\\" data-end=\\\"1023\\\" class=\\\"\\\"><p data-start=\\\"992\\\" data-end=\\\"1023\\\" class=\\\"\\\"><strong data-start=\\\"992\\\" data-end=\\\"1003\\\">Display</strong>: 6.7\\\" AMOLED, 120Hz</p>\r\n</li><li data-start=\\\"1024\\\" data-end=\\\"1064\\\" class=\\\"\\\">\r\n<p data-start=\\\"1026\\\" data-end=\\\"1064\\\" class=\\\"\\\"><strong data-start=\\\"1026\\\" data-end=\\\"1039\\\">Processor</strong>: MediaTek Dimensity 8200</p>\r\n</li><li data-start=\\\"1065\\\" data-end=\\\"1094\\\" class=\\\"\\\">\r\n<p data-start=\\\"1067\\\" data-end=\\\"1094\\\" class=\\\"\\\"><strong data-start=\\\"1067\\\" data-end=\\\"1082\\\">RAM/Storage</strong>: 12GB/256GB</p>\r\n</li><li data-start=\\\"1095\\\" data-end=\\\"1161\\\" class=\\\"\\\">\r\n<p data-start=\\\"1097\\\" data-end=\\\"1161\\\" class=\\\"\\\"><strong data-start=\\\"1097\\\" data-end=\\\"1107\\\">Camera</strong>: 50MP (Sony IMX890) + 32MP telephoto + 8MP ultra-wide</p>\r\n</li><li data-start=\\\"1162\\\" data-end=\\\"1199\\\" class=\\\"\\\">\r\n<p data-start=\\\"1164\\\" data-end=\\\"1199\\\" class=\\\"\\\"><strong data-start=\\\"1164\\\" data-end=\\\"1175\\\">Battery</strong>: 4600mAh, 80W SUPERVOOC</p>\r\n</li><li data-start=\\\"1200\\\" data-end=\\\"1233\\\" class=\\\"\\\">\r\n<p data-start=\\\"1202\\\" data-end=\\\"1233\\\" class=\\\"\\\"><strong data-start=\\\"1202\\\" data-end=\\\"1208\\\">OS</strong>: ColorOS 14 (Android 14)</p>\r\n</li><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><li data-start=\\\"1234\\\" data-end=\\\"1291\\\" class=\\\"\\\">\r\n<p data-start=\\\"1236\\\" data-end=\\\"1291\\\" class=\\\"\\\"><strong data-start=\\\"1236\\\" data-end=\\\"1247\\\">Special</strong>: Stylish design with strong portrait camera</p></li>', 1, '2025-05-07 23:34:35'),
(19, 11, 1, 0, 'Realme Narzo 70 Pro 5G', '<li data-start=\\\"1333\\\" data-end=\\\"1367\\\" class=\\\"\\\"><p data-start=\\\"1335\\\" data-end=\\\"1367\\\" class=\\\"\\\"><strong data-start=\\\"1335\\\" data-end=\\\"1346\\\">Display</strong>: 6.67\\\" AMOLED, 120Hz</p>\r\n</li><li data-start=\\\"1368\\\" data-end=\\\"1408\\\" class=\\\"\\\">\r\n<p data-start=\\\"1370\\\" data-end=\\\"1408\\\" class=\\\"\\\"><strong data-start=\\\"1370\\\" data-end=\\\"1383\\\">Processor</strong>: MediaTek Dimensity 7050</p>\r\n</li><li data-start=\\\"1409\\\" data-end=\\\"1450\\\" class=\\\"\\\">\r\n<p data-start=\\\"1411\\\" data-end=\\\"1450\\\" class=\\\"\\\"><strong data-start=\\\"1411\\\" data-end=\\\"1426\\\">RAM/Storage</strong>: 8GB/128GB or 8GB/256GB</p>\r\n</li><li data-start=\\\"1451\\\" data-end=\\\"1499\\\" class=\\\"\\\">\r\n<p data-start=\\\"1453\\\" data-end=\\\"1499\\\" class=\\\"\\\"><strong data-start=\\\"1453\\\" data-end=\\\"1463\\\">Camera</strong>: 50MP Sony IMX890 (OIS) + 2MP macro</p>\r\n</li><li data-start=\\\"1500\\\" data-end=\\\"1537\\\" class=\\\"\\\">\r\n<p data-start=\\\"1502\\\" data-end=\\\"1537\\\" class=\\\"\\\"><strong data-start=\\\"1502\\\" data-end=\\\"1513\\\">Battery</strong>: 5000mAh, 67W SUPERVOOC</p>\r\n</li><li data-start=\\\"1538\\\" data-end=\\\"1574\\\" class=\\\"\\\">\r\n<p data-start=\\\"1540\\\" data-end=\\\"1574\\\" class=\\\"\\\"><strong data-start=\\\"1540\\\" data-end=\\\"1546\\\">OS</strong>: Realme UI 5.0 (Android 14)</p>\r\n</li><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><li data-start=\\\"1575\\\" data-end=\\\"1641\\\" class=\\\"\\\">\r\n<p data-start=\\\"1577\\\" data-end=\\\"1641\\\" class=\\\"\\\"><strong data-start=\\\"1577\\\" data-end=\\\"1588\\\">Special</strong>: Air Gesture support, competitive specs in mid-range</p></li>', 1, '2025-05-07 23:37:17'),
(20, 13, 1, 0, 'Vivo V30 5G', '<li data-start=\\\"1672\\\" data-end=\\\"1706\\\" class=\\\"\\\"><p data-start=\\\"1674\\\" data-end=\\\"1706\\\" class=\\\"\\\"><strong data-start=\\\"1674\\\" data-end=\\\"1685\\\">Display</strong>: 6.78\\\" AMOLED, 120Hz</p>\r\n</li><li data-start=\\\"1707\\\" data-end=\\\"1742\\\" class=\\\"\\\">\r\n<p data-start=\\\"1709\\\" data-end=\\\"1742\\\" class=\\\"\\\"><strong data-start=\\\"1709\\\" data-end=\\\"1722\\\">Processor</strong>: Snapdragon 7 Gen 3</p>\r\n</li><li data-start=\\\"1743\\\" data-end=\\\"1785\\\" class=\\\"\\\">\r\n<p data-start=\\\"1745\\\" data-end=\\\"1785\\\" class=\\\"\\\"><strong data-start=\\\"1745\\\" data-end=\\\"1760\\\">RAM/Storage</strong>: 8GB/128GB or 12GB/256GB</p>\r\n</li><li data-start=\\\"1786\\\" data-end=\\\"1829\\\" class=\\\"\\\">\r\n<p data-start=\\\"1788\\\" data-end=\\\"1829\\\" class=\\\"\\\"><strong data-start=\\\"1788\\\" data-end=\\\"1798\\\">Camera</strong>: Dual 50MP (main + ultra-wide)</p>\r\n</li><li data-start=\\\"1830\\\" data-end=\\\"1869\\\" class=\\\"\\\">\r\n<p data-start=\\\"1832\\\" data-end=\\\"1869\\\" class=\\\"\\\"><strong data-start=\\\"1832\\\" data-end=\\\"1843\\\">Battery</strong>: 5000mAh, 80W FlashCharge</p>\r\n</li><li data-start=\\\"1870\\\" data-end=\\\"1907\\\" class=\\\"\\\">\r\n<p data-start=\\\"1872\\\" data-end=\\\"1907\\\" class=\\\"\\\"><strong data-start=\\\"1872\\\" data-end=\\\"1878\\\">OS</strong>: Funtouch OS 14 (Android 14)</p>\r\n</li><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><li data-start=\\\"1908\\\" data-end=\\\"1976\\\" class=\\\"\\\">\r\n<p data-start=\\\"1910\\\" data-end=\\\"1976\\\" class=\\\"\\\"><strong data-start=\\\"1910\\\" data-end=\\\"1921\\\">Special</strong>: Slim, premium look with Aura Light for portrait shots</p></li>', 1, '2025-05-07 23:39:10'),
(21, 10, 1, 0, 'Xiaomi Redmi Note 13 Pro+ 5G', '<li data-start=\\\"2024\\\" data-end=\\\"2075\\\" class=\\\"\\\"><p data-start=\\\"2026\\\" data-end=\\\"2075\\\" class=\\\"\\\"><strong data-start=\\\"2026\\\" data-end=\\\"2037\\\">Display</strong>: 6.67\\\" AMOLED, 120Hz, 1.5K resolution</p>\r\n</li><li data-start=\\\"2076\\\" data-end=\\\"2122\\\" class=\\\"\\\">\r\n<p data-start=\\\"2078\\\" data-end=\\\"2122\\\" class=\\\"\\\"><strong data-start=\\\"2078\\\" data-end=\\\"2091\\\">Processor</strong>: MediaTek Dimensity 7200 Ultra</p>\r\n</li><li data-start=\\\"2123\\\" data-end=\\\"2165\\\" class=\\\"\\\">\r\n<p data-start=\\\"2125\\\" data-end=\\\"2165\\\" class=\\\"\\\"><strong data-start=\\\"2125\\\" data-end=\\\"2140\\\">RAM/Storage</strong>: 8GB/256GB or 12GB/512GB</p>\r\n</li><li data-start=\\\"2166\\\" data-end=\\\"2226\\\" class=\\\"\\\">\r\n<p data-start=\\\"2168\\\" data-end=\\\"2226\\\" class=\\\"\\\"><strong data-start=\\\"2168\\\" data-end=\\\"2178\\\">Camera</strong>: 200MP Samsung HP3 + 8MP ultra-wide + 2MP macro</p>\r\n</li><li data-start=\\\"2227\\\" data-end=\\\"2267\\\" class=\\\"\\\">\r\n<p data-start=\\\"2229\\\" data-end=\\\"2267\\\" class=\\\"\\\"><strong data-start=\\\"2229\\\" data-end=\\\"2240\\\">Battery</strong>: 5000mAh, 120W HyperCharge</p>\r\n</li><li data-start=\\\"2268\\\" data-end=\\\"2298\\\" class=\\\"\\\">\r\n<p data-start=\\\"2270\\\" data-end=\\\"2298\\\" class=\\\"\\\"><strong data-start=\\\"2270\\\" data-end=\\\"2276\\\">OS</strong>: HyperOS (Android 14)</p>\r\n</li><p>\r\n\r\n\r\n\r\n\r\n\r\n</p><li data-start=\\\"2299\\\" data-end=\\\"2369\\\" class=\\\"\\\">\r\n<p data-start=\\\"2301\\\" data-end=\\\"2369\\\" class=\\\"\\\"><strong data-start=\\\"2301\\\" data-end=\\\"2312\\\">Special</strong>: Premium mid-range with curved display and fast charging</p></li>', 1, '2025-05-07 23:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(3, 3, 144980, '2025-05-08 20:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Web App for Mobile Purchase and Eco-Friendly Trade-Ins'),
(6, 'short_name', 'MOBILE-STORE'),
(11, 'logo', 'uploads/CMRU_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1630289280_wallpaper.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `trade_requests`
--

CREATE TABLE `trade_requests` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `condition` enum('Excellent','Good','Fair','Poor') NOT NULL,
  `offered_price` int(11) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clothes`
--
ALTER TABLE `clothes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_prices`
--
ALTER TABLE `mobile_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand` (`brand`,`model`,`condition`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_requests`
--
ALTER TABLE `trade_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clothes`
--
ALTER TABLE `clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mobile_prices`
--
ALTER TABLE `mobile_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `trade_requests`
--
ALTER TABLE `trade_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
