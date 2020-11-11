-- MySQL Workbench Synchronization
-- Generated: 2020-11-11 20:11
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Dodi

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `simklinik`.`b_tindakan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_tindakan` VARCHAR(250) NULL DEFAULT NULL,
  `tarif` DOUBLE NULL DEFAULT NULL,
  `is_active` VARCHAR(45) NULL DEFAULT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `simklinik`.`b_obat` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_obat` VARCHAR(512) NULL DEFAULT NULL,
  `satuan` VARCHAR(128) NULL DEFAULT NULL,
  `jenis_obat` VARCHAR(128) NULL DEFAULT NULL,
  `harga` DOUBLE NULL DEFAULT NULL,
  `is_active` CHAR(8) NULL DEFAULT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `simklinik`.`t_obat` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tanggal` DATE NULL DEFAULT NULL,
  `nama_obat` VARCHAR(500) NULL DEFAULT NULL,
  `harga` DOUBLE NULL DEFAULT NULL,
  `satuan` VARCHAR(45) NULL DEFAULT NULL,
  `jumlah` INT(11) NULL DEFAULT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `b_obat_id` INT(11) NOT NULL,
  `klinik_transaction_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_obat_b_obat1_idx` (`b_obat_id` ASC),
  INDEX `fk_t_obat_klinik_transaction1_idx` (`klinik_transaction_id` ASC),
  CONSTRAINT `fk_t_obat_b_obat1`
    FOREIGN KEY (`b_obat_id`)
    REFERENCES `simklinik`.`b_obat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_obat_klinik_transaction1`
    FOREIGN KEY (`klinik_transaction_id`)
    REFERENCES `simklinik`.`klinik_transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `simklinik`.`t_admin` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tanggal` DATE NULL DEFAULT NULL,
  `nama_admin` VARCHAR(500) NULL DEFAULT NULL,
  `harga` DOUBLE NULL DEFAULT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `b_admin_id` INT(11) NOT NULL,
  `klinik_transaction_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_admin_b_admin1_idx` (`b_admin_id` ASC),
  INDEX `fk_t_admin_klinik_transaction1_idx` (`klinik_transaction_id` ASC),
  CONSTRAINT `fk_t_admin_b_admin1`
    FOREIGN KEY (`b_admin_id`)
    REFERENCES `simklinik`.`b_admin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_admin_klinik_transaction1`
    FOREIGN KEY (`klinik_transaction_id`)
    REFERENCES `simklinik`.`klinik_transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `simklinik`.`t_tindakan` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tanggal` DATE NULL DEFAULT NULL,
  `nama_tindakan` VARCHAR(500) NULL DEFAULT NULL,
  `tarif` DOUBLE NULL DEFAULT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `b_tindakan_id` INT(11) NOT NULL,
  `klinik_transaction_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_tindakan_b_tindakan1_idx` (`b_tindakan_id` ASC),
  INDEX `fk_t_tindakan_klinik_transaction1_idx` (`klinik_transaction_id` ASC),
  CONSTRAINT `fk_t_tindakan_b_tindakan1`
    FOREIGN KEY (`b_tindakan_id`)
    REFERENCES `simklinik`.`b_tindakan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_tindakan_klinik_transaction1`
    FOREIGN KEY (`klinik_transaction_id`)
    REFERENCES `simklinik`.`klinik_transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
