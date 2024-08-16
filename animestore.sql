-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2024 at 05:31 PM
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
-- Database: `animestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `anime_category`
--

CREATE TABLE `anime_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anime_category`
--

INSERT INTO `anime_category` (`id`, `name`, `parent_id`) VALUES
(1, 'Bags', NULL),
(2, 'Posters', NULL),
(3, 'Clothes', NULL),
(4, 'Figurine', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `anime_customuser`
--

CREATE TABLE `anime_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `province` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `tole` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anime_customuser`
--

INSERT INTO `anime_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `phone_number`, `gender`, `province`, `district`, `tole`) VALUES
(1, 'pbkdf2_sha256$720000$2oajN6dJZpqOSVLjOsi5ru$ChQ5Hf7cHtV6Qjfl+7cQ48Yv4UYJnl8j5QZH/6zmIcs=', '2024-04-21 15:04:45.985154', 1, 'cindrella1039', '', '', 'cindrellakoju@gmail.com', 1, 1, '2024-04-20 10:31:22.064504', '', '', '', '', ''),
(2, 'pbkdf2_sha256$720000$VroPiDxcPmq30vAqOIp7wN$sR3DZY2mZW1N99fpUnHDAk+Ff/M85eVxR9WphQBqL4g=', '2024-04-21 15:28:29.060108', 0, 'cindy1039', 'cindrella', 'koju', 'sayuridon100@gmail.com', 0, 1, '2024-04-20 11:06:29.727126', '9840347840', 'F', '3', 'Bhaktapur', 'Byasi');

-- --------------------------------------------------------

--
-- Table structure for table `anime_customuser_groups`
--

CREATE TABLE `anime_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anime_customuser_user_permissions`
--

CREATE TABLE `anime_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anime_rootcategory`
--

CREATE TABLE `anime_rootcategory` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anime_rootcategory`
--

INSERT INTO `anime_rootcategory` (`id`, `image`, `category_id`) VALUES
(1, 'category_images/bag_category_Dzqzytp.png', 1),
(2, 'category_images/poster_category_tmKCEVq.png', 2),
(3, 'category_images/clothe_category_dP2Bui1.png', 3),
(4, 'category_images/figurein_category_DdxKQB1.png', 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add cart', 7, 'add_cart'),
(26, 'Can change cart', 7, 'change_cart'),
(27, 'Can delete cart', 7, 'delete_cart'),
(28, 'Can view cart', 7, 'view_cart'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add order', 9, 'add_order'),
(34, 'Can change order', 9, 'change_order'),
(35, 'Can delete order', 9, 'delete_order'),
(36, 'Can view order', 9, 'view_order'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add order item', 11, 'add_orderitem'),
(42, 'Can change order item', 11, 'change_orderitem'),
(43, 'Can delete order item', 11, 'delete_orderitem'),
(44, 'Can view order item', 11, 'view_orderitem'),
(45, 'Can add cart item', 12, 'add_cartitem'),
(46, 'Can change cart item', 12, 'change_cartitem'),
(47, 'Can delete cart item', 12, 'delete_cartitem'),
(48, 'Can view cart item', 12, 'view_cartitem'),
(49, 'Can add root category', 13, 'add_rootcategory'),
(50, 'Can change root category', 13, 'change_rootcategory'),
(51, 'Can delete root category', 13, 'delete_rootcategory'),
(52, 'Can view root category', 13, 'view_rootcategory');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `created_at`, `user_id`) VALUES
(1, '2024-04-20 11:06:49.269339', 2),
(3, '2024-04-20 15:58:01.663978', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `cart_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`id`, `quantity`, `cart_id`, `product_id`) VALUES
(6, 1, 3, 1),
(7, 1, 3, 2),
(12, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-20 10:32:20.061321', '1', 'Bags', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-04-20 10:32:30.734789', '2', 'Posters', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-04-20 10:32:37.098002', '3', 'Clothes', 1, '[{\"added\": {}}]', 8, 1),
(4, '2024-04-20 10:32:41.653500', '4', 'Figurine', 1, '[{\"added\": {}}]', 8, 1),
(5, '2024-04-20 10:33:33.069394', '1', 'Bags', 1, '[{\"added\": {}}]', 13, 1),
(6, '2024-04-20 10:33:44.105926', '2', 'Posters', 1, '[{\"added\": {}}]', 13, 1),
(7, '2024-04-20 10:33:56.222380', '3', 'Clothes', 1, '[{\"added\": {}}]', 13, 1),
(8, '2024-04-20 10:34:08.134235', '4', 'Figurine', 1, '[{\"added\": {}}]', 13, 1),
(9, '2024-04-20 10:37:19.036060', '1', 'Kuromi Bag Small Kawaii Saniro Plush Hello Kitty My Melody Cinnamoroll Anime Cartoon For Gifts', 1, '[{\"added\": {}}]', 10, 1),
(10, '2024-04-20 10:39:04.855088', '2', 'New Fashionable Anime And Many More Design Bags For Unisex School And College Life Comfortable To Carry And Reasonable', 1, '[{\"added\": {}}]', 10, 1),
(11, '2024-04-20 10:40:02.463085', '3', 'Akatsuki Anime Backpack For School and College for Men and Women - Black | Fashion Anime Printed Unisex Backpack', 1, '[{\"added\": {}}]', 10, 1),
(12, '2024-04-20 10:41:00.705094', '4', 'Spy X Family Anya Forger Anime Primary School Bag for Girl Children School Bags Travel Backpack SchoolBag Mochila', 1, '[{\"added\": {}}]', 10, 1),
(13, '2024-04-20 10:42:18.440538', '5', 'One Piece Action Figure Donquixote Doflamingo Vs Luffy Anime Figure 21cm PVC Gk Statue Model Doll Collection Desk Decoration Toy', 1, '[{\"added\": {}}]', 10, 1),
(14, '2024-04-20 10:43:28.712034', '6', 'Your Name 23cm Tachibana Taki & Miyamizu Mitsuha Figure Peripherals PVC Figurines Collectible Doll Toys Gifts', 1, '[{\"added\": {}}]', 10, 1),
(15, '2024-04-20 10:44:37.291892', '7', 'SPY×FAMILY Anya Forger Interchangeable heads Christmas Ver. Anime Action Figure Toys 16.5CM', 1, '[{\"added\": {}}]', 10, 1),
(16, '2024-04-20 10:45:33.424321', '8', 'Jujutsu Kaisen Gojo Satoru Kids Toys Action Figure Pvc Model Figurals Collection Brinquedos Doll Kid Toy Gift', 1, '[{\"added\": {}}]', 10, 1),
(17, '2024-04-20 10:47:18.682440', '9', 'Anime Series Naruto Team 7, Minato And Madara Poster Set- 6 Pcs', 1, '[{\"added\": {}}]', 10, 1),
(18, '2024-04-20 10:48:18.421013', '10', 'Jujutsu Kaisen Anime Series Gojo Satoru Sukuna Itadori Geto Suguru Megumi Nobara Set of 6 Poster', 1, '[{\"added\": {}}]', 10, 1),
(19, '2024-04-20 10:49:14.022406', '11', 'Luffy Zoro Sanji Nami Robin Usopp Chopper Franky Brook Jinbei Strawhat Pirate Crew Collectible Set of 11 Posters', 1, '[{\"added\": {}}]', 10, 1),
(20, '2024-04-20 10:50:09.846491', '12', 'Demon Slayer Anime Poster Set Of Nezuko Tanjiro Zenitsu Inosuke Muzan Akaza Collectible - Anime Posters |', 1, '[{\"added\": {}}]', 10, 1),
(21, '2024-04-20 10:54:05.976392', '13', 'One Piece Roronoa Zoro Long Sleeve Hoodies Pullover anime Hooded Sweatshirt for Youth Boys Girls', 1, '[{\"added\": {}}]', 10, 1),
(22, '2024-04-20 10:57:07.637203', '14', 'Demon Slayer - Shinobu Kocho T-Shirt', 1, '[{\"added\": {}}]', 10, 1),
(23, '2024-04-20 11:00:25.912792', '15', 'Heart Printing Casual Pants Women Loose Straight Joggers High Waist Sweatpants Wide Leg Pants Streetwear Hip Hop Trousers', 1, '[{\"added\": {}}]', 10, 1),
(24, '2024-04-20 11:02:52.743996', '16', 'Jujutsu Kaisen Nobara Kugisaki Sweatshirt Anime Manga Autumn New Harajuku Loose All-match Hooded Unisex Fashion Hoodie Clothes', 1, '[{\"added\": {}}]', 10, 1),
(25, '2024-04-20 12:35:36.002199', '5', 'One Piece Action Figure Donquixote Doflamingo Vs Luffy Anime Figure 21cm PVC Gk Statue Model Doll Collection Desk Decoration Toy', 2, '[{\"changed\": {\"fields\": [\"Available quantity\"]}}]', 10, 1),
(26, '2024-04-20 12:36:17.805704', '4', 'Spy X Family Anya Forger Anime Primary School Bag for Girl Children School Bags Travel Backpack SchoolBag Mochila', 2, '[{\"changed\": {\"fields\": [\"Available quantity\"]}}]', 10, 1),
(27, '2024-04-20 14:33:33.401863', '16', 'Jujutsu Kaisen Nobara Kugisaki Sweatshirt Anime Manga Autumn New Harajuku Loose All-match Hooded Unisex Fashion Hoodie Clothes', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(28, '2024-04-20 14:35:05.560181', '15', 'Heart Printing Casual Pants Women Loose Straight Joggers High Waist Sweatpants Wide Leg Pants Streetwear Hip Hop Trousers', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(29, '2024-04-20 14:35:14.729669', '14', 'Demon Slayer - Shinobu Kocho T-Shirt', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(30, '2024-04-20 14:35:25.464985', '13', 'One Piece Roronoa Zoro Long Sleeve Hoodies Pullover anime Hooded Sweatshirt for Youth Boys Girls', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(31, '2024-04-20 14:35:47.928351', '12', 'Demon Slayer Anime Poster Set Of Nezuko Tanjiro Zenitsu Inosuke Muzan Akaza Collectible - Anime Posters |', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(32, '2024-04-20 14:36:18.111696', '11', 'Luffy Zoro Sanji Nami Robin Usopp Chopper Franky Brook Jinbei Strawhat Pirate Crew Collectible Set of 11 Posters', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(33, '2024-04-20 14:36:37.176338', '10', 'Jujutsu Kaisen Anime Series Gojo Satoru Sukuna Itadori Geto Suguru Megumi Nobara Set of 6 Poster', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(34, '2024-04-20 14:36:59.915577', '1', 'Kuromi Bag Small Kawaii Saniro Plush Hello Kitty My Melody Cinnamoroll Anime Cartoon For Gifts', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(35, '2024-04-20 14:37:12.442185', '2', 'New Fashionable Anime And Many More Design Bags For Unisex School And College Life Comfortable To Carry And Reasonable', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(36, '2024-04-20 14:38:06.266699', '3', 'Akatsuki Anime Backpack For School and College for Men and Women - Black | Fashion Anime Printed Unisex Backpack', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(37, '2024-04-20 14:38:20.077929', '5', 'One Piece Action Figure Donquixote Doflamingo Vs Luffy Anime Figure 21cm PVC Gk Statue Model Doll Collection Desk Decoration Toy', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(38, '2024-04-20 14:39:26.997407', '6', 'Your Name 23cm Tachibana Taki & Miyamizu Mitsuha Figure Peripherals PVC Figurines Collectible Doll Toys Gifts', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(39, '2024-04-20 14:39:53.327724', '7', 'SPY×FAMILY Anya Forger Interchangeable heads Christmas Ver. Anime Action Figure Toys 16.5CM', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(40, '2024-04-20 14:40:11.937972', '8', 'Jujutsu Kaisen Gojo Satoru Kids Toys Action Figure Pvc Model Figurals Collection Brinquedos Doll Kid Toy Gift', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(41, '2024-04-20 14:40:35.456443', '9', 'Anime Series Naruto Team 7, Minato And Madara Poster Set- 6 Pcs', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(42, '2024-04-20 15:28:49.526866', '13', 'One Piece Roronoa Zoro Long Sleeve Hoodies Pullover anime Hooded Sweatshirt for Youth Boys Girls', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(43, '2024-04-20 15:28:58.069325', '12', 'Demon Slayer Anime Poster Set Of Nezuko Tanjiro Zenitsu Inosuke Muzan Akaza Collectible - Anime Posters |', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(44, '2024-04-20 15:29:06.147890', '11', 'Luffy Zoro Sanji Nami Robin Usopp Chopper Franky Brook Jinbei Strawhat Pirate Crew Collectible Set of 11 Posters', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(45, '2024-04-20 15:29:16.739610', '10', 'Jujutsu Kaisen Anime Series Gojo Satoru Sukuna Itadori Geto Suguru Megumi Nobara Set of 6 Poster', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(46, '2024-04-20 15:29:31.436849', '9', 'Anime Series Naruto Team 7, Minato And Madara Poster Set- 6 Pcs', 2, '[]', 10, 1),
(47, '2024-04-20 15:29:42.413226', '8', 'Jujutsu Kaisen Gojo Satoru Kids Toys Action Figure Pvc Model Figurals Collection Brinquedos Doll Kid Toy Gift', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(48, '2024-04-20 15:29:52.155861', '7', 'SPY×FAMILY Anya Forger Interchangeable heads Christmas Ver. Anime Action Figure Toys 16.5CM', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(49, '2024-04-20 15:30:03.568655', '6', 'Your Name 23cm Tachibana Taki & Miyamizu Mitsuha Figure Peripherals PVC Figurines Collectible Doll Toys Gifts', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(50, '2024-04-20 15:30:12.631924', '5', 'One Piece Action Figure Donquixote Doflamingo Vs Luffy Anime Figure 21cm PVC Gk Statue Model Doll Collection Desk Decoration Toy', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(51, '2024-04-20 15:30:26.834709', '3', 'Akatsuki Anime Backpack For School and College for Men and Women - Black | Fashion Anime Printed Unisex Backpack', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(52, '2024-04-20 15:30:33.546869', '2', 'New Fashionable Anime And Many More Design Bags For Unisex School And College Life Comfortable To Carry And Reasonable', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(53, '2024-04-20 15:30:40.034424', '1', 'Kuromi Bag Small Kawaii Saniro Plush Hello Kitty My Melody Cinnamoroll Anime Cartoon For Gifts', 2, '[{\"changed\": {\"fields\": [\"Detail\"]}}]', 10, 1),
(54, '2024-04-21 15:05:23.333113', '1', 'Order #1 - User: cindy1039, Status: Delivered', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'anime', 'cart'),
(12, 'anime', 'cartitem'),
(8, 'anime', 'category'),
(6, 'anime', 'customuser'),
(9, 'anime', 'order'),
(11, 'anime', 'orderitem'),
(10, 'anime', 'product'),
(13, 'anime', 'rootcategory'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-20 10:30:20.462008'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-04-20 10:30:20.520649'),
(3, 'auth', '0001_initial', '2024-04-20 10:30:20.779672'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-04-20 10:30:20.838641'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-04-20 10:30:20.846213'),
(6, 'auth', '0004_alter_user_username_opts', '2024-04-20 10:30:20.869689'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-04-20 10:30:20.875720'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-04-20 10:30:20.878760'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-04-20 10:30:20.886713'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-04-20 10:30:20.899141'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-04-20 10:30:20.907138'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-04-20 10:30:20.921138'),
(13, 'auth', '0011_update_proxy_permissions', '2024-04-20 10:30:20.931148'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-04-20 10:30:20.936689'),
(15, 'anime', '0001_initial', '2024-04-20 10:30:21.954765'),
(16, 'admin', '0001_initial', '2024-04-20 10:30:22.115588'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-04-20 10:30:22.126631'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-20 10:30:22.137597'),
(19, 'sessions', '0001_initial', '2024-04-20 10:30:22.171624');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0jukp9pwo0o4989xopmzznk7vnz3ga92', '.eJxVjLsOAiEQAP-F2hCyvFxLe7-BLCzIqYHkuKuM_25IrtB2ZjJvEWjfathHXsPC4iJAnH5ZpPTMbQp-ULt3mXrb1iXKmcjDDnnrnF_Xo_0bVBp1bpUu2tiivY9QEIvRTruileN0RiaDislHD9bHqMAphwyUOCOkxGzF5wvKezfc:1ry9xY:ld_gQnrJrZtjaRBRCH7qNnmWj_NhVA34Ff60h97YH-0', '2024-05-04 12:36:48.709488'),
('b4xjnjr8jv7iiq2jui72px7fxt3qchez', '.eJxVjEEOwiAQRe_C2hCgRRiX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5VtbP2RkQ8PZq5S1AVZZeVAJrMUIkEdLBKjZQyLMlo3jUTMp50i7HMX7A-xqOHo:1ryYkH:PqDpjoxDk6XpYm_nbkDPwJQK8jPur-0ILJjZ-5rj58I', '2024-05-05 15:04:45.995204'),
('jbmxbcsmsmyv0xbrp0vlgb3598775m9b', '.eJxVjLsOAiEQAP-F2hCyvFxLe7-BLCzIqYHkuKuM_25IrtB2ZjJvEWjfathHXsPC4iJAnH5ZpPTMbQp-ULt3mXrb1iXKmcjDDnnrnF_Xo_0bVBp1bpUu2tiivY9QEIvRTruileN0RiaDislHD9bHqMAphwyUOCOkxGzF5wvKezfc:1ry8YK:NZn5jo2vV3LHI7RpF3fPqHcfmgnSVt7n8UKBU2a3Xao', '2024-05-04 11:06:40.327522'),
('vt7rrzro5p84sh3x2phulobgm0j7x2wl', '.eJxVjLsOAiEQAP-F2hCyvFxLe7-BLCzIqYHkuKuM_25IrtB2ZjJvEWjfathHXsPC4iJAnH5ZpPTMbQp-ULt3mXrb1iXKmcjDDnnrnF_Xo_0bVBp1bpUu2tiivY9QEIvRTruileN0RiaDislHD9bHqMAphwyUOCOkxGzF5wvKezfc:1ryDWU:X48T1REBevaz_WygLVctP8amhufARCAWF3rF6FRmWoQ', '2024-05-04 16:25:06.153833'),
('zxhjgntum9ltnuly9dq8iummdhkmqwsr', '.eJxVjLsOAiEQAP-F2hCyvFxLe7-BLCzIqYHkuKuM_25IrtB2ZjJvEWjfathHXsPC4iJAnH5ZpPTMbQp-ULt3mXrb1iXKmcjDDnnrnF_Xo_0bVBp1bpUu2tiivY9QEIvRTruileN0RiaDislHD9bHqMAphwyUOCOkxGzF5wvKezfc:1ryZ7F:Ra8WZRm3oYzi44LFK6ChIpzwRxBbAkRbzwoVQs5AZaY', '2024-05-05 15:28:29.067070');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `order_date`, `status`, `total_price`, `user_id`) VALUES
(1, '2024-04-20 11:07:06.000000', 'Delivered', 2750.00, 2),
(2, '2024-04-20 13:15:40.111035', 'Pending', 3200.00, 2),
(3, '2024-04-20 15:47:35.204678', 'Pending', 1050.00, 1),
(4, '2024-04-21 11:34:12.361685', 'Pending', 8650.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `order_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `quantity`, `order_id`, `product_id`) VALUES
(1, 3, 1, 1),
(2, 2, 2, 4),
(3, 1, 3, 1),
(4, 1, 4, 5),
(5, 1, 4, 1),
(6, 2, 4, 2),
(7, 1, 4, 3),
(8, 1, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `detail` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale` tinyint(1) NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `image3` varchar(100) DEFAULT NULL,
  `image4` varchar(100) DEFAULT NULL,
  `available_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `title`, `description`, `detail`, `price`, `sale`, `sale_price`, `image1`, `image2`, `image3`, `image4`, `available_quantity`) VALUES
(1, 'Kuromi Bag Small Kawaii Saniro Plush Hello Kitty My Melody Cinnamoroll Anime Cartoon For Gifts', 'Kuromi  is a character from the My Melody universe. She is My Melody\'s rival and doppelgänger, and manifests as a white rabbit or imp-like creature wearing a black jester\'s hat with a pink skull on the front and a black devil\'s tail.', 'AVAILABLE IN DIFFERENT CHARACTER,\r\nSIZE : 20CM,\r\nKUROMI BAG,\r\nLAVENDER IN COLOR,\r\nFOR GIFT,\r\nFOR CHILDREN AND ADULT', 850.00, 0, NULL, 'product_images/k1.webp', 'product_images/k2.webp', 'product_images/k3.webp', '', 15),
(2, 'New Fashionable Anime And Many More Design Bags For Unisex School And College Life Comfortable To Carry And Reasonable', 'One Piece follows the adventures of Monkey D. Luffy and his crew, the Straw Hat Pirates, where he explores the Grand Line in search of the mythical treasure known as the \"One Piece\" in order to become the next King of the Pirates.', 'Organizing pocket,\r\nTop handle for easy grabbing,\r\nAffortable price,\r\nAdjustable shoulder straps', 1300.00, 0, NULL, 'product_images/o1.webp', 'product_images/02.webp', 'product_images/o3.webp', '', 8),
(3, 'Akatsuki Anime Backpack For School and College for Men and Women - Black | Fashion Anime Printed Unisex Backpack', 'This Anime Backpack from Akatsuki is an ideal option for both men and women who are searching for a practical and trendy backpack for school or college. Constructed with long-lasting Coredura fabric, this backpack is built to endure. It boasts a large capacity and a hidden pocket inside for added security. The anime symbol sign design adds a touch of fashion to this backpack, making it a perfect choice for anime enthusiasts. With dimensions of 43cm x 30.5cm x 17cm, this backpack is spacious enough to carry all your essentials.', 'Check Dimension and Quick Details Before buying,\r\nHeight 43 cm,\r\nlength 30.5 cm,\r\nbreadth 17cm,\r\nMaterial: Coredura fabric,\r\nType: Backpack,\r\nGender:Unisex,\r\nStyle: Anime', 1000.00, 0, NULL, 'product_images/n2.webp', 'product_images/n1.webp', '', '', 24),
(4, 'Spy X Family Anya Forger Anime Primary School Bag for Girl Children School Bags Travel Backpack SchoolBag Mochila', 'Spy X Family Anya Forger Anime Primary School Bag for Girl Children School Bags Travel Backpack SchoolBag Mochila\r\n\r\nSize: 30*14*43cm', 'Technics:Embossing\r\nHandle/Strap Type:soft handle\r\nStyle:Anime\r\nExterior:Open Pocket\r\nBackpacks Type:External Frame\r\nPattern Type:CARTOON\r\nGender:Unisex\r\nMain Material:nylon', 1500.00, 0, NULL, 'product_images/a1_OYvyYgH.webp', 'product_images/a3_WxUDfcz.webp', 'product_images/a2_DhQc24T.webp', '', 17),
(5, 'One Piece Action Figure Donquixote Doflamingo Vs Luffy Anime Figure 21cm PVC Gk Statue Model Doll Collection Desk Decoration Toy', 'One Piece Action Figure Donquixote Doflamingo Vs Luffy Anime Figure 21cm PVC Gk Statue Model Doll Collection Desk Decoration Toy Gifts\r\nNote: The product size is measured manually with an error of 1-3cm. Please refer to the actual product. Due to different monitors and different shooting angles, the picture may not reflect the actual color of the item.', 'Dimensions:18*17*21,\r\nBrand Name:Bandai,\r\nMaterial:PVC,\r\nCommodity Attribute:Finished Goods', 2500.00, 0, NULL, 'product_images/l2.webp', 'product_images/l4.webp', 'product_images/l1.webp', 'product_images/l3.webp', 19),
(6, 'Your Name 23cm Tachibana Taki & Miyamizu Mitsuha Figure Peripherals PVC Figurines Collectible Doll Toys Gifts', 'Material: 100% Brand New High Quality PVC Material\r\nPacking: OPP Bag\r\nSize: 21CM\r\nNote:\r\nDue to the different monitor and light effect, the actual color maybe a slight different from the picture color.\r\nPlease allow 1-2cm differs due to manual measurement.\r\nWelcome to Dropshipping', 'Brand Name:Bandai,\r\nMaterial:PVC,\r\nCommodity Attribute:Finished Goods,\r\nItem Type:Model,\r\nTheme: Movies and TV', 3000.00, 0, NULL, 'product_images/n1_pHanAEM.webp', 'product_images/n2_b4G3o1z.webp', 'product_images/n4.webp', 'product_images/n3.webp', 10),
(7, 'SPY×FAMILY Anya Forger Interchangeable heads Christmas Ver. Anime Action Figure Toys 16.5CM', 'SPY×FAMILY Anya Forger Interchangeable heads Christmas Ver. Anime Action Figure Toys 16.5CM\r\n\r\nSize is about 16.5CM', 'Brand Name:Bandai,\r\nMaterial:PVC,\r\nCommodity Attribute:Finished Goods,\r\nItem Type:Model,\r\nTheme: Movies and TV', 2000.00, 0, NULL, 'product_images/a2_zadMPyg.webp', 'product_images/a1_TRi522u.webp', 'product_images/a3_biWQnYK.webp', 'product_images/a4.webp', 30),
(8, 'Jujutsu Kaisen Gojo Satoru Kids Toys Action Figure Pvc Model Figurals Collection Brinquedos Doll Kid Toy Gift', 'Jujutsu Kaisen Gojo Satoru Kids Toys Action Figure Pvc Model Figurals Collection Brinquedos Doll Kid Toy Gift', 'Brand Name:Bandai,\r\nMaterial:PVC,\r\nCommodity Attribute:Finished Goods,\r\nItem Type:Model,\r\nTheme: Movies and TV', 2300.00, 0, NULL, 'product_images/j3.webp', 'product_images/j1.webp', 'product_images/j2.webp', '', 5),
(9, 'Anime Series Naruto Team 7, Minato And Madara Poster Set- 6 Pcs', 'Naruto series tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.', 'Anime: Naruto Series,\r\nCharacter: Naruto, Sasuke,Sakura, Kakashi, Minato & Madara,\r\nCollectible Poster Setof Famous Series Naruto,\r\nLimited Edition,\r\nHard and High Qualtiy Papers and Prints,\r\nSize: 14.5 cm width X 28.5 cm in height,\r\nColor: Multicolor,\r\nOrientation: Portrait', 225.00, 0, NULL, 'product_images/n1_PSKyf18.webp', 'product_images/n3.jpg', '', '', 35),
(10, 'Jujutsu Kaisen Anime Series Gojo Satoru Sukuna Itadori Geto Suguru Megumi Nobara Set of 6 Poster', 'Jujutsu kaisen series follows high school student Yuji Itadori as he joins a secret organization of Jujutsu Sorcerers in order to kill a powerful Curse named Ryomen Sukuna, of whom Yuji becomes the host to.', 'Anime: Jujutsu Kaisen,\r\nCharacters: Gojo Satoru, Geto Suguru, Ryomen Sukuna, Yuji Itadori, Megumi Fushiguro, Nobara Kugisaki,\r\nMaterial: High quality Paper,\r\nColor: Multicolor,\r\nPrintsSize: 14.5 cm width X 28.5 cm in height', 225.00, 0, NULL, 'product_images/j2_OuE8plu.webp', 'product_images/j1.jpg_.webp', 'product_images/j3.jpg', '', 10),
(11, 'Luffy Zoro Sanji Nami Robin Usopp Chopper Franky Brook Jinbei Strawhat Pirate Crew Collectible Set of 11 Posters', 'One Piece follows the adventures of Monkey D. Luffy and his crew, the Straw Hat Pirates, where he explores the Grand Line in search of the mythical treasure known as the \"One Piece\" in order to become the next King of the Pirates.', 'Anime:One Piece,\r\nCollectible Poster Set of Strawhat Crew all 10 Members,\r\nFamous Anime Series,\r\nLimited Edition,\r\nHard and High Quality Papers and Prints,\r\nSize: 5.7 in width X 10.9 in height', 425.00, 0, NULL, 'product_images/o1_5eLIitb.webp', 'product_images/02_NtsEBtc.webp', 'product_images/o3_XXQRAgH.webp', '', 15),
(12, 'Demon Slayer Anime Poster Set Of Nezuko Tanjiro Zenitsu Inosuke Muzan Akaza Collectible - Anime Posters |', 'Demon Slayer\'s multifaceted appeal stems from the synergy of its various elements. The convergence of masterful animation, compelling characters, historical exploration, and poignant themes has catapulted the series to unprecedented heights of acclaim and popularity.', 'Anime: Demon Slayer / Kimetsu No Yaiba,\r\nCharacter: Nezuko Tanjiro Zenitsu Inosuke Muzan Akaza.,\r\nCollectible Poster Set,\r\nFamous Series,\r\nLimited Edition,\r\nHard and High Qualtiy Papers and Prints (No Low quality print and images),\r\nSize: 5 inch width X 11 in height', 220.00, 0, NULL, 'product_images/d1.webp', 'product_images/d2.webp', '', '', 10),
(13, 'One Piece Roronoa Zoro Long Sleeve Hoodies Pullover anime Hooded Sweatshirt for Youth Boys Girls', 'One Piece Roronoa Zoro Long Sleeve Hoodies Pullover anime Hooded Sweatshirt for Youth Boys Girls', 'Brand Name:Bandai,\r\nRecommend Age:18+', 2500.00, 0, NULL, 'product_images/j1_jHDydrc.webp', 'product_images/j2_5VMQkFB.webp', '', '', 3),
(14, 'Demon Slayer - Shinobu Kocho T-Shirt', 'Superior Comfort\r\nThere\'S Nothing Better Than Being Cozy And Free In Clothing. We Designs Our Clothes With Soft, Durable Fabric. You\'Ll Love It So Much You\'Ll Never Want To Get Changed.\r\nOne Of The Best Types Of Clothes To Match', 'Applicable Scene:Casual,\r\nFabric Type:Broadcloth,\r\nHooded:No,\r\nPattern Type:Print', 900.00, 0, NULL, 'product_images/d1_qweYHmw.webp', '', '', '', 15),
(15, 'Heart Printing Casual Pants Women Loose Straight Joggers High Waist Sweatpants Wide Leg Pants Streetwear Hip Hop Trousers', 'It is a pair of pants with heart pattern and suitable for fitness, sport, yoga, and running, which can absorb sweat and show your slim body curve.\r\nThe long pants with casual design are suitable for using in different occasions in spring, summer, autumn, and winter.\r\nThe pants are made of polyester material.\r\nThe pants has four sizes of M, L, XL, and 2XL.', 'Age:MIDDLE AGE,\r\nPant Style:STRAIGHT,\r\nWaist Type:MID,\r\nSize: M, L, XL, 2XL', 700.00, 0, NULL, 'product_images/s1.webp', '', '', '', 11),
(16, 'Jujutsu Kaisen Nobara Kugisaki Sweatshirt Anime Manga Autumn New Harajuku Loose All-match Hooded Unisex Fashion Hoodie Clothes', 'Jujutsu Kaisen Nobara Kugisaki Sweatshirt Anime Manga Autumn New Harajuku Loose All-match Hooded Unisex Fashion Hoodie Clothes', 'Applicable Season:Autumn And Winter,\r\nPattern Type:CARTOON,\r\nApplicable Scene:Casual,\r\nClothing Length:regular,\r\nHooded:No', 1700.00, 0, NULL, 'product_images/a1_dsHhVCg.webp', '', '', '', 39);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4),
(8, 8, 4),
(9, 9, 2),
(10, 10, 2),
(11, 11, 2),
(12, 12, 2),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(16, 16, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anime_category`
--
ALTER TABLE `anime_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_category_parent_id_6aa51b77_fk_anime_category_id` (`parent_id`);

--
-- Indexes for table `anime_customuser`
--
ALTER TABLE `anime_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `anime_customuser_groups`
--
ALTER TABLE `anime_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anime_customuser_groups_customuser_id_group_id_d6070e48_uniq` (`customuser_id`,`group_id`),
  ADD KEY `anime_customuser_groups_group_id_1687e075_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `anime_customuser_user_permissions`
--
ALTER TABLE `anime_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anime_customuser_user_pe_customuser_id_permission_3bf7d6d2_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `anime_customuser_use_permission_id_14843731_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `anime_rootcategory`
--
ALTER TABLE `anime_rootcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_id_1361a739_fk_anime_customuser_id` (`user_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_item_cart_id_157ecf5f_fk_cart_id` (`cart_id`),
  ADD KEY `cart_item_product_id_17acb13c_fk_product_product_id` (`product_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_anime_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_id_e323497c_fk_anime_customuser_id` (`user_id`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderitem_order_id_e716e9f7_fk_order_id` (`order_id`),
  ADD KEY `orderitem_product_id_dd00a492_fk_product_product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_categories_product_id_category_id_7f37747d_uniq` (`product_id`,`category_id`),
  ADD KEY `product_categories_category_id_127e9bb3_fk_anime_category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anime_category`
--
ALTER TABLE `anime_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `anime_customuser`
--
ALTER TABLE `anime_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `anime_customuser_groups`
--
ALTER TABLE `anime_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_customuser_user_permissions`
--
ALTER TABLE `anime_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_rootcategory`
--
ALTER TABLE `anime_rootcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anime_category`
--
ALTER TABLE `anime_category`
  ADD CONSTRAINT `anime_category_parent_id_6aa51b77_fk_anime_category_id` FOREIGN KEY (`parent_id`) REFERENCES `anime_category` (`id`);

--
-- Constraints for table `anime_customuser_groups`
--
ALTER TABLE `anime_customuser_groups`
  ADD CONSTRAINT `anime_customuser_gro_customuser_id_6a7504c4_fk_anime_cus` FOREIGN KEY (`customuser_id`) REFERENCES `anime_customuser` (`id`),
  ADD CONSTRAINT `anime_customuser_groups_group_id_1687e075_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `anime_customuser_user_permissions`
--
ALTER TABLE `anime_customuser_user_permissions`
  ADD CONSTRAINT `anime_customuser_use_customuser_id_5b8998d3_fk_anime_cus` FOREIGN KEY (`customuser_id`) REFERENCES `anime_customuser` (`id`),
  ADD CONSTRAINT `anime_customuser_use_permission_id_14843731_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `anime_rootcategory`
--
ALTER TABLE `anime_rootcategory`
  ADD CONSTRAINT `anime_rootcategory_category_id_84bf7960_fk_anime_category_id` FOREIGN KEY (`category_id`) REFERENCES `anime_category` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_user_id_1361a739_fk_anime_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `anime_customuser` (`id`);

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_cart_id_157ecf5f_fk_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cart_item_product_id_17acb13c_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_anime_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `anime_customuser` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_user_id_e323497c_fk_anime_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `anime_customuser` (`id`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_order_id_e716e9f7_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `orderitem_product_id_dd00a492_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_127e9bb3_fk_anime_category_id` FOREIGN KEY (`category_id`) REFERENCES `anime_category` (`id`),
  ADD CONSTRAINT `product_categories_product_id_8862397f_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
