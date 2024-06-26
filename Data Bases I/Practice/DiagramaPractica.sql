-- MySQL Script generated by MySQL Workbench
-- Mon May  6 02:59:43 2024
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
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `categoria_id` INT NOT NULL,
  `proveedor` VARCHAR(45) NULL,
  PRIMARY KEY (`categoria_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedores` (
  `proveedor_id` INT NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `pagina_web` VARCHAR(45) NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`categoria_id`, `proveedor_id`),
  UNIQUE INDEX `pagina_web_UNIQUE` (`pagina_web` ASC) VISIBLE,
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  UNIQUE INDEX `direccion_UNIQUE` (`direccion` ASC) VISIBLE,
  UNIQUE INDEX `proveedor_id_UNIQUE` (`proveedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveedores_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `mydb`.`categoria` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transaccion` (
  `transaccion_id` INT NOT NULL,
  `fecha` DATE NULL,
  `cliente` VARCHAR(45) NULL,
  `descuento` VARCHAR(45) NULL,
  `importe` VARCHAR(45) NULL,
  `unidades` INT NULL,
  `precio` DECIMAL NULL,
  PRIMARY KEY (`transaccion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `cliente_id` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  `descripccion` VARCHAR(200) NULL,
  `direccion_nueva` VARCHAR(100) NULL,
  `direccion_vieja` VARCHAR(100) NULL,
  `numero_nuevo` INT NULL,
  `numero_viejo` INT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE,
  UNIQUE INDEX `cliente_id_UNIQUE` (`cliente_id` ASC) VISIBLE,
  UNIQUE INDEX `contraseña_UNIQUE` (`contraseña` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productos` (
  `productos_id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `precio` DECIMAL NULL,
  `stock` INT NULL,
  `proveedor` INT NOT NULL,
  `categoria` INT NOT NULL,
  PRIMARY KEY (`productos_id`, `categoria`, `proveedor`),
  INDEX `fk_productos_categoria_idx` (`categoria` ASC) VISIBLE,
  INDEX `fk_productos_proveedores1_idx` (`proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_productos_categoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `mydb`.`categoria` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_proveedores1`
    FOREIGN KEY (`proveedor`)
    REFERENCES `mydb`.`proveedores` (`direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
