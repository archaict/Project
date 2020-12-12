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
  id int(11)
  AUTO_INCREMENT 
  NOT NULL,

  username VARCHAR (30)
  NOT NULL,

  password VARCHAR(30)
  NOT NULL,

  email VARCHAR(40)
  NOT NULL,

  primary key (id)

  
);

INSERT INTO user (id, username, password, email)
VALUES ('1', 'John', 'Lorem', 'johndoe@project.xyz');
INSERT INTO user (id, username, password, email)
VALUES ('2', 'Jane', 'Ipsum', 'janedoe@project.xyz');
INSERT INTO user (id, username, password, email)
VALUES ('3', 'Nyaa', 'Dolor', 'nyaa@project.xyz');

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------

CREATE TABLE post (
  id int(11)
  AUTO_INCREMENT 
  NOT NULL,

  title VARCHAR(255)
  DEFAULT NULL,

  content
  TEXT,

  date_time
  DATETIME DEFAULT NULL,

  primary key (id)
);

-- -----------------------------------------------------
-- INSERT INTO user
-- -----------------------------------------------------
INSERT INTO post (id, title, content, date_time)
VALUES
  (1,'Archive // 01', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis tincidunt lectus. Quisque sit amet enim vel sem ultricies imperdiet quis id felis. Vestibulum nec metus lacinia, ornare odio vitae, varius mauris. Aliquam erat volutpat. Suspendisse potenti. Nulla at metus aliquet, hendrerit nibh at, faucibus quam. Morbi aliquam elit vulputate malesuada sollicitudin. Nulla facilisi. Aliquam nec est et est eleifend viverra eu in nisl. Duis vel enim in metus porttitor commodo. Curabitur posuere tempor fringilla. Curabitur efficitur mauris dui, at tincidunt mauris tincidunt sed. Vestibulum leo nibh, accumsan sed mauris id, interdum posuere leo. Praesent pellentesque posuere dui aliquam auctor. Aliquam erat volutpat. </p>','2020-12-01 00:00:00');

INSERT INTO post (id, title, content, date_time)
VALUES
  (2,'Archive // 02', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis tincidunt lectus. Quisque sit amet enim vel sem ultricies imperdiet quis id felis. Vestibulum nec metus lacinia, ornare odio vitae, varius mauris. Aliquam erat volutpat. Suspendisse potenti. Nulla at metus aliquet, hendrerit nibh at, faucibus quam. Morbi aliquam elit vulputate malesuada sollicitudin. Nulla facilisi. Aliquam nec est et est eleifend viverra eu in nisl. Duis vel enim in metus porttitor commodo. Curabitur posuere tempor fringilla. Curabitur efficitur mauris dui, at tincidunt mauris tincidunt sed. Vestibulum leo nibh, accumsan sed mauris id, interdum posuere leo. Praesent pellentesque posuere dui aliquam auctor. Aliquam erat volutpat. </p>','2020-12-01 00:00:00');

INSERT INTO post (id, title, content, date_time)
VALUES

  (3,'Archive // 03', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis tincidunt lectus. Quisque sit amet enim vel sem ultricies imperdiet quis id felis. Vestibulum nec metus lacinia, ornare odio vitae, varius mauris. Aliquam erat volutpat. Suspendisse potenti. Nulla at metus aliquet, hendrerit nibh at, faucibus quam. Morbi aliquam elit vulputate malesuada sollicitudin. Nulla facilisi. Aliquam nec est et est eleifend viverra eu in nisl. Duis vel enim in metus porttitor commodo. Curabitur posuere tempor fringilla. Curabitur efficitur mauris dui, at tincidunt mauris tincidunt sed. Vestibulum leo nibh, accumsan sed mauris id, interdum posuere leo. Praesent pellentesque posuere dui aliquam auctor. Aliquam erat volutpat. </p>','2020-12-01 00:00:00');
