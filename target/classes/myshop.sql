

��Ǭ : 

TABLE : MEMBER, BOARD, FREEBOARD, SUBWAY,


MEMBER : MID, MEMBER_ID, MEMBER_EMAIL,MEMBER_PASSWORD, MEMBER_GRADE, MEMBER_CREATED, MEMBER_UPDATED, MEMBER_DELYN, MEMBER_ADMINYN 

BOARD :BID, MID, BOARD_SUBJECT , BOARD_CONTENTS, BOARD_IMAGE, BOARD_LIKE, BOARD_HATE, MEMBER_ID, BOARD_CREATED, BOARD_UPDATED, BOARD_DELYN, BOARD_HITS

FREEBOARD : FBID, MID, FREE_SUBJECT, FREE_CONTENTS, FREE_HITS, MEMBER_ID

BOARD_COMMENT : CID ,BID, COMMENT, GRADE, MID

FREE_COMMENT : FCID , FBID, COMMENT, GRADE, MID

SUBWAY : SUBWAY_CODE, SUBWAY_NAME, SUBWAY_LINENUMBER, SUBWAY_EXT

BOARD_IMAGE 


CREATE TABLE SPOON_MEMBER(
	 MID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	 MEMBER_ID VARCHAR(40) NOT NULL,
	 MEMBER_EMAIL VARCHAR(50) NOT NULL,
	 MEMBER_PASSWORD VARCHAR(50) NOT NULL,
	 MEMBER_GRADE INT DEFAULT 0, 
	 MEMBER_CREATED DATE,
	 MEMBER_UPDATED DATE,
	 MEMBER_DELYN VARCHAR(10) DEFAULT 'N',
	 MEMBER_ADMINYN VARCHAR(10) DEFAULT 'N'
)engine = innodb default charset=UTF8;


CREATE TABLE SPOON_BOARD(
	BID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	MID INT NOT NULL,
	FOREIGN KEY(MID) REFERENCES SPOON_MEMBER(MID),
	BOARD_SUBJECT VARCHAR(40) NOT NULL, 
	BOARD_CONTENTS VARCHAR(1000),
	BOARD_LIKE INT DEFAULT 0,
	BOARD_HATE INT DEFAULT 0, 
	MEMBER_ID VARCHAR(30) NOT NULL, 
	BOARD_CREATED DATE,
	BOARD_UPDATED DATE ,
	BOARD_DELYN VARCHAR(10) DEFAULT 'N',
	BOARD_HITS INT DEFAULT 0,
	BOARD_ADDRESS VARCHAR(300) 
)ENGINE = innodb DEFAULT CHARSET=UTF8

DROP TABLE SPOON_BOARD

CREATE TABLE SPOON_FREEBOARD( 
	FBID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	MID INT NOT NULL,
	FOREIGN KEY(MID) REFERENCES SPOON_MEMBER(MID),
	FREE_SUBJECT VARCHAR(100) NOT NULL, 
	FREE_CONTENTS VARCHAR(1000),
	FREE_HITS INT DEFAULT 0,
	FREE_DELYN VARCHAR(10) DEFAULT 'N',
	MEMBER_ID VARCHAR(50)
)ENGINE = innodb DEFAULT CHARSET=UTF8

DROP TABLE FREEBOARD

CREATE TABLE SPOON_SUBWAY (
	SUBWAY_CODE VARCHAR(30), 
	SUBWAY_NAME VARCHAR(30), 
	SUBWAY_LINENUMBER VARCHAR(30),
	SUBWAY_EXT VARCHAR(30)
) ENGINE = innodb DEFAULT CHARSET=UTF8

DROP TABLE SPOON_SUBWAY

ALTER DATABASE javadb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

LOAD DATA INFILE 'C:\\subway.csv' 
INTO TABLE SPOON_SUBWAY
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM SPOON_SUBWAY

SELECT * FROM SPOON_MEMBER
select count(member_id) from spoon_member where member_id = 'km94sm'
SELECT COUNT(MEMBER_ID) FROM SPOON_MEMBER WHERE MEMBER_ID = 'km94sm' AND MEMBER_PASSWORD = 'qpalz09'
SELECT COUNT(*) FROM SPOON_MEMBER WHERE MEMBER_ID = 'moonsong22' AND MEMBER_PASSWORD = '1111'
