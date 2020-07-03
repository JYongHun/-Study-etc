-- date : "YYYY-MM-DD" 이런 형식으로 저장 "2020-05-28"
-- time : "HH:MM:SS" 이런 형식으로 저장	"23:11:23"
-- datetime : "YYYY-MM-DD HH:MM:SS", "2020-05-28 23:11:16"
-- 날짜만 조회
select name, day(birthdate) from people2;
-- 요일로 조회
select name, dayname(birthdate) from people2;
-- 년도
select name, year(birthdt) from people2;
-- 일요일 : 1  수요일이 : 4 토요일이 : 7
select name, dayofweek(birthdate) from people2;
-- 해당년도의 날짜 수
select name, dayofyear(birthdate) from people2;
-- 해당 월만 조회
select name, month(birthdt) from people2;
-- 해당 월을 영문으로 조회
select name, monthname(birthdt) from people2;
-- 시간 조회
select name, hour(birthdt) from people2;
-- 분 조회
select name, minute(birthdt) from people2;
-- 초
select name, second(birthdt) from people2;

-- curdate() : 현재 날짜를 가져오는 함수
select curdate();
-- curtime() : 현재 시간을 가져오는 함수a
select curtime();
-- now() : 현재 날짜 + 시간
select now();

insert into people2 (name, birthdate,birthtime,birthdt)
	values("Mike",curdate(),curtime(),now());


select date_format(birthdt, "Was born on a %W") from people2;
select date_format(birthdt, "%Y/%m/%d") from people2;
select date_format(birthdt, "%Y/%m/%d at %h:%i") from people2;


-- 생일이 10월인 사람을 조회하시오
select name 
from people2
where month(birthdt) = 10;
-- 두 날짜의 차이를 구해달라. 날짜수
select datediff(now(), birthdate)
from people2;
-- Operator
select birthdt, date_add(birthdt,interval 1 month)
from people2;
select birthdt, date_add(birthdt,interval 15 day)
from people2;
select birthdt, date_add(birthdt, interval 30 second)
from people2;

select birthdt, birthdt + interval 1 month 
from people2;
select birthdt, birthdt - interval 5 month 
from people2;
select birthdt, birthdt + interval 15 month + interval 10 hour
from people2;

-- timestamp
-- table name comments, columns : content String100, created_at 입력하는 시간 저장 ,  
-- changed_at  입력하는 시간 저장 업데이트 시간 저장
create table comments(
	content varchar(100),
    created_at timestamp default now(),
    changed_at timestamp default now() on update current_timestamp
    );