-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema yahooFinNew
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema yahooFinNew
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yahooFinNew` DEFAULT CHARACTER SET utf8 ;
USE `yahooFinNew` ;

-- -----------------------------------------------------
-- Table `yahooFinNew`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yahooFinNew`.`company` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `ticker` VARCHAR(45) NULL,
  `exchange` VARCHAR(45) NULL,
  `percentChangeAfterHours` REAL NULL,
  `visitorTrend` DOUBLE NULL,
  `percentchange` REAL NULL,
  `price` FLOAT NULL,
  `afterHoursPrice` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yahooFinNew`.`listOfStocks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yahooFinNew`.`listOfStocks` (
  `id` INT NOT NULL,
  `ticker` VARCHAR(45) NULL,
  `lastPrice` VARCHAR(45) NULL,
  `pricechange` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yahooFinNew`.`company-addToWatchlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yahooFinNew`.`company-addToWatchlist` (
  `companyId` INT NOT NULL,
  `listOfStocksId` INT NOT NULL,
  `watch` TINYINT NULL,
  PRIMARY KEY (`companyId`, `listOfStocksId`),
  INDEX `company-addToWatchlistToaddToWatchlist_idx` (`listOfStocksId` ASC) VISIBLE,
  CONSTRAINT `company-addToWatchlistToCompany`
    FOREIGN KEY (`companyId`)
    REFERENCES `yahooFinNew`.`company` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `company-listOfStocksToListOfStocks`
    FOREIGN KEY (`listOfStocksId`)
    REFERENCES `yahooFinNew`.`listOfStocks` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
