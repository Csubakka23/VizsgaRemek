-- Egyszerűsített, magyarított adatbázis SmartBook-hoz

DROP DATABASE IF EXISTS `idopontfoglalas`;
CREATE DATABASE `idopontfoglalas`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE `idopontfoglalas`;

-- ==========================
-- Tábla: felhasznalok
-- ==========================

CREATE TABLE `felhasznalok` (
  `id`            BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `teljes_nev`    VARCHAR(150)    NOT NULL,
  `email`         VARCHAR(255)    NOT NULL,
  `jelszo_hash`   VARCHAR(255)    NOT NULL,
  `telefon`       VARCHAR(30)     DEFAULT NULL,
  `aktiv`         TINYINT(1)      NOT NULL DEFAULT 1,
  `letrehozva`    TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modositva`     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ==========================
-- Tábla: szolgaltatasok
-- ==========================

CREATE TABLE `szolgaltatasok` (
  `id`               INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  `nev`              VARCHAR(150)  NOT NULL,
  `leiras`           TEXT          DEFAULT NULL,
  `idotartam_perc`   INT UNSIGNED  NOT NULL,
  `ar`               DECIMAL(10,2) DEFAULT 0,
  `aktiv`            TINYINT(1)    NOT NULL DEFAULT 1,
  `letrehozva`       TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modositva`        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_szolgaltatas_nev` (`nev`(50))
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ==========================
-- Tábla: dolgozok
-- ==========================

CREATE TABLE `dolgozok` (
  `id`             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nev`            VARCHAR(150)    NOT NULL,
  `szakterulet`    VARCHAR(150)    DEFAULT NULL,
  `email`          VARCHAR(255)    DEFAULT NULL,
  `telefon`        VARCHAR(30)     DEFAULT NULL,
  `rovid_bemutatas` TEXT           DEFAULT NULL,
  `aktiv`          TINYINT(1)      NOT NULL DEFAULT 1,
  `letrehozva`     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modositva`      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ==========================
-- Tábla: foglalasok
-- ==========================

CREATE TABLE `foglalasok` (
  `id`               BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `felhasznalo_id`   BIGINT UNSIGNED DEFAULT NULL,   -- ha NULL, lehet vendég foglalás
  `dolgozo_id`       BIGINT UNSIGNED NOT NULL,
  `szolgaltatas_id`  INT UNSIGNED    NOT NULL,
  `kezdes_idopont`   DATETIME        NOT NULL,
  `vege_idopont`     DATETIME        NOT NULL,
  `allapot`          ENUM('varakozik','megerositve','lemondva','befejezve')
                     NOT NULL DEFAULT 'varakozik',
  `ugyfel_nev`       VARCHAR(150)    NOT NULL,
  `ugyfel_email`     VARCHAR(255)    NOT NULL,
  `ugyfel_telefon`   VARCHAR(30)     DEFAULT NULL,
  `letrehozva`       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modositva`        TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_dolgozo_idopont` (`dolgozo_id`,`kezdes_idopont`),
  KEY `idx_allapot` (`allapot`),
  CONSTRAINT `fk_foglalas_felhasznalo`
    FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok`(`id`)
    ON DELETE SET NULL,
  CONSTRAINT `fk_foglalas_dolgozo`
    FOREIGN KEY (`dolgozo_id`) REFERENCES `dolgozok`(`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_foglalas_szolgaltatas`
    FOREIGN KEY (`szolgaltatas_id`) REFERENCES `szolgaltatasok`(`id`)
    ON DELETE RESTRICT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ==========================
-- DEMO ADATOK (opcionális)
-- ==========================

INSERT INTO `felhasznalok` (`teljes_nev`,`email`,`jelszo_hash`,`telefon`)
VALUES
  ('Rendszergazda Admin','admin@smartbook.hu','admin','+3612345678'),
  ('Teszt Felhasználó','user@smartbook.hu','user',NULL);

INSERT INTO `szolgaltatasok` (`nev`,`leiras`,`idotartam_perc`,`ar`,`aktiv`)
VALUES
  ('Hajvágás (30 perc)','Alap hajvágás, igazítás.','30',6000,1),
  ('Szőrtelenítés (45 perc)','Kezelés választott területre.','45',9000,1);

INSERT INTO `dolgozok` (`nev`,`szakterulet`,`email`,`telefon`,`rovid_bemutatas`)
VALUES
  ('Anna','Fodrász','anna@smartbook.hu','+3611111111','Női és férfi hajvágás, festés.'),
  ('Béla','Kozmetikus','bela@smartbook.hu','+3622222222','Kozmetikai kezelések, szőrtelenítés.');

