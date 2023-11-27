-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 06:57 PM
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
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `password`, `customerID`, `Payment Method`, `email`, `address`) VALUES
('Nicky Caine', '', 2180, '4656-4563-5436-6354', 'nickyC123@gmail.com', '663 New Saddle Dr. New Baltimore, MI 48047'),
('Timmy Turner', '', 3230, '1313-4321-3411-1233', 'timGamer@gmail.com', '70 Oxford Street Garland, TX 75040'),
('Richard Ma', 'RM2839', 3493, '3424-2145-2938-9485', 'rm@outlook.com', '475 South York St. Massillon, OH 44646'),
('Donald Duck', '', 4066, '1234-3432-4321-8775', 'duck@gmail.com', '2613 Camp Bella Plano TX 75074'),
('Emily Ta', 'ET1234', 4548, '2313-2345-9475-1934', 'eta2@gmail.com', '1234 Lone Star Drive Austin, TX 78701'),
('Mary Test', '', 4682, '6543-3456-3465', 'mate@live.com', '95 Roehampton Ave. Fort Myers, FL 33905'),
('Sophia Kobzar', 'pass', 5150, '4331-3143-1324-1345', 'smk@utd.edu', '509 3rd Court Anchorage, AK 99504'),
('Zack Martin', 'ZM1234', 6084, '1341-2342-8970-9342', 'zm@outlook.com', '975 West Sugar Court Malvern, PA 19355'),
('Bella Smith', 'BS3498', 6121, '1341-3411-3456-8534', 'bella@gmail.com', '8390 S. Sussex St. Glen Cove, NY 11542'),
('Gia Long', 'GL2928', 7191, '1231-2122-9384-8293', 'gial@gmail.com', '927 3rd Ave. Buford, GA 30518'),
('Cody Martin', '', 8000, '5644-4545-4566-4352', 'codyM@gmail.com', '7791 Pulaski Street Haines City, FL 33844'),
('Johnny Test', '', 8496, '1231-1234-3421-3411', 'jo@gmail.com', '5432 Lone Star Drive Plano, TX 78701'),
('Anna Kobzar', 'password123', 8508, '4857-1232-6544-1231', 'ak@live.com', '239 3rd Court Anchorage, AK 99504'),
('Marry Turner', '', 9281, '3343-1231-7651-3211', 'mt@live.com', '39 E. Creek Lane Franklin Square, NY 11010'),
('Danny Turner', 'DT3452', 9956, '1231-2123-4856-9854', 'dt2004@gmail.com', '619 Central Ave. Fairhope, AL 36532');

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
('mayo.jpg', 'Mayonnaise', '$4.00/ea', 0, 1, 934, 284),
('water.jpg', 'Water', '$1.50/ea', 0, 1, 384, 1029),
('milk.jpg', 'Milk', '$0.99/lb', 0, 1, 567, 1209),
('oj.jpg', 'Orange Juice', '$6.00/ea', 0, 1, 386, 1928),
('eggs.jpg', 'Eggs', '$3.00/ea', 4, 1, 987, 2531),
('chips.jpg', 'Chips', '$2.00/ea', 4, 1, 124, 2736),
('sriracha.jpg', 'Sriracha', '$5.00/ea', 7, 1, 111, 2938),
('vegetableoil.jpg', 'Vegetable Oil', '$4.50/ea', 7, 1, 439, 2948),
('lettuce.jpg', 'Lettuce', '$1.00/lb', 3, 1, 684, 2956),
('acv.jpg', 'Apple Cider Vinegar', '$6.00/ea', 9, 1, 822, 3937),
('banana.jpg', 'Banana', '$0.59/lb', 7, 1, 123, 4917),
('redonion.jpg', 'Red Onion', '$1.00/lb', 4, 1, 937, 4964),
('dishsoap.jpg', 'Dishsoap', '$3.50/ea', 2, 1, 122, 5796),
('apple.jpg', 'Apple', '$0.99/lb', 3, 1, 567, 6382),
('grape.jpg', 'Grapes', '$2.00/lb', 9, 1, 489, 7372),
('carrot.jpg', 'Carrot', '$0.79/lb', 7, 1, 123, 8765),
('protein powder.jpg', 'Protein Powder', '$12.00/ea', 7, 1, 112, 9375),
('bread.jpg', 'Bread', '$5.00/ea', 3, 1, 475, 9382),
('orange.jpg', 'Orange', '$1.59/lb', 7, 1, 123, 9487),
('icecream.jpg', 'Vanilla Ice Cream', '$4.00/ea', 7, 1, 839, 9549);

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
(10292, 5.37, '5432 Lone Star Drive Plano, TX 78701', NULL, 5.37, 8496),
(18375, 6.49, '509 3rd Court Anchorage, AK 99504', NULL, 6.49, 5150),
(20379, 10.5, '663 New Saddle Dr. New Baltimore, MI 48047', NULL, 10.5, 2180),
(20699, 25.5, '2613 Camp Bella Plano TX 75074', NULL, 25.5, 4066),
(33548, 10, '39 E. Creek Lane Franklin Square, NY 11010', NULL, 10, 9281),
(63885, 6.99, '1234 Lone Star Drive Austin, TX 78701', NULL, 6.99, 4548),
(64150, 8.49, '95 Roehampton Ave. Fort Myers, FL 33905', NULL, 8.49, 4682),
(66578, 13.5, '1234 Lone Star Drive Austin, TX 78701', NULL, 13.5, 4548),
(69872, 10, '1234 Lone Star Drive Austin, TX 78701', NULL, 10, 4548),
(84483, 2.97, '70 Oxford Street Garland, TX 75040', NULL, 2.97, 3230),
(86320, 20.99, '1234 Lone Star Drive Austin, TX 78701', NULL, 20.99, 4548),
(86868, 9.09, '8390 S. Sussex St. Glen Cove, NY 11542', NULL, 9.09, 6121),
(89700, 7.48, '7791 Pulaski Street Haines City, FL 33844', NULL, 7.48, 8000),
(92803, 23.99, '239 3rd Court Anchorage, AK 99504', NULL, 23.99, 8508);

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
(10292, 6382, 1),
(10292, 7372, 1),
(10292, 8765, 1),
(10292, 9487, 1),
(18375, 284, 1),
(18375, 1029, 1),
(18375, 1209, 1),
(20379, 1928, 1),
(20379, 2948, 1),
(20699, 1928, 2),
(20699, 2736, 1),
(20699, 2938, 1),
(20699, 2948, 1),
(33548, 2531, 1),
(33548, 2938, 1),
(33548, 2956, 1),
(33548, 4964, 1),
(63885, 1209, 1),
(63885, 1928, 1),
(64150, 1029, 1),
(64150, 1209, 1),
(64150, 1928, 1),
(66578, 284, 1),
(66578, 2948, 1),
(66578, 9382, 1),
(69872, 284, 1),
(69872, 1928, 1),
(84483, 6382, 3),
(86320, 1209, 1),
(86320, 1928, 2),
(86320, 9549, 2),
(86868, 1029, 1),
(86868, 2736, 1),
(86868, 2938, 1),
(86868, 4917, 1),
(89700, 1029, 1),
(89700, 1209, 2),
(89700, 2736, 2),
(92803, 284, 1),
(92803, 1029, 1),
(92803, 1209, 1),
(92803, 1928, 1),
(92803, 2736, 1),
(92803, 2938, 1),
(92803, 2948, 1);

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
(934, '12 Newport Street\r\nPasadena, TX 77506'),
(937, '788 East Fifth Court\r\nSan Antonio, TX 78247'),
(987, '315 Proctor Rd.\r\nGrapevine, TX 76051');

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
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `fk_items_warehouse` (`warehouseID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD UNIQUE KEY `OrderID` (`OrderID`),
  ADD KEY `fk_customer` (`CustomerID`);

--
-- Indexes for table `partof`
--
ALTER TABLE `partof`
  ADD PRIMARY KEY (`OrderID`,`itemID`),
  ADD KEY `fk_items` (`itemID`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`WarehouseID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_items_warehouse` FOREIGN KEY (`warehouseID`) REFERENCES `warehouse` (`WarehouseID`) ON DELETE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`customerID`) ON DELETE NO ACTION;

--
-- Constraints for table `partof`
--
ALTER TABLE `partof`
  ADD CONSTRAINT `fk_items` FOREIGN KEY (`itemID`) REFERENCES `items` (`itemID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
