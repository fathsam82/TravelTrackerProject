-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema traveltrackerdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `traveltrackerdb` ;

-- -----------------------------------------------------
-- Schema traveltrackerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `traveltrackerdb` DEFAULT CHARACTER SET utf8 ;
USE `traveltrackerdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state` ;

CREATE TABLE IF NOT EXISTS `state` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip_type` ;

CREATE TABLE IF NOT EXISTS `trip_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip` ;

CREATE TABLE IF NOT EXISTS `trip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `length_of_trip` INT NULL,
  `duration_of_trip` INT NULL,
  `user_id` INT NOT NULL,
  `trip_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trip_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_trip_trip_type1_idx` (`trip_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_trip_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_trip_type1`
    FOREIGN KEY (`trip_type_id`)
    REFERENCES `trip_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trip_state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trip_state` ;

CREATE TABLE IF NOT EXISTS `trip_state` (
  `trip_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  INDEX `fk_trip_state_trip_idx` (`trip_id` ASC) VISIBLE,
  INDEX `fk_trip_state_state1_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `fk_trip_state_trip`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_state_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `destination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `destination` ;

CREATE TABLE IF NOT EXISTS `destination` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `trip_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_destination_trip1_idx` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `fk_destination_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `experience`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `experience` ;

CREATE TABLE IF NOT EXISTS `experience` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `summary` VARCHAR(1000) NULL,
  `image_url` VARCHAR(500) NULL,
  `trip_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experience_trip1_idx` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `fk_experience_trip1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `trip` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS traveltrackeruser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'traveltrackeruser'@'localhost' IDENTIFIED BY 'traveltrackeruser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'traveltrackeruser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `traveltrackerdb`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `enabled`, `role`) VALUES (1, 'samwise', 'lol@aol.com', '$2a$10$tu5Pm.mGfjl7aMpjJ9e5aeZ9Q4cDQUN16bS5cxLxTU56EmO8rhEKe', 1, 'standard');

COMMIT;


-- -----------------------------------------------------
-- Data for table `state`
-- -----------------------------------------------------
START TRANSACTION;
USE `traveltrackerdb`;
INSERT INTO `state` (`id`, `name`) VALUES (1, 'Alabama');
INSERT INTO `state` (`id`, `name`) VALUES (2, 'Alaska');
INSERT INTO `state` (`id`, `name`) VALUES (3, 'Arizona');
INSERT INTO `state` (`id`, `name`) VALUES (4, 'Arkansas');
INSERT INTO `state` (`id`, `name`) VALUES (5, 'California');
INSERT INTO `state` (`id`, `name`) VALUES (6, 'Colorado');
INSERT INTO `state` (`id`, `name`) VALUES (7, 'Connecticut');
INSERT INTO `state` (`id`, `name`) VALUES (8, 'Delaware');
INSERT INTO `state` (`id`, `name`) VALUES (9, 'Florida');
INSERT INTO `state` (`id`, `name`) VALUES (10, 'Georgia');
INSERT INTO `state` (`id`, `name`) VALUES (11, 'Hawaii');
INSERT INTO `state` (`id`, `name`) VALUES (12, 'Idaho');
INSERT INTO `state` (`id`, `name`) VALUES (13, 'Illinois');
INSERT INTO `state` (`id`, `name`) VALUES (14, 'Indiana');
INSERT INTO `state` (`id`, `name`) VALUES (15, 'Iowa');
INSERT INTO `state` (`id`, `name`) VALUES (16, 'Kansas');
INSERT INTO `state` (`id`, `name`) VALUES (17, 'Kentucky');
INSERT INTO `state` (`id`, `name`) VALUES (18, 'Louisiana');
INSERT INTO `state` (`id`, `name`) VALUES (19, 'Maine');
INSERT INTO `state` (`id`, `name`) VALUES (20, 'Maryland');
INSERT INTO `state` (`id`, `name`) VALUES (21, 'Massachusetts');
INSERT INTO `state` (`id`, `name`) VALUES (22, 'Michigan');
INSERT INTO `state` (`id`, `name`) VALUES (23, 'Minnesota');
INSERT INTO `state` (`id`, `name`) VALUES (24, 'Mississippi');
INSERT INTO `state` (`id`, `name`) VALUES (25, 'Missouri');
INSERT INTO `state` (`id`, `name`) VALUES (26, 'Montana');
INSERT INTO `state` (`id`, `name`) VALUES (27, 'Nebraska');
INSERT INTO `state` (`id`, `name`) VALUES (28, 'Nevada');
INSERT INTO `state` (`id`, `name`) VALUES (29, 'New Hampshire');
INSERT INTO `state` (`id`, `name`) VALUES (30, 'New Jersey');
INSERT INTO `state` (`id`, `name`) VALUES (31, 'New Mexico ');
INSERT INTO `state` (`id`, `name`) VALUES (32, 'New York');
INSERT INTO `state` (`id`, `name`) VALUES (33, 'North Carolina');
INSERT INTO `state` (`id`, `name`) VALUES (34, 'North Dakota');
INSERT INTO `state` (`id`, `name`) VALUES (35, 'Ohio');
INSERT INTO `state` (`id`, `name`) VALUES (36, 'Oklahoma');
INSERT INTO `state` (`id`, `name`) VALUES (37, 'Oregon');
INSERT INTO `state` (`id`, `name`) VALUES (38, 'Pennsylvania');
INSERT INTO `state` (`id`, `name`) VALUES (39, 'Rhode Island');
INSERT INTO `state` (`id`, `name`) VALUES (40, 'South Carolina');
INSERT INTO `state` (`id`, `name`) VALUES (41, 'South Dakota');
INSERT INTO `state` (`id`, `name`) VALUES (42, 'Tennesee');
INSERT INTO `state` (`id`, `name`) VALUES (43, 'Texas');
INSERT INTO `state` (`id`, `name`) VALUES (44, 'Utah');
INSERT INTO `state` (`id`, `name`) VALUES (45, 'Vermont');
INSERT INTO `state` (`id`, `name`) VALUES (46, 'Virginia');
INSERT INTO `state` (`id`, `name`) VALUES (47, 'Washington');
INSERT INTO `state` (`id`, `name`) VALUES (48, 'West Virginia');
INSERT INTO `state` (`id`, `name`) VALUES (49, 'Wisconsin');
INSERT INTO `state` (`id`, `name`) VALUES (50, 'Wyoming');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `traveltrackerdb`;
INSERT INTO `trip_type` (`id`, `name`) VALUES (1, 'vacation');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `traveltrackerdb`;
INSERT INTO `trip` (`id`, `length_of_trip`, `duration_of_trip`, `user_id`, `trip_type_id`) VALUES (1, NULL, NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trip_state`
-- -----------------------------------------------------
START TRANSACTION;
USE `traveltrackerdb`;
INSERT INTO `trip_state` (`trip_id`, `state_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `destination`
-- -----------------------------------------------------
START TRANSACTION;
USE `traveltrackerdb`;
INSERT INTO `destination` (`id`, `name`, `trip_id`) VALUES (1, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `experience`
-- -----------------------------------------------------
START TRANSACTION;
USE `traveltrackerdb`;
INSERT INTO `experience` (`id`, `summary`, `image_url`, `trip_id`) VALUES (DEFAULT, NULL, NULL, 1);

COMMIT;

