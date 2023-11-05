-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 03:07 AM
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
-- Database: `grocerystore1`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Name` varchar(255) NOT NULL,
  `password` varchar(255),
  `customerID` int(11) NOT NULL,
  `Payment Method` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `password`, `customerID`, `Payment Method`, `email`) VALUES
('Sophia Kobzar', 'password@123', 1234, '512-12433-12', 'smk@utd.edu');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `imageName` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `price` varchar(225) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `returnable` int(11) DEFAULT NULL,
  `warehouseID` int(11) DEFAULT NULL,
  `itemID` int(11) NOT NULL
) ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`imageName`, `itemName`, `price`, `quantity`, `returnable`, `warehouseID`, `itemID`) VALUES
('milk.jpg', 'Milk', '$0.99/lb', '45', 1, 567, 1209),
('eggs.jpg', 'Eggs', '$3.00/ea', '55', 1, 987, 2531),
('banana.jpg', 'Banana', '$0.59/lb', '25', 1, 123, 4917),
('apple.jpg', 'Apple', '$0.99/lb', '64', 1, 567, 6382),
('carrot.jpg', 'Carrot', '$0.79/lb', '95', 1, 123, 8765),
('orange.jpg', 'Orange', '$1.59/lb', '55', 1, 123, 9487);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `address` varchar(255) NOT NULL,
  `discount` double,
  `totalPrice` double NOT NULL,
  `CustomerID` int(11) NOT NULL
) ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `subtotal`, `address`, `discount`, `totalPrice`, `CustomerID`) VALUES
(54312, 1.98, '4005 Panther Way, Plano, TX 75074\r\n\r\n\r\n', 0.1, 1.88, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `partof`
--

CREATE TABLE `partof` (
  `OrderID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `WarehouseID` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `email` (`email`);

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
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `partof`
--
ALTER TABLE `partof`
  ADD PRIMARY KEY (`OrderID`,`itemID`),
  ADD KEY `ItemID` (`itemID`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`WarehouseID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION;

--
-- Constraints for table `partof`
--
ALTER TABLE `partof`
  ADD CONSTRAINT `partof_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `partof_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `items` (`itemID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
