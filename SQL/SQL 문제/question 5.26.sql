show tables;
-- 테이블의 컬럼 확인
desc pastries;
-- 테이블 삭제하는 방법
drop table pastries;

-- 고양이 정보 저장 테이블 생성
-- 테이블명 : cats, column 2개 , name : 문자 50개 , age : 나이저장. 정수
create table cats
(
	name varchar(50),
    age int
);
-- 이름은 Blue 나이는 1

insert into cats(name, age) values("Blue",1);
select * from cats;
insert into cats (age, name) values(11,"Draco");
-- 데이터를 여러행으로 한번에 저장하는 방법
insert into cats (name, age)
			values('Charlie',10),
					('Sadie',3),
					('Lazy Bear',1);
                    
-- people table , column first_name 문자 20,column last_name 문자 20, column age 정수
-- Tina, Belcher ,13          Bob, Belcher, 42
create table people
(
	first_name varchar(20),
    last_name varchar(20),
    age int
);
insert into people(first_name,last_name,age)
			values('Tina','Belcher',13),
				  ('Bob','Belcher',42);
select * from people;
insert into people(first_name,last_name,age)
			values("Linda","Belcher",45),
				  ("Phillip", "Frond",38),
                  ("Calvin","Fischoeder",70);

show databases;
show tables;
desc people;
-- 텍스트를저장하려고 하는데, "I'm your farther."
-- first_name : "I'm your farther."
-- last_name : "hello",  age 30
insert into people(first_name,last_name,age)
			values("I'm your farther.","hello",30);
select * from people;		

-- first_name : "He said "HI"."
-- last_name : "hello",  age 30
-- 문자열 안네 작은따옴표나 큰따옴표가 들어갈경우,  \(역슬레시)를 써준다
insert into people(first_name,last_name,age)
			values("He said\"Hi\".","hello",30);

-- cats table data insert
-- "This cat is named Charlie which is also a human name. In fact I know a couple of Charlies. Fun Fact"
-- age 10
insert into cats(name,age)
	values("This cat is named Charlie which is also a human name. In fact I know a couple of Charlies. Fun Fact",
    10);
desc cats;

-- NULL : 값이 없다 , 0 이다 라는것과는 다른것이다.,공백 과도 다른것이다.
insert into cats (name)
	values("Alabama");
select * from cats;

insert into cats() values();

-- column 정의할때, NOT NULL 키워드를 사용하여 테이블 생성하는 경우
-- Table name : cats2, column name : String 100 , 그리고 NOT NULL
-- column age : 정수, and NOT NULL
create table cats2
(
	name varchar(100) not null,
    age int not null
    );
desc cats2;

-- cats2 (Not NULL ) table data insert   (Mit,3),(Young),(10)
insert into cats2 (name,age)
	values("Mit",3);
select * from cats2;
insert into cats2 (name)
	values("Young");

insert into cats2 (age)
	values(10);
 -- cats3 table create  name not null   
create table cats3
(
	name varchar(100) not null,
    age int 
    );    
insert into cats3 (name, age) values("Hi",3);
select * from cats3;
insert into cats3 (age) values(5);
insert into cats3 (name) values("Momo");
select * from cats;
desc cats;

-- 회사의 정책이 바뀌어서, name,age 없으면 null 이 아니라 "unnamed", age는 99세로

create table cats4 
(
	name varchar(100) default "unnamed",
    age int default 99
);
insert into cats4 (name, age) values("Momo",3);
select * from cats4;
insert into cats4 (name) values("Kity");
insert into cats4 (age) values(10);
insert into cats4() values();
desc cats4;

-- Primary Key  테이터 중복없이 유니크하게 처리하자.
create table unique_cats
(
	cat_id int not null,
    name varchar(100),
    age int,
    primary key (cat_id)
);
desc unique_cats;

insert into unique_cats (cat_id, name, age)
	values(1,"Fred", 4);
insert into unique_cats (cat_id, name, age)
	values(2,"Louise",3);
select * from unique_cats;
-- cat id 동일한 숫자로 , 새로운 데이트를 저장하는 경우
insert into unique_cats (cat_id, name, age)
	values(1, "James",5);
-- Duplicate entry '1' for key 'PRIMARY'

-- primary key 값을, 데이터베이스가 자동으로 알아서 계산해서 넣어주는 방법.
-- AUTO_INCREMENT (소문자도 동일)

create table unique_cat2 (
	cat_id int not null auto_increment,
    name varchar(100),
    age int,
    primary key(cat_id)
    );
desc unique_cat2;
-- cat_id 는 not null 이라서 , insert할때 값을 꼭 써줘야 합니다.
-- 그런데, cat_id는 auto_increment로 설정했으므로, 디비가 알아서 값을 채워주니까, 우리가 인서트에 값 넣을 필요 없다.
insert into unique_cat2 (name, age)
	values("Skippy",4);
select * from unique_cat2;

insert into unique_cat2 (name,age)
	values("Jiff",3);
    
-- table name : employees ,columns = id 숫자 (자동증가),필수,primary key
-- last_name: String(30), 필수, first_name : String(30),필수 , middle_name :String(30) 필수아님
-- age : 숫자, 필수 current_status : String(20),필수아님,default "employed"
-- 첫번째 방범
create table employees(
	id int not null auto_increment,
    last_name varchar(30) not null,
    first_name varchar(30) not null,
    middel_name varchar(30),
    age int not null,
    current_status varchar(20) default "employed",
    primary key (id)
    );
    
    -- 두번째 방법
    create table employees(
	id int not null auto_increment primary key,
    last_name varchar(30) not null,
    first_name varchar(30) not null,
    middel_name varchar(30),
    age int not null,
    current_status varchar(20) default "employed"
    );
    desc employees;
    
-- cats 테이블 삭제하고 새로 만들기
drop table cats;    

create table cats (
	cat_id int not null auto_increment primary key,
    name varchar(100),
    breed varchar(100),
    age int
    );
desc cats;
-- data 를 한번에 여러개를 insert("Ringo", "Tabby", 4),("Cindy","Maine Coon", 11),
-- ("Dumbleddore","Maine Coon",11),("Egg", "Persian", 4),
-- ("Misty", "Tabby", 13),("George Michael", "Ragdoll", 9),("Jackson", "Sphynx",7);
insert into cats(name,breed,age)
		values("Ringo", "Tabby", 4),
        ("Cindy","Maine Coon", 11),
        ("Dumbleddore","Maine Coon",11),
        ("Egg", "Persian", 4),
        ("Misty", "Tabby", 13),
        ("George Michael", "Ragdoll", 9),
        ("Jackson", "Sphynx",7);
select * from cats;
-- 저장되어 있는 값을, 다른 값으로 바꾸는 것이 update
-- 품종이 Tabby 인것들을 , 품종을 Shorthair
update cats set breed = "Shorthair" 
where breed = "Tabby" and cat_id > 0;
-- update cats set breed = "Shorthair" where cat_id > 0 ;  safe mode로 막혔을때 전체 바꾸는법
-- name Misty 인 고양이 나이를 14로 변경하세요
update cats set age = 14 
where name = "Misty";    

-- 이름이  Jackson 인 고양이 이름을 , Jack으로 바꾸세요
update cats set name = "Jack" where name = "Jackson";
-- 이름이 Jackson 인 고양이는 몇마리인지 조회하세요.
select count(*)  as "고양이 수"
from cats
where name = "Jackson";
-- 이름이 Jack 인 고양이는 몇마리인지 조회하세요.
select count(*) as "cats count" 
from cats
where name = "Jack";
select * from cats;    

-- 이름이 Ringo 인 고양이의 품종을 British Shorthair로 바꾸세요
update cats set breed = "British Shorthair"
where name = "Ringo";   
-- 품종이 hair 이 들어가는 데이터를 조회하시오.
select * 
from cats
where breed  like "%hair%";
-- 품종이 Maine Coon 인 고양이의 나이를 12로 변경하세요.
update cats set age = 12 
where breed = "Maine Coon";
-- 고양이의 나이가 8살보다 큰 고양이만 조회하세요.
select * 
from cats
where age > 8;
-- 나이가 8보다 큰 고양이의 이름과 품종을 "Kitty","Ragdoll"로 변경
update cats set name = "Kitty" , breed = "Ragdoll"
where age > 8 ;

-- age 4 cats data  delete
delete  from cats where  age = 4;
select * from cats;
-- 고양이 나이가 12인 고양이의 나이를 3로 변경
update cats set age = 3
where age = 12;

-- cats  id and age same data delete
delete from cats where cat_id = age; 
create database shirts_db;
use shirts_db;
create table shirts(
	shirt_id int not null auto_increment primary key,
    article varchar(30),
    color varchar(30),
    shirt_size varchar(5),
    last_worn int
    );
desc shirts;
insert into shirts(article, color, shirt_size, last_worn)
	values ("t-shirt","white","S",10),
		   ("t-shirt","green", "S",200),
           ("polo shirt","black","M",10),
           ("tank top","blue","S",50),
           ("t-shirt","pink","S",0),
           ("polo shirt","red","M",5),
           ("tank top", "white", "S", 200),
           ("tank top", "blue", "M", 15);
select * from shirts;

-- 아티클과 컬러만 조회하시오
select article,color 
from shirts;
-- 셔츠 사이즈가 M 인 , 데이터에서 셔츠아이디만제회하고 화면에 조회
select article,color,shirt_size,last_worn
from shirts
where shirt_size = "M";

-- 아티클이 polo shirt 로 되어있는 셔츠의 사이즈를 L로 바꾸세요
update shirts set shirt_size = "L"
where article = "polo shirt";
SELECT*FROM shirts;
-- last_worn 이 15인 데이터를 전부 10으로 바꿔주세요
update shirts set last_worn = 10 
where last_worn = 15;

-- color white  shirts, color off white change, shirt size XS change
update shirts set color = "off white",shirt_size = "XS"
where color = "white";
select * from shirts where color ="off white";

-- last_wron 이 200인 데이터를 삭제하시오.
delete from shirts where last_worn = 200;

-- 아티클이 tank top 인 데이터를 삭제하세요.
delete from shirts where article = "tank top";
-- shirts 테이블을 삭제하세요
drop table shirts;
-- shirts_db에 있는 테이블 리스트를 조회하세요.
show tables;
use mydb;
create table books(
	book_id int not null auto_increment primary key,
    title varchar(100),
    author_fname varchar(100),
    author_lname varchar(100),
    released_year int,
    stock_quantity int,
    pages int
);
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books;

--  문자열 합치기  작가의 퍼스트 네임과 라스트네임 붙이기
select author_fname, author_lname from books;
select concat(author_fname," ",author_lname) as FullName from books;

-- "책제목-작가이름-작가의성" 이 나오도록 죄회하되, 컬럼면은 title_author
select concat(title,"-",author_fname,"-",author_lname) as title_author
from books;

select concat_ws("-",title,author_fname,author_lname) as title_author
from books;

-- substring() : 문자열의 일부분을 가져오는 함수.
select substring("Hello World",3);
select substring("Hello World",1,4);
select substring("Hollo World",-3);
select substring("Hello World",4,2);

-- 책 제목을 조회하시오
select title
from books;

-- 책 제목을 죄회하되, 제목이 처음부터 10글자 까지만 나오도록 조회.
select substring(title,1,10)
from books;
-- 조회 결과가 아래처럼 나오도록 하시오. The Namesa....
select concat(substring(title,1,10),"....") as title
from books;

-- replace() : 문자열에서 원하는 문자열을 바꾼다.
select replace("Hello World","Hell","Heaven");
select replace("Hello World","l","7");
select replace("cheese bread coffee milk", " "," and ");
-- 타이틀에서 e 가 들어있으면, e를 3으로 변경하여서, 타이틀을 조회하시오.
select replace(title, "e","3") as title
from books;

-- reverse() 문자열의 순서를 역순으로 바꿔준다.
select reverse("Hello World");
-- 작가의 이름과 성을 조회하되, 성 부분을 역순으로 바꿔서 조회하시오.
select * from books;
select author_fname,reverse(author_lname)
from books;

-- char_length() 문자열의 수를 세주는 함수
select char_length("Hello World");
-- 작가의 성, 작가 성 이름의 갯수 이렇게 두개를 조회 하시오
select author_lname, char_length(author_lname) as length
from books;
-- 위의 컬럼을 합치되, Lahiri is 6
select concat(author_lname," is ", char_length(author_lname)) as last_name_cnt
from books;