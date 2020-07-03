select author_lname from books;
-- 작가이름 중복된 이름 제거하고 유니크하게 만들어서 조회
select distinct author_lname from books;
-- full name 을 중복 제거해서 조회.
select distinct concat(author_fname," ", author_lname) as "full name" 
from books;
-- 정렬, 순서  작가의 라스트이름으로 정렬해서 라스트이름 조회.
select author_lname 
from books
order by author_lname;
-- title 역순으로 조회하라.
select title
from books
order by title desc;
-- 출판년도의 오름차순으로 책제목과 출판년도를 조회.
desc books;
select title,released_year
from books
order by released_year;
-- 정렬 조건이 lname,fname 두개인 경우 title fname lname 을 조회.
select title,author_fname,author_lname
from books
order by author_lname,author_fname ;
-- limit,offset
select title
from books
limit 3;

select title from books limit 1;
select * from books limit 5;
-- 3번쨰 데이터부터 4개의 데이터를 가져와서, 책제목만 조회하시오.
select title
from books
limit 2,4;
-- 처음부터  책 을 6개 가져와라
select title from books limit 0,6;
select title from books limit 6;
-- 실무 에서 페이징 할떄 사용한다.
-- select title from bookslimit 0,30;
-- select title from bookslimit 30,30;.....

-- 책 발행년도가 최신인 책 5권의 책 제목과 발행년도를 조회하시오.
desc books;
select title,released_year
from books
order by released_year desc
limit 0,5;
-- 가장 발행된지 오래된 책 찾아서 제목과 발행년도,작가 성을 조회
select title, released_year, author_lname
from books
order by released_year
limit 0,1;
-- 책 제목을 가져오되, 5번쨰 책부터 전부 조회하시오
select title
from books
limit 4,99999999;
select count(title)
from books;
-- da 로 시작하는 작가의 이름을 찾아서, 책 제목과 작가이름을 조회.
select title, author_fname
from books
where author_fname like "da%";
-- da 가 들어있는 작가의 이름을 찾아서, 책 제목과 작가이름을 조회.
select title, author_fname
from books
where author_fname like "%da%";
-- the 로 시작하는 것, the가 들어있는 것,the 로 끝나는 것 의 책제목
select title
from books
where title like "the%";
select title
from books
where title like "%the%";
select title
from books
where title like "%the";
-- stock_quantity 2자리인 것을 조회하시오
select title, stock_quantity
from books
where stock_quantity like "___";

select title
from books
where title like "________";

select title 
from books
where title like "___ ________";
-- "(02)234-5678" like "(__)___-____"
use mydb;
-- github 문제2
desc books;
-- 1
select title
from books
where title like "%stories%";
-- 2
select title,pages
from books
order by char_length(title) desc 
limit 0,1;
select title,pages
from books
order by pages desc
limit 0,1;
-- 3
select concat(title," - ",released_year) as summary
from books
order by released_year desc
limit 0,3;
select released_year
from books;
-- 4
select title,author_lname
from books
where author_lname like "% %";
select title
from books;
-- 5
select title,released_year,stock_quantity
from books
order by stock_quantity
limit 0,3;
-- 6
select title,author_lname
from books
order by author_lname,title;
select title,author_lname
from books
order by 2,1;
-- 7
select concat("My favoriteauthor is ",
		upper(author_fname), " ",upper(author_lname)) as yell
from books
order by author_lname;
-- github 문제2 끝

-- 갯수세기 
select count(*) from books;

-- author_fname 전부 몇개?? 
select count(distinct author_fname)
from books;
-- author_lname 전부 몇개??
select count(distinct author_lname)
from books;
-- 책제목에 the 라고들어있는 책은, 몇권인가???
select count(*)
from books
where title like "%the%";
-- 작가의 lname, fname 둘다 중복 제거한 갯수를 구하시오.
select count(distinct author_lname, author_fname)
from books;
-- 작가의 중보되는 lname의 갯수를 구하시오.
select author_lname,count(*) as count
from books
group by author_lname;
-- 연도별 책 몇권이 있는지 조회
select concat("in",released_year, count(*))
from books
group by released_year;

select concat("year ",released_year," count "," "||count(*))
from books
group by released_year;

-- 책 발행한년도가 가장최소인 책 연도를 구하시오.
select title,min( released_year)
from books;
-- 책이 가장 긴 책은 몇페이지짜리 책이냐?
select max(pages)
from books;
select title,max(pages)
from books;
-- 위의 쿼리는 문제가 잇습니다. 책 제목이 다릅니다.
select title, pages from books     -- 1. subquery
where pages = (select max(pages) from books);
select title , pages  -- 2order by  limit 사용
from books
order by pages desc
limit 1;

-- 페이지수가 가장 작은 책의 제목과 페이지수를 조회하시오.
select title,pages
from books
where pages = (select min(pages) from books);
select title,pages
from books
order by pages
limit 0,1;

-- 작가별로, 각 작가의 최초 책 발간년도를 조회하시오.a
-- 조회시, 작가의 이름도 나오도록 조회하시오.
select author_fname, author_lname, min(released_year)
from books
group by author_fname,author_lname ;
-- 각 작가별로, 자신이 쓴 책의 페이지수가 가장 많은 책의 페이지수를 조회하시오. 이름도
select max(pages), author_fname,author_lname
from books
group by author_fname,author_lname;

-- 북 테이블에 있는 모든 책의 페이지수를 다 더하면 몇페이지 입니까?
select sum(pages)
from books;
-- 각 작가별로, 자신이 지금까지 쓴 책의 총 페이지수는 얼마인지 조회하시오
select sum(pages),author_fname, author_lname
from books
group by author_fname,author_lname
order by sum(pages) desc;

-- 책 출간년도의 평균을 알고싶습니다.
select avg(released_year)
from books;
-- 출간년도가 같은 책들의 stock_quantity 의 평균은 얼마인지 조회하시오. 출간년도도 조회
select avg(stock_quantity), released_year
from books
group by released_year
order by avg(stock_quantity) desc;

-- 각 해당년도마다 몇권의 책이 발간되었는지 조회하세요. 년도도 조회
select released_year,count(*)
from books
group by released_year
order by released_year desc;

-- 이 테이블에 있는 stock_quantity 는 전부 몇입니까?
select sum(stock_quantity)
from books;
-- 각 발간년도별로, 책의 갯수와,평균 페이지수를 조회하세요.
select released_year,count(*) as cnt ,avg(pages) as avg
from books
group by released_year;

-- date : "YYYY-MM-DD" 이런 형식으로 저장 "2020-05-28"
-- time : "HH:MM:SS" 이런 형식으로 저장	"23:11:23"
-- datetime : "YYYY-MM-DD HH:MM:SS", "2020-05-28 23:11:16"
create table people2(
	name varchar(100),
    birthdate Date,
    birthtime Time,
    birthdt datetime
    );
desc people2;
insert into people2(name,birthdate,birthtime,birthdt)
		values("Padma","1989-11-11","20:07:35","1989-11-11 20:07:35");
insert into people2(name,birthdate,birthtime,birthdt)
		values("Larry","1992-10-21","13:17:30","1992-10-21 13:17:30");

select * from people2;

-- curdate() : 현재 날짜를 가져오는 함수
select curdate();
-- curtime() : 현재 시간을 가져오는 함수a
select curtime();
-- now() : 현재 날짜 + 시간
select now();

insert into people2 (name, birthdate,birthtime,birthdt)
	values("Mike",curdate(),curtime(),now());
    
select name, birthdate
from people2;
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
create table comments(
	content varchar(100),
    created_at timestamp default now(),
    changed_at timestamp default now() on update current_timestamp
    );
desc comments;
insert into comments(content)
	values("Hello"),
		  ("I found"),
          ("Bye");
select * from comments;

update comments set content = "Hi" 
where content = "Hello";

select * 
from comments
order by changed_at desc;

-- not equal : !=   

select title 
from books 
where released_year = 2013;

-- 2013이 아닌 데이터들만 조회하시오
select title
from books
where released_year != 2013;

-- 책 제목에 W 가 들어있지 않은 책들만 제목으로 조회하시요.
select title
from books
where title not like "%W%";

-- fname 이 Neil 이 아닌 사람드의 책 제목만 조회 하시오.
select author_fname
from books
where author_fname not like "%Neil%";
select author_fname
from books
where author_fname != "Neil";

insert into books(title,author_fname,author_lname,
	released_year, stock_quantity,pages)
		values("Hell", "Neil Mike","Gaiman", 2020,100,742);
select *from books
order by book_id desc;

-- greater than : ~ 보다 크다
-- 연도가 2000년 이후로 발간된 책의 제목과 년도를 조회하되, 발간년도가 최신순으로 조회하시오
select title,released_year
from books
where released_year >= 2000
order by released_year desc;

