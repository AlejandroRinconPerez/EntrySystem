-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema entrysystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema entrysystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `entrysystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `entrysystem` ;

-- -----------------------------------------------------
-- Table `entrysystem`.`base_class_people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`base_class_people` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cedula` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `telefono` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`company` (
  `id_company` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_company`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`people` (
  `person_type` BIT(1) NULL DEFAULT NULL,
  `id` BIGINT NOT NULL,
  `id_company` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKlp2uqupq3n3jxbdbr8i53ih3p` (`id_company` ASC) VISIBLE,
  CONSTRAINT `FK7iwetifsjr1tsj6qygmy2fil5`
    FOREIGN KEY (`id`)
    REFERENCES `entrysystem`.`base_class_people` (`id`),
  CONSTRAINT `FKlp2uqupq3n3jxbdbr8i53ih3p`
    FOREIGN KEY (`id_company`)
    REFERENCES `entrysystem`.`company` (`id_company`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`access`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`access` (
  `access_type` BIT(1) NULL DEFAULT NULL,
  `entry_access` DATE NOT NULL,
  `exit_access` DATE NULL DEFAULT NULL,
  `id_access` BIGINT NOT NULL AUTO_INCREMENT,
  `id_people` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_access`),
  INDEX `FKfb473nf0j8v25v35cpw8n8ork` (`id_people` ASC) VISIBLE,
  CONSTRAINT `FKfb473nf0j8v25v35cpw8n8ork`
    FOREIGN KEY (`id_people`)
    REFERENCES `entrysystem`.`people` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`access_note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`access_note` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `id_access` BIGINT NOT NULL,
  `note` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKkcg4aalv8ilqf1n1hcr04rjtc` (`id_access` ASC) VISIBLE,
  CONSTRAINT `FKkcg4aalv8ilqf1n1hcr04rjtc`
    FOREIGN KEY (`id_access`)
    REFERENCES `entrysystem`.`access` (`id_access`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`porters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`porters` (
  `employment_date` DATE NULL DEFAULT NULL,
  `position` BIT(1) NULL DEFAULT NULL,
  `id` BIGINT NOT NULL,
  `id_jefe` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKb62nnbfst3q5suvxqhvmt8r4c` (`id_jefe` ASC) VISIBLE,
  CONSTRAINT `FKb62nnbfst3q5suvxqhvmt8r4c`
    FOREIGN KEY (`id_jefe`)
    REFERENCES `entrysystem`.`porters` (`id`),
  CONSTRAINT `FKireqi2yxsogbix4f5f5690xsl`
    FOREIGN KEY (`id`)
    REFERENCES `entrysystem`.`base_class_people` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`access_porters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`access_porters` (
  `access_id` BIGINT NOT NULL,
  `porters_id` BIGINT NOT NULL,
  PRIMARY KEY (`access_id`, `porters_id`),
  INDEX `FKloyhekuv3xmi4qkdeqvwwrach` (`porters_id` ASC) VISIBLE,
  CONSTRAINT `FKfvp359pwgiy97yao6edqpmpsr`
    FOREIGN KEY (`access_id`)
    REFERENCES `entrysystem`.`access` (`id_access`),
  CONSTRAINT `FKloyhekuv3xmi4qkdeqvwwrach`
    FOREIGN KEY (`porters_id`)
    REFERENCES `entrysystem`.`porters` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`carnet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`carnet` (
  `status` BIT(1) NOT NULL,
  `id_carnet` BIGINT NOT NULL AUTO_INCREMENT,
  `id_people` BIGINT NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_carnet`),
  UNIQUE INDEX `UKcl2tpuo3jevvugcrcbw5fdswl` (`id_people` ASC) VISIBLE,
  UNIQUE INDEX `UKjmmw25flpocst6kve4swahqmk` (`code` ASC) VISIBLE,
  CONSTRAINT `FKt6xx8i3cy8xggfrkjfc95jn1s`
    FOREIGN KEY (`id_people`)
    REFERENCES `entrysystem`.`people` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`membership` (
  `duration` INT NULL DEFAULT NULL,
  `price` DOUBLE NULL DEFAULT NULL,
  `vehicle_type` BIT(1) NULL DEFAULT NULL,
  `id_membership` BIGINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_membership`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`invoice` (
  `date` DATE NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `id_invoice` BIGINT NOT NULL AUTO_INCREMENT,
  `id_membership` BIGINT NULL DEFAULT NULL,
  `id_people` BIGINT NULL DEFAULT NULL,
  `id_porter` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_invoice`),
  INDEX `FKb8icstyo8djdy5m05judlfd08` (`id_membership` ASC) VISIBLE,
  INDEX `FKj21j6fl0ju8b5151tdgto3gt5` (`id_people` ASC) VISIBLE,
  INDEX `FKhtnsu5xxjjkjv9x1h5j8ri1uw` (`id_porter` ASC) VISIBLE,
  CONSTRAINT `FKb8icstyo8djdy5m05judlfd08`
    FOREIGN KEY (`id_membership`)
    REFERENCES `entrysystem`.`membership` (`id_membership`),
  CONSTRAINT `FKhtnsu5xxjjkjv9x1h5j8ri1uw`
    FOREIGN KEY (`id_porter`)
    REFERENCES `entrysystem`.`porters` (`id`),
  CONSTRAINT `FKj21j6fl0ju8b5151tdgto3gt5`
    FOREIGN KEY (`id_people`)
    REFERENCES `entrysystem`.`people` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`registered_equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`registered_equipment` (
  `registration_date` DATE NOT NULL,
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `id_people` BIGINT NOT NULL,
  `serial` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK4pqqq1sqge560antvjfhkpl9f` (`serial` ASC) VISIBLE,
  INDEX `FKhat76rt9n46c9v6xx0gccbp88` (`id_people` ASC) VISIBLE,
  CONSTRAINT `FKhat76rt9n46c9v6xx0gccbp88`
    FOREIGN KEY (`id_people`)
    REFERENCES `entrysystem`.`people` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `id_porters` BIGINT NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `user_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UKhjtrgfs83tbhyle82udkuq6md` (`id_porters` ASC) VISIBLE,
  UNIQUE INDEX `UKlqjrcobrh9jc8wpcar64q1bfh` (`user_name` ASC) VISIBLE,
  CONSTRAINT `FK_user_porters`
    FOREIGN KEY (`id_porters`)
    REFERENCES `entrysystem`.`porters` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entrysystem`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entrysystem`.`vehicle` (
  `vehicle_type` BIT(1) NOT NULL,
  `id_access` BIGINT NULL DEFAULT NULL,
  `id_people` BIGINT NOT NULL,
  `id_vehicle` BIGINT NOT NULL AUTO_INCREMENT,
  `plate` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_vehicle`),
  UNIQUE INDEX `UKdptrc1lh70j3qrg5v38fmmw7g` (`plate` ASC) VISIBLE,
  INDEX `FKaaui67fqa3jtxc747948bjpe0` (`id_access` ASC) VISIBLE,
  INDEX `FKckmk3wx17hbtgk8gnmu772ep4` (`id_people` ASC) VISIBLE,
  CONSTRAINT `FKaaui67fqa3jtxc747948bjpe0`
    FOREIGN KEY (`id_access`)
    REFERENCES `entrysystem`.`access` (`id_access`),
  CONSTRAINT `FKckmk3wx17hbtgk8gnmu772ep4`
    FOREIGN KEY (`id_people`)
    REFERENCES `entrysystem`.`people` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
