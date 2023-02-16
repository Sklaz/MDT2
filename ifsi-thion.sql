-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 16 fév. 2023 à 22:58
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ifsi-thion`
--

-- --------------------------------------------------------

--
-- Structure de la table `calls`
--

CREATE TABLE `calls` (
  `callid` mediumint(9) NOT NULL,
  `type` mediumtext NOT NULL,
  `location` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `police_grade` mediumtext NOT NULL,
  `rmu_grade` mediumtext NOT NULL,
  `channel` mediumtext NOT NULL,
  `caller` mediumint(9) NOT NULL,
  `status` mediumint(9) NOT NULL,
  `dateline` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `calls`
--

INSERT INTO `calls` (`callid`, `type`, `location`, `description`, `police_grade`, `rmu_grade`, `channel`, `caller`, `status`, `dateline`) VALUES
(5, 'AMBULANCE', '1251', 'Test', 'Low', 'Priority 3', 'Channel 4', 0, 4, 1676565804),
(6, 'TRAFFIC', '1215', 'test', 'Low', 'Priority 5', 'Channel 5', 0, 4, 1676570775),
(7, 'CRIME', 'test', 'te', 'Not Set', 'Not Set', 'Not Set', 0, 4, 1676575299),
(8, 'CRIME', 'test', 'test', 'Low', 'Priority 7', 'Channel 5', 0, 2, 1676576874);

-- --------------------------------------------------------

--
-- Structure de la table `civilians`
--

CREATE TABLE `civilians` (
  `civid` bigint(20) NOT NULL,
  `name` mediumtext NOT NULL,
  `dob` mediumtext NOT NULL,
  `address` mediumtext NOT NULL,
  `markers` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `civilian_notes`
--

CREATE TABLE `civilian_notes` (
  `noteid` bigint(20) NOT NULL,
  `civid` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `note` mediumtext NOT NULL,
  `dateline` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE `logs` (
  `logid` bigint(20) NOT NULL,
  `user` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `category` mediumtext NOT NULL,
  `dateline` bigint(20) NOT NULL,
  `visible` int(1) NOT NULL DEFAULT 1 COMMENT '1 = Visible, 0 = Hidden'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `logs`
--

INSERT INTO `logs` (`logid`, `user`, `content`, `category`, `dateline`, `visible`) VALUES
(315, '1', 'Has created a new session ::1.', 'Session', 1676565762, 1),
(316, '1', 'Has logged in from another IP, possible account breach. Old IP: 24.165.178.147 | New IP: ::1.', 'Security', 1676565763, 1),
(317, '1', 'Has created the call 5.', 'Calls', 1676565804, 1),
(318, 'SYSTEM', 'VSAV 1 has been assigned to log 5', 'Patrol', 1676565871, 0),
(319, 'SYSTEM', 'vsav 1 has updated their status to 1 on log 5', 'Patrol', 1676565881, 0),
(320, 'SYSTEM', 'vsav 1 has updated their status to 1 on log 5', 'Patrol', 1676565885, 0),
(321, 'SYSTEM', 'vsav 1 has updated their status to 2 on log 5', 'Patrol', 1676565888, 0),
(322, 'SYSTEM', 'vsav 1 has updated their status to 1 on log 5', 'Patrol', 1676565891, 0),
(323, 'SYSTEM', 'vsav 1 has updated their status to 3 on log 5', 'Patrol', 1676565905, 0),
(324, 'SYSTEM', 'vsav 1 has updated their status to 3 on log 5', 'Patrol', 1676565906, 0),
(325, 'SYSTEM', 'vsav 1 has updated their status to 9 on log 5', 'Patrol', 1676565908, 0),
(326, 'SYSTEM', 'vsav 1 has updated their status to 1 on log 5', 'Patrol', 1676565912, 0),
(327, 'SYSTEM', 'vsav 1 has updated their status to 1 on log 5', 'Patrol', 1676565916, 0),
(328, 'SYSTEM', 'vsav 1 has updated their status to 7 on log 5', 'Patrol', 1676565918, 0),
(329, 'SYSTEM', 'vsav 1 has updated their status to 3 on log 5', 'Patrol', 1676565920, 0),
(330, 'SYSTEM', 'vsav 1 has updated their status to 2 on log 5', 'Patrol', 1676565925, 0),
(331, 'SYSTEM', 'vsav 1 has updated their status to 1 on log 5', 'Patrol', 1676565930, 0),
(332, 'SYSTEM', 'vsav 1 has been cleared from log 5', 'Patrol', 1676565942, 0),
(333, 'SYSTEM', 'vsav 1 has updated their status to 9 on log 0', 'Patrol', 1676565944, 0),
(334, 'SYSTEM', 'vsav 1 has updated their status to 3 on log 0', 'Patrol', 1676565946, 0),
(335, 'SYSTEM', 'vsav 1 has updated their status to 1 on log 0', 'Patrol', 1676565949, 0),
(336, 'SYSTEM', 'vsav 1 has updated their status to 7 on log 0', 'Patrol', 1676565952, 0),
(337, 'SYSTEM', 'vsav 1 has updated their status to 1 on log 0', 'Patrol', 1676565955, 0),
(338, 'SYSTEM', 'vsav 1 has updated their status to 2 on log 0', 'Patrol', 1676565960, 0),
(339, 'SYSTEM', '251 has updated their status to 1 on log 0', 'Patrol', 1676565983, 0),
(340, 'SYSTEM', '251 has updated their status to 9 on log 0', 'Patrol', 1676565986, 0),
(341, 'SYSTEM', '251 has updated their status to 3 on log 0', 'Patrol', 1676565988, 0),
(342, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676565991, 0),
(343, 'SYSTEM', '251 has updated their status to 3 on log 0', 'Patrol', 1676565994, 0),
(344, 'SYSTEM', '251 has updated their status to 2 on log 0', 'Patrol', 1676566005, 0),
(345, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566006, 0),
(346, 'SYSTEM', '251 has updated their status to 1 on log 0', 'Patrol', 1676566009, 0),
(347, 'SYSTEM', ' has been assigned to log 5', 'Patrol', 1676566062, 0),
(348, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566067, 0),
(349, 'SYSTEM', '251 has updated their status to 97 on log 0', 'Patrol', 1676566068, 0),
(350, 'SYSTEM', '251 has updated their status to 97 on log 0', 'Patrol', 1676566068, 0),
(351, 'SYSTEM', '251 has updated their status to 97 on log 0', 'Patrol', 1676566070, 0),
(352, 'SYSTEM', '251 has updated their status to 23 on log 0', 'Patrol', 1676566070, 0),
(353, 'SYSTEM', '251 has updated their status to 23 on log 0', 'Patrol', 1676566071, 0),
(354, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566072, 0),
(355, 'SYSTEM', '251 has updated their status to 2 on log 0', 'Patrol', 1676566074, 0),
(356, 'SYSTEM', '251 has updated their status to 6 on log 0', 'Patrol', 1676566076, 0),
(357, 'SYSTEM', '251 has updated their status to 9 on log 0', 'Patrol', 1676566078, 0),
(358, 'SYSTEM', '251 has updated their status to 23 on log 0', 'Patrol', 1676566082, 0),
(359, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566083, 0),
(360, 'SYSTEM', '251 has updated their status to 6 on log 0', 'Patrol', 1676566130, 0),
(361, 'SYSTEM', '251 has updated their status to 6 on log 0', 'Patrol', 1676566189, 0),
(362, 'SYSTEM', '251 has updated their status to 6 on log 0', 'Patrol', 1676566199, 0),
(363, 'SYSTEM', '251 has updated their status to 6 on log 0', 'Patrol', 1676566205, 0),
(364, 'SYSTEM', '251 has updated their status to 23 on log 0', 'Patrol', 1676566213, 0),
(365, 'SYSTEM', '251 has updated their status to 2 on log 0', 'Patrol', 1676566214, 0),
(366, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566216, 0),
(367, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566291, 0),
(368, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566309, 0),
(369, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566309, 0),
(370, 'SYSTEM', '251 has updated their status to 23 on log 0', 'Patrol', 1676566310, 0),
(371, 'SYSTEM', '251 has updated their status to 9 on log 0', 'Patrol', 1676566312, 0),
(372, 'SYSTEM', '251 has updated their status to 9 on log 0', 'Patrol', 1676566430, 0),
(373, 'SYSTEM', '251 has updated their status to 1 on log 0', 'Patrol', 1676566431, 0),
(374, 'SYSTEM', '251 has updated their status to 1 on log 0', 'Patrol', 1676566434, 0),
(375, 'SYSTEM', '251 has updated their status to 1 on log 0', 'Patrol', 1676566435, 0),
(376, 'SYSTEM', '251 has updated their status to 1 on log 0', 'Patrol', 1676566435, 0),
(377, 'SYSTEM', '251 has updated their status to 1 on log 0', 'Patrol', 1676566438, 0),
(378, 'SYSTEM', '251 has updated their status to 1 on log 0', 'Patrol', 1676566439, 0),
(379, 'SYSTEM', '251 has updated their status to 2 on log 0', 'Patrol', 1676566482, 0),
(380, 'SYSTEM', '251 has updated their status to 2 on log 0', 'Patrol', 1676566483, 0),
(381, 'SYSTEM', '251 has updated their status to 7 on log 0', 'Patrol', 1676566484, 0),
(382, 'SYSTEM', '251 has updated their status to 23 on log 0', 'Patrol', 1676566486, 0),
(383, 'SYSTEM', '251 has updated their status to 97 on log 0', 'Patrol', 1676566487, 0),
(384, 'SYSTEM', '251 has updated their status to 6 on log 0', 'Patrol', 1676566489, 0),
(385, 'SYSTEM', '251 has updated their status to 2 on log 0', 'Patrol', 1676566577, 0),
(386, 'SYSTEM', 'VSAV 1 has been assigned to log 5', 'Patrol', 1676566612, 0),
(387, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566723, 0),
(388, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566723, 0),
(389, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566725, 0),
(390, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566725, 0),
(391, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566726, 0),
(392, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566726, 0),
(393, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566727, 0),
(394, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566727, 0),
(395, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566783, 0),
(396, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566783, 0),
(397, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566784, 0),
(398, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566784, 0),
(399, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566787, 0),
(400, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566787, 0),
(401, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566789, 0),
(402, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566790, 0),
(403, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566790, 0),
(404, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566790, 0),
(405, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566791, 0),
(406, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566791, 0),
(407, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566792, 0),
(408, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566792, 0),
(409, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566793, 0),
(410, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566793, 0),
(411, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566794, 0),
(412, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566794, 0),
(413, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566794, 0),
(414, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566794, 0),
(415, 'SYSTEM', 'VSAV 1 has updated their status to 97 on log 5', 'Patrol', 1676566795, 0),
(416, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566797, 0),
(417, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566797, 0),
(418, 'SYSTEM', 'VSAV 1 has updated their status to 7 on log 5', 'Patrol', 1676566799, 0),
(419, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566801, 0),
(420, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566801, 0),
(421, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566803, 0),
(422, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566803, 0),
(423, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566833, 0),
(424, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566833, 0),
(425, 'SYSTEM', 'VSAV 1 has updated their status to 97 on log 5', 'Patrol', 1676566874, 0),
(426, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566876, 0),
(427, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566876, 0),
(428, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566881, 0),
(429, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566881, 0),
(430, 'SYSTEM', 'VSAV 1 has updated their status to 7 on log 5', 'Patrol', 1676566883, 0),
(431, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 5', 'Patrol', 1676566884, 0),
(432, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 5', 'Patrol', 1676566884, 0),
(433, 'SYSTEM', 'VSAV 1 has been cleared from log 5', 'Patrol', 1676566922, 0),
(434, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676566923, 0),
(435, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566924, 0),
(436, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566924, 0),
(437, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566924, 0),
(438, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566924, 0),
(439, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566925, 0),
(440, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566925, 0),
(441, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566926, 0),
(442, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566926, 0),
(443, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566927, 0),
(444, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566927, 0),
(445, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566928, 0),
(446, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566928, 0),
(447, 'SYSTEM', 'VSAV 1 has updated their status to 97 on log 0', 'Patrol', 1676566931, 0),
(448, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566933, 0),
(449, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566933, 0),
(450, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566937, 0),
(451, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566937, 0),
(452, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566939, 0),
(453, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566939, 0),
(454, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566941, 0),
(455, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566941, 0),
(456, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566983, 0),
(457, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566983, 0),
(458, 'SYSTEM', 'VSAV 1 has updated their status to 99 on log 0', 'Patrol', 1676566988, 0),
(459, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676566993, 0),
(460, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676566993, 0),
(461, 'SYSTEM', 'VSAV 1 has updated their status to 7 on log 0', 'Patrol', 1676567011, 0),
(462, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567013, 0),
(463, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567013, 0),
(464, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567045, 0),
(465, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567045, 0),
(466, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567046, 0),
(467, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567046, 0),
(468, 'SYSTEM', 'VSAV 1 has updated their status to 97 on log 0', 'Patrol', 1676567048, 0),
(469, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567050, 0),
(470, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567050, 0),
(471, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567088, 0),
(472, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567088, 0),
(473, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567090, 0),
(474, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567090, 0),
(475, 'SYSTEM', 'VSAV 1 has updated their status to 97 on log 0', 'Patrol', 1676567091, 0),
(476, 'SYSTEM', 'VSAV 1 has updated their status to 97 on log 0', 'Patrol', 1676567170, 0),
(477, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567172, 0),
(478, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567210, 0),
(479, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567253, 0),
(480, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567254, 0),
(481, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567256, 0),
(482, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567350, 0),
(483, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567352, 0),
(484, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567354, 0),
(485, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567371, 0),
(486, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567382, 0),
(487, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567383, 0),
(488, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567438, 0),
(489, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567442, 0),
(490, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567463, 0),
(491, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567464, 0),
(492, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567466, 0),
(493, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567468, 0),
(494, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567470, 0),
(495, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567574, 0),
(496, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567584, 0),
(497, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567620, 0),
(498, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 0', 'Patrol', 1676567662, 0),
(499, 'SYSTEM', 'VSAV 1 has updated their status to 4 on log 0', 'Patrol', 1676567666, 0),
(500, 'SYSTEM', 'VSAV 1 has updated their status to 4 on log 0', 'Patrol', 1676567681, 0),
(501, 'SYSTEM', 'VSAV 1 has updated their status to 4 on log 0', 'Patrol', 1676567700, 0),
(502, 'SYSTEM', 'VSAV 1 has updated their status to 4 on log 0', 'Patrol', 1676567769, 0),
(503, 'SYSTEM', 'VSAV 1 has updated their status to 5 on log 0', 'Patrol', 1676567771, 0),
(504, 'SYSTEM', 'VSAV 1 has updated their status to 5 on log 0', 'Patrol', 1676567811, 0),
(505, 'SYSTEM', 'VSAV 1 has updated their status to 5 on log 0', 'Patrol', 1676567834, 0),
(506, 'SYSTEM', 'VSAV 1 has updated their status to 5 on log 0', 'Patrol', 1676567859, 0),
(507, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676567870, 0),
(508, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567872, 0),
(509, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676567885, 0),
(510, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676568216, 0),
(511, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676568245, 0),
(512, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676568259, 0),
(513, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676568297, 0),
(514, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676568310, 0),
(515, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 0', 'Patrol', 1676568372, 0),
(516, 'SYSTEM', 'VSAV 1 has updated their status to 6 on log 0', 'Patrol', 1676568373, 0),
(517, 'SYSTEM', 'VSAV 1 has updated their status to 5 on log 0', 'Patrol', 1676568376, 0),
(518, 'SYSTEM', 'VSAV 1 has been assigned to log 5', 'Patrol', 1676569518, 0),
(519, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 5', 'Patrol', 1676569536, 0),
(520, 'SYSTEM', 'VSAV 1 has updated their status to 99 on log 5', 'Patrol', 1676569664, 0),
(521, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 5', 'Patrol', 1676569794, 0),
(522, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 5', 'Patrol', 1676569801, 0),
(523, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 5', 'Patrol', 1676569834, 0),
(524, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 5', 'Patrol', 1676569890, 0),
(525, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 5', 'Patrol', 1676569950, 0),
(526, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676569957, 0),
(527, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570007, 0),
(528, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570032, 0),
(529, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570085, 0),
(530, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570116, 0),
(531, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570135, 0),
(532, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570146, 0),
(533, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570172, 0),
(534, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570208, 0),
(535, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570211, 0),
(536, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570219, 0),
(537, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 5', 'Patrol', 1676570225, 0),
(538, 'SYSTEM', 'VSAV 1 has been cleared from log 5', 'Patrol', 1676570229, 0),
(539, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570366, 0),
(540, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570381, 0),
(541, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570391, 0),
(542, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570398, 0),
(543, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570399, 0),
(544, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570400, 0),
(545, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570410, 0),
(546, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570414, 0),
(547, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570451, 0),
(548, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570458, 0),
(549, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570470, 0),
(550, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570477, 0),
(551, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570496, 0),
(552, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570533, 0),
(553, 'SYSTEM', 'VSAV 1 has been cleared from log 0', 'Patrol', 1676570604, 0),
(554, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 0', 'Patrol', 1676570621, 0),
(555, 'SYSTEM', 'VSAV 1 has updated their status to 8 on log 0', 'Patrol', 1676570621, 0),
(556, 'SYSTEM', 'VSAV 1 has updated their status to 6 on log 0', 'Patrol', 1676570626, 0),
(557, 'SYSTEM', 'VSAV 1 has updated their status to 6 on log 0', 'Patrol', 1676570648, 0),
(558, 'SYSTEM', 'VSAV 1 has updated their status to 6 on log 0', 'Patrol', 1676570664, 0),
(559, 'SYSTEM', 'VSAV 1 has updated their status to 6 on log 0', 'Patrol', 1676570666, 0),
(560, 'SYSTEM', 'VSAV 1 has updated their status to 6 on log 0', 'Patrol', 1676570673, 0),
(561, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 0', 'Patrol', 1676570712, 0),
(562, '1', 'Has created the call 6.', 'Calls', 1676570775, 1),
(563, 'SYSTEM', 'VSAV 1 has updated their status to 9 on log 0', 'Patrol', 1676570840, 0),
(564, 'SYSTEM', 'VSAV 1 has been assigned to log 6', 'Patrol', 1676570871, 0),
(565, 'SYSTEM', 'VSAV 1 has updated their status to 1 on log 6', 'Patrol', 1676570887, 0),
(566, 'SYSTEM', 'VSAV 1 has updated their status to 2 on log 6', 'Patrol', 1676570892, 0),
(567, 'SYSTEM', 'VSAV 1 has updated their status to 3 on log 6', 'Patrol', 1676570896, 0),
(568, '1', 'Has created the user test test', 'Admin', 1676570969, 1),
(569, '3', 'Has created a new session ::1.', 'Session', 1676570972, 1),
(570, '3', 'Has logged in from another IP, possible account breach. Old IP:  | New IP: ::1.', 'Security', 1676570972, 1),
(571, '1', 'Has edited the access perms for test test', 'Admin', 1676570995, 1),
(572, '1', 'Has edited the access perms for test test', 'Admin', 1676571014, 1),
(573, '1', 'Has edited the access perms for test test', 'Admin', 1676571030, 1),
(574, 'SYSTEM', 'FSR has updated their status to 1 on log 0', 'Patrol', 1676571039, 0),
(575, 'SYSTEM', 'FSR has updated their status to 9 on log 0', 'Patrol', 1676571052, 0),
(576, 'SYSTEM', 'FSR has been assigned to log 6', 'Patrol', 1676571069, 0),
(577, 'SYSTEM', 'FSR has updated their status to 5 on log 6', 'Patrol', 1676571092, 0),
(578, 'SYSTEM', 'FSR has updated their status to 3 on log 6', 'Patrol', 1676571099, 0),
(579, 'SYSTEM', 'FSR has updated their status to 2 on log 6', 'Patrol', 1676571101, 0),
(580, 'SYSTEM', 'FSR has been cleared from log 6', 'Patrol', 1676571170, 0),
(581, 'SYSTEM', 'VSAV 1 has been cleared from log 6', 'Patrol', 1676571177, 0),
(582, '1', 'Has ended the shift at 16th February 2023 at 13:13', 'Admin', 1676571188, 1),
(583, 'SYSTEM', '18 has updated their status to 5 on log 0', 'Patrol', 1676571724, 0),
(584, 'SYSTEM', '18 has updated their status to 5 on log 0', 'Patrol', 1676571741, 0),
(585, 'SYSTEM', '18 has updated their status to 5 on log 0', 'Patrol', 1676571782, 0),
(586, '3', 'Has created a new session ::1.', 'Session', 1676571803, 1),
(587, 'SYSTEM', '85 has updated their status to 1 on log 0', 'Patrol', 1676571815, 0),
(588, 'SYSTEM', '85 has updated their status to 1 on log 0', 'Patrol', 1676571816, 0),
(589, 'SYSTEM', '18 has updated their status to 1 on log 0', 'Patrol', 1676571858, 0),
(590, 'SYSTEM', '18 has updated their status to 8 on log 0', 'Patrol', 1676571892, 0),
(591, 'SYSTEM', '18 has updated their status to 1 on log 0', 'Patrol', 1676571896, 0),
(592, 'SYSTEM', 'FSR has updated their status to 1 on log 0', 'Patrol', 1676572596, 0),
(593, 'SYSTEM', 'FSR has updated their status to 1 on log 0', 'Patrol', 1676572599, 0),
(594, '1', 'Has ended the shift at 16th February 2023 at 13:36', 'Admin', 1676572610, 1),
(595, 'SYSTEM', '18 has updated their status to 1 on log 0', 'Patrol', 1676572805, 0),
(596, 'SYSTEM', '18 has updated their status to 9 on log 0', 'Patrol', 1676572812, 0),
(597, '3', 'Has created a new session ::1.', 'Session', 1676572847, 1),
(598, 'SYSTEM', '18 has updated their status to 6 on log 0', 'Patrol', 1676572895, 0),
(599, 'SYSTEM', '18 has updated their status to 3 on log 0', 'Patrol', 1676572896, 0),
(600, 'SYSTEM', '52 has updated their status to 9 on log 0', 'Patrol', 1676572908, 0),
(601, 'SYSTEM', '52 has updated their status to 10 on log 0', 'Patrol', 1676572929, 0),
(602, 'SYSTEM', '52 has updated their status to 9 on log 0', 'Patrol', 1676572940, 0),
(603, 'SYSTEM', '52 has updated their status to 10 on log 0', 'Patrol', 1676572946, 0),
(604, 'SYSTEM', 't has updated their status to 1 on log 0', 'Patrol', 1676572953, 0),
(605, 'SYSTEM', 't has updated their status to 10 on log 0', 'Patrol', 1676573003, 0),
(606, 'SYSTEM', 't has been cleared from log 0', 'Patrol', 1676573024, 0),
(607, 'SYSTEM', 't has updated their status to 10 on log 0', 'Patrol', 1676573033, 0),
(608, 'SYSTEM', 't has updated their status to 9 on log 0', 'Patrol', 1676573106, 0),
(609, 'SYSTEM', 't has updated their status to 1 on log 0', 'Patrol', 1676573159, 0),
(610, 'SYSTEM', '25 has updated their status to 3 on log 0', 'Patrol', 1676573315, 0),
(611, 'SYSTEM', '25 has updated their status to 1 on log 0', 'Patrol', 1676573318, 0),
(612, 'SYSTEM', '25 has updated their status to 9 on log 0', 'Patrol', 1676573326, 0),
(613, '1', 'Has ended the shift at 16th February 2023 at 13:49', 'Admin', 1676573358, 1),
(614, 'SYSTEM', 'The tactical advisor has sent a global message with the message 12', 'Patrol', 1676573934, 0),
(615, 'SYSTEM', '12 has updated their status to 1 on log 0', 'Patrol', 1676573957, 0),
(616, 'SYSTEM', '5 has updated their status to 1 on log 0', 'Patrol', 1676574159, 0),
(617, 'SYSTEM', '5 has updated their status to 9 on log 0', 'Patrol', 1676574228, 0),
(618, '1', 'Has created the call 7.', 'Calls', 1676575299, 1),
(619, '1', 'Has ended the shift at 16th February 2023 at 20:29', 'Admin', 1676575787, 1),
(620, 'SYSTEM', 'T has updated their status to 3 on log 0', 'Patrol', 1676576110, 0),
(621, '1', 'Has ended the shift at 16th February 2023 at 20:47', 'Admin', 1676576838, 1),
(622, '1', 'Has ended the shift at 16th February 2023 at 20:47', 'Admin', 1676576855, 1),
(623, '1', 'Has created the call 8.', 'Calls', 1676576875, 1),
(624, '1', 'Has created the civilian GALLARD Thomas', 'Civilian Management', 1676579679, 1),
(625, '1', 'Has created the civilian GALLARD Thomas', 'Civilian Management', 1676579682, 1),
(626, '1', 'Has created the civilian GALLARD Thomas', 'Civilian Management', 1676579688, 1),
(627, '1', 'Has created the civilian GALLARD Thomas', 'Civilian Management', 1676579689, 1),
(628, '1', 'Has created the civilian GALLARD Thomas', 'Civilian Management', 1676579692, 1),
(629, '1', 'Has deleted the Civilian GALLARD Thomas', 'Civilian Management', 1676579700, 1),
(630, '1', 'Has deleted the Civilian ', 'Civilian Management', 1676579700, 1),
(631, '1', 'Has deleted the Civilian GALLARD Thomas', 'Civilian Management', 1676579701, 1),
(632, '1', 'Has deleted the Civilian GALLARD Thomas', 'Civilian Management', 1676579702, 1),
(633, '1', 'Has deleted the Civilian GALLARD Thomas', 'Civilian Management', 1676579703, 1),
(634, '1', 'Has deleted the Civilian gallard', 'Civilian Management', 1676580250, 1),
(635, '1', 'Has deleted the Civilian GALLARD', 'Civilian Management', 1676580265, 1),
(636, '1', 'Has deleted the Civilian GALLARD', 'Civilian Management', 1676580274, 1),
(637, '1', 'Has deleted the Civilian GALLARD Thomas', 'Civilian Management', 1676580290, 1),
(638, '1', 'Has deleted the Civilian GALLARD', 'Civilian Management', 1676580291, 1),
(639, '1', 'Has deleted the Civilian th', 'Civilian Management', 1676580307, 1),
(640, '1', 'Has created a new session ::1.', 'Session', 1676583100, 1),
(641, '1', 'Has created a new session ::1.', 'Session', 1676584110, 1),
(642, '1', 'Has created a new session ::1.', 'Session', 1676584332, 1),
(643, '1', 'Has created a new session ::1.', 'Session', 1676584398, 1);

-- --------------------------------------------------------

--
-- Structure de la table `markers`
--

CREATE TABLE `markers` (
  `id` bigint(20) NOT NULL,
  `acronym` mediumtext NOT NULL,
  `name` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `markers`
--

INSERT INTO `markers` (`id`, `acronym`, `name`) VALUES
(1, 'T1A', 'Antécédent cardique'),
(2, 'T1AA', 'BPCO'),
(3, 'T1B', 'Infartus'),
(4, 'T1BA', 'Opération MS'),
(5, 'T1C', 'Opération MI'),
(6, 'T1D', 'Opération autre'),
(7, 'T1E', 'BPCO'),
(8, 'T1FA', 'Maladie psy'),
(9, 'T1FB', 'Amputé '),
(10, 'T1FC', 'ACR'),
(11, 'T1GA', 'DCD'),
(12, 'T1GB', 'Fracture'),
(13, 'T1GC', 'Luxation'),
(14, 'T1H', 'Entorse'),
(15, 'T1I', 'Hémorragie '),
(16, 'T1J', 'AVC'),
(17, 'T2A', 'AIT'),
(18, 'T2B', 'Trespassing'),
(19, 'T2C', 'Breaking and Entering'),
(20, 'T2D', 'Burglary'),
(21, 'T2E', 'Possession of criminal tools '),
(22, 'T2F', 'Vandalism'),
(23, 'T3A', 'Forgery'),
(24, 'T3B', 'Fraud'),
(25, 'T3C', 'Money Laundering'),
(26, 'T3DA', 'Petty Theft'),
(27, 'T3DB', 'Theft'),
(28, 'T3DC', 'Grand Theft'),
(29, 'T3DD', 'Grand Theft Auto'),
(30, 'T3DE', 'Grand Theft of Firearms'),
(31, 'T3E', 'Receiving Stolen Property'),
(32, 'T3F', 'Robbery'),
(33, 'T3G', 'Armed Robbery'),
(34, 'T3H', 'Extortion'),
(35, 'T3I', 'Counterfeiting'),
(36, 'T3J', 'Embezzlement'),
(37, 'T3K', 'Carjacking'),
(38, 'T4A', 'Bribery'),
(39, 'T4AA', 'Bribery of a Government Official'),
(40, 'T4AB', 'Accepting A Bribe'),
(41, 'T4B', 'Failure To Pay A Fine'),
(42, 'T4C', 'Resisting Arrest'),
(43, 'T4D', 'Escaping Custody'),
(44, 'T4E', 'Obstruction'),
(45, 'T4F', 'Misuse of a Government Helpline'),
(46, 'T4G', 'Human Trafficking'),
(47, 'T4H', 'Aiding and Abetting'),
(48, 'T4I', 'Accessory After The Fact'),
(49, 'T4J', 'Tampering With Evidence'),
(50, 'T4KA', 'Impersonation Of Another Person'),
(51, 'TK4B', 'Impersonation of a Government Official'),
(52, 'T4KC', 'Contempt of Court '),
(53, 'T4L', 'Corruption'),
(54, 'T4LA', 'Corruption of a Public Office'),
(55, 'T4LB', 'Corruption of Public Duty'),
(56, 'T5A', 'Indecent Exposure'),
(57, 'T5B', 'Disturbing the Peace'),
(58, 'T5C', 'Littering'),
(59, 'T5D', 'Unlawful Assembly'),
(60, 'T5E', 'Rioting'),
(61, 'T5EA', 'Participating in a Riot'),
(62, 'T5EB', 'Initiating a Riot'),
(63, 'T5F', 'Prostitution'),
(64, 'T5G', 'Pimping'),
(65, 'T6A', 'Public Intoxication'),
(66, 'T6B', 'Terrorism'),
(67, 'T6C', 'Possession of a controlled substance'),
(68, 'T6D', 'Possession of a controlled substance with intent'),
(69, 'T6E', 'Sale of a Controlled Substance'),
(70, 'T6FA', 'Manufacture of a Controlled Substance'),
(71, 'T6FB', 'Manufacturing of Alcohol without a license'),
(72, 'T6G', 'Sale of Alcohol to a minor'),
(73, 'T7A', 'Eluding / Evading a Peace Officer'),
(74, 'T7B', 'Reckless Elusion / Evasion?'),
(75, 'T7C', 'Hit and Run'),
(76, 'T7D', 'Hit and Run with Injury'),
(77, 'T7E', 'Failure to yield at a stop sign'),
(78, 'T7F', 'Reckless Driving'),
(79, 'T7G', 'Speeding'),
(80, 'T7H', 'Parking Violation'),
(81, 'T7I', 'Illegal Window Tint'),
(82, 'T7J', 'Driving without Valid License'),
(83, 'T7L', 'Failure to show I.D.'),
(84, 'T7M', 'Open Alcohol Container'),
(85, 'T7N', 'Driving Under the Influence'),
(86, 'T7O', 'Driving Under the Influence of Drugs'),
(87, 'T7P', 'Operation of a ATV on Streets/Highways'),
(88, 'T7Q', 'Operation of a Golf Cart on Streets/Highways'),
(89, 'T7R', 'Failure to Display plates'),
(90, 'T7S', 'Engaging in a Speed Contest'),
(91, 'T8A', 'Carrying a concealed weapon'),
(92, 'T8B', 'Possession of an Automatic Assault Rifle'),
(93, 'T8C', 'Felon in possession of a firearm'),
(94, 'T8D', 'High Dangerous Device'),
(95, 'T8E', 'Brandishing a weapon'),
(96, 'T8F', 'Brandishing a firearm'),
(97, 'T8G', 'Drive By Shooting'),
(98, 'T8H', 'General Prohibited weapons violation'),
(99, 'T8I', 'Weapons Discharge Violation'),
(100, 'T8IA', 'Weapons Discharge Violation (In Public)'),
(101, 'T8J', 'Unlawful sale of a firearm'),
(102, 'T8JA', 'Unlawful sale of a firearm to an unlicensed person'),
(103, 'CLEAN', 'CLEAN RECORD');

-- --------------------------------------------------------

--
-- Structure de la table `mdt_sessions`
--

CREATE TABLE `mdt_sessions` (
  `id` mediumint(9) NOT NULL,
  `session_id` mediumtext NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `timestamp` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `mdt_sessions`
--

INSERT INTO `mdt_sessions` (`id`, `session_id`, `user_id`, `ip`, `timestamp`) VALUES
(2, 'f5aos3n8mpf9830rosq59ctp8k', 1, '::1', 8388607),
(3, 'tb3l8sk7jeskm08nagbgggpms9', 1, '::1', 8388607),
(14, 'iovf81sg2lf0i10g118r91uld7', 1, '24.165.178.147', 8388607),
(52, '7p0l3kt6r6nl5k4bpkf2psq8po', 3, '::1', 8388607),
(53, 'e691g3njqa8slcuk3cdmk5virs', 3, '::1', 8388607),
(54, 'tn0arou8q9644alitu1r0mulps', 3, '::1', 8388607),
(58, '3nfktrs8it0583o1st7p0uea4a', 1, '::1', 8388607);

-- --------------------------------------------------------

--
-- Structure de la table `mdt_users`
--

CREATE TABLE `mdt_users` (
  `userid` mediumint(9) NOT NULL,
  `first_name` text NOT NULL,
  `surname` mediumtext NOT NULL,
  `email` mediumtext NOT NULL,
  `steamid` longtext NOT NULL,
  `password` mediumtext NOT NULL,
  `collar` mediumtext NOT NULL,
  `groups` mediumtext NOT NULL,
  `joindate` bigint(20) NOT NULL,
  `theme` int(11) NOT NULL DEFAULT 1,
  `last_ip` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `mdt_users`
--

INSERT INTO `mdt_users` (`userid`, `first_name`, `surname`, `email`, `steamid`, `password`, `collar`, `groups`, `joindate`, `theme`, `last_ip`) VALUES
(1, 'Change', 'Me', 'Changeme@gmail.com', '', '$2y$10$Hd6BbW4F4SNJv1wVq0o6xOHZpdPMoGYYpI.mtZVY3ntkfqveVre/i', '1234', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,', 1530222515, 2, '::1'),
(3, 'test', 'test', 'test@gmail.fr', '', '$2y$10$w2EBGO4vaiKmAWYqL.6h8.bnCt88eD7MyChW6zoSGGR4pQ/bEhAju', 'test', '1,2,3,4,6,', 1676570968, 1, '::1');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `messageid` mediumint(9) NOT NULL,
  `recive` mediumtext NOT NULL,
  `post` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `dateline` bigint(20) NOT NULL,
  `visible` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pois`
--

CREATE TABLE `pois` (
  `id` bigint(20) NOT NULL,
  `civ_id` bigint(20) NOT NULL,
  `image` mediumtext NOT NULL,
  `reason` mediumtext NOT NULL,
  `notes` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `remarks`
--

CREATE TABLE `remarks` (
  `remarkid` mediumint(9) NOT NULL,
  `unit` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `dateline` bigint(20) NOT NULL,
  `callid` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) NOT NULL,
  `user` bigint(20) NOT NULL,
  `incident` mediumtext NOT NULL,
  `cad` mediumtext NOT NULL,
  `located` mediumtext NOT NULL,
  `otherUnits` mediumtext NOT NULL,
  `arrested` mediumtext NOT NULL,
  `person` mediumtext NOT NULL,
  `arrestedFor` mediumtext NOT NULL,
  `foundItems` mediumtext NOT NULL,
  `whatHappened` longtext NOT NULL,
  `dateline` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `reports`
--

INSERT INTO `reports` (`id`, `user`, `incident`, `cad`, `located`, `otherUnits`, `arrested`, `person`, `arrestedFor`, `foundItems`, `whatHappened`, `dateline`) VALUES
(4, 1, '', '', '', '', 'Oui', '', '', '', '', 1676583706),
(5, 1, '', '', '', '', 'Oui', '', '', '', '', 1676583735);

-- --------------------------------------------------------

--
-- Structure de la table `units`
--

CREATE TABLE `units` (
  `unitid` mediumint(9) NOT NULL,
  `unit` mediumtext NOT NULL,
  `callid` mediumint(9) NOT NULL,
  `status` mediumtext NOT NULL,
  `collar` mediumtext NOT NULL,
  `steamid` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `units`
--

INSERT INTO `units` (`unitid`, `unit`, `callid`, `status`, `collar`, `steamid`, `location`) VALUES
(27, 't', 0, '11', '', '', ''),
(28, '25', 0, '11', '', '', ''),
(32, 'T', 0, '11', '', '', ''),
(33, 'T', 0, '11', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` mediumint(9) NOT NULL,
  `name` mediumtext NOT NULL,
  `perms` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `usergroups`
--

INSERT INTO `usergroups` (`id`, `name`, `perms`) VALUES
(1, 'Registered User', 1),
(2, 'Community Member', 17),
(3, 'Trooper', 211),
(4, 'Corporal', 209),
(5, 'Sergeant', 241),
(6, 'Lieutenant', 8959),
(7, 'Captain', 25343),
(8, 'Chief', 27647),
(9, 'Moderator', 60159),
(10, 'Field Training Officer', 255),
(11, 'Dispatcher', 59647),
(12, 'Director', 64255),
(13, 'Administrator', 64511),
(14, 'Website Administrator', 16383);

-- --------------------------------------------------------

--
-- Structure de la table `user_perms`
--

CREATE TABLE `user_perms` (
  `perm` bigint(20) NOT NULL,
  `name` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `user_perms`
--

INSERT INTO `user_perms` (`perm`, `name`) VALUES
(1, 'Is A Registered Member[Do not uncheck this or will break usergroups!]'),
(2, 'Can Access Call Overview Page'),
(4, 'Can Access Assign Calls Page [Must have \"Can Access Call Overview Page\" Enabled]'),
(8, 'Can Access Dismiss Calls Page [Must have \"Can Access Call Overview Page\" Enabled]'),
(16, 'Can Access Civilian Area'),
(32, 'Can Access BOLO Area'),
(64, 'Can Access Reports Area'),
(128, 'Can Access CAD Area'),
(256, 'Can Access Admin Area'),
(512, 'Is a Command Member'),
(2048, 'Can End Shifts'),
(4096, 'Can Ban mdt_users'),
(8192, 'Can View Reports'),
(16384, 'Can view Form Responses'),
(32768, 'Can create & Delete events');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicleid` bigint(20) NOT NULL,
  `vehicle` mediumtext NOT NULL,
  `vrm` mediumtext NOT NULL,
  `owner` bigint(20) NOT NULL,
  `status` mediumtext NOT NULL,
  `insurer` mediumtext NOT NULL,
  `insurance_number` mediumtext NOT NULL,
  `registered_drivers` mediumtext NOT NULL,
  `markers` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vois`
--

CREATE TABLE `vois` (
  `id` bigint(20) NOT NULL,
  `vehicle_id` bigint(20) NOT NULL,
  `image` mediumtext NOT NULL,
  `reason` mediumtext NOT NULL,
  `notes` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`callid`);

--
-- Index pour la table `civilians`
--
ALTER TABLE `civilians`
  ADD PRIMARY KEY (`civid`);

--
-- Index pour la table `civilian_notes`
--
ALTER TABLE `civilian_notes`
  ADD PRIMARY KEY (`noteid`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`logid`);

--
-- Index pour la table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mdt_sessions`
--
ALTER TABLE `mdt_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mdt_users`
--
ALTER TABLE `mdt_users`
  ADD PRIMARY KEY (`userid`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageid`);

--
-- Index pour la table `pois`
--
ALTER TABLE `pois`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `remarks`
--
ALTER TABLE `remarks`
  ADD PRIMARY KEY (`remarkid`);

--
-- Index pour la table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unitid`);

--
-- Index pour la table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicleid`);

--
-- Index pour la table `vois`
--
ALTER TABLE `vois`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `calls`
--
ALTER TABLE `calls`
  MODIFY `callid` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `civilians`
--
ALTER TABLE `civilians`
  MODIFY `civid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `civilian_notes`
--
ALTER TABLE `civilian_notes`
  MODIFY `noteid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
  MODIFY `logid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=644;

--
-- AUTO_INCREMENT pour la table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT pour la table `mdt_sessions`
--
ALTER TABLE `mdt_sessions`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `mdt_users`
--
ALTER TABLE `mdt_users`
  MODIFY `userid` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageid` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `pois`
--
ALTER TABLE `pois`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `remarks`
--
ALTER TABLE `remarks`
  MODIFY `remarkid` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `units`
--
ALTER TABLE `units`
  MODIFY `unitid` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicleid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `vois`
--
ALTER TABLE `vois`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
