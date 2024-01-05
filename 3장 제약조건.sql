# 날짜 : 2024/01/03
# 이름 : 정태영
# 내용 : 3장 제약조건

#실습 3-1
Create table `User2` (
		`uid`	VARCHAR(10) primary key,
        `name`	VARCHAR(10),
        `birth`	VARCHAR(10),
        `addr`	VARCHAR(50)
);

#실습 3-2
insert into `User2` Values ('A101', '김유신','1968-05-09','경남 김해시');
insert into `User2` Values ('A102', '김춘추','1972-11-23','경남 경주시');
insert into `User2` Values ('A103', '장보고','1978-03-01','전남 완도군');
insert into `User2` Values ('A105', '강감찬','1979-08-16','서울시 관악구');
insert into `User2` Values ('A106', '이순신','1981-05-23','부산시 진구');

Select * from `User2`;
DROP Table `User2`;

#실습 3-3

Create Table `user3`(
	`uid` VARCHAR(10) primary key,
    `name` VARCHAR(10),
    `birth` varchar(10),
    `hp`	varchar(13)unique,
    `addr`	varchar(50)
    );


#실습 3-4
insert into `User3` Values ('A101', '김유신','1968-05-09','010-1234-1111','경남 김해시');
insert into `User3` Values ('A102', '김춘추','1972-11-23','010-1234-2222','경남 경주시');
insert into `User3` Values ('A103', '장보고','1978-03-01','010-1234-3333','전남 완도군');
insert into `User3` Values ('A104', '강감찬','1979-08-16','010-1234-4444','서울시 관악구');
insert into `User3` Values ('A105', '이순신','1981-05-23','010-1234-5555','부산시 진구');
insert into `User3` Values ('A106', '안중근','1981-05-21','NULL','부산시 진구');

Select * from `User3`;
DROP Table `User3`;


#실습 3-5
create table `parent` (
	`pid`		Varchar(10),
	`name`		Varchar(10),
	`birth`		CHAR(10),
	`addr`		VARCHAR(100)
);

create table `Child` (
	`cid`		VARCHAR(10) primary key,
    `name`		VARCHAR(10),
    `hp`		CHAR(13) unique,
    `parent`	Varchar(10),
    foreign key (`parent`) references `parent`(`pid`)
    );

drop table `parent`;
drop table `Chile`;


insert into `parent` Values('p101','김유신','1968-05-09'.'경남 김해시');
insert into `parent` Values('p102','김춘추','1972-11-23'.'경남 경주시');
insert into `parent` Values('p103','장보고','1978-03-01'.'전남 완도시');
insert into `parent` Values('p104','강감찬','1979-08-16'.'서울시 관악구');
insert into `parent` Values('p105','이순신','1981-05-23'.'부산시 진구');


insert into `Child` Values('c101','김철수','010-1234-1001'.'P101');
insert into `Child` Values('c102','김영희','010-1234-1002'.'P102');
insert into `Child` Values('c103','강철수','010-1234-1003'.'P103');
insert into `Child` Values('c104','이철수','010-1234-1004'.'P107');





#실습 3-6