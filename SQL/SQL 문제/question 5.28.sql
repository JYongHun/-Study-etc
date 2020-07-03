-- and : 여러 조건을, 그리고  의미로 해석될때 사용.
-- 작가의 lname이 Eggers이고 발간년도가 2010년 이상인 책들의 책 제목과 lname과 년도를 조회하라.
select title, author_lname, released_year
from books 
where author_lname = "Eggers" and released_year >= 2010;
-- 작가이름이 Eggers이고 발행년도가 2010 이상이고, 책제목에 novel 이 포함된 책들의 모든 컬럼을 조회
select *
from books
where author_lname = "Eggers" 
and released_year >= 2010 
and title like "%Novel%";
-- or 또는 , 거나 이렇게 해석될때 사용
-- 작가이름이 Eggers 이거나 발행발간년도가 2010년 이상인 책들만,책제목과 작가이름,년도로 조회.
select title,author_lname,released_year
from books
where author_lname = "Eggers" or released_year >= 2010;
-- 작가이름이 Eggers 이거나 발행발간년도가 2010년 이상이거나 stock_quantity가
-- 100 이상인 책들만 , 모든컬럼 조회하시오
select *
from books
where author_lname = "Eggers" or released_year >= 2010
or stock_quantity >=100;
-- between : 뭐와 뭐 사이의 값으로 조회해달라. 00부터 ~ 00 까지
-- 발간년도가 2004 년 이상이고 2015년 이하인 책, 발간년도가 2004년 부터 2015년 사이에 나온책.
select *
from books
where released_year >= 2004 and released_year <= 2015;
select *
from books
where released_year between 2004 and 2015;
-- 책 발간년도가 2004년 과 2015년 사이에 발간된 책이 아닌것을만, 책 제목을 조회하시오
select title
from books
where released_year not between 2004 and 2015;
select *
from books 
where released_year <= 2004 or released_year >= 2015; 
-- people2 에서 birthdt가 1990 년 이상 2010 사이에 태어난 사람으 이름과 birthdt를조회
desc people2;
select name , birthdt
from people2
where birthdt between "1990-01-01 00:00:00" and "2010-01-01 00:00:00";
select name , birthdt
from people2
where year(birthdt) between "1990" and "2010";
desc people2;
select name , birthdt
from people2
where time(birthdt) between "01:00:00" and "23:00:00";
select * from people2;

select name, birthdt
from people2
where birthdt between cast("1990-01-01" as datetime) and
						cast("2010-12-31" as datetime);
-- github 문제 3
select * from books;
-- 1
select *
from books 
where author_lname = "Eggers"or author_lname ="Chabon" ;
-- 2
select title, pages
from books
where released_year <= 1980 and pages <= 500;
-- 3
select author_lname, sum(pages)
from books
where  author_lname = "Eggers" or author_lname = "Lahiri"
group by author_lname;
-- 4
select title, released_year
from books
where stock_quantity between 60 and 100
order by released_year 
limit 0,1;
select * from books order by released_year;
-- 5
select count(*), sum(stock_quantity)
from books
where char_length(title) >= 30;
select title,char_length(title),stock_quantity from books;
-- 6
select released_year as year, count(*) as cnt, sum(pages)as pages
from books
group by released_year;

-- in / not in : 여러개 중에 포함되어 있는것들을 가져올떄 / 가져오지 않을때 column이 동일시
-- Carver, Lahiri, Smith 이 세명의 책 제목과 이름을 조회.
select title,author_lname
from books
where author_lname in ("Carver","Lahiri","Smith");
-- 2016년 2003년 1996 년 에 출간한 책 제목과 작가 이름을 조회
select title,author_fname
from books
where released_year in (2016,2003,1996);
-- 2016년 2003년 1996 년 이 아닌 출간한 책 제목과 작가 이름을 조회
select title,author_fname
from books
where released_year not in(2016,2003,1996);
-- 2016년 2003년 1996 년 이 아닌 출간한 책중에서, 2005년 이후에 출간된 책 제목과 작가 이름을 조회
select title ,author_fname, released_year
from books
where released_year not in(2016,2003,1996) and released_year >= 2005;
-- github 문제 4
-- Schema
-- student table, papers table
create table students(
		id int not null auto_increment primary key,
        first_name varchar(100)
);
create table papers(
	id int not null auto_increment primary key,
    title varchar(100),
    grade int ,
    student_id int,
    foreign key (student_id) references students(id) on delete cascade
);
-- 만약에 students 테이블에서 데이터가 삭제 (delete )될 경우에,
-- papers 테이블에 해당 id값이 있으면, 같이 삭제하도록 할 수 있다.
-- 그 문법은 ? on delete cascade
-- on delete cascade   students
select * from students;
select *from papers;
delete from students where id = 1;
-- github 문제 5
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);
select * from students;
select * from papers;
-- 1
select s.first_name, p.title , p.grade
from students as s
join papers as p
on s.id = p.student_id
order by p.grade desc;
-- 2
select s.first_name,p.title,p.grade
from students as s
left join papers as p
on s.id = p.student_id; 
-- 3 
select s.first_name,ifnull(p.title,"MISSING"),ifnull(p.grade,0)
from students as s
left join papers as p
on s.id = p.student_id;
-- 4
select s.first_name,ifnull(avg(p.grade),0) as average
from students as s
left join papers as p
on s.id = p.student_id
group by s.first_name
order by p.grade desc;
-- 5 
select first_name,ifnull(avg(p.grade),0) as average,
	case
		when avg(p.grade) >= 70 then "PASSING"
		else "FAILING"
	end as passing_tatus
from students as s
left join papers as p
on s.id = p.student_id
group by s.first_name
order by p.grade desc;

-- case statemants
select title, released_year,
	case
		when released_year >= 2003 then"Modern"
        else "20th Centry"
	end as genre
from books;

select title, stock_quantity,
	case
		when stock_quantity between 0 and 50 then "*"
        when stock_quantity between 51 and 100 then "**"
        else "***"
	end as stock
from books;

select title, stock_quantity,
	case
		when stock_quantity <= 50 then"*"
        when stock_quantity <= 100 then"**"
        else "***"
	end as stock
from books;

-- 3 이상의 테이블 설계 reviewers , series,reviews
create table reviewers(
	id int not null auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100)
);
create table reviews(
	id int not null auto_increment primary key,
    rating decimal(2,1) ,
    series_id int ,
    reviewer_id int,
    foreign key(series_id) references series(id) ,
	foreign key(reviewer_id) references reviewers(id)
);
create table series(
	id int not null auto_increment primary key,
    title varchar(100),
    released_year year(4) ,
    genre varchar(100)
);

  
INSERT INTO series (title, released_year, genre) VALUES
   ('Archer', 2009, 'Animation'),
   ('Arrested Development', 2003, 'Comedy'),
   ("Bob's Burgers", 2011, 'Animation'),
   ('Bojack Horseman', 2014, 'Animation'),
   ("Breaking Bad", 2008, 'Drama'),
   ('Curb Your Enthusiasm', 2000, 'Comedy'),
   ("Fargo", 2014, 'Drama'),
   ('Freaks and Geeks', 1999, 'Comedy'),
   ('General Hospital', 1963, 'Drama'),
   ('Halt and Catch Fire', 2014, 'Drama'),
   ('Malcolm In The Middle', 2000, 'Comedy'),
   ('Pushing Daisies', 2007, 'Comedy'),
   ('Seinfeld', 1989, 'Comedy'),
   ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
   ('Thomas', 'Stoneman'),
   ('Wyatt', 'Skaggs'),
   ('Kimbra', 'Masters'),
   ('Domingo', 'Cortes'),
   ('Colt', 'Steele'),
   ('Pinkie', 'Petit'),
   ('Marlon', 'Crafford');
  
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
   (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
   (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
   (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
   (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
   (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
   (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
   (7,2,9.1),(7,5,9.7),
   (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
   (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
   (10,5,9.9),
   (13,3,8.0),(13,4,7.2),
   (14,2,8.5),(14,3,8.9),(14,4,8.9);

select * from reviews;
select * from reviewers;
select * from series;
-- 티비 쇼 제목과 별점을 조회하시오 
select s.title,r.rating
from series as s
join reviews as r
on r.series_id = s.id; 
-- 티비쇼의 제목별, 별점평균을 조회하시오
select s.title,avg(r.rating) as rating
from series as s
join reviews as r
on r.series_id = s.id
group by title
order by rating desc;
-- 리뷰어의 풀네임 과 별점을 조회하세요
select concat(re.first_name," ",re.last_name) as "Full Nmae",r.rating
from reviewers as re
join reviews as r
on r.reviewer_id = re.id;
-- 티비쇼중에서 별점이 없는 것들을 , 제목으로 조회하시오
select s.title
from series as s
left join reviews as r
on r.series_id = s.id
where r.rating is null; 	-- ifnull(r.rating,0 )=  0 ; 
-- 각 장르별로, 장르와 장르의 별점평균을 구하시오. 단 평균의 소수점 3자리를 반올림하시오
select s.genre, round( avg(r.rating),2) as average
from series as s
join reviews as r
on s.id = r.series_id
group by s.genre;

