-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Már 05. 10:35
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `idopontfoglalas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dolgozok`
--

CREATE TABLE `dolgozok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `szalon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nev` varchar(150) NOT NULL,
  `szakterulet` varchar(150) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `rovid_bemutatas` text DEFAULT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `letrehozva` timestamp NOT NULL DEFAULT current_timestamp(),
  `modositva` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `dolgozok`
--

INSERT INTO `dolgozok` (`id`, `szalon_id`, `nev`, `szakterulet`, `email`, `telefon`, `rovid_bemutatas`, `aktiv`, `letrehozva`, `modositva`) VALUES
(1, 1, 'Anna', 'Fodrászat', 'anna@smartbook.hu', '+3611111111', 'Női és férfi hajvágás, festés.', 1, '2026-03-05 07:10:51', '2026-03-05 09:19:56'),
(2, NULL, 'Béla', 'Kozmetikus', 'bela@smartbook.hu', '+3622222222', 'Kozmetikai kezelések, szőrtelenítés.', 1, '2026-03-05 07:10:51', '2026-03-05 07:10:51'),
(3, NULL, 'Pető Ádám', 'Autószerelő', NULL, NULL, NULL, 1, '2026-03-05 07:31:22', '2026-03-05 07:31:22'),
(4, 2, 'Angyal Eszter', 'Fodrászat', 'eszter@angelstudio.hu', '+36301112233', 'Női hajvágás, balayage, alkalmi frizurák.', 1, '2026-03-05 09:19:56', '2026-03-05 09:19:56'),
(5, 2, 'Kata', 'Fodrászat', 'kata@angelstudio.hu', '+36302223344', 'Festés, keratinos kezelés, hajápolás.', 1, '2026-03-05 09:19:56', '2026-03-05 09:19:56'),
(6, 3, 'Gergő', 'Fodrászat', 'gergo@barbershop.hu', '+36303334455', 'Férfi hajvágás, skin fade, borotválás.', 1, '2026-03-05 09:19:56', '2026-03-05 09:19:56'),
(7, 3, 'Márk', 'Fodrászat', 'mark@barbershop.hu', '+36304445566', 'Szakáll igazítás, klasszikus barber stílus.', 1, '2026-03-05 09:19:56', '2026-03-05 09:19:56');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teljes_nev` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `jelszo_hash` varchar(255) NOT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `letrehozva` timestamp NOT NULL DEFAULT current_timestamp(),
  `modositva` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `teljes_nev`, `email`, `jelszo_hash`, `telefon`, `aktiv`, `letrehozva`, `modositva`) VALUES
(2, 'Teszt Felhasználó', 'user@smartbook.hu', 'user', NULL, 1, '2026-03-05 07:10:51', '2026-03-05 07:10:51'),
(3, 'Rekecki Alex', 'alexrekecki@gmail.com', '$2y$10$5SyzqvOUxEm2vkVku6nZbeydGb7jumcX21qeJbpjWUuchH30/tT9u', NULL, 1, '2026-03-05 07:11:28', '2026-03-05 07:11:28'),
(4, 'Admin', 'admin@smartbook.hu', '$2y$10$HUSDwNqDoTYFXRvDe7T3Y.itGbWAOUhIjMwuhxMMkcCb9CFjAUGn2', NULL, 1, '2026-03-05 07:30:50', '2026-03-05 07:30:50'),
(5, 'ujfiok', 'ujfiok@gmail.com', '$2y$10$TSkAeVEyxLE5rVZyoe.A1eJvOAhqtZ1HviShea9aKqmcZIMDtvWwe', NULL, 1, '2026-03-05 07:35:59', '2026-03-05 07:35:59');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foglalasok`
--

CREATE TABLE `foglalasok` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `idopont_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `foglalasok`
--

INSERT INTO `foglalasok` (`id`, `user_id`, `idopont_id`, `created_at`) VALUES
(1, 3, 31, '2026-03-05 07:51:19'),
(2, 3, 31, '2026-03-05 07:53:15'),
(3, 3, 31, '2026-03-05 07:54:51'),
(4, 3, 31, '2026-03-05 07:54:55'),
(5, 3, 31, '2026-03-05 07:55:05'),
(6, 3, 36, '2026-03-05 09:26:30'),
(7, 3, 36, '2026-03-05 09:28:37'),
(8, 3, 36, '2026-03-05 09:29:18');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `idopontok`
--

CREATE TABLE `idopontok` (
  `id` int(10) UNSIGNED NOT NULL,
  `datum` date NOT NULL,
  `ido` time NOT NULL,
  `foglalt` tinyint(1) NOT NULL DEFAULT 0,
  `szalon_id` int(10) UNSIGNED NOT NULL,
  `dolgozo_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `idopontok`
--

INSERT INTO `idopontok` (`id`, `datum`, `ido`, `foglalt`, `szalon_id`, `dolgozo_id`) VALUES
(31, '2026-03-05', '10:00:00', 1, 1, 1),
(32, '2026-03-05', '11:00:00', 0, 1, 1),
(33, '2026-03-06', '14:00:00', 0, 1, 1),
(34, '2026-03-06', '15:30:00', 0, 1, 1),
(35, '2026-03-07', '09:00:00', 0, 1, 1),
(36, '2026-03-05', '09:00:00', 1, 2, 4),
(37, '2026-03-05', '10:00:00', 0, 2, 4),
(38, '2026-03-05', '11:30:00', 0, 2, 4),
(39, '2026-03-06', '14:00:00', 0, 2, 4),
(40, '2026-03-06', '15:00:00', 0, 2, 4),
(41, '2026-03-05', '12:00:00', 0, 2, 5),
(42, '2026-03-05', '13:00:00', 0, 2, 5),
(43, '2026-03-06', '10:00:00', 0, 2, 5),
(44, '2026-03-06', '11:00:00', 0, 2, 5),
(45, '2026-03-07', '09:30:00', 0, 2, 5),
(46, '2026-03-05', '10:00:00', 0, 3, 6),
(47, '2026-03-05', '10:30:00', 0, 3, 6),
(48, '2026-03-05', '11:00:00', 0, 3, 6),
(49, '2026-03-06', '16:00:00', 0, 3, 6),
(50, '2026-03-07', '17:00:00', 0, 3, 6),
(51, '2026-03-05', '12:00:00', 0, 3, 7),
(52, '2026-03-05', '12:30:00', 0, 3, 7),
(53, '2026-03-06', '09:00:00', 0, 3, 7),
(54, '2026-03-06', '09:30:00', 0, 3, 7),
(55, '2026-03-07', '14:00:00', 0, 3, 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szakteruletek`
--

CREATE TABLE `szakteruletek` (
  `id` int(10) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `szakteruletek`
--

INSERT INTO `szakteruletek` (`id`, `nev`) VALUES
(1, 'Fodrászat'),
(2, 'Kozmetika'),
(3, 'Manikűr'),
(4, 'Autószerelő');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szalonok`
--

CREATE TABLE `szalonok` (
  `id` int(10) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `szakterulet_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `szalonok`
--

INSERT INTO `szalonok` (`id`, `nev`, `szakterulet_id`) VALUES
(1, 'Alap fodrász szalon', 1),
(2, 'Angel Studio', 1),
(3, 'Barber Shop', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szolgaltatasok`
--

CREATE TABLE `szolgaltatasok` (
  `id` int(10) UNSIGNED NOT NULL,
  `nev` varchar(150) NOT NULL,
  `leiras` text DEFAULT NULL,
  `idotartam_perc` int(10) UNSIGNED NOT NULL,
  `ar` decimal(10,2) DEFAULT 0.00,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `letrehozva` timestamp NOT NULL DEFAULT current_timestamp(),
  `modositva` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `szolgaltatasok`
--

INSERT INTO `szolgaltatasok` (`id`, `nev`, `leiras`, `idotartam_perc`, `ar`, `aktiv`, `letrehozva`, `modositva`) VALUES
(1, 'Hajvágás (30 perc)', 'Alap hajvágás, igazítás.', 30, 6000.00, 1, '2026-03-05 07:10:51', '2026-03-05 07:10:51'),
(2, 'Szőrtelenítés (45 perc)', 'Kezelés választott területre.', 45, 9000.00, 1, '2026-03-05 07:10:51', '2026-03-05 07:10:51'),
(3, 'Gumis', NULL, 60, 15000.00, 1, '2026-03-05 07:31:16', '2026-03-05 07:31:16');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `dolgozok`
--
ALTER TABLE `dolgozok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dolgozok_szalon` (`szalon_id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_email` (`email`);

--
-- A tábla indexei `foglalasok`
--
ALTER TABLE `foglalasok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foglalasok_idopont` (`idopont_id`);

--
-- A tábla indexei `idopontok`
--
ALTER TABLE `idopontok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_idopontok_szalon` (`szalon_id`),
  ADD KEY `idx_idopontok_dolgozo` (`dolgozo_id`);

--
-- A tábla indexei `szakteruletek`
--
ALTER TABLE `szakteruletek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `szalonok`
--
ALTER TABLE `szalonok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_szalonok_szakterulet` (`szakterulet_id`);

--
-- A tábla indexei `szolgaltatasok`
--
ALTER TABLE `szolgaltatasok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_szolgaltatas_nev` (`nev`(50));

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `dolgozok`
--
ALTER TABLE `dolgozok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `foglalasok`
--
ALTER TABLE `foglalasok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `idopontok`
--
ALTER TABLE `idopontok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT a táblához `szakteruletek`
--
ALTER TABLE `szakteruletek`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `szalonok`
--
ALTER TABLE `szalonok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `szolgaltatasok`
--
ALTER TABLE `szolgaltatasok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `foglalasok`
--
ALTER TABLE `foglalasok`
  ADD CONSTRAINT `fk_foglalasok_idopont` FOREIGN KEY (`idopont_id`) REFERENCES `idopontok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `idopontok`
--
ALTER TABLE `idopontok`
  ADD CONSTRAINT `fk_idopontok_szalon` FOREIGN KEY (`szalon_id`) REFERENCES `szalonok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `szalonok`
--
ALTER TABLE `szalonok`
  ADD CONSTRAINT `fk_szalonok_szakterulet` FOREIGN KEY (`szakterulet_id`) REFERENCES `szakteruletek` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
