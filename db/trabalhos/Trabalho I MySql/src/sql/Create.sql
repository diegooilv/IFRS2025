DROP SCHEMA IF EXISTS `mydb`;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4;
USE `mydb`;

-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuario`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Filme` (
  `idFilme` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `descrição` VARCHAR(45),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFilme`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Serie` (
  `idSerie` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `temporadas` INT NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `descrição` VARCHAR(45),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idSerie`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Avaliação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Avaliação` (
  `idAvaliação` INT NOT NULL AUTO_INCREMENT,
  `nota` FLOAT NOT NULL,
  `comentario` VARCHAR(45),
  `Usuario_idUsuario` INT NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAvaliação`),
  CONSTRAINT `fk_Avaliação_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Avaliação_has_Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Avaliação_has_Filme` (
  `Avaliação_idAvaliação` INT NOT NULL,
  `Filme_idFilme` INT NOT NULL,
  PRIMARY KEY (`Avaliação_idAvaliação`, `Filme_idFilme`),
  CONSTRAINT `fk_Avaliação_has_Filme_Avaliação`
    FOREIGN KEY (`Avaliação_idAvaliação`)
    REFERENCES `Avaliação` (`idAvaliação`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Avaliação_has_Filme_Filme`
    FOREIGN KEY (`Filme_idFilme`)
    REFERENCES `Filme` (`idFilme`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Avaliação_has_Serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Avaliação_has_Serie` (
  `Avaliação_idAvaliação` INT NOT NULL,
  `Serie_idSerie` INT NOT NULL,
  PRIMARY KEY (`Avaliação_idAvaliação`, `Serie_idSerie`),
  CONSTRAINT `fk_Avaliação_has_Serie_Avaliação`
    FOREIGN KEY (`Avaliação_idAvaliação`)
    REFERENCES `Avaliação` (`idAvaliação`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Avaliação_has_Serie_Serie`
    FOREIGN KEY (`Serie_idSerie`)
    REFERENCES `Serie` (`idSerie`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Favorito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Favorito` (
  `idFavorito` INT NOT NULL AUTO_INCREMENT,
  `Avaliação_idAvaliação` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFavorito`),
  CONSTRAINT `fk_Favorito_Avaliação`
    FOREIGN KEY (`Avaliação_idAvaliação`)
    REFERENCES `Avaliação` (`idAvaliação`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Favorito_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;
