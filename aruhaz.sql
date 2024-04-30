-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 30. 09:01
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `aruhaz`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ordering`
--

CREATE TABLE `ordering` (
  `orderID` int(11) NOT NULL COMMENT 'rendelés azonosítója',
  `userID` int(11) NOT NULL COMMENT 'a felhasználó azonosítója',
  `seriesID` int(11) NOT NULL COMMENT 'a termék azonosítója',
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'a rendelés ideje',
  `price` int(11) NOT NULL COMMENT 'a megrendelés összértéke'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `ordering`
--

INSERT INTO `ordering` (`orderID`, `userID`, `seriesID`, `orderDate`, `price`) VALUES
(1, 2, 3, '2024-03-04 10:39:42', 0),
(8, 2, 11, '2024-03-05 05:50:01', 45000),
(9, 2, 12, '2024-03-05 05:52:03', 30000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rating`
--

CREATE TABLE `rating` (
  `ratingID` int(11) NOT NULL COMMENT 'értékelés azonosítója',
  `rating` decimal(10,1) NOT NULL COMMENT 'adott sorozat értékelésének átlaga egy adott felhasználótól',
  `userID` int(11) NOT NULL COMMENT 'felhasználó azonosítója',
  `seriesID` int(11) NOT NULL COMMENT 'termék azonosítója'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rating`
--

INSERT INTO `rating` (`ratingID`, `rating`, `userID`, `seriesID`) VALUES
(1, 5.0, 2, 3),
(2, 3.0, 2, 9),
(3, 4.0, 2, 12),
(4, 5.0, 2, 13),
(5, 4.0, 2, 14),
(6, 3.0, 2, 15),
(7, 4.0, 2, 16),
(8, 2.0, 2, 11);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `seriesID` int(11) NOT NULL COMMENT 'termék azonosítója',
  `name` varchar(50) NOT NULL COMMENT 'termék neve',
  `image` varchar(255) DEFAULT NULL COMMENT 'a kép neve',
  `rating` decimal(10,1) NOT NULL COMMENT 'a termék értékelésének átlaga',
  `price` int(11) NOT NULL COMMENT 'a termék ára',
  `stock` int(11) NOT NULL COMMENT 'a termék darabszáma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`seriesID`, `name`, `image`, `rating`, `price`, `stock`) VALUES
(3, 'M4 CQB-R Charlie [Elektromos]', '2024_03_04_M4.png', 5.0, 45299, 8),
(11, '88g Paintball Airsoft co2 Patron', '2024_03_04_88g-paintball-airsoft-co2-patron.jpg', 2.0, 15000, 7),
(12, 'kriss vector airsoft fegyver [Elektromos]', '2024_03_04_kriss-vector-airsoft-fegyver1.jpg', 4.0, 30000, 3),
(13, 'Airsoft BLS BB 0.20g [Kicsi Kiszerelés]', '2024_03_04_Airsoft BLS BB 0.20g.jpg', 5.0, 5000, 20),
(14, 'Dye Goggle Maszk', '2024_03_04_dye-goggle-i4-pro-black-paintball-maszk.jpg', 4.0, 40000, 7),
(15, 'Airsoft asg cz p 09 gbb Airsoft Pisztoly [Gázos]', '2024_03_04_airsoft-asg-cz-p-09-gbb-airsoft-pisztoly.jpg', 3.0, 25000, 15),
(16, 'BB gyortöltő fekete', '2024_03_04_bb-gyorstolto-fekete-61ade6bb51fc5.jpg', 4.0, 10000, 30);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL,
  `userImage` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`userID`, `email`, `username`, `password`, `role`, `userImage`, `birthday`) VALUES
(1, 'admin@admin.hu', 'Admin', '$2b$10$YvS/lnv/2t.IiQPIx3ykUOi17S3NYq85P5SKOoKOj53C9XY7szSBm', 1, '2024_03_04_images.png', NULL),
(2, 'user@user.hu', 'User', '$2b$10$RaBjUmG09gjcdeTe2XnJYe0DK8SEdzIs1yonuochGxvt03SQDrAUS', 0, '2024_03_04_images.png', NULL),
(3, 'kecske@kecske.hu', 'Kecske', '$2b$10$zUyQkQ2rV1xmRi/EUjajoOr.5/VAPZh.TJUnB0dn2rnI1ozfDV2mO', 0, 'no_image.png', NULL),
(4, 'kecske1@kecske.hu', 'Kecske', '$2b$10$1SXfOZYbqWB2tantICi7pOpthez0hhQSgOob2h9Fj89sMig.gwgxi', 0, 'no_image.png', NULL),
(5, 'asd@asd.asd', 'Asd', '$2b$10$fTSO3GccyIlfS4auB.Phu.ShzOi.qYNapk82hIayt4dRlJtHk7Rw2', 0, 'no_image.png', NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ordering`
--
ALTER TABLE `ordering`
  ADD PRIMARY KEY (`orderID`),
  ADD UNIQUE KEY `userID` (`userID`,`seriesID`);

--
-- A tábla indexei `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ratingID`),
  ADD UNIQUE KEY `userID` (`userID`,`seriesID`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`seriesID`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ordering`
--
ALTER TABLE `ordering`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rendelés azonosítója', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `rating`
--
ALTER TABLE `rating`
  MODIFY `ratingID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'értékelés azonosítója', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `termek`
--
ALTER TABLE `termek`
  MODIFY `seriesID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'termék azonosítója', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
