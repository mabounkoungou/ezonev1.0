-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 18, 2023 at 09:32 AM
-- Server version: 8.0.33
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akihvfyj_lundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `id` int NOT NULL,
  `ac_name` varchar(255) NOT NULL,
  `ac_number` varchar(255) NOT NULL,
  `ac_decrip` varchar(255) NOT NULL,
  `store_ID` varchar(255) NOT NULL,
  `balance` float NOT NULL DEFAULT '0',
  `store_name` varchar(255) NOT NULL,
  `delet_flage` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`id`, `ac_name`, `ac_number`, `ac_decrip`, `store_ID`, `balance`, `store_name`, `delet_flage`) VALUES
(1, 'Cash', '00000000', 'Cash Account', '1', 10648.3, 'trinity ', '0'),
(2, 'trinity-ICICI ', '60020051020', 'bank account of trinity shop ', '1', 2967.17, 'trinity ', '0'),
(4, 'trinity-BOB', '625500010510002', 'BOB bank account of trinity shop ', '1', 50001300, 'trinity ', '0'),
(5, 'Cash', '00000000', 'Cash Account ', '5', 28846.3, 'papel ', '0'),
(6, 'papel-BOB', '5689900025002', 'BOB bank account of papel shop ', '5', 523138, 'papel ', '0'),
(7, 'Cash', '000000', 'Cash account of rio shop ', '6', 13593.9, 'rio ', '0'),
(8, 'Cash', '8989556652', 'My personal', '10', 1311.52, 'iLaundry ', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_addons`
--

CREATE TABLE `tbl_addons` (
  `id` int NOT NULL,
  `addon` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  `store_ID` varchar(45) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_addons`
--

INSERT INTO `tbl_addons` (`id`, `addon`, `price`, `status`, `store_ID`) VALUES
(2, 'tiching', 5.36, '0', '1'),
(3, 'Extra Care', 14.36, '0', '1'),
(4, 'Safai', 1.39, '0', '1'),
(5, 'color', 8.23, '0', '1'),
(8, 'color', 50, '0', '6'),
(9, 'paking', 64.35, '0', '1'),
(10, 'Laundry Bag', 45, '0', '5'),
(11, 'Hang Dry Bag', 60, '0', '5'),
(12, 'Linen Bag', 30, '0', '5'),
(13, 'Extra Dry Cleaned', 30, '0', '5'),
(14, 'Extra Laundered', 60, '0', '5');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `store_ID` varchar(45) NOT NULL DEFAULT '0',
  `roll_id` varchar(45) NOT NULL DEFAULT '0',
  `approved` varchar(45) NOT NULL DEFAULT '0',
  `delet_flage` varchar(45) NOT NULL DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `is_staff` varchar(45) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `name`, `number`, `email`, `username`, `password`, `store_ID`, `roll_id`, `approved`, `delet_flage`, `img`, `is_staff`) VALUES
(1, 'admin', '916598788556', 'trinity1@gmail.com', 'admin', '1234', '1', '1', '1', '0', '1674642755446-avatar-1.jpg', '1'),
(2, 'UrbanDhobi', '+914567893548', 'trinity@gmail.com', 'urbandhobi', '1234', '1', '2', '1', '0', 'None', '0'),
(3, 'E-Laundry', '+915654654555', 'trinity@gmail.com', 'abc', '123', '5', '2', '1', '0', 'None', '0'),
(4, 'Rosie Wash Express Laundry', '+5452525252525', 'puma@gmail.com1', 'abc23', '2563', '6', '2', '1', '0', 'None', '0'),
(6, 'bhagat', '+16852148684', 'abc@gmail.com', 'bhagat', '1234', '1', '4', '1', '0', 'None', '1'),
(9, '360 Wash-N-Dry', '+919985678412', 'dixit@gmail.com', 'stayn', '777', '7', '2', '1', '0', 'None', '0'),
(10, 'Yagnik', '+655252525256', 'abc1@gmail.com', 'abcd5', '7777', '5', '9', '1', '0', '1675144239860-avatar-4.jpg', '1'),
(11, 'Happy Laundry and Dry Cleaning', '+789958475136', 'aone@gmail.com', 'aone', '7272', '8', '2', '1', '0', 'None', '0'),
(12, 'Bubbly Bubbles Laundry', '+68695217486', 'slite@gmail.com', 'lite', '123', '9', '2', '1', '0', 'None', '0'),
(13, 'iLaundry', '+16359854', 'decent@gmail.com', 'ketan', '123', '10', '2', '1', '0', 'None', '0'),
(16, 'vivek', '+9125963847', 'vivek@thepotenzials.com', 'vivek', '123', '1', '4', '1', '0', 'None', '1'),
(17, 'ketan', '+919898989', 'y@gmail.com', 'ketan', '123', '1', '4', '1', '0', 'None', '1'),
(18, 'vaibhav', '+912569842', 'vaibhav@gmail.com', 'v123', '123', '5', '5', '1', '0', 'None', '1'),
(19, 'Ramesh', '+91989898989', 'ramesh@gmail.com', 'ramesh', '123', '10', '10', '1', '0', '1674650353821-ava.png', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int NOT NULL,
  `created_by` varchar(45) NOT NULL DEFAULT '0',
  `store_id` varchar(45) NOT NULL DEFAULT '0',
  `customer_id` varchar(45) NOT NULL DEFAULT '0',
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `service_list_id` varchar(255) NOT NULL DEFAULT '0',
  `order_id` varchar(255) NOT NULL DEFAULT '0',
  `addon_id` varchar(255) NOT NULL DEFAULT '0',
  `addon_price` float NOT NULL DEFAULT '0',
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `extra_discount` float NOT NULL DEFAULT '0',
  `coupon_id` varchar(255) NOT NULL DEFAULT '0',
  `coupon_discount` float NOT NULL DEFAULT '0',
  `tax` float DEFAULT NULL,
  `sub_total` float NOT NULL DEFAULT '0',
  `gross_total` float NOT NULL DEFAULT '0',
  `paid_amount` float NOT NULL DEFAULT '0',
  `payment_type` varchar(255) NOT NULL DEFAULT '0',
  `balance` float NOT NULL DEFAULT '0',
  `notes` varchar(255) NOT NULL DEFAULT ' ',
  `tax_amount` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`id`, `created_by`, `store_id`, `customer_id`, `order_date`, `service_list_id`, `order_id`, `addon_id`, `addon_price`, `delivery_date`, `extra_discount`, `coupon_id`, `coupon_discount`, `tax`, `sub_total`, `gross_total`, `paid_amount`, `payment_type`, `balance`, `notes`, `tax_amount`) VALUES
(1, '1,1', '5', '62', '2023-07-17 20:25:12', '0,509', '#ORD0212', '0', 0, '2023-07-17 20:25:12', 0, '0', 0, 15, 100, 115, 0, '0', 115, '', 15),
(2, '1,4', '6', '0', '2023-01-30 06:24:44', '0', '#ORD 0011', '0', 0, '2023-01-30 06:24:44', 0, '0', 0, 20, 0, 0, 0, '0', 0, '', 0),
(3, '1,3', '5', '62', '2023-07-15 15:20:41', '0', '#ORD0206', '0', 0, '2023-07-15 15:20:41', 0, '0', 0, 15, 0, 0, 0, '0', 0, '', 0),
(4, '0,1', '1', '9', '2023-01-26 18:30:00', '0', '#ORD 0154', '0', 0, '2023-01-26 18:30:00', 0, '0', 0, 25, 0, 0, 0, '0', 0, '', 0),
(5, '1,6', '1', '10', '2023-01-25 03:49:43', '0', '#ORD 0138', '0', 0, '2023-01-25 03:49:43', 0, '0', 0, 25, 0, 0, 0, '0', 0, ' ', 0),
(6, '1,2', '1', '63', '2023-07-12 17:12:50', '0', '#ORD0208', '0', 0, '2023-07-12 17:12:50', 0, '0', 0, 25, 0, 0, 0, '0', 0, '', 0),
(7, '1,10', '5', '62', '2023-07-09 08:39:39', '0,469', '#ORD0207', '0', 0, '2023-07-09 08:39:39', 0, '0', 0, 15, 100, 115, 0, '0', 115, '', 15),
(8, '1,13', '10', '0', '2023-01-25 12:43:50', '0,349', '#ORD 0146', '0', 0, '2023-01-25 12:43:50', 0, '0', 0, 17.2, 60, 70.32, 0, '0', 70.32, '', 10.32),
(9, '1,19', '10', '0', '2023-01-25 12:32:05', '0,343,344', '#ORD 0150', '0', 0, '2023-01-25 12:32:05', 0, '0', 0, 17.2, 130, 152.36, 0, '0', 152.36, ' ', 22.36),
(10, '0,49', '10', '0', '2023-01-25 12:57:21', '0,351', '#ORD 0147', '0', 0, '2023-01-25 12:57:21', 0, '0', 0, 17.2, 50, 58.6, 0, '0', 58.6, '', 8.6),
(11, '0,48', '1', '48', '2023-07-04 18:12:23', '0,451', '#ORD0208', '0', 0, '2023-07-04 18:12:23', 0, '0', 0, 25, 25.67, 32.09, 0, '0', 32.09, '', 6.42),
(12, '0,52', '1', '52', '2023-07-11 05:20:26', '0,472,489,499,500,501', '#ORD0208', '0', 0, '2023-07-11 05:20:26', 0, '0', 0, 25, 256.81, 321.01, 0, '0', 321.01, '', 64.2),
(13, '0,51', '6', '62', '2023-02-01 06:36:57', '0', '#ORD 0028', '0', 0, '2023-02-01 06:36:57', 0, '0', 0, 20, 0, 0, 0, '0', 0, ' ', 0),
(15, '0,56', '5', '62', '2023-06-26 08:42:56', '0', '#ORD 0110', '0', 0, '2023-06-26 08:42:56', 0, '0', 0, 15, 0, 0, 0, '0', 0, ' ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart_servicelist`
--

CREATE TABLE `tbl_cart_servicelist` (
  `id` int NOT NULL,
  `service_id` varchar(255) NOT NULL,
  `service_type_id` varchar(255) NOT NULL,
  `service_type_price` float NOT NULL,
  `service_quntity` int NOT NULL,
  `service_color` varchar(255) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_type_name` varchar(255) NOT NULL,
  `service_img` varchar(255) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_cart_servicelist`
--



-- --------------------------------------------------------

--
-- Table structure for table `tbl_commision`
--

CREATE TABLE `tbl_commision` (
  `id` int NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` float DEFAULT NULL,
  `from_account` varchar(255) DEFAULT NULL,
  `to_account` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_commision`
--

INSERT INTO `tbl_commision` (`id`, `date`, `amount`, `from_account`, `to_account`, `description`, `store_id`) VALUES
(1, '2023-01-27 18:30:00', 25.78, '6', '1', 'Pay Store comiision', '5'),
(2, '2023-01-30 18:30:00', 233.4, '2', '1', '', '1'),
(3, '2023-01-30 18:30:00', 11.62, '6', '2', '', '5'),
(4, '2023-01-31 18:30:00', 100, '5', '1', '', '5');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `id` int NOT NULL,
  `titel` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `min_purchase` float NOT NULL,
  `discount` float NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `store_list_id` varchar(255) NOT NULL DEFAULT '1',
  `coupon_type` varchar(255) NOT NULL,
  `limit_forsame_user` int NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_coupon`
--

INSERT INTO `tbl_coupon` (`id`, `titel`, `code`, `min_purchase`, `discount`, `start_date`, `end_date`, `store_list_id`, `coupon_type`, `limit_forsame_user`, `status`) VALUES
(2, 'Well-Come Offer', 'E56SUQ', 500, 50, '2023-01-11 00:00:00', '2023-09-22 00:00:00', '1,5,6,7', '2', 1, '0'),
(3, 'dhamaka', 'CK47WN', 5000, 100, '2023-01-19 00:00:00', '2023-01-31 00:00:00', '1,5,6,7', '1', 2, '0'),
(4, 'holi utsav', '9JGNH0', 700, 150, '2023-01-20 00:00:00', '2023-03-30 00:00:00', '1,5,6,7', '1', 1, '0'),
(5, 'Independ Order', '7O8TAG', 200, 30, '2023-01-20 00:00:00', '2023-01-27 00:00:00', '1,5,6,7', '1', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `taxnumber` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `store_ID` varchar(45) NOT NULL DEFAULT '1',
  `reffstore` varchar(45) NOT NULL DEFAULT '1',
  `approved` int NOT NULL DEFAULT '0',
  `delet_flage` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_customer`
--



-- --------------------------------------------------------

--
-- Table structure for table `tbl_email`
--

CREATE TABLE `tbl_email` (
  `id` int NOT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `frommail` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_email`
--

INSERT INTO `tbl_email` (`id`, `store_id`, `host`, `port`, `username`, `password`, `frommail`, `status`) VALUES
(1, '5', 'hostname', '465', 'email_address', 'password', 'from_mail', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense`
--

CREATE TABLE `tbl_expense` (
  `id` int NOT NULL,
  `date` timestamp NOT NULL,
  `amount` float NOT NULL,
  `towards` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `taxInclud` varchar(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `delet_flage` varchar(255) NOT NULL DEFAULT '0',
  `store_ID` varchar(255) DEFAULT '1',
  `taxpercent` int DEFAULT '0',
  `transection_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_expense`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_exp_cat`
--

CREATE TABLE `tbl_exp_cat` (
  `id` int NOT NULL,
  `exp_cat_type_id` varchar(45) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `delet_flage` varchar(45) NOT NULL DEFAULT '0',
  `store_ID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_exp_cat`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_exp_cat_type`
--

CREATE TABLE `tbl_exp_cat_type` (
  `id` int NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `delet_flage` varchar(45) NOT NULL DEFAULT '0',
  `store_ID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_exp_cat_type`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_shop`
--

CREATE TABLE `tbl_master_shop` (
  `id` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `currency_placement` int DEFAULT '0',
  `thousands_separator` varchar(45) DEFAULT NULL,
  `customer_autoapprove` int DEFAULT '0',
  `store_autoapprove` int DEFAULT '0',
  `timezone` varchar(255) DEFAULT NULL,
  `printer` int DEFAULT '0',
  `storeroll` int DEFAULT '0',
  `app_logo` varchar(255) DEFAULT NULL,
  `app_favicon` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `onesignal_app_id` varchar(255) DEFAULT NULL,
  `onesignal_api_key` varchar(255) DEFAULT NULL,
  `twilio_sid` varchar(255) DEFAULT NULL,
  `twilio_auth_token` varchar(255) DEFAULT NULL,
  `twilio_phone_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_master_shop`
--

INSERT INTO `tbl_master_shop` (`id`, `type`, `currency_symbol`, `currency_placement`, `thousands_separator`, `customer_autoapprove`, `store_autoapprove`, `timezone`, `printer`, `storeroll`, `app_logo`, `app_favicon`, `app_name`, `onesignal_app_id`, `onesignal_api_key`, `twilio_sid`, `twilio_auth_token`, `twilio_phone_no`) VALUES
(1, '1', '$', 0, '1', 0, 1, 'Asia/Calcutta', 0, 4, '1687515875491-1674713607268-llll11.png', '1674714113150-llll11.png', 'iLaundry', 'key', 'hash', 'sid', 'token', 'phone_number_approve_twilio');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int NOT NULL,
  `invoice` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `sender` varchar(45) NOT NULL,
  `received` varchar(45) NOT NULL,
  `notification` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_notification`
--



-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` int DEFAULT NULL,
  `service_list` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `addon_data` varchar(255) DEFAULT NULL,
  `addon_price` float DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `coupon_id` varchar(255) DEFAULT NULL,
  `coupon_discount` float DEFAULT NULL,
  `extra_discount` float DEFAULT NULL,
  `gross_total` float DEFAULT NULL,
  `paid_amount` float DEFAULT NULL,
  `balance_amount` float DEFAULT NULL,
  `payment_data` varchar(255) DEFAULT NULL,
  `tax_amount` float DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `stutus_change_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `master_comission` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_order`
--



-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderstatus`
--

CREATE TABLE `tbl_orderstatus` (
  `id` int NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_orderstatus`
--

INSERT INTO `tbl_orderstatus` (`id`, `status`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Ready To deliver'),
(4, 'Deliver'),
(5, 'Returned'),
(6, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_payment`
--

CREATE TABLE `tbl_order_payment` (
  `id` int NOT NULL,
  `payment_amount` float NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_account` varchar(255) NOT NULL,
  `order_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_order_payment`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_roll`
--

CREATE TABLE `tbl_roll` (
  `id` int NOT NULL,
  `roll` varchar(255) NOT NULL,
  `orders` varchar(45) NOT NULL DEFAULT ' ',
  `expense` varchar(45) NOT NULL DEFAULT ' ',
  `service` varchar(45) NOT NULL DEFAULT ' ',
  `reports` varchar(45) NOT NULL DEFAULT ' ',
  `tools` varchar(45) NOT NULL DEFAULT ' ',
  `mail` varchar(45) NOT NULL DEFAULT ' ',
  `master` varchar(45) NOT NULL DEFAULT ' ',
  `sms` varchar(45) NOT NULL DEFAULT ' ',
  `staff` varchar(45) NOT NULL DEFAULT ' ',
  `pos` varchar(45) NOT NULL DEFAULT ' ',
  `account` varchar(45) DEFAULT ' ',
  `coupon` varchar(45) DEFAULT ' ',
  `rollaccess` varchar(45) NOT NULL DEFAULT ' ',
  `delet_flage` varchar(45) NOT NULL DEFAULT '0',
  `store_ID` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_roll`
--

INSERT INTO `tbl_roll` (`id`, `roll`, `orders`, `expense`, `service`, `reports`, `tools`, `mail`, `master`, `sms`, `staff`, `pos`, `account`, `coupon`, `rollaccess`, `delet_flage`, `store_ID`) VALUES
(1, 'master_Admin', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', '0', '1'),
(2, 'Store', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit', 'read,write,edit', 'read,edit', 'read', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', '', 'read,write,edit', '0', '1'),
(4, 'Cashier', 'read,write,edit,delete', 'read,write,edit', 'read,write,edit', 'read', 'read', 'read', 'read', 'read', 'read,write', 'read,write,edit,delete', 'read', 'read', 'read', '0', '1'),
(5, 'coustomer', 'read,edit', 'read', 'read', '', '', 'edit', 'write', '', '', '', '', '', '', '0', '5'),
(6, 'Cashier', '', 'read,write,edit,delete', 'read,write,edit,delete', '', '', '', 'write', '', '', '', '', '', '', '0', '6'),
(7, 'customer', 'read', 'read,write,edit', '', '', '', '', '', '', '', '', NULL, NULL, '', '0', '6'),
(9, 'manager', 'read,write,edit,delete', 'read,write,edit', '', '', '', '', '', '', '', 'read,write,edit,delete', '', '', '', '0', '5'),
(10, 'Office boys', 'read,write,edit,delete', 'read,write,edit,delete', 'read,write,edit,delete', '', '', '', '', '', '', 'read', '', '', '', '0', '10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_services`
--

CREATE TABLE `tbl_services` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `services_type_id` varchar(45) NOT NULL,
  `services_type_price` varchar(45) NOT NULL,
  `store_ID` varchar(45) NOT NULL DEFAULT '1',
  `status` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_services`
--



-- --------------------------------------------------------

--
-- Table structure for table `tbl_services_type`
--

CREATE TABLE `tbl_services_type` (
  `id` int NOT NULL,
  `services_type` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `store_ID` varchar(45) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_services_type`
--



-- --------------------------------------------------------

--
-- Table structure for table `tbl_store`
--

CREATE TABLE `tbl_store` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `shop_commission` float NOT NULL,
  `tax_percent` float NOT NULL,
  `country` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `district` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  `store_email` varchar(255) NOT NULL,
  `store_tax_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0',
  `delete_flage` varchar(45) NOT NULL DEFAULT '0',
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `roll_ID` varchar(45) DEFAULT '0',
  `admin_id` varchar(45) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_store`
--

INSERT INTO `tbl_store` (`id`, `name`, `logo`, `mobile_number`, `username`, `password`, `shop_commission`, `tax_percent`, `country`, `state`, `city`, `district`, `zipcode`, `store_email`, `store_tax_number`, `address`, `status`, `delete_flage`, `createdat`, `roll_ID`, `admin_id`) VALUES
(1, 'UrbanDhobi', '1675163625145-Item9.png', '+914567893548', 'trinity', '1234', 40, 25, 'AR', 'gujarat', 'surat', 'surat', '390008', 'trinity@gmail.com', 'PBN458261P52', 'L. P. Savani road', '1', '0', '2023-01-05 12:23:29', '2', '2');
-- --------------------------------------------------------

--
-- Table structure for table `tbl_transections`
--

CREATE TABLE `tbl_transections` (
  `id` int NOT NULL,
  `account_id` varchar(45) NOT NULL,
  `store_ID` varchar(45) NOT NULL,
  `transec_detail` varchar(255) NOT NULL,
  `transec_type` varchar(255) NOT NULL,
  `debit_amount` float NOT NULL DEFAULT '0',
  `credit_amount` float NOT NULL DEFAULT '0',
  `balance_amount` float DEFAULT '0',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_transections`
--



-- --------------------------------------------------------

--
-- Table structure for table `tbl_validate`
--

CREATE TABLE `tbl_validate` (
  `id` int NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_validate`
--

INSERT INTO `tbl_validate` (`id`, `data`) VALUES

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_addons`
--
ALTER TABLE `tbl_addons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_cart_servicelist`
--
ALTER TABLE `tbl_cart_servicelist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_commision`
--
ALTER TABLE `tbl_commision`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_email`
--
ALTER TABLE `tbl_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_expense`
--
ALTER TABLE `tbl_expense`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_exp_cat`
--
ALTER TABLE `tbl_exp_cat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_exp_cat_type`
--
ALTER TABLE `tbl_exp_cat_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_orderstatus`
--
ALTER TABLE `tbl_orderstatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_order_payment`
--
ALTER TABLE `tbl_order_payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_roll`
--
ALTER TABLE `tbl_roll`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_services`
--
ALTER TABLE `tbl_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_services_type`
--
ALTER TABLE `tbl_services_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_store`
--
ALTER TABLE `tbl_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_transections`
--
ALTER TABLE `tbl_transections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `tbl_validate`
--
ALTER TABLE `tbl_validate`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_addons`
--
ALTER TABLE `tbl_addons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_cart_servicelist`
--
ALTER TABLE `tbl_cart_servicelist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=510;

--
-- AUTO_INCREMENT for table `tbl_commision`
--
ALTER TABLE `tbl_commision`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tbl_email`
--
ALTER TABLE `tbl_email`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_expense`
--
ALTER TABLE `tbl_expense`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_exp_cat`
--
ALTER TABLE `tbl_exp_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_exp_cat_type`
--
ALTER TABLE `tbl_exp_cat_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_master_shop`
--
ALTER TABLE `tbl_master_shop`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `tbl_orderstatus`
--
ALTER TABLE `tbl_orderstatus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_order_payment`
--
ALTER TABLE `tbl_order_payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `tbl_roll`
--
ALTER TABLE `tbl_roll`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_services`
--
ALTER TABLE `tbl_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `tbl_services_type`
--
ALTER TABLE `tbl_services_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_store`
--
ALTER TABLE `tbl_store`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_transections`
--
ALTER TABLE `tbl_transections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `tbl_validate`
--
ALTER TABLE `tbl_validate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;