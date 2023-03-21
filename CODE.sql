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
CREATE SCHEMA IF NOT EXISTS `Clinica` DEFAULT CHARACTER SET utf8 ;
USE `Clinica` ;

-- -----------------------------------------------------
-- Table `Clinica`.`Ambulatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Ambulatorio` (
  `nroa` INT NOT NULL,
  `andar` VARCHAR(3) NOT NULL,
  `capacidade` SMALLINT NULL,
  PRIMARY KEY (`nroa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Medico` (
  `codm` INT NOT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT NOT NULL,
  `especialidade` VARCHAR(20) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `cidade` VARCHAR(30) NULL,
  `Ambulatorio_nroa` INT NOT NULL,
  PRIMARY KEY (`codm`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ) ,
  INDEX `fk_Medico_Ambulatorio1_idx` (`Ambulatorio_nroa` ) ,
  CONSTRAINT `fk_Medico_Ambulatorio1`
    FOREIGN KEY (`Ambulatorio_nroa`)
    REFERENCES `mydb`.`Ambulatorio` (`nroa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Paciente` (
  `codp` INT NOT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT NOT NULL,
  `cidade` VARCHAR(30) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `doenca` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`codp`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ) ,
  UNIQUE INDEX `doenca_UNIQUE` (`doenca` ) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Funcionario` (
  `codf` INT NOT NULL,
  `nome` VARCHAR(40) NOT NULL,
  `idade` SMALLINT NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `salario` DECIMAL(10) NULL,
  `cargo` VARCHAR(20) NULL,
   `cidade` VARCHAR(30) NULL,
  PRIMARY KEY (`codf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinica`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinica`.`Consulta` (
  `data` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `Medico_codm` INT NOT NULL,
  `Paciente_codp` INT NOT NULL,
  INDEX `fk_Consulta_Medico_idx` (`Medico_codm` ) ,
  INDEX `fk_Consulta_Paciente1_idx` (`Paciente_codp` ) ,
  PRIMARY KEY (`Medico_codm`, `hora`, `data`),
  CONSTRAINT `fk_Consulta_Medico`
    FOREIGN KEY (`Medico_codm`)
    REFERENCES `mydb`.`Medico` (`codm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Paciente1`
    FOREIGN KEY (`Paciente_codp`)
    REFERENCES `mydb`.`Paciente` (`codp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#3
ALTER TABLE Funcionario ADD nroa int;

#4
alter table medico add index idx_cpf (cpf);
alter table paciente add index idx_doenca (doenca);

#5
DROP INDEX idx_doenca ON paciente;

#6
ALTER TABLE Funcionario DROP COLUMN cargo;
ALTER TABLE Funcionario DROP COLUMN nroa;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
