-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 11:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facultyfaculty`
--
CREATE DATABASE IF NOT EXISTS `facultyfaculty` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `facultyfaculty`;

-- --------------------------------------------------------

--
-- Table structure for table `archives`
--

CREATE TABLE `archives` (
  `id` int(11) NOT NULL,
  `original_user_id` int(11) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `faculty_id` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` int(50) DEFAULT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `day_id` int(11) NOT NULL,
  `day_name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`day_id`, `day_name`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`) VALUES
(5, 'CSS Lab'),
(2, 'lab 3'),
(1, 'lobby'),
(4, 'mammoblue'),
(3, 'tambayan');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `sched_id` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `day_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`sched_id`, `faculty_id`, `room_id`, `subject_id`, `day_id`, `start_time`, `end_time`) VALUES
(9, 3, 2, 1, 1, '08:00:00', '09:00:00'),
(11, 3, 3, 1, 2, '10:00:00', '11:00:00'),
(12, 3, 2, 2, 1, '10:00:00', '11:00:00'),
(13, 5, 5, 1, 2, '10:00:00', '11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(20) DEFAULT NULL,
  `subject_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_code`, `subject_description`) VALUES
(1, '09', 'habibi'),
(2, '08', 'dubai');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `admin` int(50) DEFAULT NULL,
  `faculty_id` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `position`, `admin`, `faculty_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `contact_number`, `address`, `gender`, `email`, `username`, `password`) VALUES
(1, NULL, 321, NULL, 'samerei', 'padilla', 'orande', '2003-10-30', '09770864266', 'zarah san luis aurora', 'Male', 'samereiorande40@gmail.com', 'samerei321', '090807'),
(3, 'Instructor  II', NULL, '890', 'ako', 'toh', 'si natoy', '2003-09-11', '090807065', 'nonong', 'Male', 'natoy@gmail.com', 'natoy890', 'nmlp'),
(4, 'Instructor  III', NULL, '678', 'ikaw', 'bah', 'yan?', '2001-09-22', '121314156', 'san luis', 'Female', 'ikawnanga@gmail.com', 'ikaw321', '1213'),
(5, 'Instructor I', NULL, '12345', 'Raphael', 'Valdez', 'Cenon', '2025-11-01', '099987862123', 'Gloria St.', 'Male', 'raphaelVcenon@gmail.com', 'sirC', 'mahal123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archives`
--
ALTER TABLE `archives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `original_user_id` (`original_user_id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`day_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_name` (`room_name`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`sched_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `day_id` (`day_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `subject_code` (`subject_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faculty_id` (`faculty_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archives`
--
ALTER TABLE `archives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `sched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archives`
--
ALTER TABLE `archives`
  ADD CONSTRAINT `archives_ibfk_1` FOREIGN KEY (`original_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `schedules_ibfk_4` FOREIGN KEY (`day_id`) REFERENCES `days` (`day_id`);
--
-- Database: `opd`
--
CREATE DATABASE IF NOT EXISTS `opd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `opd`;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `log_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Verified','Rejected','Scheduled','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `date` date NOT NULL,
  `time` time NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `notified` tinyint(1) DEFAULT 0,
  `receipt_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_schedules`
--

CREATE TABLE `daily_schedules` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `days` varchar(255) NOT NULL,
  `time_range` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_schedules`
--

INSERT INTO `daily_schedules` (`id`, `department_id`, `description`, `days`, `time_range`) VALUES
(1, 1, 'Animal Bite Treatment Center', 'Monday to Friday', '8am to 5pm'),
(2, 5, 'Cough Center (TB IDOTS)', 'Monday to Friday', '8am to 5pm'),
(3, 2, 'Mental Health Clinic', 'Monday to Friday', '8am to 5pm'),
(4, 3, 'Women\'s Health Clinic', 'Every 2nd and 4th Wednesday of the month', ''),
(5, 6, 'Adolescent Health Clinic', 'Monday to Friday', '8am to 3pm'),
(6, 7, 'Nutrition Clinic', 'Monday to Friday', '8am to 3pm'),
(7, 15, 'General Surgery', 'Monday to Friday', '8am to 3pm'),
(8, 16, 'Internal Medicine', 'Monday to Friday', '8am to 3pm'),
(9, 17, 'General Medicine', 'Monday to Friday', '8am to 3pm'),
(10, 18, 'Pediatric Medicine', 'Monday to Friday', '8am to 3pm'),
(11, 19, 'Family Medicine', 'Wednesday and Thursday', '8am to 3pm'),
(12, 20, 'ENT', 'Monday to Friday', '8am to 3pm');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(6, 'ADOLESCENT HEALTH CLINIC'),
(1, 'ANIMAL BITE TREATMENT CENTER'),
(4, 'DANGEROUS DRUGS ASSESSMENT & SCREENING CLINIC'),
(20, 'ENT'),
(19, 'FAMILY MEDICINE'),
(17, 'GENERAL MEDICINE'),
(15, 'GENERAL SURGERY'),
(16, 'INTERNAL MEDICINE'),
(2, 'MENTAL HEALTH CLINIC'),
(8, 'NEPHROLOGY'),
(10, 'NEUROLOGY'),
(7, 'NUTRITION CLINIC'),
(13, 'OCCUPATIONAL THERAPY'),
(18, 'PEDIATRIC MEDICINE'),
(11, 'PSYCHIATRY'),
(14, 'PSYCHOLOGIST'),
(12, 'REHABILITATION MEDICINE'),
(9, 'RHEUMATOLOGY'),
(5, 'TB IDOTS CLINIC'),
(3, 'WOMEN\'S HEALTH CLINIC');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialty_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_services`
--

CREATE TABLE `emergency_services` (
  `id` int(11) NOT NULL,
  `service` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency_services`
--

INSERT INTO `emergency_services` (`id`, `service`, `description`) VALUES
(1, 'Immediate Care for Emergency Cases', ''),
(2, 'Wound Care', 'Treatment for cuts, lacerations, and burns. Suturing and dressing of wounds.'),
(3, 'Stabilization of Patients', ''),
(4, 'Treatment of Injuries', 'Fractures, sprains, and dislocations. Sports injuries and falls.'),
(5, 'Pediatric Emergency Care', ''),
(6, 'OB Cases Emergency Care', ''),
(7, 'Referrals from other Health Care Facility', 'Community Hospital, RHU');

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `record_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `record_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `prescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monthly_schedules`
--

CREATE TABLE `monthly_schedules` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monthly_schedules`
--

INSERT INTO `monthly_schedules` (`id`, `department_id`, `description`, `frequency`, `notes`) VALUES
(1, 8, 'Nephrology', 'Once a month', 'By schedule'),
(2, 9, 'Rheumatology', 'Once a month', 'By schedule'),
(3, 10, 'Neurology', 'Once a month', 'By schedule'),
(4, 11, 'Psychiatry', 'Once a month', 'By schedule'),
(5, 12, 'Rehabilitation Medicine', 'Twice a month', 'By appointment'),
(6, 13, 'Occupational Therapy', 'Twice a month', 'By appointment'),
(7, 14, 'Psychologist', 'Once a month', 'By schedule');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `last_checkup_date` date DEFAULT NULL,
  `emergency_contact_name` varchar(100) DEFAULT NULL,
  `emergency_contact_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `user_id`, `first_name`, `middle_name`, `last_name`, `date_of_birth`, `gender`, `age`, `civil_status`, `nationality`, `phone`, `permanent_address`, `current_address`, `city`, `state`, `postal_code`, `country`, `religion`, `last_checkup_date`, `emergency_contact_name`, `emergency_contact_phone`) VALUES
(3, 6, 'sam', 'padilla', 'Orande', '2003-10-30', 'Male', NULL, NULL, 'Filipino', '09770972025', 'pulo', 'zarah pulo', 'San Luis', 'Aurora', '3201', 'Philippines', NULL, NULL, 'rayzel saguibo telen', '09333333333'),
(5, 14, 'romea gem', 'hakdok', 'habana', '2007-09-17', 'Female', NULL, NULL, 'ffilipino', '09123456760', 'pulo', 'zarah pulo', 'San Luis', 'Aurora', '3201', 'Philippines', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `available` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_number`, `room_type`, `available`) VALUES
(1, '101', 'Consultation', 1),
(2, '102', 'Consultation', 1),
(3, '201', 'Examination', 1),
(4, '202', 'Examination', 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `specialty_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`specialty_id`, `name`, `description`) VALUES
(1, 'General Medicine', 'General medical practice'),
(2, 'Cardiology', 'Heart and cardiovascular diseases'),
(3, 'Dermatology', 'Skin diseases and conditions'),
(4, 'Pediatrics', 'Medical care for children'),
(5, 'Orthopedics', 'Bone and joint disorders');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `user_type` enum('Admin','Doctor','Staff','Patient') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','archived') DEFAULT 'active',
  `session_token` varchar(255) DEFAULT NULL,
  `session_token_expires_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `failed_login_attempts` int(11) DEFAULT 0,
  `account_locked_until` timestamp NULL DEFAULT NULL,
  `lockout_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `contact_number`, `user_type`, `created_at`, `status`, `session_token`, `session_token_expires_at`, `last_login`, `failed_login_attempts`, `account_locked_until`, `lockout_count`) VALUES
(6, 'orande.sam.padilla', 'vkH4a8apDWD^', '09770972025', 'Patient', '2025-10-27 11:34:03', 'active', NULL, '2025-10-27 22:19:00', '2025-10-27 22:04:00', 0, NULL, 0),
(14, 'habana.romea gem.hakdok', '$2a$10$VvRvqfqH5czJ4hkyNe7seuO/YLJ8aYkd5ENMvoqqsp2vQSuwGscXO', '09123456760', 'Patient', '2025-10-28 00:14:14', 'active', '3bdb9c1a-df00-4115-a59d-e530a7a85234', '2025-10-28 00:29:26', '2025-10-28 00:14:26', 0, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `daily_schedules`
--
ALTER TABLE `daily_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `specialty_id` (`specialty_id`);

--
-- Indexes for table `emergency_services`
--
ALTER TABLE `emergency_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `monthly_schedules`
--
ALTER TABLE `monthly_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`specialty_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `contact_number` (`contact_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `daily_schedules`
--
ALTER TABLE `daily_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emergency_services`
--
ALTER TABLE `emergency_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `monthly_schedules`
--
ALTER TABLE `monthly_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `specialties`
--
ALTER TABLE `specialties`
  MODIFY `specialty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);

--
-- Constraints for table `daily_schedules`
--
ALTER TABLE `daily_schedules`
  ADD CONSTRAINT `daily_schedules_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`specialty_id`);

--
-- Constraints for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);

--
-- Constraints for table `monthly_schedules`
--
ALTER TABLE `monthly_schedules`
  ADD CONSTRAINT `monthly_schedules_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
--
-- Database: `opd_db`
--
CREATE DATABASE IF NOT EXISTS `opd_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `opd_db`;

-- --------------------------------------------------------

--
-- Table structure for table `appointed_relatives`
--

CREATE TABLE `appointed_relatives` (
  `relationship_id` int(11) NOT NULL,
  `patient_user_id` int(11) NOT NULL,
  `relative_user_id` int(11) NOT NULL,
  `relationship_type` varchar(50) NOT NULL COMMENT 'e.g., Guardian, Spouse, Child',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `booked_by_user_id` int(11) DEFAULT NULL,
  `relative_id` int(11) DEFAULT NULL,
  `patient_type` varchar(10) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `given_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `contact_number` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `opd_no` varchar(50) DEFAULT NULL,
  `last_checkup_date` date DEFAULT NULL,
  `reason_for_visit` text NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `preferred_date` date NOT NULL,
  `status` enum('Pending','Assigned','Accepted','Rejected','Completed') NOT NULL DEFAULT 'Pending',
  `assigned_doctor_id` int(11) DEFAULT NULL,
  `assigned_room_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`log_id`, `user_id`, `username`, `user_type`, `action`, `timestamp`) VALUES
(1, 1, 'admin', 'Super Admin', 'User logged in', '2025-11-26 22:47:20'),
(2, 1, 'admin', 'Super Admin', 'Created new admin account: orande.sam.p', '2025-11-26 22:47:42'),
(3, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-26 22:48:31'),
(4, 2, 'orande.sam.p', 'Admin', 'Created new staff account: orande.pavio.t', '2025-11-26 22:49:29'),
(5, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-26 22:53:12'),
(6, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-26 23:00:17'),
(7, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-26 23:07:56'),
(8, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-26 23:13:11'),
(9, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-26 23:19:12'),
(10, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-26 23:19:47'),
(11, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-26 23:35:14'),
(12, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-26 23:38:52'),
(13, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-26 23:47:59'),
(14, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 00:33:58'),
(15, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 00:53:37'),
(16, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 00:54:54'),
(17, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 01:28:40'),
(18, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 01:38:47'),
(19, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 01:42:44'),
(20, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 01:48:20'),
(21, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 01:59:13'),
(22, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 02:08:22'),
(23, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 02:11:15'),
(24, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 02:40:07'),
(25, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 02:54:16'),
(26, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 03:27:13'),
(27, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 03:29:03'),
(28, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 03:56:02'),
(29, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 03:57:03'),
(30, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 04:02:14'),
(31, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 04:34:09'),
(32, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 04:37:38'),
(33, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 04:39:21'),
(34, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 04:40:02'),
(35, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 05:16:49'),
(36, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 05:24:24'),
(37, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 05:32:09'),
(38, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 05:43:04'),
(39, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 05:52:44'),
(40, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 06:22:07'),
(41, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 06:53:16'),
(42, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 07:01:23'),
(43, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 07:09:58'),
(44, 2, 'orande.sam.p', 'Admin', 'Created new doctor account: buencamino.siimmonn', '2025-11-27 07:11:06'),
(45, 10, 'buencamino.siimmonn', 'Doctor', 'User logged in', '2025-11-27 07:16:24'),
(46, 10, 'buencamino.siimmonn', 'Doctor', 'User logged in', '2025-11-27 07:19:06'),
(47, 10, 'buencamino.siimmonn', 'Doctor', 'User logged in', '2025-11-27 07:21:10'),
(48, 10, 'buencamino.siimmonn', 'Doctor', 'User logged in', '2025-11-27 07:29:55'),
(49, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 07:32:33'),
(50, 10, 'buencamino.siimmonn', 'Doctor', 'User logged in', '2025-11-27 07:50:14'),
(51, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 07:50:49'),
(52, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 08:07:02'),
(53, 2, 'orande.sam.p', 'Admin', 'Updated own profile information', '2025-11-27 08:07:37'),
(54, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 08:12:16'),
(55, 10, 'buencamino.siimmonn', 'Doctor', 'User logged in', '2025-11-27 08:18:09'),
(56, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 08:20:24'),
(57, 2, 'orande.sam.p', 'Admin', 'User logged in', '2025-11-27 08:52:57'),
(58, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 08:56:59'),
(59, 3, 'orande.pavio.t', 'Staff', 'Updated own profile information', '2025-11-27 09:05:16'),
(60, 3, 'orande.pavio.t', 'Staff', 'Updated own profile information', '2025-11-27 09:09:28'),
(61, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 09:13:06'),
(62, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 09:19:24'),
(63, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 09:23:05'),
(64, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 09:25:22'),
(65, 3, 'orande.pavio.t', 'Staff', 'User logged in', '2025-11-27 09:30:33'),
(66, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 09:33:22'),
(67, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 09:55:42'),
(68, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 09:59:35'),
(69, 4, 'mendoza.anthony.o', 'Patient', 'User logged in', '2025-11-27 10:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `daily_reports`
--

CREATE TABLE `daily_reports` (
  `report_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`designation_id`, `designation_name`) VALUES
(5, 'Billing Staff'),
(2, 'Medical Technologist'),
(1, 'Nurse'),
(3, 'Pharmacist'),
(4, 'Receptionist'),
(6, 'Utility');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `month_num` int(11) NOT NULL,
  `month_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`month_num`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_type_target` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_relatives`
--

CREATE TABLE `patient_relatives` (
  `relative_id` int(11) NOT NULL,
  `patient_user_id` int(11) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `given_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_number` varchar(50) NOT NULL,
  `room_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_number`, `room_name`) VALUES
(1, '3', 'fghbn');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `schedule_type` enum('Weekly','Monthly','Daily') NOT NULL,
  `schedule_details` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `schedule_type`, `schedule_details`, `notes`) VALUES
(1, 'Public Health Unit', 'Daily', 'Monday to Friday - 8am to 5pm', 'Ariel A. Bitong Jr. , RN, MD, MPA, MPH (Chief of Hospital)\nJomarie Aquino, RM (Health Educator)\nJudy Ann Julio, RPM, CHRA (Health Education & Promotion Officer)\nMarcelo Jr C. Alalag, RN (Unit Head)\nApril Tacianne Lucindo, RN (HESU Coordinator Unit Coordinator)'),
(2, 'Animal Bite Treatment Center', 'Weekly', 'Monday to Friday - 8am to 5pm', 'Pamela Aurora Erog-Erog, RN (Program Coordinator)'),
(3, 'Cough Center', 'Weekly', 'Monday to Friday - 8am to 5pm', NULL),
(4, 'Mental Health Clinic', 'Weekly', 'Monday to Friday - 8am to 5pm', 'Roberto Delarna Jr. , RN (Program Coordinator)'),
(5, 'Physical Therapy and Rehabilitation Unit', 'Weekly', 'Monday to Friday - 8am to 5pm', NULL),
(6, 'Adolescent Health Clinic', 'Weekly', 'Monday to Friday - 8am to 3pm', 'Jasmin Gutierrez, RN (Program Coordinator)'),
(7, 'Nutrition Clinic', 'Weekly', 'Monday to Friday - 8am to 3pm', 'Lorelie Shane Aragon, RN (Program Coordinator)'),
(8, 'General Surgery', 'Weekly', 'Monday to Friday - 8am to 3pm', NULL),
(9, 'Internal Medicine', 'Weekly', 'Monday to Friday - 8am to 3pm', NULL),
(10, 'General Medicine', 'Weekly', 'Monday to Friday - 8am to 3pm', NULL),
(11, 'Pediatric Medicine', 'Weekly', 'Monday to Friday - 8am to 3pm', NULL),
(12, 'ENT', 'Weekly', 'Monday to Friday - 8am to 3pm', NULL),
(13, 'Women\'s Health Clinic', 'Weekly', 'Every 2nd and 4th Wednesday of the month', 'Leiann Magsino, RN (Program Coordinator)'),
(14, 'Family Medicine', 'Weekly', 'Wednesday and Thursday - 8am to 3pm', NULL),
(15, 'Nephrology', 'Monthly', 'Once a month by schedule', NULL),
(16, 'Rheumatology', 'Monthly', 'Once a month by schedule', NULL),
(17, 'Neurology', 'Monthly', 'Once a month by schedule', NULL),
(18, 'Psychiatry', 'Monthly', 'Once a month by schedule', NULL),
(19, 'Rehabilitation Medicine', 'Monthly', 'Twice a month by appointment', NULL),
(20, 'Occupational Therapy', 'Monthly', 'Twice a month by appointment', NULL),
(21, 'Psychologist', 'Monthly', 'Once a month by schedule', NULL),
(22, 'Emergency Rooms', 'Daily', 'Open daily 24-hours', '1. Immediate care for emergency cases\n2. Wound care (treatment for cuts, lacerations, and burns)\n3. Stabilization of patients\n4. Treatment of injuries (fractures, sprains, and dislocation)\n5. Pediatric emergency care\n6. OB cases emergency care\n7. Referrals from other health care facilities'),
(23, 'Dangerous Drug Assesment & Screening Clinic', 'Weekly', 'Monday to Friday - 8am to 5pm', 'Katherine Kris Apilado, RN (Program Coordinator)'),
(24, 'TB, DOTS Clinic', 'Weekly', 'Monday to Friday - 8am to 5pm', 'Yna Perfiñan, RN (Program Coordinator)');

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `specialization_id` int(11) NOT NULL,
  `specialization_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`specialization_id`, `specialization_name`) VALUES
(1, 'Cardiology'),
(2, 'Dermatology'),
(7, 'ENT'),
(5, 'General Surgery'),
(6, 'Internal Medicine'),
(3, 'Neurology'),
(4, 'Pediatrics');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `session_id` varchar(100) DEFAULT NULL,
  `failed_login_attempts` int(11) NOT NULL DEFAULT 0,
  `account_locked_until` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `contact_number`, `user_type`, `status`, `created_at`, `updated_at`, `session_id`, `failed_login_attempts`, `account_locked_until`) VALUES
(1, 'admin', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', '+639770972025', 'Super Admin', 'active', '2025-11-26 22:41:02', '2025-11-26 22:48:03', NULL, 0, NULL),
(2, 'orande.sam.p', 'Vw8jtlnlOlhiEKnH4eSH2feB+y7vex61kMjKMxKmAlA=', '+639926791507', 'Admin', 'active', '2025-11-26 22:47:41', '2025-11-27 08:56:46', NULL, 0, NULL),
(3, 'orande.pavio.t', 'vLypk5PeoKL00yahbDtvUFKt1fs7y4HlCg9EfoECxvc=', '+639126074720', 'Staff', 'active', '2025-11-26 22:49:29', '2025-11-27 09:33:05', NULL, 0, NULL),
(4, 'mendoza.anthony.o', '2Nn+IuH/igBnUCSg0wj51grKV0Bct3vr38pjl5KAxVI=', '+639641622778', 'Patient', 'active', '2025-11-26 22:59:51', '2025-11-27 10:02:36', 'A4F5D69DD9DF16BC84EF24B75434FC42', 0, NULL),
(10, 'buencamino.siimmonn', '9mEThE9EHCG2x/BnO1eIhBT7wQBjY+DUHQIH5243Jl8=', '+639318478074', 'Doctor', 'active', '2025-11-27 07:11:05', '2025-11-27 08:18:52', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `given_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `permanent_address` text NOT NULL,
  `current_address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `secondary_specialization` varchar(255) DEFAULT NULL,
  `license_number` varchar(100) DEFAULT NULL,
  `license_expiry_date` date DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL COMMENT 'For Staff: e.g., Nurse, Receptionist',
  `profile_picture_path` varchar(255) DEFAULT 'uploads/profile_pictures/default_avatar.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`profile_id`, `user_id`, `surname`, `given_name`, `middle_name`, `date_of_birth`, `gender`, `age`, `religion`, `permanent_address`, `current_address`, `city`, `postal_code`, `specialization`, `secondary_specialization`, `license_number`, `license_expiry_date`, `employee_id`, `designation`, `profile_picture_path`) VALUES
(1, 1, 'Admin', 'Super', 'A', '1990-01-01', 'Male', NULL, NULL, 'Hospital Main Office', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/profile_pictures/default_avatar.png'),
(2, 2, 'orande', 'sam', 'padilla', '2003-10-30', 'Male', NULL, NULL, 'pulo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 'orande', 'pavio', 'tamara', '2000-08-30', 'Male', NULL, NULL, '049, sitio pulo Barangay Zarah san luis Aurora', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '876535675879', 'Receptionist', NULL),
(4, 4, 'mendoza', 'anthony', 'orande', '2003-10-30', 'Male', 22, 'Roman Catholic', '049, sitio pulo Barangay Zarah san luis Aurora', '049, sitio pulo Barangay Zarah san luis Aurora', 'San Luis', '3201', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 10, 'buencamino', 'siimmonn', 'orande', '2000-10-20', 'Male', 25, NULL, '049, sitio pulo Barangay Zarah san luis Aurora', NULL, NULL, NULL, 'General Surgery', 'Cardiology', '897937', '2028-10-28', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointed_relatives`
--
ALTER TABLE `appointed_relatives`
  ADD PRIMARY KEY (`relationship_id`),
  ADD UNIQUE KEY `unique_relationship` (`patient_user_id`,`relative_user_id`),
  ADD KEY `relative_user_id` (`relative_user_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `booked_by_user_id` (`booked_by_user_id`),
  ADD KEY `relative_id` (`relative_id`),
  ADD KEY `assigned_doctor_id` (`assigned_doctor_id`),
  ADD KEY `assigned_room_id` (`assigned_room_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `daily_reports`
--
ALTER TABLE `daily_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `report_date` (`report_date`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`designation_id`),
  ADD UNIQUE KEY `designation_name` (`designation_name`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`month_num`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `patient_relatives`
--
ALTER TABLE `patient_relatives`
  ADD PRIMARY KEY (`relative_id`),
  ADD KEY `patient_user_id` (`patient_user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`specialization_id`),
  ADD UNIQUE KEY `specialization_name` (`specialization_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `contact_number` (`contact_number`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointed_relatives`
--
ALTER TABLE `appointed_relatives`
  MODIFY `relationship_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `daily_reports`
--
ALTER TABLE `daily_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_relatives`
--
ALTER TABLE `patient_relatives`
  MODIFY `relative_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `specialization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointed_relatives`
--
ALTER TABLE `appointed_relatives`
  ADD CONSTRAINT `appointed_relatives_ibfk_1` FOREIGN KEY (`patient_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointed_relatives_ibfk_2` FOREIGN KEY (`relative_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`booked_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`relative_id`) REFERENCES `patient_relatives` (`relative_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`assigned_doctor_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`assigned_room_id`) REFERENCES `rooms` (`room_id`) ON DELETE SET NULL;

--
-- Constraints for table `patient_relatives`
--
ALTER TABLE `patient_relatives`
  ADD CONSTRAINT `patient_relatives_ibfk_1` FOREIGN KEY (`patient_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"angular\",\"snap_to_grid\":\"on\",\"full_screen\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'opd', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"appointments\",\"audit_logs\",\"daily_schedules\",\"departments\",\"doctors\",\"emergency_services\",\"medical_records\",\"monthly_schedules\",\"patients\",\"rooms\",\"specialties\",\"users\"],\"table_structure[]\":[\"appointments\",\"audit_logs\",\"daily_schedules\",\"departments\",\"doctors\",\"emergency_services\",\"medical_records\",\"monthly_schedules\",\"patients\",\"rooms\",\"specialties\",\"users\"],\"table_data[]\":[\"appointments\",\"audit_logs\",\"daily_schedules\",\"departments\",\"doctors\",\"emergency_services\",\"medical_records\",\"monthly_schedules\",\"patients\",\"rooms\",\"specialties\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"opd_db\",\"table\":\"appointments\"},{\"db\":\"opd_db\",\"table\":\"user_profiles\"},{\"db\":\"opd_db\",\"table\":\"users\"},{\"db\":\"opd_db\",\"table\":\"services\"},{\"db\":\"opd_db\",\"table\":\"rooms\"},{\"db\":\"opd_db\",\"table\":\"specializations\"},{\"db\":\"opd_db\",\"table\":\"patient_relatives\"},{\"db\":\"facultyfaculty\",\"table\":\"users\"},{\"db\":\"opd_db\",\"table\":\"appointed_relatives\"},{\"db\":\"opd_db\",\"table\":\"designations\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-11-27 09:05:22', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
