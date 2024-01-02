# 날짜 : 2024/01/02
# 이름 : 정태영
# 내용 : 1장 데이터베이스 생성과 사용자 관리

#실습 1-1
create database `StudyDB`;
Drop database `StudyDB`;

#실습 1-2
create user `qksrm5546`@`%` Identified by '1234';
grant all privileges on studydb. * to `qksrm5546`@`%`;
flush privileges;

#실습 1-3
ALTER user `qksrm5546`@`%` identified by 'abc1234';
Drop user `qksrm5546`@`%`;
flush privileges


