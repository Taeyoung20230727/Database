# 날짜 : 2024/01/11
# 이름 : 정태영
# 내용 : SQL 연습문제 4


#실습 4-1
Create database `BookStore`;
Create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
grant all privileges on `BookStore`.* to 'qksrm5546'@'%';
flush privileges;

#실습 4-2
create table `Customer` (
	`custId` int primary key,
    `name` varchar(10) not null,
    `address` varchar(20),
    `phone` varchar(13)
    );

create table `Book` (
	`bookId` int primary key,
    `bookName` Varchar(20) not null,
    `publisher` varchar(20) not null,
    `price` int
    );
    
    create table `Order` (
    `orderId` int primary key,
    `custId` int not null,
    `bookId` int not null,
    `salePrice` int not null,
    `orderDate` Datetime not null
    );
    

#실습 4-3
select * from `Customer`;
Drop table `Customer`;

insert into `Customer` value(1,'박지성','영국 멘체스타',000-5000-0001);
insert into `Customer` value(2,'김연아','대한민국 서울',000-6000-0001);
insert into `Customer` value(3,'장미란','대한민국 강원도',000-7000-0001);
insert into `Customer` value(4,'추신수','미국 클리블랜드',000-8000-0001);
insert into `Customer`(`custId`, `name`, `address`) value(5,'박세리','대한민국 대전');

select * from `Book`;
Drop table `Book`;

insert into `Book` value(1,'축구의 역사','굿 스포츠',7000);
insert into `Book` value(2,'축구아는 여자','나무수',13000);
insert into `Book` value(3,'축구의 이해','대한미디어',22000);
insert into `Book` value(4,'골프 바이블','대한미디어',35000);
insert into `Book` value(5,'피겨 교본','굿 스포츠',8000);
insert into `Book` value(6,'역고 단계별 기술','굿 스포츠',6000);
insert into `Book` value(7,'야구의 추억','이상미디어',20000);
insert into `Book` value(8,'야구를 부탁해','이상미디어',13000);
insert into `Book` value(9,'올림픽 이야기','삼성당',7500);
insert into `Book` value(10,'Olympic Champions','pearson',13000);

select * from `Order`;
Drop table `Order`;

insert into `Order` value(1,1,1,6000,'2014-07-01');
insert into `Order` value(2,1,3,21000,'2014-07-03');
insert into `Order` value(3,2,5,8000,'2014-07-03');
insert into `Order` value(4,3,6,6000,'2014-07-04');
insert into `Order` value(5,4,7,20000,'2014-07-05');
insert into `Order` value(6,1,2,12000,'2014-07-07');
insert into `Order` value(7,4,8,13000,'2014-07-07');
insert into `Order` value(8,3,10,12000,'2014-07-08');
insert into `Order` value(9,2,10,7000,'2014-07-09');
insert into `Order` value(10,3,8,13000,'2014-07-10');



#실습 4-4
select `custId`,`name`,`address` from `Customer`;

#실습 4-5
select `bookName`,`price` from `Book`;

#실습 4-6
select `price`,`bookName` from `Book`;

#실습 4-7
select * from `Book`;


#실습 4-8
select `publisher` from `Book`;

#실습 4-9
select distinct `publisher` from `book`;

#실습 4-10
select * from `Book` where `price` >= 20000;

#실습 4-11
select * from `book` where `price` < 20000;

#실습 4-12
select * from `book` where  `price` <= 20000 && `price` >= 10000;

#실습 4-13
select `bookid`, `bookname`, `price` from `book` where `price` <= 30000 && `price` >= 15000;

#실습 4-14
select * from `book` where `bookid` = 2  || `bookid` = 3 || `bookid` = 5;				# in(2,3,5)이거도 가능

#실습 4-15
select * from `book` where mod(`bookid`, 2) = 0;			# 짝수 출력하는방법(mod)
select * from `book` where `bookid` % 2 = 0;				# 둘다 가능

#실습 4-16
select * from `Customer` where `name` like '박%';


#실습 4-17
select * from `Customer` where `address` like'대한민국%';


#실습 4-18
select * from `Customer` where `phone` is not null;


#실습 4-19
select * from `book` where `publisher` = '굿 스포츠' or `publisher` = '대한미디어';


#실습 4-20
select `publisher` from `book` where `bookname` = '축구의 역사';


#실습 4-21
select `publisher` from `book` where `bookname` like '축구%';


#실습 4-22
select * from `book` where `bookname`like'_구%';



#실습 4-23
select * from `book` where `bookname` like '축구%' && `price` >= 20000;

#실습 4-24
select * from `book` order by `bookname`;

#실습 4-25
select * from `book` order by `price`,`bookname`;


#실습 4-26
select * from `book` order by `price`desc, `bookname`;


#실습 4-27
select * from `book` order by `price`desc limit 3;


#실습 4-28
select * from `book` order by `price` limit 3;


#실습 4-29
select sum(`saleprice`) as `총판매액` from `order`;

#실습 4-30
Select
sum(`saleprice`) as `총 판매액`,
avg(`saleprice`) as `평균값`,
min(`saleprice`) as `최저가`,
max(`saleprice`) as `최고가`	
from `order`;


#실습 4-31
select
count(*) as `판매 건수`
from `order`;

#실습 4-32
select
	`Bookid`,
    replace(`bookname`,'야구','농구') as `bookname`,										# replace 사용해서 수정
    `publisher`,
    `price`
    from `book`;

#  update `book` set `bookname` = '야구%', `bookname` = '농구%' where `bookname` = '야구%';



#실습 4-33
select * from `order`;

select `custid`,
count(*) as `수량`
from `order`
where `saleprice` >= 8000
group by `custid`
having `수량` > 1
order by `custid`;

#실습 4-34
select * from `Customer` as a join `order` as b on a.custid = b.custid order by a.custid;


select * from `Customer` join `order` Using(`custid`);


select * from `Customer` as a, `order` as b where a.custId = b. custid;


#실습 4-35
select * from `Customer` as a join `order` as b on a.custid = b.custid order by a.`custid`;


#실습 4-36
select `name`,`saleprice` from `Customer` as a join `order` as b on a.custid = b.custid order by a.`custid`;


#실습 4-37
select `name`,sum(`saleprice`) from `Customer` as a join `order` as b on a.custid = b.custid group by `name` order by `name`;


#실습 4-38
select 
	`name`,
    `bookName`
	from `Customer` as a 
    join `order` as b on a.custid = b.custid
    join `book` as c on b.bookid = c.bookid;

#실습 4-39
select 
	`name`,
    `bookName`
	from `Customer` as a 
    join `order` as b on a.custid = b.custid
    join `book` as c on b.bookid = c.bookid
    where `price` = 20000;

#==================================================================================================================================================

#실습 4-40
select 
	*    
FROM `Customer` AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId;

#실습 4-41
select 
	SUM(`salePrice`) as `총매출`
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId
where `name`='김연아';


SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Order`
WHERE `custId`=(SELECT `custId` FROM `Customer` WHERE `name`='김연아');


#실습 4-42
SELECT `bookName` FROM `Book` ORDER BY `price` DESC LIMIT 1;
SELECT `bookName` FROM `Book` WHERE `price`=(SELECT MAX(`price`) FROM `Book`);

#실습 4-43
SELECT `name` FROM `Customer` AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId
WHERE `orderId` IS NULL;


SELECT 
	`name` 
FROM `Customer` 
	WHERE `custId` NOT IN (SELECT DISTINCT `custId` FROM `Order`);
    

#실습 4-44
INSERT INTO `Book` SET
					`bookId` = 11, 
					`bookName` = '스포츠의학',
					`publisher` = '한솔의학서적';

#실습 4-45
UPDATE `Customer` SET `address`='대한민국 부산' WHERE `custId`=5;

#실습 4-46
DELETE FROM `Customer` WHERE `custId`=5;