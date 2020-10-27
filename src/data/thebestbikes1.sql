-- MySQL Script generated by MySQL Workbench
-- Mon Oct 12 16:30:39 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS
, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS
, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE
, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema thebestbikes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema thebestbikes
-- -----------------------------------------------------
CREATE SCHEMA
IF NOT EXISTS `thebestbikes` DEFAULT CHARACTER
SET utf8mb4 ;
USE `thebestbikes`
;

-- -----------------------------------------------------
-- Table `thebestbikes`.`categories`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `thebestbikes`.`categories`
(
  `id` INT
(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR
(45) NOT NULL,
  `foto` VARCHAR
(45) NULL DEFAULT NULL,
  PRIMARY KEY
(`id`))
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8mb4;


-- -----------------------------------------------------
-- Table `thebestbikes`.`products`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `thebestbikes`.`products`
(
  `id` INT
(11) NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR
(45) NOT NULL,
  `nombre` VARCHAR
(100) NOT NULL,
  `precio` INT
(11) NOT NULL,
  `color` VARCHAR
(30) NULL DEFAULT NULL,
  `descripcion` MEDIUMTEXT NULL DEFAULT NULL,
  `fotos` VARCHAR
(255) NULL DEFAULT NULL,
  `categoria_id` INT
(11) NOT NULL,
  PRIMARY KEY
(`id`),
  INDEX `categoria_id_idx`
(`categoria_id` ASC),
  CONSTRAINT `id_categorie`
    FOREIGN KEY
(`categoria_id`)
    REFERENCES `thebestbikes`.`categories`
(`id`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8mb4;


-- -----------------------------------------------------
-- Table `thebestbikes`.`users`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `thebestbikes`.`users`
(
  `id` INT
(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR
(45) NOT NULL,
  `apellido` VARCHAR
(45) NOT NULL,
  `email` VARCHAR
(45) NOT NULL,
  `fecha de nacimiento` DATE NULL DEFAULT NULL,
  `imagen` VARCHAR
(45) NULL DEFAULT NULL,
  `password` VARCHAR
(100) NOT NULL,
  `domicilio` VARCHAR
(45) NULL DEFAULT NULL,
  PRIMARY KEY
(`id`))
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8mb4;


-- -----------------------------------------------------
-- Table `thebestbikes`.`sale-buy`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `thebestbikes`.`sale-buy`
(
  `id` INT
(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` INT
(11) NOT NULL,
  `id_producto` INT
(11) NOT NULL,
  PRIMARY KEY
(`id`),
  INDEX `id_producto_idx`
(`id_producto` ASC),
  INDEX `id_usuario`
(`id_usuario` ASC),
  CONSTRAINT `id_producto`
    FOREIGN KEY
(`id_producto`)
    REFERENCES `thebestbikes`.`products`
(`id`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `id_usuario`
    FOREIGN KEY
(`id_usuario`)
    REFERENCES `thebestbikes`.`users`
(`id`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8mb4;


SET SQL_MODE
=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS
=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS
=@OLD_UNIQUE_CHECKS;
