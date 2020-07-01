--
-- Table structure for table `meusite`
--

CREATE DATABASE meusite DEFAULT CHARACTER SET utf8;

CREATE TABLE `meusite`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(128) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`));
