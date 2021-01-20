-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 01:56 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentgadgets`
--

-- --------------------------------------------------------

--
-- Table structure for table `allgadgets`
--

CREATE TABLE `allgadgets` (
  `gadgetid` int(100) NOT NULL,
  `gadgetname` varchar(100) NOT NULL,
  `gadgettype` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allgadgets`
--

INSERT INTO `allgadgets` (`gadgetid`, `gadgetname`, `gadgettype`, `image`, `price`, `status`) VALUES
(6, 'Vivo', 'cellphone', 'vivoY20i.jpg', '12000', 'available'),
(8, 'OPPO', 'cellphone', 'oppo.png', '12000', 'available'),
(9, 'Realme', 'cellphone', 'realme5pro.jpg', '12000', 'available'),
(10, 'Realme', 'cellphone', 'realme5pro.jpg', '12000', 'available'),
(11, 'Vivo', 'cellphone', 'vivoY20i.jpg', '12000', 'available'),
(12, 'Samsung', 'cellphone', 'Samsung_A21s.jpg', '8000', 'available'),
(13, 'Realme', 'cellphone', 'realme5pro.jpg', '7900', 'available'),
(14, 'Vivo', 'cellphone', 'vivoY20i.jpg', '13000', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `usertype`, `email`) VALUES
(1, 'leo', 'leo', 'admin', 'leo@gmail.com'),
(2, 'ustp', 'ustp', 'member', 'leo@gmail.com'),
(3, 'adrians', '123', 'member', 'adrian@gmail.com'),
(4, 'leo', '123', 'member', 'adrian@gmail.com'),
(5, 'leo', '123', 'member', 'leo@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allgadgets`
--
ALTER TABLE `allgadgets`
  ADD PRIMARY KEY (`gadgetid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allgadgets`
--
ALTER TABLE `allgadgets`
  MODIFY `gadgetid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
