DROP DATABASE booksys ;

CREATE DATABASE booksys ;

USE booksys ;

CREATE TABLE Oid (
       last_id    INT NOT NULL
) ;

CREATE TABLE `Table` (
       oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       number    INT NOT NULL,
       places    INT NOT NULL
) ;

CREATE TABLE Customer (
       oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       name        VARCHAR(32) NOT NULL,
       phoneNumber  CHAR(13) NOT NULL,
       point      INT NOT NULL
) ;

CREATE TABLE Menu (
       oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       menuName    VARCHAR(32) NOT NULL,
       menuPrice  INT NOT NULL
) ;

CREATE TABLE WalkIn (
       oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       covers    int,
       date        DATE,
       time        TIME,
       table_id    int,
       menu_id    int
) ;

CREATE TABLE Reservation (
       oid           int NOT NULL PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
       covers       int,
       date           DATE,
       time           TIME,
       table_id       int,
       menu_id   int,
       customer_id  int
) ;