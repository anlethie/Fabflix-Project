DROP DATABASE IF EXISTS moviedb;
CREATE DATABASE moviedb;
USE moviedb;

CREATE TABLE movies (
	id varchar(10) NOT NULL,
    title varchar(100) NOT NULL,
    year int NOT NULL,
    director varchar(100) NOT NULL,
    PRIMARY KEY (id),
    FULLTEXT (title)
);
CREATE TABLE stars (
	id varchar(10) NOT NULL,
    name varchar(100) NOT NULL,
    birthYear int,
    PRIMARY KEY (id)
);
CREATE TABLE stars_in_movies (
	starId varchar(10) NOT NULL,
    movieId varchar(10) NOT NULL,
    FOREIGN KEY (starId) REFERENCES stars(id),
    FOREIGN kEY (movieId) REFERENCES movies(id)
);
CREATE TABLE genres (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(32) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE genres_in_movies (
	genreId int NOT NULL,
    movieId varchar(10) NOT NULL,
    FOREIGN KEY (genreId) REFERENCES genres(id),
    FOREIGN KEY (movieId) REFERENCES movies(id)
);
CREATE TABLE creditcards (
	id varchar(20) NOT NULL,
    firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    expiration date NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE customers (
	id int NOT NULL AUTO_INCREMENT,
    firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    ccId varchar(20) NOT NULL,
    address varchar(200) NOT NULL,
    email varchar(50) NOT NULL,
    password varchar(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ccId) REFERENCES creditcards(id)
);
CREATE TABLE sales (
	id int NOT NULL AUTO_INCREMENT,
    customerId int NOT NULL,
    movieId varchar(10) NOT NULL,
    saleDate date NOT NULL,
    FOREIGN KEY (movieId) REFERENCES movies(id),
    FOREIGN KEY (customerId) REFERENCES customers(id),
    PRIMARY KEY (id)
);

CREATE TABLE ratings (
	movieId varchar (10) NOT NULL,
    rating float NOT NULL,
    numVotes int NOT NULL,
    FOREIGN KEY (movieId) REFERENCES movies(id)
);

CREATE TABLE employees (
	email varchar(50) NOT NULL,
	password varchar(20) NOT NULL,
	fullname varchar(100),
	PRIMARY KEY (email)
);
