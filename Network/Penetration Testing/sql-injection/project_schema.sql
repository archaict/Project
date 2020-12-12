-- MYSQL DATABASE

-- -----------------------------------------------------
-- Schema Project
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS Project ;
CREATE DATABASE IF NOT EXISTS Project ;
USE Project ;

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------

CREATE TABLE user(
  `id` INT(11)
  UNSIGNED
  AUTO_INCREMENT
  PRIMARY KEY
  NOT NULL,

  `username` VARCHAR (30)
  NOT NULL,

  `passwd` VARCHAR(30)
  NOT NULL,

  `email`
  VARCHAR(40)
  NOT NULL
); 

-- -----------------------------------------------------
-- INSERT INTO user
-- -----------------------------------------------------


INSERT INTO user (id, username, passwd, email)
VALUES ('0000000001', 'John', 'Lorem', 'johndoe@project.xyz');

INSERT INTO user (id, username, passwd, email)
VALUES ('0000000002', 'Jane', 'Ipsum', 'janedoe@project.xyz');

INSERT INTO user (id, username, passwd, email)
VALUES ('0000000003', 'Nyaa', 'Dolor', 'nyaa@project.xyz');
