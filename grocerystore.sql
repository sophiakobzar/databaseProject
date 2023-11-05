-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2023 at 11:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

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
('Emily Ta', 'ET1234', 4548, '2313-2345-9475-1934', 'eta2@gmail.com'),
('Danny Turner', 'DT3452', 9956, '1231-2123-4856-9854', 'dt2004@gmail.com'),
('Richard Ma', 'RM2839', 3493, '3424-2145-2938-9485', 'rm@outlook.com'),
('Bella Smith', 'BS3498', 3024, '1341-3411-3456-8534', 'bella@gmail.com'),
('Gia Long', 'GL2928', 7191, '1231-2122-9384-8293', 'gial@gmail.com'),
('Zack Martin', 'ZM1234', 6084, '1341-2342-8970-9342', 'zm@outlook.com');

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
('orange.jpg', 'Orange', '$1.59/lb', 4, 1, 123, 9487),
('chips.jpg', 'Chips', '$2.00/ea', 5, 1, 124, 2736),
('dishsoap.jpg', 'Dishsoap', '$3.50/ea', 6, 1, 122, 5796),
('protein powder.jpg', 'Protein Powder', '$12.00/ea', 10, 1, 112, 9375),
('sriracha.jpg', 'Sriracha', '$5.00/ea', 5, 1, 111, 2938),
('water.jpg', 'Water', '$1.50/ea', 5, 1, 384, 1029),
('lettuce.jpg', 'Lettuce', '$1.00/lb', 5, 1, 684, 2956),
('mayo.jpg', 'Mayonnaise', '$4.00/ea', 6, 1, 934, 284),
('oj.jpg', 'Orange Juice', '$6.00/ea', 10, 1, 386, 1928),
('vegetableoil.jpg', 'Vegetable Oil', '$4.50/ea', 5, 1, 439, 2948),
('redonion.jpg', 'Red Onion', '$1.00/lb', 5, 1, 937, 4964),
('bread.jpg', 'Bread', '$5.00/ea', 5, 1, 475, 9382),
('icecream.jpg', 'Vanilla Ice Cream', '$4.00/ea', 10, 1, 839, 9549),
('grape.jpg', 'Grapes', '$2.00/lb', 10, 1, 489, 7372),
('acv.jpg', 'Apple Cider Vinegar', '$6.00/ea', 10, 1, 822, 3937);

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
(19825, 2.17, '1122 Parkway Plano Tx 75074', 0, 2.17, 4978),
(64606, 0.99, '5633 Plano Parkway Garland Tx 75074', 0, 0.99, 4548),
(80744, 0.99, '4322 Parker Plano Tx 75074', 0, 0.99, 9956),
(75217, 0.59, '1222 test rd Garland TX 75032', 0, 0.59, 3024),
(11111, 3, '18614 Oxenberg Lane, Richardson, TX 75080', 0, 3, 1683),
(22222, 4, '702 Arden Oaks, Dallas, TX 75074', 0, 4, 6497),
(93972, 10, '394 Luxemburg Lane Austin, TX 74930', 3, 7, 9467),
(49786, 17, '9300 Santa Fe Blvd, Plano, TX 75074', 0, 17, 1221);

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
