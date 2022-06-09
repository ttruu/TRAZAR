DROP DATABASE DESIGN;

CREATE DATABASE DESIGN CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

USE DESIGN;

CREATE TABLE Member(
    id VARCHAR(30) PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    nickName VARCHAR(20) NOT NULL UNIQUE,
    phoneNum VARCHAR(20) NOT NULL UNIQUE,
    introduce VARCHAR(10000),
    inserted DATETIME DEFAULT NOW(),
    name VARCHAR(20) NOT NULL
);

DESC Member;

CREATE TABLE DesignBoard(
   id INT PRIMARY KEY AUTO_INCREMENT,
   designerId VARCHAR(30) REFERENCES Member(id),
   managerId VARCHAR(30) REFERENCES Member(id),
   title VARCHAR(100) NOT NULL,
    body VARCHAR(2000) NOT NULL,
    price VARCHAR(100) NOT NULL,
   inserted DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE Auth (
    memberId VARCHAR(30) NOT NULL,
    memberRole VARCHAR(20),
    managerRole VARCHAR(20),
    FOREIGN KEY (memberId) REFERENCES Member(id)
);

DESC Auth;

CREATE TABLE Likes(
	boardId INT,
    memberId VARCHAR(30) UNIQUE,
    FOREIGN KEY (memberId) REFERENCES Member(id),
    FOREIGN KEY (boardId) REFERENCES DesignBoard(id)
);

DESC DesignBoard;

DESC CustomerReview;

CREATE TABLE CustomerReview(
   id INT PRIMARY KEY AUTO_INCREMENT,
   managerId VARCHAR(30) REFERENCES Member(id),
   customerId VARCHAR(30) REFERENCES Member(id),
    designBoardId INT,  
    content VARCHAR(255) NOT NULL,
    inserted DATETIME DEFAULT NOW(),
    FOREIGN KEY (designBoardId) REFERENCES DesignBoard(id)
);

CREATE TABLE Request(
   id INT PRIMARY KEY AUTO_INCREMENT,
    designBoardId INT,
    managerId VARCHAR(30) REFERENCES Member(id),
    designerId VARCHAR(30),
    customerId VARCHAR(30),
    agree boolean,
    disagree boolean,
    price VARCHAR(100) NOT NULL DEFAULT '문의주세요',
    body VARCHAR(10000),
    FOREIGN KEY (designBoardId) REFERENCES DesignBoard(id),
    FOREIGN KEY (customerId) REFERENCES Member(id),
    FOREIGN KEY (designerId) REFERENCES Member(id)
);

CREATE TABLE ManagerBoard(
   id INT PRIMARY KEY AUTO_INCREMENT,
   managerId VARCHAR(30) REFERENCES Member(id),
   title VARCHAR(100) NOT NULL,
    body VARCHAR(2000) NOT NULL,
   inserted DATETIME NOT NULL DEFAULT NOW()
    );

CREATE TABLE Files (
   id INT PRIMARY KEY AUTO_INCREMENT,
   designBoardId INT REFERENCES DesignBoard(id),
    memberId VARCHAR(30) REFERENCES Member(id),
    fileName VARCHAR(255) NOT NULL
);

CREATE TABLE Tags (
   id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    memberId VARCHAR(30),
    FOREIGN KEY (memberId) REFERENCES Member(id)
);