# 날짜 : 2024/01/02
# 이름 : 정태영
# 내용 : 2장 SQL 기초

# 실습 2-1 테이블 생성 및 제거
create table `User1`(
`uid` varchar(10),
`name` varchar(10),
`hp` char(13),
`age` int
);
# 실습 2-2 테이블에 데이터 추가
 insert into `user1` values ('A101','김유신','010-1234-1111',25);
 insert into `user1` values ('A102','김춘추','010-1234-2222',23);
 insert into `user1` values ('A103','장보고','010-1234-3333',32);
 insert into `user1` (`uid`,`name`,`age`) values ('A104','강감찬',45);
 insert into `user1` SET `uid` = 'A105', `name` = '이순신', `hp` = '010-1234-5555';

# 실습 2-3 테이블에 데이터 조회
select * from `User1`;
select * from `user1` where `uid` = 'A101';
select * from `user1` where `name` = '김춘추';
select * from `user1` where `age` < 30;
select * from `user1` where `age` >= 30;
select `uid`, `name`, `age` from `user1`;

# 실습 2-4 데이블에 데이터 수정
update `user1` set `hp` = '010-1234-4444' where `uid` = 'A104';
update `user1` set `age` = 51 where `uid` = 'A105';
update `user1` set `hp` = '010-1234-1001',`age` = 27 where `uid` = 'A101';

# 실습 2-5 데이터 삭제
delete from `user1` where `uid` = 'A104';
delete from `user1` where `uid` = 'A102' AND `age` = 25;
delete from `user1` where `age` >= 30;

# 실습 2-6 테이블 수정
Alter table `user1` add `gender` tinyint;
Alter table `user1` add `birth` char(10) after `name`;
Alter table `user1` modify `gender` char(1);
Alter table `user1` modify `age` tinyint;
Alter table `user1` drop `gender`;

# 실습 2-7 테이블 복사
create table `user1copy` like `user1`;
insert into `user1copy` select * from `user1`;

# 실습 2-8   
 select * from `TblUser`;
 delete from `TblUser`;
 
create table `TblUser`(
`user_id` varchar(10),
`user_name` varchar(10),
`user_hp` char(13),
`user_age` tinyint,
`user_addr` Varchar(20)
);

 insert into `TblUser` values ('P101','김유신','010-1234-1001',25,'경남 김해시');
 insert into `TblUser` values ('P102','김춘추','010-1234-1002',23,'경남 경주시');
 insert into `TblUser` (`user_id`,`user_name`,`user_age`,`user_addr`) values('p103','장보고',31,'전남 완도군');
 insert into `TblUser` (`user_id`,`user_name`,`user_addr`) values('p104','강감찬','서울시 중구');
insert into `TblUser` (`user_id`,`user_name`,`user_hp`,`user_age`) values('p105','이순신','010-1234-1005',50);


 select * from `Tblproduc`;
 delete from `Tblproduct`;
 
create table `Tblproduct`(
`prod_no` varchar(10),
`prod_name` varchar(10),
`prod_price` char(13),
`prod_stock` int,
`prod_company` Varchar(10),
`prod_date` DATETIME
);

insert into `Tblproduct` values ('1001','냉장고','800,000',25,'LG전자','2022-01-06');
insert into `Tblproduct` values ('1002','노트북','1,200,000',120,'삼성전자','2022-01-07');
insert into `Tblproduct` values ('1003','모니터','350,000',35,'LG전자','2023-01-13');
insert into `Tblproduct` values ('1004','세탁기','1,000,000',80,'삼성전자','2021-01-06');
insert into `Tblproduct` values ('1005','컴퓨터','1,500,000',20,'삼성전자','2023-10-01');
insert into `Tblproduct` (`prod_no`,`prod_name`,`prod_price`,`prod_stock`) values('1006','휴대폰','950,000',102);


# 실습 2-9
Select * from `TblUser`;
Select `user_name` From `tbluser`;
Select `user_name`, `user_hp` From `tbluser`;
Select * from `TblUser` where `user_id` = 'p102';
Select * from `TblUser` where `user_id` = 'p102' or `user_id` = 'p105';
Select * from `TblUser` where `user_addr` = '부산시 금정구';
Select * from `TblUser` where `user_age` > 30;
Select * from `TblUser` where `user_hp` IS NULL;
update `TblUser` set `user_age` = 42 where `user_id` = 'p104';
update `TblUser` set `user_addr` = '부산시 진구' where `user_id` = 'p105';
delete from `TblUser` where `user_id` = 'p103';

select * from `Tblproduct`;
select `prod_name` From `TblProduct`;
select `prod_name`,`prod_company`, `prod_price` From `TblProduct`;
select * from `Tblproduct` where `prod_company` = 'LG전자';
select * from `Tblproduct` where `prod_company` = '삼성전자';
update `Tblproduct` set
						`prod_company` = '삼성전자',
                        `prod_date` = '2024-01-01'
                        where
                        `prdcode` = 1006;


