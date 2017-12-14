-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2017 at 08:39 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storedemo`
--
CREATE DATABASE IF NOT EXISTS `storedemo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `storedemo`;

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--
-- Creation: Mar 02, 2017 at 08:06 PM
-- Last update: Mar 02, 2017 at 08:13 PM
--

DROP TABLE IF EXISTS `tbldepartment`;
CREATE TABLE `tbldepartment` (
  `deptID` int(2) NOT NULL,
  `deptName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`deptID`, `deptName`) VALUES(1, 'Electronics');
INSERT INTO `tbldepartment` (`deptID`, `deptName`) VALUES(2, 'Pharmacy');
INSERT INTO `tbldepartment` (`deptID`, `deptName`) VALUES(3, 'App Store');
INSERT INTO `tbldepartment` (`deptID`, `deptName`) VALUES(4, 'Grocery');
INSERT INTO `tbldepartment` (`deptID`, `deptName`) VALUES(5, 'Books');

-- --------------------------------------------------------

--
-- Table structure for table `tblitems`
--
-- Creation: Mar 02, 2017 at 08:11 PM
-- Last update: Mar 02, 2017 at 08:34 PM
--

DROP TABLE IF EXISTS `tblitems`;
CREATE TABLE `tblitems` (
  `itemID` int(2) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `deptID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblitems`
--

INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(2, 'DVD', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(3, 'Video Game', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(4, 'Laptop', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(5, 'Tablet', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(6, 'USB Cable', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(7, 'HDMI Cable', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(8, 'Television', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(9, 'Router', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(10, 'Monitor', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(11, 'Batteries', 1);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(12, 'Vivarin', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(13, 'Tylenol', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(14, 'Ibruprofen', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(15, 'Rubbing Alcohol', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(16, 'Peroxide', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(17, 'Alka Seltzer', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(18, 'Allegra', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(19, 'Nyquil', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(20, 'Multi-Vitamin', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(21, 'Zantac', 2);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(22, 'Tinder', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(23, 'Facebook', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(24, 'Bumble', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(25, 'Pandora', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(26, 'Lookout', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(27, 'PokemonGO', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(28, 'Minecraft', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(29, 'Snapchat', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(30, 'CandyCrush', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(31, 'Facebook Messenger', 3);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(32, 'Yogurt', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(33, 'Bananas', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(34, 'Coca Cola', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(35, 'Brocolli', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(36, 'Tabasco Sauce', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(37, 'Frozen Meals', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(38, 'Ramen Noodles', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(39, 'Soy Milk', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(40, 'Bread', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(41, 'Organic Bananas', 4);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(42, '50 Shades of Grey', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(43, 'Data Mining Concepts', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(44, 'Database Administration for Dummies', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(45, 'Introduction to Architecture', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(46, 'Hunger Games', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(47, 'Who Moved My Cheese', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(48, 'Harry Potter', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(49, 'The Martian', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(50, 'Advanced Analytics', 5);
INSERT INTO `tblitems` (`itemID`, `itemName`, `deptID`) VALUES(51, 'Dr. Seuss', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--
-- Creation: Mar 02, 2017 at 09:46 PM
-- Last update: Mar 03, 2017 at 08:29 PM
--

DROP TABLE IF EXISTS `tblorders`;
CREATE TABLE `tblorders` (
  `transactionID` int(5) NOT NULL,
  `orderID` int(4) NOT NULL,
  `userID` int(4) NOT NULL,
  `itemID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblorders`
--

INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(1, 111, 2, 22);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(2, 111, 2, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(3, 111, 2, 25);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(4, 111, 2, 31);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(5, 112, 3, 24);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(6, 112, 3, 25);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(7, 112, 3, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(8, 112, 3, 31);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(9, 113, 4, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(10, 113, 4, 31);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(11, 113, 4, 29);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(12, 114, 5, 28);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(13, 114, 5, 30);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(14, 114, 5, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(15, 115, 6, 22);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(16, 115, 6, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(17, 115, 6, 31);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(18, 115, 6, 25);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(19, 116, 7, 26);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(20, 116, 7, 24);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(21, 116, 7, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(22, 117, 8, 24);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(23, 117, 8, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(24, 117, 8, 26);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(25, 118, 9, 22);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(26, 118, 9, 24);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(27, 118, 9, 25);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(28, 118, 9, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(29, 118, 9, 31);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(30, 119, 10, 27);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(31, 119, 10, 29);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(32, 119, 10, 23);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(33, 119, 10, 31);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(34, 120, 11, 30);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(35, 120, 11, 28);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(36, 120, 11, 27);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(37, 121, 6, 43);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(38, 121, 6, 13);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(39, 122, 7, 43);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(40, 122, 7, 13);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(41, 123, 3, 43);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(42, 124, 3, 13);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(43, 125, 8, 43);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(44, 125, 8, 13);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(45, 126, 4, 45);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(46, 126, 4, 12);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(47, 127, 4, 45);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(48, 127, 4, 12);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(49, 128, 8, 50);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(50, 128, 8, 17);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(51, 129, 3, 50);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(52, 129, 3, 17);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(53, 128, 7, 50);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(54, 128, 7, 17);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(55, 129, 7, 42);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(56, 129, 7, 24);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(57, 130, 6, 42);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(58, 130, 7, 22);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(59, 131, 3, 42);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(60, 131, 3, 24);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(61, 132, 8, 42);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(62, 132, 8, 24);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(63, 133, 9, 42);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(64, 133, 9, 22);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(65, 134, 5, 47);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(66, 134, 5, 32);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(67, 135, 11, 47);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(68, 135, 11, 32);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(69, 136, 8, 47);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(70, 136, 8, 32);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(71, 137, 3, 47);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(72, 137, 3, 32);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(75, 139, 4, 26);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(76, 139, 4, 18);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(77, 140, 2, 27);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(78, 140, 2, 18);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(79, 138, 9, 27);
INSERT INTO `tblorders` (`transactionID`, `orderID`, `userID`, `itemID`) VALUES(80, 138, 9, 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--
-- Creation: Mar 02, 2017 at 09:07 PM
-- Last update: Mar 02, 2017 at 08:41 PM
--

DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE `tbluser` (
  `userID` int(4) NOT NULL,
  `userSex` varchar(1) NOT NULL,
  `userAge` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(2, 'F', 21);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(3, 'F', 31);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(4, 'F', 19);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(5, 'F', 45);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(6, 'F', 25);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(7, 'M', 30);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(8, 'M', 35);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(9, 'M', 22);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(10, 'M', 18);
INSERT INTO `tbluser` (`userID`, `userSex`, `userAge`) VALUES(11, 'M', 55);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  ADD KEY `deptID` (`deptID`);

--
-- Indexes for table `tblitems`
--
ALTER TABLE `tblitems`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `deptID` (`deptID`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`transactionID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblitems`
--
ALTER TABLE `tblitems`
  MODIFY `itemID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `transactionID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `userID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblitems`
--
ALTER TABLE `tblitems`
  ADD CONSTRAINT `fk_deptID` FOREIGN KEY (`deptID`) REFERENCES `tbldepartment` (`deptID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
