
/*Table structure for table `Dim_Team`*/

CREATE TABLE `Dim_Team` (
	`teamID` int(11) NOT NULL,
	`location` varchar(45) NOT NULL,
	`t_name` varchar(45) NOT NULL,
	PRIMARY KEY (teamID)
);

/*Data Dump for table `Dim_Team`*/

INSERT INTO `Dim_Team` (`teamID`, `location`, `t_name`) VALUES
(1, 'Arizona', 'Diamondbacks'),
(2, 'Atlanta', 'Braves'),
(3, 'Baltimore', 'Orioles'),
(4, 'Boston', 'Red Sox'),
(5, 'Chicago', 'Cubs'),
(6, 'Chicago', 'White Sox'),
(7, 'Cincinnati', 'Reds'),
(8, 'Cleveland', 'Indians'),
(9, 'Colorado', 'Rockies'),
(10, 'Detroit', 'Tigers'),
(11, 'Houston', 'Astros'),
(12, 'Kansas City', 'Royals'),
(13, 'Los Angeles', 'Angels'),
(14, 'Los Angeles', 'Dodgers'),
(15, 'Miami', 'Marlins'),
(16, 'Milwaukee', 'Brewers'),
(17, 'Minnesota', 'Twins'),
(18, 'New York', 'Yankees'),
(19, 'New York', 'Mets'),
(20, 'Oakland', 'Athletics'),
(21, 'Philadelphia', 'Phillies'),
(22, 'Pittsburgh', 'Pirates'),
(23, 'San Diego', 'Padres'),
(24, 'San Francisco', 'Giants'),
(25, 'Seattle', 'Mariners'),
(26, 'St. Louis', 'Cardinals'),
(27, 'Tampa Bay', 'Rays'),
(28, 'Texas', 'Rangers'),
(29, 'Toronto', 'Blue Jays'),
(30, 'Washington', 'Nationals');


/*Table structure for table `Dim_Player`*/

CREATE TABLE `Dim_Player` (
	`playerID` int(11) NOT NULL,
	`p_fName` varchar(45) NOT NULL,
	`p_lName` varchar(45) NOT NULL,
	PRIMARY KEY (playerID)
);

/*Data Dump for table `Dim_Player`*/

INSERT INTO `Dim_Player` (`playerID`, `p_fName`, `p_lName`) VALUES
(1, 'Asa', 'Lacy'),
(2, 'Anthony', 'Seigler'),
(3, 'Shea', 'Langeliers'),
(4, 'CJ', 'Abrams');

/* Table structure for table `Dim_Year`*/

CREATE TABLE `Dim_Year`	(
	`yearID` int(5) NOT NULL,
	`year` int(5) NOT NULL,
	PRIMARY KEY (yearID)
);

/* Data Dump for table `Dim_Year` */

INSERT INTO `Dim_Year` (`yearID`, `year`) VALUES
(1, 2015),
(2, 2016),
(3, 2017),
(4, 2018),
(5, 2019),
(6, 2020),
(7, 2021);


/*Table structure for table `Dim_Brand`*/

CREATE TABLE `Dim_Brand` (
	`brandID` int(11) NOT NULL,
	`b_name` varchar(45) NOT NULL,
	PRIMARY KEY (brandID)
);

/*Data Dump for table `Dim_Brand`*/

INSERT INTO `Dim_Brand` (`brandID`, `b_name`) VALUES
(1, 'Topps'),
(2, 'Bowman'),
(3, 'Leaf');

/*Table structure for table `Dim_Series`*/

CREATE TABLE `Dim_Series` (
	`seriesID` int(11) NOT NULL,
	`brandID` int(11) NOT NULL,
	`s_name` varchar(45) NOT NULL,
	`yearID` int(4) NOT NULL,
	PRIMARY KEY (seriesID),
	FOREIGN KEY (brandID) REFERENCES Dim_Brand(brandID),
	FOREIGN KEY (yearID) REFERENCES Dim_Year(yearID)
);

/*Data Dump for table `Dim_Series`*/

INSERT INTO `Dim_Series` (`seriesID`, `brandID`, `s_name`, `yearID`) VALUES
(1, 3, 'Ultimate Draft', 6),
(2, 2, 'Draft', 4),
(3, 3, 'Flash', 5),
(4, 3, 'Trinity', 5);


/*Table structure for table `Dim_Feature`*/

CREATE TABLE `Dim_Feature` (
	`featureID` int(11) NOT NULL,
	`f_name` varchar(30) NULL,
	PRIMARY KEY (featureID)
);

/*Data Dump for table `Dim_Feature`
	Used bitwise method. There is no possible 
	combination where the two sums will be equal
	Source: Datawarehouse training conducted by 
	Nagarro at work */
INSERT INTO `Dim_Feature` (`featureID`, `f_name`) VALUES
(1, '1st'),
(2, 'Chrome'),
(3, '1st, Chrome'), 
(4, 'Refractor'),
(5, '1st, Refractor'),
(6, 'Chrome, Refractor'),
(7, '1st, Chrome, Refractor '), 
(8, 'Parallel'),
(9, '1st, Parallel'),
(10, 'Chrome, Parallel'),
(11, '1st, Chrome, Refractor'),
(12, 'Refractor, Parallel'),
(13, '1st, Refractor, Parallel'),
(14, 'Chrome, Refractor, Parallel'),
(15, '1st, Chrome, Refractor, Parallel'),
(16, '#d'),
(17, '1st, #d'), -- 1st, #d
(18, 'Chrome, #d'), -- Chrome, #d
(19, '1st, Chrome, #d '), -- 1st, Chrome, #d 
(20, 'Refractor, #d'), -- Refractor, #d
(21, '1st, Refractor, #d'), -- 1st, Refractor, #d
(22, 'Chrome, Refractor, #d'), -- Chrome, Refractor, #d
(23, '1st, Chrome, Refractor, #d'), -- 1st, Chrome, Refractor, #d
(24, 'Parallel, #d'), -- Parallel, #d
(25, NULL), -- 1st, Parallel, #d
(26, NULL), -- Chrome, Parallel, #d 
(27, NULL), -- 1st, Chrome, Parallel, #d
(28, NULL), -- Refractor, Parallel, #d
(29, NULL), -- 1st, refraftor, Parallel, #d
(30, NULL), -- Chrome, Refractor, Parallel, #d
(31, NULL), -- 1st, Chrome, Refractor, Parallel, #d
(32, 'Rookie Card'),
(33, NULL), -- 1st, Rookie Card
(34, NULL), -- Chrome, Rookie Card
(35, NULL), -- 1st, Chrome, Rookie Card
(36, NULL), -- Refractor, Rookie Card
(37, NULL), -- 1st, Refractor, Rookie Card
(38, NULL), -- Chrome, Refractor, Rookie Card
(39, NULL), -- 1st, Chrome, Refractor, Rookie Card
(40, NULL), -- Parallel, Rookie Card
(41, NULL), -- 1st, Parallel, Rookie Card
(42, NULL), -- Chrome, Parallel, Rookie Card
(43, NULL), -- 1st, Parallel, Rookie Card
(44, NULL), -- Refractor, Parallel, Rookie Card
(45, NULL), -- 1st, Refractor, Parallel, Rookie Card
(46, NULL), -- Chrome, Refractor, Parallel, Rookie Card
(47, NULL), -- 1st, Chrome, Refractor, Parallel, Rookie Card
(48, NULL), -- #d, Rookie Card
(49, NULL), -- 1st, #d, Rookie Card
(50, NULL), -- Chrome, #d, Rookie Card
(51, NULL), -- 1st, Chrome, #d, Rookie Card
(52, NULL), -- Refractor, #d, Rookie Card
(53, NULL), -- 1st, Refractor, #d, Rookie Card
(54, NULL), -- Chrome, Refractor, #d, Rookie Card
(55, NULL), -- 1st, Chrome, Refractor, #d, Rookie Card
(56, NULL), -- Parallel, #d, Rookie Card
(57, NULL), -- 1st, Parallel, #d, Rookie Card
(58, NULL), -- Chrome, Parallel, #d, Rookie Card
(59, NULL), -- 1st, Chrome, Parallel, #d, Rookie Card
(60, NULL), -- Refractor, Parallel #d, Rookie Card
(61, NULL), -- 1st, Refractor, Parallel #d, Rookie Card
(62, NULL), -- Chrome, Refractor, Parallel #d, Rookie Card
(63, NULL), -- 1st, Chrome, Refractor, Parallel #d, Rookie Card
(64, 'Auto'),
(65, NULL), -- 1st, Auto
(66, NULL), -- Chrome, Auto
(67, NULL), -- 1st, Chrome, Auto
(68, NULL), -- Refractor, Auto
(69, NULL), -- 1st, Refractor, Auto
(70, NULL), -- Chrome, Refractor, Auto
(71, NULL), -- 1st, Chrome, Refractor, Auto
(72, NULL), -- Parallel, Auto
(73, NULL), -- 1st, Parallel, Auto
(74, NULL), -- Chrome, Parallel, Auto
(75, NULL), -- 1st, Chrome, paralle, Auto
(76, NULL), -- Refractor, Parallel, Auto
(77, NULL), -- 1st, Refractor, Parallel, Auto
(78, NULL), -- Chrome, Refractor, Parallel, Auto
(79, NULL), -- 1st, Chrome, Refractor, Parallel, Auto
(80, NULL), -- #d, Auto
(81, NULL), -- 1st, #d, Auto
(82, NULL), -- Chrome, #d, Auto
(83, NULL), -- 1st, Chrome, #d, Auto
(84, NULL), -- Refractor, #d Auto
(85, NULL), -- 1st, Refractor, #d, Auto
(86, NULL), -- Chrome, Refractor, #d, Auto
(87, NULL), -- 1st, Chrome, Refractor, #d, Auto
(88, NULL), -- Parallel, #d, Auto
(89, NULL), -- 1st, Parallel, #d, Auto
(90, NULL), -- Chrome, Parallel, #d, Auto
(91, NULL), -- 1st, Chrome, Parallel, #d, Auto
(92, NULL), -- Refractor, Parallel, #d, Auto
(93, NULL), -- 1st, Refractor, Parallel, #d, Auto
(94, NULL), -- Chrome, Refractor, Parallel, #d, Auto
(95, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Auto
(96, NULL), -- Rookie Card, Auto
(97, NULL), -- 1st, Rookie Card, Auto
(98, NULL), -- Chrome, Rookie Card, Auto 
(99, NULL), -- 1st, Chrome, Rookie Card, Auto
(100, NULL), -- Refractor, Rookie Card, Auto
(101, NULL), -- 1st, Refractor, Rookie Card, Auto
(102, NULL), -- Chrome, Refractor, Rookie Card, Auto
(103, NULL), -- 1st, Chrome, Refractor, Rookie Card, Auto
(104, NULL), -- Parallel, Rookie Card, Auto
(105, NULL), -- 1st, Parallel, Rookie Card, Auto
(106, NULL), -- Chrome, Parallel, Rookie Card, Auto
(107, NULL), -- 1st, Chrome, Parallel, Rookie Card, Auto
(108, NULL), -- Refractor, Parallel, Rookie Card, Auto
(109, NULL), -- 1st, Refractor, Parallel, Rookie Card, Auto
(110, NULL), -- Chrome, Refractor, Parallel, Rookie Card, Auto
(111, NULL), -- 1st, Chrome, Refractor, Parallel, Rookie Card, Auto
(112, NULL), -- #d, Rookie Card, Auto
(113, NULL), -- 1st, #d, Rookie Card, Auto
(114, NULL), -- Chrome, #d, Rookie Card, Auto
(115, NULL), -- 1st, Chrome, #d, Rookie Card, Auto
(116, NULL), -- Refractor, #d, Rookie Card, Auto
(117, NULL), -- 1st, Refractor, #d, Rookie Card, Auto
(118, NULL), -- Chrome, Refractor, #d, Rookie Card, Auto
(119, NULL), -- 1st, Chrome, Refractor, #d, Rookie Card, Auto
(120, NULL), -- Parallel, #d, Rookie Card, Auto
(121, NULL), -- 1st, Parallel, #d, Rookie Card, Auto
(122, NULL), -- Chrome, Parallel,#d, Rookie Card, Auto
(123, NULL), -- 1st, Chrome, Parallel, #,d Rookie Card, Auto
(124, NULL), -- Refractor, Parallel, #d, Rookie Card, Auto
(125, NULL), -- 1st, Refractor, Parallel, #d, Rookie Card, Auto
(126, NULL), -- Chrome, Refractor, Parallel, #d, Rookie Card, Auto
(127, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Rookie Card, Auto
(128, 'Variation'),
(129, NULL), -- 1st, Variation
(130, NULL), -- Chrome, Variation
(131, NULL), -- 1st, Chrome, Variation
(132, NULL), -- Refractor, Variation
(133, NULL), -- 1st, Refractor, Variation
(134, NULL), -- Chrome, Refractor, Variation
(135, NULL), -- 1st, Chrome, Refractor, Variation
(136, NULL), -- Parallel, Variation
(137, NULL), -- 1st, Parallel, Variation
(138, NULL), -- Chrome, Parallel, Variation
(139, NULL), -- 1st, Chrome, Parallel, Variation
(140, NULL), -- Refractor, Parallel, Variation
(141, NULL), -- 1st, Refractor, Parallel, Variation
(142, NULL), -- Chrome, Refractor, Parallel, Variation
(143, NULL), -- 1st, Chrome, Refractor, Parallel, Variation
(144, NULL), -- #d, Variation
(145, NULL), -- 1st, #d, Variation
(146, NULL), -- Chrome, #d, Variation
(147, NULL), -- 1st, Chrome, #d, Variation
(148, NULL), -- Refractor, Parallel, Variation
(149, NULL), -- 1st, Refractor, Parallel, Variation
(150, NULL), -- Chrome, Refractor, Parallel, Variation
(151, NULL), -- 1st, Chrome, Refractor, Parallel, Variation
(152, NULL), -- Parallel, #d, Variation
(153, NULL), -- 1st, Parallel, #d, Variation
(154, NULL), -- Chrome, Parallel, #d, Variation
(155, NULL), -- 1st, Chrome, Parallel, #d, Variation
(156, NULL), -- Refractor, Parallel, #d, Variation
(157, NULL), -- 1st, Refractor, Parallel, #d, Variation
(158, NULL), -- Chrome, Refractor, Parallel, #d, Variation
(159, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Variation
(160, NULL), -- Rookie Card, Variation
(161, NULL), -- 1st, Rookie Card, Variation
(162, NULL), -- Chrome, Rookie Card, Variation
(163, NULL), -- 1st, Chrome, Rookie Card, Variation
(164, NULL), -- Refractor, Rookie Card, Variation
(165, NULL), -- 1st, Refractor, Rookie Card, Variation
(166, NULL), -- Chrome, Refractor, Rookie Card, Variation
(167, NULL), -- 1st, Chrome, Refractor, Rookie Card, Variation
(168, NULL), -- Parallel, Rookie Card, Variation
(169, NULL), -- 1st, Parallel, Rookie Card, Variation
(170, NULL), -- Chrome, Parallel, Rookie Card, Variation
(171, NULL), -- 1st, Chrome, Parallel, Rookie Card, Variation
(172, NULL), -- Refractor, Parallel, Rookie Card, Variation
(173, NULL), -- 1st, Refractor, Parallel, Rookie Card, Variation
(174, NULL), -- Chrome, Refractor, Parallel, Rookie Card, Variation
(175, NULL), -- 1st, Chrome, Refractor, Parallel, Rookie Card, Variation
(176, NULL), -- #d, Rookie Card, Variation
(177, NULL), -- 1st, #d, Rookie Card, Variation
(178, NULL), -- Chrome, #d, Rookie Card, Variation
(179, NULL), -- 1st, Chrome, #d, Rookie Card, Variation
(180, NULL), -- Refractor, #d, Rookie Card, Variation
(181, NULL), -- 1st, Refractor, #d, Rookie Card, Variation
(182, NULL), -- Chrome, Refractor, #d, Rookie Card, Variation
(183, NULL), -- 1st, Chrome, Refractor, #d, Rookie Card Variation
(184, NULL), -- Parallel, #d, Rookie Card, Variation
(185, NULL), -- 1st, Parallel, #d, Rookie Card, Variation
(186, NULL), -- Chrome, Parallel, #d, Rookie Card, Variation
(187, NULL), -- 1st, Chrome, Parallel, #d, Rookie Card, Variation
(188, NULL), -- Refractor, Parallel, #d, Rookie Card, Variation 
(189, NULL), -- 1st, Refractor, Parallel, #d, Rookie Card, Variation
(190, NULL), -- Chrome, Refractor, Parallel, #d, Rookie Card, Variation
(191, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Rookie Card, Variation
(192, NULL), -- Auto, Variation
(193, NULL), -- 1st, Auto, Variation
(194, NULL), -- Chrome, Auto, Variation
(195, NULL), -- 1st, Chrome, Auto, Variation
(196, NULL), -- Refractor, Auto, Variation
(197, NULL), -- 1st, Refractor, Auto, Variation
(198, NULL), -- Chrome, Refractor, Auto, Variation
(199, NULL), -- 1st, Chrome, Refractor, Auto, Variation
(200, NULL), -- Parallel, Auto, Variation
(201, NULL), -- 1st, Parallel, Auto, Variation
(202, NULL), -- Chrome, Parallel, Auto, Variation
(203, NULL), -- 1st, Chrome, Parallel, Auto, Variation
(204, NULL), -- Refractor, Parallel, Auto, Variation
(205, NULL), -- 1st, Refractor, Parallel, Auto, Variation
(206, NULL), -- Chrome, Refractor, Parallel, Auto, Variation
(207, NULL), -- 1st, Chrome, Refractor, paralllel, Auto, Variation
(208, NULL), -- #d, Auto, Variation
(209, NULL), -- 1st, #d, Auto, Variation
(210, NULL), -- Chrome, #d, Auto, Variation
(211, NULL), -- 1st, Chrome, #d, Auto, Variation
(212, NULL), -- Refractor, #d, Auto, Variation
(213, NULL), -- 1st, Refractor, #d, Auto, Variation
(214, NULL), -- Chrome, Refractor, #d, Auto, Variation
(215, NULL), -- 1st, Chrome, Refractor, #d, Auto Variation
(216, NULL), -- Parallel, #d, Auto, Variation
(217, NULL), -- 1st, Parallel, #d, Auto, Variation
(218, NULL), -- Chrome, Parallel, #d, Auto, Variation
(219, NULL), -- 1st, Chrome, Parallel, #d, Auto, Variation
(220, NULL), -- Refractor, Parallel, #d, Auto, Variation
(221, NULL), -- 1st, Refractor, Parallel, #d, Auto, Variation
(222, NULL), -- Chrome, Refractor, Parallel, #d, Auto, Variation
(223, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Auto, Variation
(224, NULL), -- Rookie Card, Auto, Variation
(225, NULL), -- 1st, Rookie Card, Auto, Variation
(226, NULL), -- Chrome, Rookie Card, Auto, Variation
(227, NULL), -- 1st, Chrome, Rookie Card, Auto, Variation
(228, NULL), -- Refractor, Rookie Card, Auto, Variation
(229, NULL), -- 1st, Refractor, Rookie Card, Auto, Variation
(230, NULL), -- Chrome, Refractor, Rookie Card, Auto, Variation
(231, NULL), -- 1st, Chrome, Refractor, Rookie Card, Auto, Variation
(232, NULL), -- Parallel, Rookie Card, Auto, Variation
(233, NULL), -- 1st, Parallel, Rookie Card, Auto, Variation
(234, NULL), -- Chrome, Parallel, Rookie Card, Auto, Variation
(235, NULL), -- 1st, Chrome, Parallel, Rookie Card, Auto, Variation
(236, NULL), -- Refractor, Parallel, Rookie Card, Auto, Variation
(237, NULL), -- 1st, Refractor, Parallel, Rookie Card, Auto, Variation
(238, NULL), -- Chrome, Refractor, Parallel, Rookie Card, Auto, Variation
(239, NULL), -- 1st, Chrome, Refractor, Parallel, Rookie Card, Auto, Variation
(240, NULL), -- #, Rookie Card, Auto, Variation
(241, NULL), -- 1st, #, Rookie Card, Auto, Variation
(242, NULL), -- Chrome, #, Rookie Card, Auto, Variation
(243, NULL), -- 1st, Chrome, #, Rookie Card, Auto, Variation
(244, NULL), -- Refractor, #d, Rookie Card, Auto, Variation
(245, NULL), -- 1st, Refractor, #d, Rookie Card, Auto, Variation
(246, NULL), -- Chrome, Refractor, #d, Rookie Card, Auto, Variation
(247, NULL), -- 1st, Chrome, Refractor, #d, Rookie Card, Auto, Variation
(248, NULL), -- parlalel, #d, Rookie Card, Auto, Variation
(249, NULL), -- 1st, parlalel, #d, Rookie Card, Auto, Variation 
(250, NULL), -- Chrome, parlalel, #d, Rookie Card, Auto, Variation
(251, NULL), -- 1st, Chrome, parlalel, #d, Rookie Card, Auto, Variation
(252, NULL), -- Refractor, Parallel, #d, Rookie Card, Auto, Variation
(253, NULL), -- 1st, Refractor, Parallel, #d, Rookie Card, Auto, Variation
(254, NULL), -- Chrome, Refractor, Parallel, #d, Rookie Card, Auto, Variation
(255, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Rookie Card, Auto, Variation
(256, 'Memorabilia'),
(257, NULL), -- 1st, Memorabilia
(258, NULL), -- Chrome, Memorabilia
(259, NULL), -- 1st, Chrome, Memorabilia
(260, NULL), -- Refractor, Memorabilia
(261, NULL), -- 1st, Refractor, Memorabilia
(262, NULL), -- Chrome, Refractor, Memorabilia 
(263, NULL), -- 1st, Chrome, Refractor, Memorabilia
(264, NULL), -- Parallel, Memorabilia
(265, NULL), -- 1st, Parallel, Memorabilia
(266, NULL), -- Chrome, Parallel, Memorabilia
(267, NULL), -- 1st, Chrome, Parallel, Memorabilia
(268, NULL), -- Refractor, Parallel, Memorabilia
(269, NULL), -- 1st, Refractor, Parallel, Memorabilia
(270, NULL), -- Chrome, Refractor, Parallel, Memorabilia
(271, NULL), -- 1st, Chrome, Refractor, Parallel, Memorabilia
(272, NULL), -- #d, Memorabilia
(273, NULL), -- 1st, #d, Memorabilia
(274, NULL), -- Chrome, #d, Memorabilia
(275, NULL), -- 1st, Chrome, #d, Memorabilia
(276, NULL), -- Refractor, #d, Memorabilia
(277, NULL), -- 1st, Refractor, #d, Memorabilia
(278, NULL), -- Chrome, Refractor, #d, Memorabilia
(279, NULL), -- 1st, Chrome, Refractor, #d, Memorabilia
(280, NULL), -- Parallel, #d, Memorabilia
(281, NULL), -- 1st, Parallel, #d, Memorabilia
(282, NULL), -- Chrome, Parallel, #d, Memorabilia
(283, NULL), -- 1st, Chrome, paralel, #d, Memorabilia
(284, NULL), -- Refractor, Parallel, #d, Memorabilia
(285, NULL), -- 1st, Refractor, Parallel, #d, Memorabilia
(286, NULL), -- Chrome, Refractor, Parallel, #d, Memorabilia
(287, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Memorabilia
(288, NULL), -- Rookie Card, Memorabilia
(289, NULL), -- 1st, Rookie Card, Memorabilia
(290, NULL), -- Chrome, Rookie Card, Memorabilia
(291, NULL), -- 1st, Chrome, Rookie Card, Memorabilia
(292, NULL), -- Refractor, Rookie Card, Memorabilia
(293, NULL), -- 1st, Refractor, Rookie Card, Memorabilia
(294, NULL), -- Chrome, Refractor, Rookie Card, Memorabilia
(295, NULL), -- 1st, Chrome, Refractor, Rookie Card, Memorabilia
(296, NULL), -- Parallel, Rookie Card, Memorabilia
(297, NULL), -- 1st, Parallel, Rookie Card, Memorabilia
(298, NULL), -- Chrome, Parallel, Rookie Card, Memorabilia
(299, NULL), -- 1st, Chrome, Parallel, Rookie Card, Memorabilia 
(300, NULL), -- Refractor, Parallel, Rookie Card, Memorabilia
(301, NULL), -- 1st, Refractor, Parallel, Rookie Card, Memorabilia
(302, NULL), -- Chrome, Refractor, Parallel, Rookie Card, Memorabilia
(303, NULL), -- 1st, Chrome, Refractor, Parallel, Rookie Card, Memorabilia
(304, NULL), -- #d, Rookie Card, Memorabilia
(305, NULL), -- 1st, #d, Rookie Card, Memorabilia
(306, NULL), -- Chrome, #d, Rookie Card, Memorabilia
(307, NULL), -- 1st, Chrome, #d, Rookie Card, Memorabilia
(308, NULL), -- Refractor, #d, Rookie Card, Memorabilia
(309, NULL), -- 1st, Refractor, #d, Rookie Card, Memorabilia
(310, NULL), -- Chrome, Refractor, #d, Rookie Card, Memorabilia
(311, NULL), -- 1st, Chrome, Refractor, #d, Rookie Card, Memorabilia
(312, NULL), -- Parallel, #d, Rookie Card, Memorabilia
(313, NULL), -- 1st, Parallel, #d, Rookie Card, Memorabilia
(314, NULL), -- Chrome, Parallel, #d, Rookie Card, Memorabilia
(315, NULL), -- 1st, Chrome, Parallel, #d, Rookie Card, Memorabilia
(316, NULL), -- Refractor, Parallel, #d, Rookie Card, Memorabilia
(317, NULL), -- 1st, Refractor, Parallel, #d, Rookie Card, Memorabilia
(318, NULL), -- Chrome, Refractor, Parallel, #d, Rookie Card, Memorabilia
(319, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Rookie Card, Memorabilia
(320, NULL), -- Auto, Memorabilia
(321, NULL), -- 1st, Auto, Memorabilia
(322, NULL), -- Chrome, Auto, Memorabilia
(323, NULL), -- 1st, Chrome, Auto, Memorabilia
(324, NULL), -- Refractor, Auto, Memorabilia
(325, NULL), -- 1st, Refractor, Auto, Memorabilia
(326, NULL), -- Chrome, Refractor, Auto, Memorabilia
(327, NULL), -- 1st, Chrome, Refractor, Auto, Memorabilia
(328, NULL), -- Parallel, Auto, Memorabilia
(329, NULL), -- 1st, Parallel, Auto, Memorabilia
(330, NULL), -- Chrome, Parallel, Auto, Memorabilia
(331, NULL), -- 1st, Chrome, Parallel, Auto, Memorabilia
(332, NULL), -- Refractor, Parallel, Auto, Memorabilia
(333, NULL), -- 1st, Refractor, Parallel, Auto, Memorabilia
(334, NULL), -- Chrome, Refractor, Parallel, Auto, Memorabilia
(335, NULL), -- 1st, Chrome, Refractor, Parallel, Auto, Memorabilia
(336, NULL), -- #d, Auto, Memorabilia
(337, NULL), -- 1st, #d, Auto, Memorabilia
(338, NULL), -- Chrome, #d, Auto, Memorabilia
(339, NULL), -- 1st, Chrome, #d, Auto, Memorabilia
(340, NULL), -- Refractor, #d, Auto, Memorabilia
(341, NULL), -- 1st, Refractor, #d, Auto, Memorabilia
(342, NULL), -- Chrome, Refractor, #d, Auto, Memorabilia
(343, NULL), -- 1st, Chrome, Refractor, #d, Auto, Memorabilia
(344, NULL), -- Parallel, #d, Auto, Memorabilia
(345, NULL), -- 1st, Parallel, #d, Auto, Memorabilia
(346, NULL), -- Chrome, Parallel, #d, Auto, Memorabilia
(347, NULL), -- 1st, Chrome, Parallel, #d, Auto, Memorabilia
(348, NULL), -- Refractor, Parallel, #d, Auto, Memorabilia
(349, NULL), -- 1st, Refractor, Parallel, #d, Auto, Memorabilia
(350, NULL), -- Chrome, Refractor, Parallel, #d, Auto, Memorabilia
(351, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Auto, Memorabilia
(352, NULL), -- Rookie Card, Auto, Memorabilia
(353, NULL), -- 1st, Rookie Card, Auto, Memorabilia
(354, NULL), -- Chrome, Rookie Card, Auto, Memorabilia
(355, NULL), -- 1st, Chrome, Rookie Card, Auto, Memorabilia
(356, NULL), -- Refractor, Rookie Card, Auto, Memorabilia
(357, NULL), -- 1st, Refractor, Rookie Card, Auto, Memorabilia
(358, NULL), -- Chrome, Refractor, Rookie Card, Auto, Memorabilia
(359, NULL), -- 1st, Chrome, Refractor, Rookie Card, Auto, Memorabilia
(360, NULL), -- Parallel, Rookie Card, Auto, Memorabilia
(361, NULL), -- 1st, Parallel, Rookie Card, Auto, Memorabilia
(362, NULL), -- Chrome, Parallel, Rookie Card, Auto, Memorabilia
(363, NULL), -- 1st, Chrome, Parallel, Rookie Card, Auto, Memorabilia
(364, NULL), -- Refractor, Parallel, Rookie Card, Auto, Memorabilia
(365, NULL), -- 1st, Refractor, Parallel, Rookie Card, Auto, Memorabilia
(366, NULL), -- Chrome, Refractor, Parallel, Rookie Card, Auto, Memorabilia
(367, NULL), -- 1st, Chrome, Refractor, Parallel, Rookie Card, Auto, Memorabilia
(368, NULL), -- #d, Rookie Card, Auto, Memorabilia
(369, NULL), -- 1st, #d, Rookie Card, Auto, Memorabilia
(370, NULL), -- Chrome, #d, Rookie Card, Auto, Memorabilia
(371, NULL), -- 1st, Chrome, #d, Rookie Card, Auto, Memorabilia
(372, NULL), -- Refractor, #d, Rookie Card, Auto, Memorabilia
(373, NULL), -- 1st, Refractor, #d, Rookie Card, Auto, Memorabilia
(374, NULL), -- Chrome, Refractor, #d, Rookie Card, Auto, Memorabilia
(375, NULL), -- 1st, Chrome, Refractor, #d, Rookie Card, Auto, Memorabilia
(376, NULL), -- Parallel, #d, Rookie Card, Auto, Memorabilia
(377, NULL), -- 1st, Parallel, #d, Rookie Card, Auto, Memorabilia
(378, NULL), -- Chrome, Parallel, #d, Rookie Card, Auto, Memorabilia
(379, NULL), -- 1st, Chrome, Parallel, #d, Rookie Card, Auto, Memorabilia
(380, NULL), -- Refractor, Parallel, #d, Rookie Card, Auto, Memorabilia
(381, NULL), -- 1st, Refractor, Parallel, #d, Rookie Card, Auto, Memorabilia
(382, NULL), -- Chrome, Refractor, Parallel, #d, Rookie Card, Auto, Memorabilia
(383, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Rookie Card, Auto, Memorabilia
(384, NULL), -- Variation, Memorabilia
(385, NULL), -- 1st, Variation, Memorabilia
(386, NULL), -- Chrome, Variation, Memorabilia
(387, NULL), -- 1st, Chrome, Variation, Memorabilia
(388, NULL), -- Refractor, Variation, Memorabilia
(389, NULL), -- 1st, Refractor, Variation, Memorabilia
(390, NULL), -- Chrome, Refractor, Variation, Memorabilia
(391, NULL), -- 1st, Chrome, Refractor, Variation, Memorabilia
(392, NULL), -- Parallel, Variation, Memorabilia
(393, NULL), -- 1st, Parallel, Variation, Memorabilia
(394, NULL), -- Chrome, Parallel, Variation, Memorabilia
(395, NULL), -- 1st, Chrome, Parallel, Variation, Memorabilia
(396, NULL), -- Refractor, Parallel, Variation, Memorabilia
(397, NULL), -- 1st, Refractor, Parallel, Variation, Memorabilia
(398, NULL), -- Chrome, Refractor, Parallel, Variation, Memorabilia
(399, NULL), -- 1st, Chrome, Refractor, Parallel, Variation, Memorabilia
(400, NULL), -- #d, Variation, Memorabilia
(401, NULL), -- 1st, #d, Variation, Memorabilia
(402, NULL), -- Chrome, #d, Variation, Memorabilia
(403, NULL), -- 1st, Chrome, #d, Variation, Memorabilia
(404, NULL), -- Refractor, #d, Variation, Memorabilia
(405, NULL), -- 1st, Refractor, #d, Variation, Memorabilia
(406, NULL), -- Chrome, Refractor, #d, Variation, Memorabilia
(407, NULL), -- 1st, Chrome, Refractor, #d, Variation, Memorabilia
(408, NULL), -- Parallel, #d, Variation, Memorabilia
(409, NULL), -- 1st, Parallel, #d, Variation, Memorabilia
(410, NULL), -- Chrome, Parallel, #d, Variation, Memorabilia
(411, NULL), -- 1st, Chrome, Parallel, #d, Variation, Memorabilia
(412, NULL), -- Refractor, Parallel, #d, Variation, Memorabilia
(413, NULL), -- 1st, Refractor, Parallel, #d, Variation, Memorabilia
(414, NULL), -- Chrome, Refractor, Parallel, #d, Variation, Memorabilia
(415, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Variation, Memorabilia
(416, NULL), -- Rookie Card, Variation, Memorabilia
(417, NULL), -- 1st, Rookie Card, Variation, Memorabilia
(418, NULL), -- Chrome, Rookie Card, Variation, Memorabilia
(419, NULL), -- 1st, Chrome, Rookie Card, Variation, Memorabilia
(420, NULL), -- Refractor, Rookie Card, Variation, Memorabilia
(421, NULL), -- 1st, Refractor, Rookie Card, Variation, Memorabilia
(422, NULL), -- Chrome, Refractor, Rookie Card, Variation, Memorabilia
(423, NULL), -- 1st, Chrome, Refractor, Rookie Card, Variation, Memorabilia
(424, NULL), -- Parallel, Rookie Card, Variation, Memorabilia
(425, NULL), -- 1st, Parallel, Rookie Card, Variation, Memorabilia
(426, NULL), -- Chrome, Parallel, Rookie Card, Variation, Memorabilia
(427, NULL), -- 1st, Chrome, Parallel, Rookie Card, Variation, Memorabilia
(428, NULL), -- Refractor, Parallel, Rookie Card, Variation, Memorabilia
(429, NULL), -- 1st, Refractor, Parallel, Rookie Card, Variation, Memorabilia
(430, NULL), -- Chrome, Refractor, Parallel, Rookie Card, Variation, Memorabilia
(431, NULL), -- 1st, Chrome, Refractor, Parallel, Rookie Card, Variation, Memorabilia
(432, NULL), -- #d, Rookie Card, Variation, Memorabilia
(433, NULL), -- 1st, #d, Rookie Card, Variation, Memorabilia
(434, NULL), -- Chrome, #d, Rookie Card, Variation, Memorabilia
(435, NULL), -- 1st, Chrome, #d, Rookie Card, Variation, Memorabilia
(436, NULL), -- Refractor, #d, Rookie Card, Variation, Memorabilia
(437, NULL), -- 1st, Refractor, #d, Rookie Card, Variation, Memorabilia
(438, NULL), -- Chrome, Refractor, #d, Rookie Card, Variation, Memorabilia
(439, NULL), -- 1st, Chrome, Refractor, #d, Rookie Card, Variation, Memorabilia
(440, NULL), -- Parallel, #d, Rookie Card, Variation, Memorabilia
(441, NULL), -- 1st, Parallel, #d, Rookie Card, Variation, Memorabilia
(442, NULL), -- Chrome, Parallel, #d, Rookie Card, Variation, Memorabilia
(443, NULL), -- 1st, Chrome, Parallel, #d, Rookie Card, Variation, Memorabilia
(444, NULL), -- Refractor, Parallel, #d, Rookie Card, Variation, Memorabilia
(445, NULL), -- 1st, Refractor, Parallel, #d, Rookie Card, Variation, Memorabilia
(446, NULL), -- Chrome, Refractor, Parallel, #d, Rookie Card, Variation, Memorabilia
(447, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Rookie Card, Variation, Memorabilia
(448, NULL), -- Auto, Variation, Memorabilia
(449, NULL), -- 1st, Auto, Variation, Memorabilia
(450, NULL), -- Chrome, Auto, Variation, Memorabilia
(451, NULL), -- 1st, Chrome, Auto, Variation, Memorabilia
(452, NULL), -- Refractor, Auto, Variation, Memorabilia
(453, NULL), -- 1st, Refractor, Auto, Variation, Memorabilia
(454, NULL), -- Chrome, Refractor, Auto, Variation, Memorabilia
(455, NULL), -- 1st, Chrome, Refractor, Auto, Variation, Memorabilia
(456, NULL), -- Parallel, Auto, Variation, Memorabilia
(457, NULL), -- 1st, Parallel, Auto, Variation, Memorabilia
(458, NULL), -- Chrome, Parallel, Auto, Variation, Memorabilia
(459, NULL), -- 1st, Chrome, Parallel, Auto, Variation, Memorabilia
(460, NULL), -- Refractor, Parallel, Auto, Variation, Memorabilia
(461, NULL), -- 1st, Refractor, Parallel, Auto, Variation, Memorabilia
(462, NULL), -- Chrome, Refractor, Parallel, Auto, Variation, Memorabilia
(463, NULL), -- 1st, Chrome, Refractor, Parallel, Auto, Variation, Memorabilia
(464, NULL), -- #d, Auto, Variation, Memorabilia
(465, NULL), -- 1st, #d, Auto, Variation, Memorabilia
(466, NULL), -- Chrome, #d, Auto, Variation, Memorabilia
(467, NULL), -- 1st, Chrome, #d, Auto, Variation, Memorabilia
(468, NULL), -- Refractor, #d, Auto, Variation, Memorabilia
(469, NULL), -- 1st, #d, Auto, Variation, Memorabilia
(470, NULL), -- Chrome, #d, Auto, Variation, Memorabilia
(471, NULL), -- 1st, Chrome, #d, Auto, Variation, Memorabilia
(472, NULL), -- Parallel, #d, Auto, Variation, Memorabilia
(473, NULL), -- 1st, Parallel, #d, Auto, Variation, Memorabilia
(474, NULL), -- Chrome, Parallel, #d, Auto, Variation, Memorabilia
(475, NULL), -- 1st, Chrome, Parallel, #d, Auto, Variation, Memorabilia
(476, NULL), -- Refractor, Parallel, #d, Auto, Variation, Memorabilia
(477, NULL), -- 1st, Refractor, Parallel, #d, Auto, Variation, Memorabilia
(478, NULL), -- Chrome, Refractor, Parallel, #d, Auto, Variation, Memorabilia
(479, NULL), -- 1st, Chrome, Refractor, Parallel, #d, Auto, Variation, Memorabilia
(480, NULL), -- Rookie Card, Auto, Variation, Memorabilia
(481, NULL), -- 1st, Rookie Card, Auto, Variation, Memorabilia
(482, NULL), -- Chrome, Rookie Card, Auto, Variation, Memorabilia
(483, NULL), -- 1st, Chrome, Rookie Card, Auto, Variation, Memorabilia
(484, NULL), -- Refractor, Rookie Card, Auto, Variation, Memorabilia
(485, NULL), -- 1st, Refractor, Rookie Card, Auto, Variation, Memorabilia
(486, NULL), -- Chrome, Refractor, Rookie Card, Auto, Variation, Memorabilia
(487, NULL), -- 1st, Chrome, Refractor, Rookie Card, Auto, Variation, Memorabilia
(488, NULL), -- Parallel, Rookie Card, Auto, Variation, Memorabilia
(489, NULL), -- 1st, Parallel, Rookie Card, Auto, Variation, Memorabilia
(490, NULL), -- Chrome, Parallel, Rookie Card, Auto, Variation, Memorabilia
(491, NULL), -- 1st, Chrome, Parallel, Rookie Card, Auto, Variation, Memorabilia
(492, NULL), -- Refractor, Parallel, Rookie Card, Auto, Variation, Memorabilia
(493, NULL), -- 1st, Refractor, Parallel, Rookie Card, Auto, Variation, Memorabilia
(494, NULL), -- Chrome, Refractor, Parallel, Rookie Card, Auto, Variation, Memorabilia
(495, NULL), -- 1st, Chrome, Refractor, Parallel, Rookie Card, Auto, Variation, Memorabilia
(496, NULL), -- #d, Rookie Card, Auto, Variation, Memorabilia
(497, NULL), -- 1st, #d, Rookie Card, Auto, Variation, Memorabilia
(498, NULL), -- Chrome, #d, Rookie Card, Auto, Variation, Memorabilia
(499, NULL), -- 1st, Chrome, #d, Rookie Card, Auto, Variation, Memorabilia
(500, NULL), -- Refractor, #d, Auto, Variation, Memorabilia
(501, NULL), -- 1st, Refractor, #d, Auto, Variation, Memorabilia
(502, NULL), -- Chrome, Refractor, #d, Auto, Variation, Memorabilia
(503, NULL), -- 1st, Chrome, Refractor, #d, Auto, Variation, Memorabilia
(504, NULL), -- Parallel, #d, Rookie Card, Auto, Variation, Memorabilia
(505, NULL), -- 1st, Parallel, #d, Rookie Card, Auto, Variation, Memorabilia
(506, NULL), -- Chrome, Parallel, #d, Rookie Card, Auto, Variation, Memorabilia
(507, NULL), -- 1st, Chrome, Parallel, #d, Rookie Card, Auto, Variation, Memorabilia
(508, NULL), -- Refractor, Parallel, #d, Rookie Card, Auto, Variation, Memorabilia
(509, NULL), -- 1st, Refractor, Parallel, #d, Rookie Card, Auto, Variation, Memorabilia
(510, NULL), -- Chrome, Refractor, Parallel, #d, Rookie Card, Auto, Variation, Memorabilia
(511, NULL); -- 1st, Chrome, Refractor, Parallel, #d, Rookie Card, Auto, Variation, Memorabilia



/*Table structure for table `Dim_Sale`*/

CREATE TABLE `Dim_Sale` (
	`saleID` int(11) NULL,
	`b_date` date NULL,
	`b_price` decimal(6, 2) NOT NULL,
	`b_fees` decimal(6, 2) NOT NULL,
	`b_ship` decimal(6, 2) NOT NULL,
	`s_date` date NULL,
	`s_price` decimal(6, 2) NOT NULL,
	`s_fees` decimal(6, 2) NOT NULL,
	`s_ship` decimal(6, 2) NOT NULL,
	PRIMARY KEY (saleID)
);

/* Data Dump for table `Dim_Sale` */

INSERT INTO `Dim_Sale` (`saleID`, `b_date`, `b_price`, `b_fees`, 
	`b_ship`, `s_date`, `s_price`, `s_fees`, `s_ship`) VALUES
(1, DATE '2020-3-14', 20, 0, 0, NULL, NULL, NULL, NULL),
(2, DATE '2021-2-21', 35, 0, 4, NULL, NULL, NULL, NULL),
(3, DATE '2020-5-14', 29.28, 2, 2.3, DATE '2021-2-1', 110, 3.49, 6.72),
(4, DATE '2020-6-15', 15.02, 1.5, 1.2, DATE '2021-2-5', 25.88, 3.12, 3.76);

/*Table structure for table `Dim_Effect`*/

CREATE TABLE `Dim_Effect` (
	`effectID` int(11) NOT NULL,
	`e_name` varchar(30),
	PRIMARY KEY (effectID)
);

/* Data Dump for table `Dim_Effect` */

INSERT INTO `Dim_Effect` (`effectID`, `e_name`) VALUES
(1, 'Paper'),
(2, 'Mojo'),
(3, 'Shimmer'),
(4, 'Wave'),
(5, 'Spectrum'),
(6, 'Acetate');

/*Table structure for table `Dim_Parallel`*/

CREATE TABLE `Dim_Parallel` (
	`parallelID` int(11) NOT NULL,
	`p_name` varchar(30) NOT NULL,
	PRIMARY KEY (parallelID)
);

INSERT INTO `Dim_Parallel` (`parallelID`, `p_name`) VALUES
(1, 'Base'),
(2, 'Silver'),
(3, 'Red'),
(4, 'Blue');

/* Join Table structure for `Dim_Effect_Parallel` M:M relationship*/
CREATE TABLE `Dim_Effect_Parallel` (
	`joinID` int(11) NOT NULL,
	`effectID` int(11) NULL,
	`parallelID` int(11) NOT NULL,
	PRIMARY KEY (joinID),
	FOREIGN KEY (effectID) REFERENCES Dim_Effect(effectID),
	FOREIGN KEY (parallelID) REFERENCES Dim_Parallel(parallelID)
);

/* Data dump for the join table*/
INSERT INTO `Dim_Effect_Parallel`(`joinID`, `effectID`, `parallelID`) VALUES 
(1, NULL, 1),
(2, 5, 2),
(3, NULL, 3),
(4, 6, 4);


/* Table structure for table `Dim_Grading` */

CREATE TABLE `Dim_Grading` (
	`gradingID` int(11) NOT NULL,
	`g_name` varchar(45) NOT NULL,
	PRIMARY KEY (gradingID)
);

/* Data dump for table `Dim_Grading` */

INSERT INTO `Dim_Grading` (`gradingID`, `g_name`) VALUES
(1, 'PSA'),
(2, 'BGS');

/* Table Structure for table `Dim_Slab` */

CREATE TABLE `Dim_Slab` (
	`slabID` int(11) NOT NULL,
	`gradingID` int(11) NOT NULL,
	`slab_number` int(11) NOT NULL,
	`Overall Grade` float(1) NOT NULL,
	`Centering` float(1) NULL,
	`Corners` float(1) NULL,
	`Edges` float(1) NULL,
	`Surface` float(1) NULL,
	`Auto` float(1) NULL,
	PRIMARY KEY (slabID),
	FOREIGN KEY (gradingID) REFERENCES Dim_Grading(gradingID)
);

/* Data Dump for table `Dim_Slab` */

INSERT INTO `Dim_Slab` (`slabID`,`gradingID`, `slab_number`, `Overall Grade`, `Centering`, `Corners`, `Edges`, `Surface`, `Auto`) VALUES
(1, 2, 0011709833, 9, 9, 8.5, 9.5, 9.5, 9);

/*Table structure for table `Fact_Card`*/

CREATE TABLE `Fact_Card` (
	`cardID` int(11) NOT NULL,
	`saleID` int(11) NOT NULL, 
	`seriesID` int(11) NOT NULL,
	`teamID` int(11) NOT NULL,
	`playerID` int(11) NOT NULL,
	`featureID` int(11) NOT NULL,
	`parallelID` int(11) NOT NULL,
	`slabID` int(11) NULL,
	`#d` int(4) NULL,
	`out of` int(4) NULL,
	`note` varchar(255) NULL,
	PRIMARY KEY (cardID),
	FOREIGN KEY (saleID) REFERENCES Dim_Sale(saleID),
	FOREIGN KEY (seriesID) REFERENCES Dim_Series(seriesID),
	FOREIGN KEY (teamID) REFERENCES Dim_Team(teamID),
	FOREIGN KEY (playerID) REFERENCES Dim_Player(playerID),
	FOREIGN KEY (featureID) REFERENCES Dim_Feature(featureID),
	FOREIGN KEY (parallelID) REFERENCES Dim_Parallel(parallelID),
	FOREIGN KEY (slabID) REFERENCES Dim_Slab(slabID)
);

/*Data Dump for table `Fact_Card`*/

INSERT INTO `Fact_Card` (`cardID`, `saleID`, `seriesID`, `teamID`,
	`playerID`, `featureID`, `parallelID`, `slabID`, `#d`, `out of`,
	`note`)	VALUES 
(1, 1, 1, 12, 1, 88, 2, NULL, 1, 4, NULL), -- feature Parallel, #d, Auto
(2, 2, 2, 18, 2, 214, 1, 1, 16, 99, NULL), -- Chrome, Refractor, #d, Auto
(3, 3, 3, 2, 3, 216, 3, NULL, 3, 5, 'Flash of Brilliance'), -- parallel, #d, auto, variation
(4, 4, 4, 23, 4, 216, 4, NULL, 25, 45, NULL);