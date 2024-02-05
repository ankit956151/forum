-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 05:14 PM
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
-- Database: `idiscuss`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(8) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `created`) VALUES
(1, 'Python', 'Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.', '2023-11-28 16:54:00'),
(2, 'Java', 'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.', '2023-11-28 16:54:26'),
(3, 'PHP', 'PHP is a general-purpose scripting language geared towards web development. It was originally created by Danish-Canadian programmer Rasmus Lerdorf in', '2023-11-28 16:55:14'),
(4, 'Django', 'Django is a free and open-source, Python-based web framework that follows the model–template–views architectural pattern. It is maintained by the Django Software Foundation, an independent organization established in the US as a 501 non-profit', '2023-11-29 11:43:36'),
(5, 'HTML', 'The HyperText Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser', '2023-11-29 11:44:09'),
(6, 'SQL', 'Structured Query Language is a domain-specific language used in programming and designed for managing data held in a relational database', '2023-11-29 11:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(8) NOT NULL,
  `comment_content` text NOT NULL,
  `thread_id` int(8) NOT NULL,
  `comment_by` int(8) NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_content`, `thread_id`, `comment_by`, `comment_time`) VALUES
(1, 'this is a comment', 1, 12, '2023-12-03 20:48:16'),
(2, 'this is second comment', 1, 10, '2023-12-03 20:56:49'),
(3, 'this is third', 1, 12, '2023-12-03 21:17:01'),
(5, 'Mat kar insert', 2, 10, '2023-12-03 21:18:45'),
(6, 'ye pyhon bakwash hai', 2, 12, '2023-12-03 21:18:57'),
(7, 'this is another comment', 1, 10, '2023-12-03 21:24:24'),
(8, 'this is another comment', 1, 12, '2023-12-03 21:26:47'),
(9, 'this is sql comment', 10, 10, '2023-12-03 21:29:56'),
(10, 'Standard SQL uses the C syntax /* this is a comment */ for comments, and MySQL Server supports this syntax as well. MySQL also support extensions to this syntax that enable MySQL-specific SQL to be embedded in the comment, as described in Section 9.7, “Comments”. The statement produces no change in value at all.', 10, 12, '2023-12-03 21:31:49'),
(11, 'this is php comment', 6, 12, '2023-12-03 21:36:44'),
(17, 'this is not ', 1, 10, '2023-12-06 20:15:53'),
(30, 'Reinstall the sql', 21, 10, '2023-12-11 13:15:11'),
(33, '&lt;html&gt;', 1, 10, '2023-12-11 13:37:10'),
(34, '&lt;div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\"&gt;\r\n                &lt;strong&gt;Success!&lt;/strong&gt; Your Comment has been added!\r\n                &lt;button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"&gt;&lt;/button&gt;\r\n            &lt;/div&gt;', 1, 10, '2023-12-11 13:39:54'),
(35, 'please re install jdk', 23, 10, '2023-12-11 14:40:20'),
(36, 'no need to re install\r\nplz download my code', 23, 12, '2023-12-11 14:44:21'),
(37, 'not available\r\n', 3, 10, '2023-12-15 20:55:04'),
(38, 'xaxxzxccvcvc', 4, 12, '2024-01-05 11:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `thread_id` int(7) NOT NULL,
  `thread_title` varchar(255) NOT NULL,
  `thread_desc` text NOT NULL,
  `thread_cat_id` int(7) NOT NULL,
  `thread_user_id` int(7) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`thread_id`, `thread_title`, `thread_desc`, `thread_cat_id`, `thread_user_id`, `timestamp`) VALUES
(1, 'unable to install payaudio ', 'i am not able to install paaudio on wondow', 1, 10, '2023-11-30 10:51:00'),
(2, 'Not able to insert python', 'please help me for installing the python software', 1, 12, '2023-11-30 11:25:33'),
(3, 'python', 'sscsc scs cs cs cs cs ', 1, 10, '2023-12-02 17:36:19'),
(4, 'java problem', 'ss,nbsh cndvd  v', 2, 12, '2023-12-02 17:43:58'),
(5, 'please help me for installation of jdk', 'My windows was not supporting this jdk', 2, 10, '2023-12-02 17:44:57'),
(21, 'this is first comment', 'my sql was not working', 6, 10, '2023-12-11 13:14:49'),
(22, 'this is code', '&lt;html&gt;', 1, 10, '2023-12-11 13:42:22'),
(23, 'jdk problem', 'jdk was not functioning and showing error that file', 2, 10, '2023-12-11 14:39:59'),
(24, 'this is jio sim', 'not install', 2, 10, '2023-12-15 20:12:19'),
(25, 'jnas', 'nand', 2, 12, '2024-01-05 11:42:02'),
(26, 'kjhgkjb', 'jhjgh', 1, 14, '2024-01-12 11:12:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `sno` int(8) NOT NULL,
  `usname` text NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`sno`, `usname`, `user_email`, `user_pass`, `timestamp`) VALUES
(10, 'Sumit Pandey', 'a@a.com', '$2y$10$KMZUYBWVwKcyYbN2cIqRAeiiljo2khfkeWbcoQlt4EMkkCcAqmAN.', '2023-12-05 16:03:04'),
(12, 'Ankit Pandey', 'ankit@ankit.com', '$2y$10$Tpv0EccW2j79OgMJndpkBOBn3V5J637yy/H3mc.kZGZqG40fqgXea', '2023-12-11 14:41:56'),
(13, 'Admin', 'admin@a.com', '$2y$10$2gr0Gor3x8J0EgaXqNXpluF222IR8Ri/b2ewa2K2xpswWvwcchedW', '2023-12-11 16:21:44'),
(14, 'ankk', 'student@9158038326', '$2y$10$8ywJDjJ/9AhH7jWYflBXVeQwtE87KBp1PDfEjSclwidlAkiJ2.kxK', '2024-01-12 11:12:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`thread_id`);
ALTER TABLE `threads` ADD FULLTEXT KEY `thread_title` (`thread_title`,`thread_desc`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `thread_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `sno` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
