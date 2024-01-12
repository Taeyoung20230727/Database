select * from `student`;

insert into `student` values ('20201011','김유신','010-1234-1001',3,'경남 김해시');
insert into `student` values ('20201122','김춘추','010-1234-1002',3,'경남 경주시');
insert into `student` values ('20210213','장보고','010-1234-1003',2,'전남 완도군');
insert into `student` values ('20210324','강감찬','010-1234-1004',2,'서울 관악구');
insert into `student` values ('20220415','이순신','010-1234-1005',1,'서울 종로구');


SET foreign_key_checks = 0; 
SET foreign_key_checks = 1;

select * from `register`;
insert into `register` values ('20220415',101,60,30,null,null);
insert into `register` values ('20210324',103,54,36,null,null);
insert into `register` values ('20201011',105,52,28,null,null);
insert into `register` values ('20220415',102,38,40,null,null);
insert into `register` values ('20210324',104,56,32,null,null);
insert into `register` values ('20210213',103,48,40,null,null);


select * from `Lecture`;
insert into `Lecture` values (101,'컴퓨터과학 개론',2,40,'본301');
insert into `Lecture` values (102,'프로그래밍 언어',3,52,'본302');
insert into `Lecture` values (103,'데이터 베이스',3,56,'본303');
insert into `Lecture` values (104,'자료구조',3,60,'본304');
insert into `Lecture` values (105,'운영체제',3,52,'본305');


select `stdNo`,`stdName`,`stdHp`,`stdYear` from `Student` as a 
left join `register` as b on a.stdNo = b.restdNo
where `restdNo` is null;

select 
	`reStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`,
    `regLecNo` as `임시컬럼1`    
from `Register`;




















