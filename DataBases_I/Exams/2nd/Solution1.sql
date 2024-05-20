-- MySQL Script generated by MySQL Workbench
-- dom 19 may 2024 02:22:51
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Almacén`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Almacén` (
  `IDAlmacén` INT NOT NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Condado` VARCHAR(45) NULL,
  `CódigoPostal` INT NULL,
  `País` VARCHAR(45) NULL,
  `Teléfono` INT NULL,
  PRIMARY KEY (`IDAlmacén`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamentos` (
  `IDDepartamentos` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`IDDepartamentos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Existencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Existencias` (
  `DNI` INT NOT NULL,
  `Descripción` VARCHAR(100) NULL,
  `Precio` DECIMAL NULL,
  `CantidadEnStock` INT NULL,
  `IDAlmacén` INT NOT NULL,
  PRIMARY KEY (`DNI`, `IDAlmacén`),
  INDEX `fk_Existencias_Almacén1_idx` (`IDAlmacén` ASC) VISIBLE,
  CONSTRAINT `fk_Existencias_Almacén1`
    FOREIGN KEY (`IDAlmacén`)
    REFERENCES `mydb`.`Almacén` (`IDAlmacén`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orden` (
  `ID_Orden` INT NOT NULL,
  `FechaPedido` DATE NULL,
  `FechaEnvio` DATE NULL,
  `TipoDePago` VARCHAR(45) NULL,
  `ID_Tienda` INT NOT NULL,
  `IDDepartamentos` INT NOT NULL,
  `DNI` INT NOT NULL,
  PRIMARY KEY (`ID_Orden`, `ID_Tienda`, `IDDepartamentos`, `DNI`),
  INDEX `fk_Orden_Tienda_idx` (`ID_Tienda` ASC) VISIBLE,
  INDEX `fk_Orden_Departamentos1_idx` (`IDDepartamentos` ASC) VISIBLE,
  INDEX `fk_Orden_Existencias1_idx` (`DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Orden_Tienda`
    FOREIGN KEY (`ID_Tienda`)
    REFERENCES `mydb`.`Tienda` (`ID_Tienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orden_Departamentos1`
    FOREIGN KEY (`IDDepartamentos`)
    REFERENCES `mydb`.`Departamentos` (`IDDepartamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orden_Existencias1`
    FOREIGN KEY (`DNI`)
    REFERENCES `mydb`.`Existencias` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tienda` (
  `ID_Tienda` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Dirección` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `País` VARCHAR(45) NULL,
  `CódigoPostal` INT NULL,
  `Condado` VARCHAR(45) NULL,
  `Teléfono` INT NULL,
  `Comentarios` VARCHAR(200) NULL,
  PRIMARY KEY (`ID_Tienda`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
