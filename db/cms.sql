-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 10:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'ac1c8d64fd23ae5a7eac5b7f7ffee1fa', '14-04-2023 09:50:48 AM'),
(2, 'admin1', '21232f297a57a5a743894a0e4a801fc3', '08-05-2020 07:23:45 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Results Related Complaints', '', '2023-01-30 15:20:28', ''),
(2, 'Others', '', '2023-01-30 15:21:55', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(1, 1, 'in process', 'The Examination office have been contacted', '2023-01-30 16:01:28'),
(2, 2, 'closed', 'Your assessment has been updated', '2023-01-30 16:02:39'),
(3, 1, 'in process', 'The Examination officer has been contacted', '2023-01-31 08:33:16'),
(4, 2, 'closed', 'Your continuous Assessments has been added', '2023-01-31 08:34:31'),
(5, 3, 'in process', 'tjndfjkj', '2023-02-13 04:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `levelName` varchar(255) NOT NULL,
  `Description` tinytext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `levelName`, `Description`, `postingDate`, `updationDate`) VALUES
(1, '100', '', '2023-01-30 15:19:32', ''),
(2, '200', '', '2023-01-30 15:20:07', ''),
(3, '300', '', '2023-01-30 15:20:13', ''),
(4, '400', '', '2023-01-30 15:20:17', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Wrong Addition of scores from individual questions', '2023-01-30 15:20:47', ''),
(2, 1, 'Wrong Addition of Examination Scores and or Continuous Assessments Score', '2023-01-30 15:20:54', ''),
(3, 1, 'Missing Continuous Assessments Scores', '2023-01-30 15:21:05', ''),
(4, 1, 'Missing Examination Scores', '2023-01-30 15:21:20', ''),
(5, 1, 'No Result at all (i.e. Mat No. Not in the Published Results)', '2023-01-30 15:21:27', ''),
(6, 1, 'Two Result with the same Mat. Number but different Score', '2023-01-30 15:21:34', ''),
(7, 1, 'Correction of Result Grades', '2023-01-30 15:21:41', ''),
(8, 2, 'Appealing against published Results (the student will have to attain the required payment of the prescribed fee for revisit of Examination Script).', '2023-01-30 15:22:06', ''),
(9, 2, 'Any others not Stated', '2023-01-30 15:22:16', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(20) NOT NULL,
  `userId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `complaintType` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `coursecode` varchar(255) DEFAULT NULL,
  `coursetitle` varchar(255) DEFAULT NULL,
  `courselecturer` varchar(255) DEFAULT NULL,
  `academicsession` varchar(255) DEFAULT NULL,
  `drp` varchar(255) DEFAULT NULL,
  `sdep` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `level`, `coursecode`, `coursetitle`, `courselecturer`, `academicsession`, `drp`, `sdep`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 3, 1, 'Missing Examination Scores', ' Complaint', '400', 'CSC 410.2', 'Computational Method', 'Dr Asur Ntuk', '2020/2021', '25/07/2022', 'Computer Science', '', '', '2023-01-31 07:55:24', 'in process', '2023-01-31 08:33:16'),
(2, 3, 1, 'Missing Continuous Assessments', ' Complaint', '200', 'CSC 202.1', 'Computer Analysis', 'Dr Asur Ntuk', '2019/2020', '25/07/2021', 'Computer Science', '', '', '2023-01-31 07:57:25', 'closed', '2023-01-31 08:34:31'),
(3, 3, 2, 'Any others not Stated', 'General Query', '300', 'CSC 301.1', 'Compiler Construction', 'Prof. Nsang Etim', '2019/2020', 'Nil', 'Computer Science', 'Sexual advancement and harassment.', '', '2023-01-31 07:59:53', 'in process', '2023-02-13 04:39:32'),
(4, 3, 1, 'Two Result with the same Mat. Number but different Score', ' Complaint', '100', 'CSC. 100.2', 'Computer Application', 'Dr. Nyin Kayin', '2018/2019', '25/07/2020', 'Computer Science', '', '', '2023-01-31 08:01:01', NULL, '2023-01-31 08:27:35'),
(5, 3, 1, 'Correction of Result Grades', ' Complaint', '300', 'CSC 304.2', 'Artificial Intelligence', 'Prof. Myam Yrice', '2019/2020', 'Nil', 'Computer Science', '', '', '2023-01-31 08:02:04', NULL, '2023-01-31 08:27:08'),
(13, 3, 1, 'Missing Examination Scores', ' Complaint', '300', 'CSC 303.1', '', 'Dr Asur Ntuk', '2020/2021', 'Nil', 'Computer Science', '', 'computer.jpg', '2023-01-31 15:59:20', NULL, '0000-00-00 00:00:00'),
(14, 3, 1, 'Two Result with the same Mat. Number but different Score', ' Complaint', '400', 'CSC 410.2', '', 'Dr Asur Ntuk', '2020/2021', 'Nil', 'Computer Science', 'the complaint', 'lecture hall2.jpg', '2023-02-13 04:37:26', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(13, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-01-31 08:31:24', '31-01-2023 09:31:42 AM', 1),
(14, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-01-31 08:32:14', '31-01-2023 09:32:31 AM', 1),
(15, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-01-31 08:39:36', '31-01-2023 09:40:40 AM', 1),
(16, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-01-31 10:16:01', '31-01-2023 03:40:45 PM', 1),
(17, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-01-31 15:58:03', '31-01-2023 04:59:36 PM', 1),
(18, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-01-31 16:35:42', '', 1),
(19, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-01 06:00:38', '01-02-2023 07:00:58 AM', 1),
(20, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-01 11:15:15', '01-02-2023 12:16:10 PM', 1),
(21, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-02 05:03:23', '02-02-2023 06:04:23 AM', 1),
(22, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-02 05:05:47', '02-02-2023 06:05:57 AM', 1),
(23, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-02 13:06:10', '02-02-2023 02:07:43 PM', 1),
(24, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-02 16:27:10', '02-02-2023 05:27:50 PM', 1),
(25, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-02 18:09:03', '02-02-2023 07:09:56 PM', 1),
(26, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-03 00:57:52', '', 1),
(27, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-02-13 04:35:11', '13-02-2023 05:38:33 AM', 1),
(28, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-14 08:48:07', '', 1),
(29, 3, 'ruthibitomisin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-14 08:51:07', '', 1),
(30, 0, 'user1', 0x3a3a3100000000000000000000000000, '2023-04-14 08:53:21', '', 0),
(31, 3, 'user1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-14 08:53:29', '14-04-2023 09:54:02 AM', 1),
(32, 3, 'user1@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-14 08:54:05', '14-04-2023 09:54:17 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `matriculationNo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `Level` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `matriculationNo`, `department`, `Level`, `phonenumber`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(3, 'User 1', 'user1@gmail.com', 'ac1c8d64fd23ae5a7eac5b7f7ffee1fa', 'U2023/5570001', 'Computer Science', '400', '0800000000', 1, NULL, '2023-01-31 07:54:50', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
