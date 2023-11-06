-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 01:18 AM
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
('Bella Smith', 'BS3498', 3024, '1341-3411-3456-8534', 'bella@gmail.com'),
('Richard Ma', 'RM2839', 3493, '3424-2145-2938-9485', 'rm@outlook.com'),
('Emily Ta', 'ET1234', 4548, '2313-2345-9475-1934', 'eta2@gmail.com'),
('Zack Martin', 'ZM1234', 6084, '1341-2342-8970-9342', 'zm@outlook.com'),
('Donald Duck', '', 6121, '1234-3432-4321-8775', 'duck@gmail.com'),
('Gia Long', 'GL2928', 7191, '1231-2122-9384-8293', 'gial@gmail.com'),
('Danny Turner', 'DT3452', 9956, '1231-2123-4856-9854', 'dt2004@gmail.com');

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
  `itemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`imageName`, `itemName`, `price`, `quantity`, `returnable`, `warehouseID`, `itemID`) VALUES
('mayo.jpg', 'Mayonnaise', '$4.00/ea', 6, 1, 934, 284),
('water.jpg', 'Water', '$1.50/ea', 4, 1, 384, 1029),
('milk.jpg', 'Milk', '$0.99/lb', 5, 1, 567, 1209),
('oj.jpg', 'Orange Juice', '$6.00/ea', 10, 1, 386, 1928),
('eggs.jpg', 'Eggs', '$3.00/ea', 5, 1, 987, 2531),
('chips.jpg', 'Chips', '$2.00/ea', 4, 1, 124, 2736),
('sriracha.jpg', 'Sriracha', '$5.00/ea', 4, 1, 111, 2938),
('vegetableoil.jpg', 'Vegetable Oil', '$4.50/ea', 5, 1, 439, 2948),
('lettuce.jpg', 'Lettuce', '$1.00/lb', 5, 1, 684, 2956),
('acv.jpg', 'Apple Cider Vinegar', '$6.00/ea', 10, 1, 822, 3937),
('banana.jpg', 'Banana', '$0.59/lb', 2, 1, 123, 4917),
('redonion.jpg', 'Red Onion', '$1.00/lb', 5, 1, 937, 4964),
('dishsoap.jpg', 'Dishsoap', '$3.50/ea', 6, 1, 122, 5796),
('apple.jpg', 'Apple', '$0.99/lb', 4, 1, 567, 6382),
('grape.jpg', 'Grapes', '$2.00/lb', 10, 1, 489, 7372),
('carrot.jpg', 'Carrot', '$0.79/lb', 3, 1, 123, 8765),
('protein powder.jpg', 'Protein Powder', '$12.00/ea', 10, 1, 112, 9375),
('bread.jpg', 'Bread', '$5.00/ea', 5, 1, 475, 9382),
('orange.jpg', 'Orange', '$1.59/lb', 4, 1, 123, 9487),
('icecream.jpg', 'Vanilla Ice Cream', '$4.00/ea', 10, 1, 839, 9549);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `address` varchar(255) NOT NULL,
  `discount` double DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `subtotal`, `address`, `discount`, `totalPrice`, `CustomerID`) VALUES
(20699, 25.5, '2613 Camp Bella Plano TX 75074', NULL, 25.5, 4066),
(54312, 1.98, '4005 Panther Way, Plano, TX 75074\r\n\r\n\r\n', 0.1, 1.88, 1234),
(86868, 9.09, '8390 S. Sussex St. Glen Cove, NY 11542', NULL, 9.09, 6121);

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
(20699, 1772, 1),
(20699, 1928, 2),
(20699, 2736, 1),
(20699, 2938, 1),
(20699, 2948, 1),
(86868, 1029, 1),
(86868, 2736, 1),
(86868, 2938, 1),
(86868, 4917, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `WarehouseID` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`WarehouseID`, `Location`) VALUES
(111, '9084 Lower River Ave.\r\nAustin, TX 78758'),
(112, '539 East Brook Ave.\r\nAustin, TX 78753'),
(122, '159 Jefferson St.\r\nHouston, TX 77016'),
(123, '10 Snake Hill Road\r\nHaltom City, TX 76117'),
(124, '554 Main Drive\r\nAllen, TX 75002'),
(384, '8036 East Creek Lane\r\nFort Worth, TX 76116'),
(385, '204 Constitution Ave.\r\nNew Braunfels, TX 78130'),
(386, '962 Pennsylvania St.\r\nCedar Park, TX 78613'),
(432, '7226 Grove St.\r\nLeague City, TX 77573'),
(439, '7224 Armstrong Ave.\r\nAbilene, TX 79605'),
(475, '972 Linda Street\r\nHumble, TX 77339'),
(489, '60 Dunbar Ave.\r\nRichardson, TX 75081'),
(567, '788 South Arcadia Road\r\nMesquite, TX 75149'),
(684, '23 Beaver Ridge Street\r\nHouston, TX 77033'),
(822, '8275 Brickyard Ave.\r\nCleburne, TX 76031'),
(839, '128 Walnut St.\r\nMissouri City, TX 77459'),
(934, '12 Newport Street\r\nPasadena, TX 77506');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `customerID` (`customerID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD UNIQUE KEY `OrderID` (`OrderID`);

--
-- Indexes for table `partof`
--
ALTER TABLE `partof`
  ADD PRIMARY KEY (`OrderID`,`itemID`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`WarehouseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
