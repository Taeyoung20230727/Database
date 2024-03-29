SELECT * FROM bank_account;
SELECT * FROM bank_customer;
SELECT * FROM bank_transaction;

alter table `bank_customer` modify `c_addr` varchar(20);	# 데이터타입 변경하는법

insert into `bank_customer` values('730423-1000001','김유신',1,'010-1234-1001','경남 김해시');
insert into `bank_customer` values('730423-1000002','김춘추',1,'010-1234-1002','경남 경주시');
insert into `bank_customer` values('750423-1000003','장보고',1,'010-1234-1003','전남 완도군');
insert into `bank_customer` values('102-12-51094','(주)정보산업',2,'051-500-1004','부산시 부산진구');
insert into `bank_customer` values('930423-1000005','이순신',1,'010-1234-1005','서울 종로구');


SET foreign_key_checks = 0; 
SET foreign_key_checks = 1;
# insert into `bank_account` set `a_no` = '101-11-1001',`a_item_dist`='S1', `a_item_name`= '자유저축예금', `a_c_no`=730423-1000001, `a_balance` = 1550000,`a_open_date` = '2011-04-11';
UPDATE bank_account SET a_no=1 WHERE a_no='101-11-1001';

insert into `bank_account` values('101-11-1001','S1','자유저축예금','730423-1000001',1550000,'2011-04-11');
insert into `bank_account` values('101-11-1002','S1','자유저축예금','930423-1000005',260000,'2011-05-12');
insert into `bank_account` values('101-11-1003','S1','자유저축예금','750423-1000003',75000,'2011-06-13');
insert into `bank_account` values('101-12-1001','S2','기업전용예금','102-12-51094',15000000,'2011-07-14');
insert into `bank_account` values('101-13-1001','S3','정기저축예금','730423-1000002',1200000,'2011-08-15');


insert into `bank_transaction` values(1,'101-11-1001',1,50000,'2023-01-01 13:15:10');
insert into `bank_transaction` values(2,'101-12-1001',2,1000000,'2023-01-02 13:15:12');
insert into `bank_transaction` values(3,'101-11-1002',3,260000,'2023-01-03 13:15:14');
insert into `bank_transaction` values(4,'101-11-1002',2,100000,'2023-01-04 13:15:16');
insert into `bank_transaction` values(5,'101-11-1003',3,75000,'2023-01-05 13:15:18');
insert into `bank_transaction` values(6,'101-11-1001',1,150000,'2023-01-05 13:15:28');


select `a_c_no`,`c_name`,`c_phone`,`a_no`,`a_item_dist`,`a_balance` from `bank_account` as a
join `bank_customer` as b on a.a_c_no = b.c_no;

select `c_name`,`t_dist`,`t_amount`,`t_datetime` from `bank_customer` as a
join `bank_account` as b on a.c_no = b.a_c_no
join `bank_transaction` as c on b.a_no = t_a_no
where `c_name` = '이순신';


select `a_no`,`c_name`,`a_no`,`a_balance`,`a_open_date` from `bank_customer` as a
join `bank_account` as b on a.c_no = b.a_c_no
where c_dist = 1
order by `a_balance` desc limit 1;











