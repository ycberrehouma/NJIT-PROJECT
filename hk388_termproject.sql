-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql.hyochangkim.com
-- Generation Time: Dec 12, 2017 at 10:27 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hk388_termproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `idAddress` int(11) NOT NULL,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` int(5) NOT NULL,
  `phone` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`idAddress`, `street`, `city`, `state`, `zip`, `phone`) VALUES
(15, '123 Maub St.', 'Maine', 'KS', 98792, 1023451234),
(16, '593 Elm St.', 'Main', 'NJ', 98704, 1923451234),
(17, '987 Helpme Ave', 'Little Rock', 'AK', 99998, 2147483647),
(18, '456 Knock Ave', 'Cheap', 'OR', 98792, 2147483647),
(19, '45 Vegan Way', 'Tomato', 'OK', 87434, 2147483647),
(20, '65 Strong Blvd', 'Wan', 'MS', 99981, 2147483647),
(21, '34 Hero Way', 'Smallville', 'KS', 88873, 2147483647),
(22, '65 Carlito Way', 'Brooklyn', 'NY', 19342, 2147483647),
(23, '123 Oak St', 'Maple', 'NJ', 7222, 2013459876),
(24, '45 Booker Ave', 'Newzahmde', 'NJ', 99876, 2018763453),
(25, '87 Hill Drive', 'Paramus', 'NJ', 7776, 2019873421),
(26, '56 Spidey Rd', 'Venom', 'NJ', 8773, 2019879874),
(27, '89 Highrise Tower', 'Edgewater', 'NJ', 7777, 2018739876),
(28, '876 Scarlett Ave', 'Aventown', 'NJ', 7878, 2019808273),
(29, '2345 Blue Grass Way', 'BigTown', 'NJ', 7657, 2018742837),
(30, '876 Overlook Drive', 'Palisades', 'NJ', 7832, 2019874357),
(32, '987 Shrink Ave', 'Tiny', 'MS', 99999, 2147483647),
(33, '765 Killer Bee Way', 'Hellspt', 'CA', 55555, 2147483647),
(34, '456 Bifrost Path', 'Asgard', 'YS', 33344, 2147483647),
(35, '234 Dark Shadow Way', 'Under', 'KS', 99999, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `Allergy`
--

CREATE TABLE `Allergy` (
  `idAllegry` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `dov` date NOT NULL,
  `allergy_name` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Allergy`
--

INSERT INTO `Allergy` (`idAllegry`, `idPatient`, `dov`, `allergy_name`, `description`) VALUES
(2, 5, '2017-12-11', 'pollen', 'itchy, running nose with red eyes');

-- --------------------------------------------------------

--
-- Table structure for table `Cholesterol`
--

CREATE TABLE `Cholesterol` (
  `idChol` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `dov` date NOT NULL,
  `hdl` int(11) NOT NULL,
  `ldl` int(11) NOT NULL,
  `trig` int(11) NOT NULL,
  `totChol` int(11) NOT NULL,
  `heartRisk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cholesterol`
--

INSERT INTO `Cholesterol` (`idChol`, `idPatient`, `dov`, `hdl`, `ldl`, `trig`, `totChol`, `heartRisk`) VALUES
(5, 5, '2017-12-11', 100, 200, 300, 600, 'very bad'),
(6, 5, '2017-03-14', 120, 400, 100, 600, 'Bad'),
(7, 5, '2017-03-14', 120, 400, 100, 540, 'No Risk'),
(8, 5, '2010-08-10', 765, 987, 456, 1843, 'No Risk');

-- --------------------------------------------------------

--
-- Table structure for table `Consultation`
--

CREATE TABLE `Consultation` (
  `idConsult` int(11) NOT NULL,
  `idPhysician` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `dov` date NOT NULL,
  `tov` time DEFAULT NULL,
  `reason` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Drug`
--

CREATE TABLE `Drug` (
  `idDrug` int(11) NOT NULL,
  `drug_name` int(11) NOT NULL,
  `on_hand` int(11) NOT NULL,
  `on_order` int(11) NOT NULL,
  `unit_cost` double NOT NULL,
  `idInteraction` int(11) NOT NULL,
  `YTD Dosage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DrugInteraction`
--

CREATE TABLE `DrugInteraction` (
  `idInteration` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Illness`
--

CREATE TABLE `Illness` (
  `idIll` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `dov` date NOT NULL,
  `ill_name` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Illness`
--

INSERT INTO `Illness` (`idIll`, `idPatient`, `dov`, `ill_name`, `description`) VALUES
(1, 5, '2017-12-11', 'Unknown', '0');

-- --------------------------------------------------------

--
-- Table structure for table `InPatient`
--

CREATE TABLE `InPatient` (
  `idHospitalstay` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `idPhysician` int(11) NOT NULL,
  `idNurse` int(11) NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `nursing_unit` int(11) NOT NULL,
  `wing` varchar(30) NOT NULL,
  `room` int(11) NOT NULL,
  `bed` varchar(30) NOT NULL,
  `idPrescription` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `InPatient`
--

INSERT INTO `InPatient` (`idHospitalstay`, `idPatient`, `idPhysician`, `idNurse`, `date_in`, `date_out`, `nursing_unit`, `wing`, `room`, `bed`, `idPrescription`) VALUES
(3, 7, 3, 5, '2017-02-06', '2017-02-06', 1, 'Green', 3, 'A', 0),
(5, 7, 2, 6, '2016-01-07', '2016-01-07', 1, 'Blue', 34, 'B', 0),
(6, 12, 4, 7, '2017-01-02', '2017-01-02', 6, 'Blue', 12, 'A', 0);

-- --------------------------------------------------------

--
-- Table structure for table `MedicalData`
--

CREATE TABLE `MedicalData` (
  `idMeddata` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `blood_type` varchar(10) NOT NULL,
  `blood_sugar` float NOT NULL,
  `idChol` int(11) DEFAULT NULL,
  `idIllness` int(11) DEFAULT NULL,
  `idAllergy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MedicalData`
--

INSERT INTO `MedicalData` (`idMeddata`, `idPatient`, `blood_type`, `blood_sugar`, `idChol`, `idIllness`, `idAllergy`) VALUES
(1, 6, 'AB+', 5, NULL, NULL, NULL),
(2, 7, 'O+', 4, NULL, NULL, NULL),
(3, 8, 'A-', 8, NULL, NULL, NULL),
(4, 9, 'O+', 3.5, NULL, NULL, NULL),
(5, 10, 'B-', 6.2, NULL, NULL, NULL),
(6, 12, 'A+', 4.3, NULL, NULL, NULL),
(7, 13, 'O+', 6.3, NULL, NULL, NULL),
(8, 14, 'B-', 3.5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Nurse`
--

CREATE TABLE `Nurse` (
  `idNurse` int(11) NOT NULL,
  `EmNo` int(11) NOT NULL,
  `year_exp` int(2) NOT NULL,
  `grade` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Nurse`
--

INSERT INTO `Nurse` (`idNurse`, `EmNo`, `year_exp`, `grade`) VALUES
(5, 27, 4, 3),
(6, 28, 8, 2),
(7, 29, 17, 9);

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `idPatient` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `dob` date NOT NULL,
  `ssn` int(9) NOT NULL,
  `idAddress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` (`idPatient`, `first_name`, `last_name`, `gender`, `dob`, `ssn`, `idAddress`) VALUES
(5, 'Will', 'Smith', 'M', '2000-08-18', 98785678, 15),
(6, 'Jack', 'Hello', 'M', '2000-05-15', 98791234, 16),
(7, 'Jennifer', 'Flower', 'F', '1961-03-24', 876905436, 17),
(8, 'Tonya ', 'Harding', 'F', '1968-11-02', 398765432, 18),
(9, 'Jill', 'Happy ', 'F', '1996-12-20', 987234234, 19),
(10, 'Roxanne', 'Yates', 'F', '1993-07-11', 123121234, 20),
(12, 'Henry ', 'Pym', 'M', '1956-10-21', 987608765, 32),
(13, 'Hope', 'Van Dyke', 'F', '1969-04-22', 999775555, 33),
(14, 'Thor', 'Odinson', 'M', '1950-02-04', 888663333, 34),
(15, 'Barnabas', 'Collins', 'M', '1950-12-07', 987561234, 35);

-- --------------------------------------------------------

--
-- Table structure for table `Physician`
--

CREATE TABLE `Physician` (
  `idPhysician` int(11) NOT NULL,
  `EmNo` int(11) NOT NULL,
  `specialty` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Physician`
--

INSERT INTO `Physician` (`idPhysician`, `EmNo`, `specialty`) VALUES
(2, 22, 'Internal'),
(3, 25, 'Internal'),
(4, 26, 'Family');

-- --------------------------------------------------------

--
-- Table structure for table `Prescription`
--

CREATE TABLE `Prescription` (
  `idPrescription` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `idPhysician` int(11) NOT NULL,
  `idDrug` int(11) NOT NULL,
  `dp` date NOT NULL,
  `dosage` int(11) NOT NULL,
  `frequency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedNurse`
--

CREATE TABLE `schedNurse` (
  `idschedNurse` int(11) NOT NULL,
  `idNurse` int(11) NOT NULL,
  `dayOfWeek` varchar(12) NOT NULL,
  `stime` time NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedPhy`
--

CREATE TABLE `schedPhy` (
  `idschedPhy` int(11) NOT NULL,
  `idPhysician` int(11) NOT NULL,
  `dayOfWeek` varchar(10) NOT NULL,
  `stime` time NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedPhy`
--

INSERT INTO `schedPhy` (`idschedPhy`, `idPhysician`, `dayOfWeek`, `stime`, `status`) VALUES
(6, 2, 'Mon', '09:00:00', 0),
(7, 2, 'Mon', '11:00:00', 0),
(8, 2, 'Mon', '01:00:00', 0),
(9, 2, 'Mon', '02:00:00', 0),
(10, 2, 'Mon', '03:00:00', 0),
(11, 2, 'Tue', '09:00:00', 0),
(12, 2, 'Tue', '10:00:00', 0),
(13, 2, 'Thur', '09:00:00', 0),
(14, 2, 'Thur', '10:00:00', 0),
(15, 2, 'Thur', '11:00:00', 0),
(16, 2, 'Thur', '01:00:00', 0),
(17, 2, 'Fri', '12:00:00', 0),
(18, 2, 'Fri', '01:00:00', 0),
(19, 2, 'Fri', '02:00:00', 0),
(20, 2, 'Fri', '03:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedSurg`
--

CREATE TABLE `schedSurg` (
  `idschedSurg` int(11) NOT NULL,
  `idSurgeon` int(11) NOT NULL,
  `dayOfWeek` varchar(12) NOT NULL,
  `stime` time NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedSurg`
--

INSERT INTO `schedSurg` (`idschedSurg`, `idSurgeon`, `dayOfWeek`, `stime`, `status`) VALUES
(1, 4, 'Mon', '07:00:00', 0),
(2, 4, 'Mon', '09:00:00', 0),
(3, 4, 'Mon', '01:00:00', 0),
(4, 4, 'Mon', '03:00:00', 0),
(5, 4, 'Wed', '12:00:00', 0),
(6, 4, 'Wed', '02:00:00', 0),
(7, 4, 'Wed', '04:00:00', 0),
(8, 4, 'Thur', '07:00:00', 0),
(9, 4, 'Thur', '09:00:00', 0),
(10, 4, 'Fri', '07:00:00', 0),
(11, 4, 'Fri', '09:00:00', 0),
(12, 4, 'Fri', '01:00:00', 0),
(13, 4, 'Fri', '03:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Skill`
--

CREATE TABLE `Skill` (
  `idSkill` int(11) NOT NULL,
  `sk_name` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `EmNo` int(10) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `ssn` int(9) NOT NULL,
  `position` varchar(20) NOT NULL,
  `salary` int(7) DEFAULT NULL,
  `idAddress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`EmNo`, `first_name`, `last_name`, `gender`, `ssn`, `position`, `salary`, `idAddress`) VALUES
(22, 'Thomas', 'Aquinas', 'M', 987563456, 'Physician', 175000, 21),
(23, 'Nelson', 'Rockefeller', 'M', 98765432, 'Surgeon', 0, 22),
(24, 'Traci ', 'Goodheart', 'F', 876098765, 'Surgeon', 0, 23),
(25, 'Hope', 'Vaughn', 'F', 876098776, 'Physician', 126000, 24),
(26, 'Jaco', 'Wayyo', 'M', 777777777, 'Physician', 88000, 25),
(27, 'Peter', 'Parker', 'M', 876451234, 'Nurse', 45000, 26),
(28, 'Tony ', 'Stark', 'M', 987654567, 'Nurse', 29000, 27),
(29, 'Wanda', 'Maximoff', 'F', 789237654, 'Nurse', 98000, 28),
(30, 'Jodi', 'Foster', 'F', 675452345, 'Office Manager', 65000, 29),
(31, 'John', 'Overhead', 'M', 876459812, 'Receptionist', 28400, 30);

-- --------------------------------------------------------

--
-- Table structure for table `Surgeon`
--

CREATE TABLE `Surgeon` (
  `idSurgeon` int(11) NOT NULL,
  `EmNo` int(11) NOT NULL,
  `idSkill` int(11) NOT NULL,
  `specialty` varchar(45) NOT NULL,
  `duration` int(11) NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Surgeon`
--

INSERT INTO `Surgeon` (`idSurgeon`, `EmNo`, `idSkill`, `specialty`, `duration`, `type`) VALUES
(4, 23, 0, 'Heart', 36, 'Permanent'),
(5, 24, 0, 'Brain', 24, 'Temporary');

-- --------------------------------------------------------

--
-- Table structure for table `SurgeryCode`
--

CREATE TABLE `SurgeryCode` (
  `IdSurgeryCode` int(11) NOT NULL,
  `idSurgeryType` int(11) NOT NULL,
  `idSkill` int(11) NOT NULL,
  `category` varchar(1) NOT NULL,
  `anatomical_loc` varchar(45) NOT NULL,
  `special_needs` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SurgerySchedule`
--

CREATE TABLE `SurgerySchedule` (
  `idSurgerySchedule` int(11) NOT NULL,
  `idSurgeon` int(11) NOT NULL,
  `idNurse` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `idSurgeryCode` int(11) NOT NULL,
  `location` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SurgeryType`
--

CREATE TABLE `SurgeryType` (
  `isSurgeryType` int(11) NOT NULL,
  `surg_type_name` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(10) NOT NULL,
  `input1` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indexes for table `Allergy`
--
ALTER TABLE `Allergy`
  ADD PRIMARY KEY (`idAllegry`),
  ADD KEY `idPatient` (`idPatient`);

--
-- Indexes for table `Cholesterol`
--
ALTER TABLE `Cholesterol`
  ADD PRIMARY KEY (`idChol`),
  ADD KEY `Cholesterol_ibfk_1` (`idPatient`);

--
-- Indexes for table `Consultation`
--
ALTER TABLE `Consultation`
  ADD PRIMARY KEY (`idConsult`),
  ADD KEY `idPatient` (`idPatient`),
  ADD KEY `idPhysician` (`idPhysician`);

--
-- Indexes for table `Drug`
--
ALTER TABLE `Drug`
  ADD PRIMARY KEY (`idDrug`),
  ADD KEY `idInteraction` (`idInteraction`);

--
-- Indexes for table `DrugInteraction`
--
ALTER TABLE `DrugInteraction`
  ADD PRIMARY KEY (`idInteration`);

--
-- Indexes for table `Illness`
--
ALTER TABLE `Illness`
  ADD PRIMARY KEY (`idIll`),
  ADD KEY `idPatient` (`idPatient`);

--
-- Indexes for table `InPatient`
--
ALTER TABLE `InPatient`
  ADD PRIMARY KEY (`idHospitalstay`),
  ADD KEY `idNurse` (`idNurse`),
  ADD KEY `idPatient` (`idPatient`),
  ADD KEY `idPhysician` (`idPhysician`),
  ADD KEY `idPrescription` (`idPrescription`);

--
-- Indexes for table `MedicalData`
--
ALTER TABLE `MedicalData`
  ADD PRIMARY KEY (`idMeddata`),
  ADD KEY `idAllergy` (`idAllergy`),
  ADD KEY `idChol` (`idChol`),
  ADD KEY `idIllness` (`idIllness`),
  ADD KEY `idPatient` (`idMeddata`,`idPatient`),
  ADD KEY `medicaldata_ibfk_4` (`idPatient`);

--
-- Indexes for table `Nurse`
--
ALTER TABLE `Nurse`
  ADD PRIMARY KEY (`idNurse`),
  ADD KEY `EmNo` (`EmNo`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`idPatient`),
  ADD KEY `idAddress` (`idAddress`);

--
-- Indexes for table `Physician`
--
ALTER TABLE `Physician`
  ADD PRIMARY KEY (`idPhysician`),
  ADD KEY `EmNo` (`EmNo`);

--
-- Indexes for table `Prescription`
--
ALTER TABLE `Prescription`
  ADD PRIMARY KEY (`idPrescription`),
  ADD KEY `idDrug` (`idDrug`),
  ADD KEY `idPatient` (`idPatient`),
  ADD KEY `idPhysician` (`idPhysician`);

--
-- Indexes for table `schedNurse`
--
ALTER TABLE `schedNurse`
  ADD PRIMARY KEY (`idschedNurse`),
  ADD KEY `idNurse` (`idNurse`);

--
-- Indexes for table `schedPhy`
--
ALTER TABLE `schedPhy`
  ADD PRIMARY KEY (`idschedPhy`),
  ADD KEY `idPhysician` (`idPhysician`);

--
-- Indexes for table `schedSurg`
--
ALTER TABLE `schedSurg`
  ADD PRIMARY KEY (`idschedSurg`),
  ADD KEY `idSurgeon` (`idSurgeon`);

--
-- Indexes for table `Skill`
--
ALTER TABLE `Skill`
  ADD PRIMARY KEY (`idSkill`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`EmNo`),
  ADD KEY `idAddress` (`idAddress`);

--
-- Indexes for table `Surgeon`
--
ALTER TABLE `Surgeon`
  ADD PRIMARY KEY (`idSurgeon`),
  ADD KEY `EmNo` (`EmNo`);

--
-- Indexes for table `SurgeryCode`
--
ALTER TABLE `SurgeryCode`
  ADD PRIMARY KEY (`IdSurgeryCode`),
  ADD KEY `idSurgeryType` (`idSurgeryType`),
  ADD KEY `idSkill` (`idSkill`);

--
-- Indexes for table `SurgerySchedule`
--
ALTER TABLE `SurgerySchedule`
  ADD PRIMARY KEY (`idSurgerySchedule`),
  ADD KEY `idNurse` (`idNurse`),
  ADD KEY `idPatient` (`idPatient`),
  ADD KEY `idSurgeon` (`idSurgeon`),
  ADD KEY `idSurgeryCode` (`idSurgeryCode`);

--
-- Indexes for table `SurgeryType`
--
ALTER TABLE `SurgeryType`
  ADD PRIMARY KEY (`isSurgeryType`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `Allergy`
--
ALTER TABLE `Allergy`
  MODIFY `idAllegry` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Cholesterol`
--
ALTER TABLE `Cholesterol`
  MODIFY `idChol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Consultation`
--
ALTER TABLE `Consultation`
  MODIFY `idConsult` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Drug`
--
ALTER TABLE `Drug`
  MODIFY `idDrug` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `DrugInteraction`
--
ALTER TABLE `DrugInteraction`
  MODIFY `idInteration` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Illness`
--
ALTER TABLE `Illness`
  MODIFY `idIll` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `InPatient`
--
ALTER TABLE `InPatient`
  MODIFY `idHospitalstay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `MedicalData`
--
ALTER TABLE `MedicalData`
  MODIFY `idMeddata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Nurse`
--
ALTER TABLE `Nurse`
  MODIFY `idNurse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Patient`
--
ALTER TABLE `Patient`
  MODIFY `idPatient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `Physician`
--
ALTER TABLE `Physician`
  MODIFY `idPhysician` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Prescription`
--
ALTER TABLE `Prescription`
  MODIFY `idPrescription` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `schedNurse`
--
ALTER TABLE `schedNurse`
  MODIFY `idschedNurse` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `schedPhy`
--
ALTER TABLE `schedPhy`
  MODIFY `idschedPhy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `schedSurg`
--
ALTER TABLE `schedSurg`
  MODIFY `idschedSurg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `Skill`
--
ALTER TABLE `Skill`
  MODIFY `idSkill` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Staff`
--
ALTER TABLE `Staff`
  MODIFY `EmNo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `Surgeon`
--
ALTER TABLE `Surgeon`
  MODIFY `idSurgeon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `SurgeryCode`
--
ALTER TABLE `SurgeryCode`
  MODIFY `IdSurgeryCode` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SurgerySchedule`
--
ALTER TABLE `SurgerySchedule`
  MODIFY `idSurgerySchedule` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SurgeryType`
--
ALTER TABLE `SurgeryType`
  MODIFY `isSurgeryType` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Allergy`
--
ALTER TABLE `Allergy`
  ADD CONSTRAINT `Allergy_ibfk_1` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Cholesterol`
--
ALTER TABLE `Cholesterol`
  ADD CONSTRAINT `Cholesterol_ibfk_1` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Consultation`
--
ALTER TABLE `Consultation`
  ADD CONSTRAINT `consultation_ibfk_3` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`),
  ADD CONSTRAINT `consultation_ibfk_4` FOREIGN KEY (`idPhysician`) REFERENCES `Physician` (`idPhysician`);

--
-- Constraints for table `Drug`
--
ALTER TABLE `Drug`
  ADD CONSTRAINT `drug_ibfk_1` FOREIGN KEY (`idInteraction`) REFERENCES `DrugInteraction` (`idInteration`);

--
-- Constraints for table `Illness`
--
ALTER TABLE `Illness`
  ADD CONSTRAINT `Illness_ibfk_1` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `InPatient`
--
ALTER TABLE `InPatient`
  ADD CONSTRAINT `inpatient_ibfk_1` FOREIGN KEY (`idNurse`) REFERENCES `Nurse` (`idNurse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inpatient_ibfk_2` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inpatient_ibfk_3` FOREIGN KEY (`idPhysician`) REFERENCES `Physician` (`idPhysician`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MedicalData`
--
ALTER TABLE `MedicalData`
  ADD CONSTRAINT `medicaldata_ibfk_1` FOREIGN KEY (`idAllergy`) REFERENCES `Allergy` (`idAllegry`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicaldata_ibfk_2` FOREIGN KEY (`idChol`) REFERENCES `Cholesterol` (`idChol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicaldata_ibfk_3` FOREIGN KEY (`idIllness`) REFERENCES `Illness` (`idIll`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medicaldata_ibfk_4` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Nurse`
--
ALTER TABLE `Nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`EmNo`) REFERENCES `Staff` (`EmNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Patient`
--
ALTER TABLE `Patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`idAddress`) REFERENCES `Address` (`idAddress`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Physician`
--
ALTER TABLE `Physician`
  ADD CONSTRAINT `physician_ibfk_1` FOREIGN KEY (`EmNo`) REFERENCES `Staff` (`EmNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Prescription`
--
ALTER TABLE `Prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`idDrug`) REFERENCES `Drug` (`idDrug`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`),
  ADD CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`idPhysician`) REFERENCES `Physician` (`idPhysician`);

--
-- Constraints for table `schedNurse`
--
ALTER TABLE `schedNurse`
  ADD CONSTRAINT `schedNurse_ibfk_1` FOREIGN KEY (`idNurse`) REFERENCES `Nurse` (`idNurse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedPhy`
--
ALTER TABLE `schedPhy`
  ADD CONSTRAINT `schedPhy_ibfk_1` FOREIGN KEY (`idPhysician`) REFERENCES `Physician` (`idPhysician`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedSurg`
--
ALTER TABLE `schedSurg`
  ADD CONSTRAINT `schedSurg_ibfk_1` FOREIGN KEY (`idSurgeon`) REFERENCES `Surgeon` (`idSurgeon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`idAddress`) REFERENCES `Address` (`idAddress`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Surgeon`
--
ALTER TABLE `Surgeon`
  ADD CONSTRAINT `surgeon_ibfk_1` FOREIGN KEY (`EmNo`) REFERENCES `Staff` (`EmNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SurgeryCode`
--
ALTER TABLE `SurgeryCode`
  ADD CONSTRAINT `surgerycode_ibfk_1` FOREIGN KEY (`idSurgeryType`) REFERENCES `SurgeryType` (`isSurgeryType`),
  ADD CONSTRAINT `surgerycode_ibfk_2` FOREIGN KEY (`idSkill`) REFERENCES `Skill` (`idSkill`);

--
-- Constraints for table `SurgerySchedule`
--
ALTER TABLE `SurgerySchedule`
  ADD CONSTRAINT `surgeryschedule_ibfk_1` FOREIGN KEY (`idNurse`) REFERENCES `Nurse` (`idNurse`),
  ADD CONSTRAINT `surgeryschedule_ibfk_2` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`),
  ADD CONSTRAINT `surgeryschedule_ibfk_3` FOREIGN KEY (`idSurgeon`) REFERENCES `Surgeon` (`idSurgeon`),
  ADD CONSTRAINT `surgeryschedule_ibfk_4` FOREIGN KEY (`idSurgeryCode`) REFERENCES `SurgeryCode` (`IdSurgeryCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
