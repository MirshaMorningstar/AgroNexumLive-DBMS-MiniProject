-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 06:31 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmers`
--

-- --------------------------------------------------------

--
-- Table structure for table `addagroproducts`
--

CREATE TABLE `addagroproducts` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productdesc` text NOT NULL,
  `price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addagroproducts`
--

--
INSERT INTO `addagroproducts` (`username`, `email`, `pid`, `productname`, `productdesc`, `price`) VALUES
('agriexpert1', 'agriexpert1@gmail.com', 1, 'Organic Wheat', 'High-quality organic wheat harvested from pesticide-free fields.', '1 kg - ₹450'),
('poultryfarmers', 'poultryfarmers@gmail.com', 2, 'Farm-Fresh Eggs', 'Fresh and nutritious eggs from free-range chickens.', '12 eggs - ₹60'),
('milkman123', 'milkman123@gmail.com', 3, 'Goat Milk', 'Pure and fresh goat milk, rich in nutrients and proteins.', '500 ml - ₹200'),
('dairyfarms', 'dairyfarms@gmail.com', 4, 'Cow Milk', 'Farm-fresh cow milk, pasteurized and free from additives.', '1 liter - ₹120'),
('farmerlife', 'farmerlife@gmail.com', 5, 'Buffalo Milk', 'Naturally sourced buffalo milk with high cream content.', '1 liter - ₹150'),
('plantnursery', 'plantnursery@gmail.com', 6, 'Fruit Saplings', 'Healthy saplings of various fruit trees for home gardens or farms.', '1 sapling - ₹80'),
('indianveggies', 'indianveggies@gmail.com', 7, 'Organic Tomatoes', 'Locally grown organic tomatoes, rich in flavor and nutrients.', '1 kg - ₹40'),
('greenfieldfarm', 'greenfieldfarm@gmail.com', 8, 'Fresh Spinach', 'Nourishing and pesticide-free spinach, handpicked from the farm.', '500g - ₹30'),
('spicegrove', 'spicegrove@gmail.com', 9, 'Aromatic Spices Set', 'Assorted pack of aromatic Indian spices for culinary use.', '250g - ₹150'),
('flowercultivator', 'flowercultivator@gmail.com', 10, 'Marigold Flowers', 'Freshly plucked marigold flowers, ideal for religious ceremonies.', '25 flowers - ₹25'),
('honeyharvesters', 'honeyharvesters@gmail.com', 11, 'Pure Honey', 'Raw and unprocessed honey, collected from local bee farms.', '500g - ₹180'),
('ricefarmers', 'ricefarmers@gmail.com', 12, 'Basmati Rice', 'Premium quality Basmati rice grains, known for their aroma.', '1 kg - ₹500'),
('organicgrains', 'organicgrains@gmail.com', 13, 'Quinoa', 'Nutritious and gluten-free quinoa grains, perfect for a healthy diet.', '500g - ₹350'),
('freshveggieshub', 'freshveggieshub@gmail.com', 14, 'Green Capsicum', 'Fresh and crunchy green capsicums grown using organic methods.', '500g - ₹60'),
('tealeafplanters', 'tealeafplanters@gmail.com', 15, 'Assam Tea Leaves', 'High-quality Assam tea leaves, perfect for a refreshing cup of tea.', '250g - ₹250'),
('spicychillies', 'spicychillies@gmail.com', 16, 'Red Chillies', 'Sun-dried spicy red chillies, essential for Indian cooking.', '100g - ₹45'),
('organicfarmerindia', 'organicfarmerindia@gmail.com', 17, 'Healthy Millets Mix', 'A mix of nutrient-rich millets for a balanced diet.', '1 kg - ₹180'),
('herbsharvest', 'herbsharvest@gmail.com', 18, 'Fresh Coriander', 'Fragrant and fresh coriander leaves, essential in Indian cuisine.', '50g - ₹20'),
('nutrientrichfarms', 'nutrientrichfarms@gmail.com', 19, 'Chickpeas', 'High-protein and fiber-rich chickpeas for healthy meals.', '1 kg - ₹90'),
('tumericgrowers', 'tumericgrowers@gmail.com', 20, 'Turmeric Powder', 'Ground turmeric powder, known for its medicinal properties.', '250g - ₹70'),
('mangoorchards', 'mangoorchards@gmail.com', 21, 'Alphonso Mangoes', 'Juicy and flavorful Alphonso mangoes, a summer delight.', '1 dozen - ₹80'),
('cashewplantations', 'cashewplantations@gmail.com', 22, 'Cashew Nuts', 'Premium-quality cashew nuts, handpicked and processed.', '250g - ₹300'),
('bengalifarmfresh', 'bengalifarmfresh@gmail.com', 23, 'Bengal Gram', 'Fresh Bengal gram, ideal for Indian culinary preparations.', '1 kg - ₹120'),
('localvegetablevendor', 'localvegetablevendor@gmail.com', 24, 'Potatoes', 'Locally sourced and fresh potatoes for various cooking needs.', '1 kg - ₹30'),
('grapevineyard', 'grapevineyard@gmail.com', 25, 'Seedless Grapes', 'Sweet and seedless grapes, perfect for snacking or desserts.', '500g - ₹100'),
('artisanalcheesery', 'artisanalcheesery@gmail.com', 26, 'Artisanal Cheese Set', 'Assorted set of artisanal cheeses for gourmet experiences.', '500g - ₹350'),
('localmeatshop', 'localmeatshop@gmail.com', 27, 'Fresh Lamb Meat', 'Tender and fresh lamb meat, sourced from local farms.', '1 kg - ₹400'),
('fisherydock', 'fisherydock@gmail.com', 28, 'Fresh Water Fish', 'Freshly caught local fish from freshwater sources.', '500g - ₹250'),
('poultryzone', 'poultryzone@gmail.com', 29, 'Dressed Chicken', 'Freshly dressed and cleaned chicken for cooking purposes.', '1 kg - ₹180'),
('dairyproductsindia', 'dairyproductsindia@gmail.com', 30, 'Butter', 'Homemade butter churned from farm-fresh cow milk.', '500g - ₹120');

--
-- --------------------------------------------------------

--
-- Table structure for table `farming`
--

CREATE TABLE `farming` (
  `fid` int(11) NOT NULL,
  `farmingtype` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farming`
--

INSERT INTO `farming` (`fid`, `farmingtype`) VALUES
(1, 'Seed Farming'),
(2, 'Cocoon Farming'),
(3, 'Silk Farming'),
(4, 'Goat Farming'),
(5, 'Cow Farming'),
(6, 'Buffalo Farming'),
(7, 'Sapling Cultivation'),
(8, 'Tomato Farming'),
(9, 'Spinach Farming'),
(10, 'Spice Cultivation'),
(11, 'Flower Cultivation'),
(12, 'Honey Harvesting'),
(13, 'Rice Farming'),
(14, 'Grain Cultivation'),
(15, 'Capsicum Farming'),
(16, 'Tea Leaf Cultivation'),
(17, 'Chilli Farming'),
(18, 'Millets Farming'),
(19, 'Coriander Farming'),
(20, 'Chickpea Farming'),
(21, 'Turmeric Farming'),
(22, 'Mango Orchard'),
(23, 'Cashew Plantation'),
(24, 'Bengal Gram Farming'),
(25, 'Potato Farming'),
(26, 'Grape Farming'),
(27, 'Cheese Production'),
(28, 'Lamb Farming'),
(29, 'Fishery'),
(30, 'Poultry Farming'),
(31, 'Butter Production');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `rid` int(11) NOT NULL,
  `farmername` varchar(50) NOT NULL,
  `adharnumber` varchar(20) NOT NULL,
  `age` int(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phonenumber` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `farming` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `register` (`rid`, `farmername`, `adharnumber`, `age`, `gender`, `phonenumber`, `address`, `farming`) VALUES
(1, 'agriexpert1', '123456789012', 35, 'Male', '9876543210', 'Address 1', 'Crop Cultivation'),
(2, 'poultryfarmers', '234567890123', 28, 'Female', '8765432109', 'Address 2', 'Poultry Farming'),
(3, 'milkman123', '345678901234', 40, 'Male', '7654321098', 'Address 3', 'Dairy Farming'),
(4, 'dairyfarms', '456789012345', 32, 'Female', '6543210987', 'Address 4', 'Dairy Farming'),
(5, 'farmerlife', '567890123456', 45, 'Male', '5432109876', 'Address 5', 'Dairy Farming'),
(6, 'plantnursery', '678901234567', 50, 'Female', '4321098765', 'Address 6', 'Horticulture'),
(7, 'indianveggies', '789012345678', 38, 'Male', '3210987654', 'Address 7', 'Crop Cultivation'),
(8, 'greenfieldfarm', '890123456789', 26, 'Female', '2109876543', 'Address 8', 'Crop Cultivation'),
(9, 'spicegrove', '901234567890', 31, 'Male', '1098765432', 'Address 9', 'Horticulture'),
(10, 'flowercultivator', '012345678901', 42, 'Female', '9876543210', 'Address 10', 'Horticulture'),
(11, 'honeyharvesters', '123456789012', 33, 'Male', '8765432109', 'Address 11', 'Apiculture'),
(12, 'ricefarmers', '234567890123', 29, 'Female', '7654321098', 'Address 12', 'Crop Cultivation'),
(13, 'organicgrains', '345678901234', 44, 'Male', '6543210987', 'Address 13', 'Organic Farming'),
(14, 'freshveggieshub', '456789012345', 36, 'Female', '5432109876', 'Address 14', 'Crop Cultivation'),
(15, 'tealeafplanters', '567890123456', 41, 'Male', '4321098765', 'Address 15', 'Horticulture'),
(16, 'spicychillies', '678901234567', 27, 'Female', '3210987654', 'Address 16', 'Crop Cultivation'),
(17, 'organicfarmerindia', '789012345678', 39, 'Male', '2109876543', 'Address 17', 'Organic Farming'),
(18, 'herbsharvest', '890123456789', 30, 'Female', '1098765432', 'Address 18', 'Horticulture'),
(19, 'nutrientrichfarms', '901234567890', 43, 'Male', '0987654321', 'Address 19', 'Crop Cultivation'),
(20, 'tumericgrowers', '012345678901', 34, 'Female', '9876543210', 'Address 20', 'Crop Cultivation'),
(21, 'mangoorchards', '123456789012', 37, 'Male', '8765432109', 'Address 21', 'Horticulture'),
(22, 'cashewplantations', '234567890123', 25, 'Female', '7654321098', 'Address 22', 'Agroforestry'),
(23, 'bengalifarmfresh', '345678901234', 48, 'Male', '6543210987', 'Address 23', 'Crop Cultivation'),
(24, 'localvegetablevendor', '456789012345', 31, 'Female', '5432109876', 'Address 24', 'Crop Cultivation'),
(25, 'grapevineyard', '567890123456', 46, 'Male', '4321098765', 'Address 25', 'Horticulture'),
(26, 'artisanalcheesery', '678901234567', 29, 'Female', '3210987654', 'Address 26', 'Dairy Farming'),
(27, 'localmeatshop', '789012345678', 35, 'Male', '2109876543', 'Address 27', 'Livestock Rearing'),
(28, 'fisherydock', '890123456789', 40, 'Female', '1098765432', 'Address 28', 'Aquaculture'),
(29, 'poultryzone', '901234567890', 33, 'Male', '0987654321', 'Address 29', 'Poultry Farming'),
(30, 'dairyproductsindia', '012345678901', 42, 'Female', '9876543210', 'Address 30', 'Dairy Farming');


--
-- Triggers `register`
--
DELIMITER $$
CREATE TRIGGER `deletion` BEFORE DELETE ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.rid,'	Agrarian DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertion` AFTER INSERT ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rid,'	Agrarian Inserted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updation` AFTER UPDATE ON `register` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rid,'	Agrarian UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 'Mirsha_Morningstar');

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--

CREATE TABLE `trig` (
  `id` int(11) NOT NULL,
  `fid` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trig`
--
INSERT INTO `trig` (`id`, `fid`, `action`, `timestamp`) VALUES
(1, '1', 'Agrarian Inserted', '2023-11-01 09:00:00'),
(2, '2', 'Agrarian Inserted', '2023-11-02 09:30:00'),
(3, '3', 'Agrarian Inserted', '2023-11-03 10:00:00'),
(4, '4', 'Agrarian Inserted', '2023-11-04 10:30:00'),
(5, '5', 'Agrarian DELETED', '2023-11-05 11:00:00'),
(6, '6', 'Agrarian Inserted', '2023-11-06 11:30:00'),
(7, '7', 'Agrarian UPDATED', '2023-11-07 12:00:00'),
(8, '8', 'Agrarian DELETED', '2023-11-08 12:30:00'),
(9, '9', 'Agrarian UPDATED', '2023-11-09 13:00:00'),
(10, '10', 'Agrarian Inserted', '2023-11-10 13:30:00'),
(11, '11', 'Agrarian UPDATED', '2023-11-11 14:00:00'),
(12, '12', 'Agrarian Inserted', '2023-11-12 14:30:00'),
(13, '13', 'Agrarian Inserted', '2023-11-13 15:00:00'),
(14, '14', 'Agrarian DELETED', '2023-11-14 15:30:00'),
(15, '15', 'Agrarian UPDATED', '2023-11-15 16:00:00'),
(16, '16', 'Agrarian Inserted', '2023-11-16 16:30:00'),
(17, '17', 'Agrarian DELETED', '2023-11-17 17:00:00'),
(18, '18', 'Agrarian Inserted', '2023-11-18 17:30:00'),
(19, '19', 'Agrarian UPDATED', '2023-11-19 18:00:00'),
(20, '20', 'Agrarian Inserted', '2023-11-20 18:30:00'),
(21, '21', 'Agrarian DELETED', '2023-11-21 19:00:00'),
(22, '22', 'Agrarian Inserted', '2023-11-22 19:30:00'),
(23, '23', 'Agrarian Inserted', '2023-11-23 20:00:00'),
(24, '24', 'Agrarian UPDATED', '2023-11-24 20:30:00'),
(25, '25', 'Agrarian Inserted', '2023-11-25 21:00:00'),
(26, '26', 'Agrarian UPDATED', '2023-11-26 21:30:00'),
(27, '27', 'Agrarian DELETED', '2023-11-27 22:00:00'),
(28, '28', 'Agrarian Inserted', '2023-11-28 22:30:00'),
(29, '29', 'Agrarian DELETED', '2023-11-29 23:00:00'),
(30, '30', 'Agrarian Inserted', '2023-11-30 23:30:00'),
(31, '31', 'Agrarian DELETED', '2023-11-01 14:00:00'),
(32, '32', 'Agrarian UPDATED', '2023-11-02 16:30:00'),
(33, '33', 'Agrarian Inserted', '2023-11-03 18:45:00'),
(34, '34', 'Agrarian UPDATED', '2023-11-04 20:00:00'),
(35, '35', 'Agrarian DELETED', '2023-11-05 21:15:00'),
(36, '36', 'Agrarian UPDATED', '2023-11-06 09:45:00'),
(37, '37', 'Agrarian DELETED', '2023-11-07 11:00:00'),
(38, '38', 'Agrarian Inserted', '2023-11-08 13:30:00'),
(39, '39', 'Agrarian UPDATED', '2023-11-09 15:45:00'),
(40, '40', 'Agrarian DELETED', '2023-11-10 17:00:00');


--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `user`
ADD COLUMN `is_agrarian` BOOLEAN NOT NULL DEFAULT FALSE AFTER `password`;

ALTER TABLE `user`
ADD COLUMN `is_admin` BOOLEAN NOT NULL DEFAULT FALSE AFTER `is_agrarian`;
--
-- Dumping data for table `user`
--

/*
INSERT INTO `user` (`id`, `username`, `email`, `password`, `is_agrarian`, `is_admin`) VALUES
(1, 'agriexpert1', 'agriexpert1@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(2, 'poultryfarmers', 'poultryfarmers@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(3, 'milkman123', 'milkman123@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(4, 'dairyfarms', 'dairyfarms@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(5, 'farmerlife', 'farmerlife@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(6, 'plantnursery', 'plantnursery@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(7, 'indianveggies', 'indianveggies@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(8, 'greenfieldfarm', 'greenfieldfarm@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(9, 'spicegrove', 'spicegrove@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(10, 'flowercultivator', 'flowercultivator@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(11, 'honeyharvesters', 'honeyharvesters@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(12, 'ricefarmers', 'ricefarmers@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(13, 'organicgrains', 'organicgrains@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(14, 'freshveggieshub', 'freshveggieshub@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(15, 'tealeafplanters', 'tealeafplanters@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(16, 'spicychillies', 'spicychillies@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(17, 'organicfarmerindia', 'organicfarmerindia@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(18, 'herbsharvest', 'herbsharvest@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(19, 'nutrientrichfarms', 'nutrientrichfarms@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(20, 'tumericgrowers', 'tumericgrowers@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(21, 'mangoorchards', 'mangoorchards@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(22, 'cashewplantations', 'cashewplantations@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(23, 'bengalifarmfresh', 'bengalifarmfresh@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(24, 'localvegetablevendor', 'localvegetablevendor@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(25, 'grapevineyard', 'grapevineyard@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(26, 'artisanalcheesery', 'artisanalcheesery@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(27, 'localmeatshop', 'localmeatshop@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(28, 'fisherydock', 'fisherydock@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(29, 'poultryzone', 'poultryzone@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE),
(30, 'dairyproductsindia', 'dairyproductsindia@gmail.com', 'scrypt:32768:8:1$6fwghdUJoGXGMzCS$87ab66b6792675d58c311f3043a0b39cde35058a1accde80f5f3c561756429d99649bd2ebab4dec3b5293861722e2372e0adf8977ef48d39fafea2b01a017740', TRUE, FALSE);

*/





-- Indexes for dumped tables
--

--
-- Indexes for table `addagroproducts`
--
ALTER TABLE `addagroproducts`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `farming`
--
ALTER TABLE `farming`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addagroproducts`
--
ALTER TABLE `addagroproducts`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `farming`
--
ALTER TABLE `farming`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trig`
--
ALTER TABLE `trig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
