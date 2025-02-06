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
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_state_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_state_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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
INSERT INTO `user` (`id`, `username`, `email`, `password`, `enabled`, `role`) VALUES (1, 'samwise', 'lol@aol.com', '123', 1, 'standard');

COMMIT;


-- -----------------------------------------------------
-- Data for table `state`
-- -----------------------------------------------------
START TRANSACTION;
USE `traveltrackerdb`;
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (1, 'Alabama', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (2, 'Alaska', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (3, 'Arizona', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (4, 'Arkansas', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (5, 'California', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (6, 'Colorado', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (7, 'Connecticut', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (8, 'Delaware', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (9, 'Florida', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (10, 'Georgia', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (11, 'Hawaii', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (12, 'Idaho', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (13, 'Illinois', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (14, 'Indiana', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (15, 'Iowa', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (16, 'Kansas', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (17, 'Kentucky', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (18, 'Louisiana', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (19, 'Maine', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (20, 'Maryland', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (21, 'Massachusetts', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (22, 'Michigan', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (23, 'Minnesota', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (24, 'Mississippi', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (25, 'Missouri', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (26, 'Montana', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (27, 'Nebraska', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (28, 'Nevada', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (29, 'New Hampshire', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (30, 'New Jersey', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (31, 'New Mexico ', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (32, 'New York', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (33, 'North Carolina', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (34, 'North Dakota', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (35, 'Ohio', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (36, 'Oklahoma', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (37, 'Oregon', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (38, 'Pennsylvania', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (39, 'Rhode Island', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (40, 'South Carolina', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (41, 'South Dakota', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (42, 'Tennesee', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (43, 'Texas', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (44, 'Utah', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (45, 'Vermont', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (46, 'Virginia', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (47, 'Washington', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (48, 'West Virginia', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (49, 'Wisconsin', 1);
INSERT INTO `state` (`id`, `name`, `user_id`) VALUES (50, 'Wyoming', 1);

COMMIT;

