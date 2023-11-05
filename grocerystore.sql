-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2023 at 05:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocerystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL,
  `Payment Method` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `password`, `customerID`, `Payment Method`, `email`) VALUES
('Sophia Kobzar', 'password@123', 1234, '512-12433-12', 'smk@utd.edu'),
('Sophia Kobzar', '', 4978, '9230392 / 233', 'smk180007@utdallas.edu'),
('Emily Ta', '', 4548, '231223 211', 'eta2@gmail.com'),
('Danny Turner', '', 9956, '12312 123', 'dt@gmail.com'),
('test', '', 3493, '342421', 'tes'),
('Bella Smith', '', 3024, '1341341 134', 'bella@gmail.com'),
('test', '', 7191, '12312 122', 'asd@gmail.com'),
('Zack Martin', '', 6084, '13412342 342', 'mt@outlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `imageName` text NOT NULL,
  `itemName` text NOT NULL,
  `price` text NOT NULL,
  `quantity` int(255) NOT NULL,
  `returnable` int(11) DEFAULT NULL,
  `warehouseID` int(11) DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`imageName`, `itemName`, `price`, `quantity`, `returnable`, `warehouseID`, `itemID`) VALUES
('apple.jpg', 'Apple', '$0.99/lb', 4, 1, 567, 6382),
('banana.jpg', 'Banana', '$0.59/lb', 3, 1, 123, 4917),
('carrot.jpg', 'Carrot', '$0.79/lb', 3, 1, 123, 8765),
('milk.jpg', 'Milk', '$0.99/lb', 5, 1, 567, 1209),
('eggs.jpg', 'Eggs', '$3.00/ea', 5, 1, 987, 2531),
('orange.jpg', 'Orange', '$1.59/lb', 4, 1, 123, 9487);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `address` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `totalPrice` double NOT NULL,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `subtotal`, `address`, `discount`, `totalPrice`, `CustomerID`) VALUES
(54312, 1.98, '4005 Panther Way, Plano, TX 75074', 0.1, 1.88, 1234),
(15399, 0, '', 0, 1.98, 0),
(19825, 2.17, '1122 Parkway Plano Tx 75074', 0, 2.17, 4978),
(64606, 0.99, '5633 Plano Parkway Garland Tx 75074', 0, 0.99, 4548),
(80744, 0.99, '4322 Parker Plano Tx 75074', 0, 0.99, 9956),
(62372, 0.59, 'sdrasd', 0, 0.59, 3493),
(75217, 0.59, '1222 test rd Garland TX 75032', 0, 0.59, 3024),
(75304, 1.58, 'mwsefd', 0, 1.58, 7191),
(82413, 3.17, '1231 st', 0, 3.17, 6084);

-- --------------------------------------------------------

--
-- Table structure for table `partof`
--

CREATE TABLE `partof` (
  `OrderID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partof`
--

INSERT INTO `partof` (`OrderID`, `itemID`, `quantity`) VALUES
(54312, 6382, 2),
(82413, 9487, 1),
(82413, 8765, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
