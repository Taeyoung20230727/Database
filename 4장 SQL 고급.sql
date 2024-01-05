#날짜 : 2024/01/03
#이름 : 정태영
#내용 : 4장 SQL 고급

#실습 4-1
CREATE TABLE `Member` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE NOT NULL,
	`pos`	VARCHAR(10) default '사원',
	`dep`	TINYINT,
	`rdate`	DATETIME  NOT NULL
);

CREATE TABLE `Department` (
	`depNo`	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`seq`	INT AUTO_INCREMENT PRIMARY KEY,
	`uid`	VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	TINYINT NOT NULL,
	`sale`	INT NOT NULL
);

select * from `sales`;
drop table `sales`;

#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());
INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);


#실습 4-3
select * from `Member` Where `name` = '김유신';
select * from `Member` Where `pos` = '차장' and `dep` = 101;
select * from `Member` where `pos` = '차장' OR   `dep` =101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos` In ('사원','대리');
select * from `Member` where `dep` In(101,102,103);
select * from `Member` where `name` like '%신';   # 뒤에글자만 신이면 부름
select * from `Member` where `name` like '정_';   #정으로 시작하면서 뒤에 한글자더
select * from `Member` where `name` like '_성_';  #3글자인데 중간이름이 성
select * from `Member` where `name` like '김__';
select * from `sales` where `sale` > 50000;
select * from `sales` where `sale` >= 50000 and `sale` <100000 and `month` =1;
select * from `sales` where `sale` between 50000 and 100000;
select * from `sales` where `sale` not between 50000 and 100000;
select * from `sales` where `year` In(2020);
select * from `sales` where `month` In(1, 2);

#실습 4-4

select * from `sales` order by `sale` Asc;
select * from `sales` order by `sale` desc;
select * from `member` order by `name` asc;
select * from `sales` where `sale` > 50000 order by `year`, `month`, `sale` desc; 
select * from `member` order by `name` desc;
select * from `member` order by `rdate` asc;
select * from `sales` where `sale` > 50000 order by `sale` desc;




#실습 4-5
select * from `sales` LIMIT 3;
select * from `sales` Limit 0, 3;
select * from `sales` limit 5, 3;
select * from `sales` order by `sale` desc limit 3, 5;
select * from `sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `sales` where `sale` > 50000 order by `year` desc, `month`, `sale`desc limit 5;




#실습 4-6
select sum(`sale`) as `합계` from `sales`;
select avg(`sale`) as `평균` from `sales`;
select max(`sale`) as `최댓값` from `sales`;
select min(sale) as `최소값` from `sales`;
select ceiling(1.2);
select ceiling(1.8);
select floor(1.2);
select floor(1.8);
select round(1.2);
select round(1.8);
select rand();
select ceil(1.2);		#ceiling이랑 같음
select ceil(rand() * 10);
select count(`sale`) as `갯수` from `sales`;
select count(*) as `갯수` from `sales`;     # 위에꺼랑 다르게 NULL값이 있으면 제외하고 셈

select left('HelloWorld', 5);
select right('HelloWorld',5);
select substring('HelloWorld', 6, 5);  # 6번쨰부터(포함) 5개 출력
select concat('Hello','world');   # 문자를 연결
select concat(`uid`,`name`,`hp`) from `member` where `uid` = 'a108';

select curdate();
select curtime();
select now();
insert into `member` values ('a112','유관순','010-1234-1012','대리',107,now());
select * from `member`;

#실습 4-7

#실습 4-8

#실습 4-9


#실습 4-10
select `uid`, count(*)  from `sales` group by `uid`;
select * from `sales` group by `uid`;
select * from `sales` group by `uid`, `year`;
select `uid`, `year`, sum(`sale`) as `합계`
from `sales`
group by `uid`, `year`;

select `uid`, count(*) as `건수` from `sales` group by `uid`;
select `uid`, sum(sale) as `합계`from `sales` group by `uid`; 
select `uid`, avg(sale) as `평균` from `sales` group by `uid`;

#실습 4-11
select `uid`, count(*)  from `sales` group by `uid`;
select * from `sales` group by `uid`;
select * from `sales` group by `uid`, `year`;
select `uid`, `year`, sum(`sale`) as `합계`
from `sales`
group by `uid`, `year`
having `합계` >= 200000
order by `합계`desc;

#실습 4-12
create table `Sales2` like `Sales`;
insert into `Sales2` select * from `Sales`;
update `sales2` set `year` = `year` + 3;

select * from `sales` Union select * from `sales2`; # 연도가 달라서 60건 모두출력
select * from `sales` where `sale` >= 100000 union select * from `sales2` where `sale` >= 100000;

select `uid`, `year`, `sale` from sales union select `uid`, `year`, `sale` from sales2;

select `uid`, `year`, sum(sale) as `합계` from `sales` group by `uid`, `year` union select `uid`, `year`, sum(sale) as `합계`
from `sales2` group by `uid`, `year` order by `year` asc, `합계` desc;


#실습 4-13
select * from `sales` inner join `member` on `sales`.`uid` = `Member`.`uid`;

select * from `sales` as a
join `member` as b on a.uid = b.uid;

select * from `sales` as a, `member` as b where a.uid =  b.uid;

select * from `sales` as a
join `member` as b using (`uid`);

select a.`uid`,
		a.`year`,
        a.`month`,
        a.`sale`,
        b.`name`,
        b.`hp`,
        c.`name`
        
from `sales` as a 
join `member` as b on a.uid =b.uid
join `Department` as c on b.dep =c.depNo;


#실습 4-14

select * from `sales` as a inner join `member` as b on a.uid = b.uid;
select * from `sales` as a left join `member` as b on a.uid = b.uid;
select * from `sales` as a right join `member` as b on a.uid = b.uid;









#실습 4-15
#실습 4-16
#실습 4-17
