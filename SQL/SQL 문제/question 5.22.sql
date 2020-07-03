use songs;
-- select 옆에, 테이블이 두개 이상일때는, * 을 쓰지 마시고, 테이블명.*
select girl_group.*,song.*
from girl_group  
join song 
on girl_group.hit_song_id = song._id;

-- as 를 사용하여 테이블 명칭 축소
select g.*,s.*
from girl_group as g 
join song as s 
on g.hit_song_id = s._id;

-- 걸그룹 이름과 노래제목을 조회하시오.
select * from girl_group;
select * from song;
select g.name, s.title 
from girl_group as g 
join song as s 
on g.hit_song_id = s._id; 

-- 가수 이름, 데뷔날짜도 을 조회하시요
select name,debut 
from girl_group;

-- 데뷔날짜가 2008년 1월 17일인 그룹의 이름과 데뷔 날짜를조회
select name,debut 
from girl_group 
where debut = "2008-01-17";

-- 데뷔날짜가 2009 1월 1일 이후에 데뷔한 그룹의 이름과 데뷔날짜 노래제목을 조회
select * from song;
select * from girl_group;
select g.name,g.debut,s.title
from girl_group as g
join song as s
on g.hit_song_id = s._id
where g.debut >= "2009-01-01";

-- 이름에 "스" 자가 들어가는 걸그룹의 걸그룹이름과 데뷔날짜 타이틀을 조회하세요
select g.name,g.debut,s.title
from girl_group as g
join song as s
on g.hit_song_id = s._id
where name like "%스%";

-- 데뷔날짜가 2008 5월 1일 이후에 데뷔한 그룹의 이름과 데뷔날짜 노래제목을 최근 데뷔한걸 그룹부터 조회
select g.name,g.debut,s.title
from girl_group as g
join song as s
on g.hit_song_id = s._id
where g.debut > "2008-05-01"
order by g.debut desc;

--
select g.*,s.*
from girl_group as g
join song as s
on g.hit_song_id = s._id;

-- left outer join
select g.*, s.*
from song as s
left join girl_group as g
on g.hit_song_id = s. _id;

-- 걸그룹 중에서 히트곡 타이틀이 없는 걸그룹의 걸그룹 이름과 데뷔날짜를 조회하세요 
select * from girl_group;
select * from song;
select g.name,g.debut 
from girl_group as g
left join song as s
on g.hit_song_id = s._id
where g.hit_song_id is NULL;

-- 노래 피노키오를 부른 가수의 이름을 조회하세요  left join
select g.name
from song as s
left join girl_group as g
on s._id = g.hit_song_id
where s.title = "피노키오";

-- 노래 기대해 를 부른 가수의 노래와 이름을 조회하세요
select s.title,g.name
from song as s
left join girl_group as g
on s._id = g.hit_song_id
where s.title = "기대해";

-- emp_test 이동
use emp_test;

-- DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름 조회
select * from emp; 
select * from dept;
select e.ENAME,e.JOB,d.DEPTNO,d.DNAME
from dept as d
left join emp as e
on d.DEPTNO = e.DEPTNO
where LOC like "DALLAS";

-- 이름에 A 가 들어가는 사원들의 이름과 부서이름을 조회하세요.
select e.ENAME,d.DNAME
from emp as e
left join dept as d
on d.DEPTNO = e.DEPTNO
where e.ENAME like "%A%";

-- 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을 조회. 단 , 월급이 3000이상인 사원 대상으로
select e.ENAME, d.DNAME, e.SAL
from emp as e
left join dept as d
on d.DEPTNO = e.DEPTNO
where e.SAL >= 3000;

-- 직위가 SALESMAN 인 사원들의 직위 , 사원이름, 부서명 조회
select e.JOB,e.ENAME,d.DNAME
from emp as e
left join dept as d
on e.DEPTNO = d.DEPTNO
where JOB like "SALESMAN";

-- 커미션이 책정된 사원들의 사원번호 , 이름, 연봉, 연봉+커미션, 급여등급을 조회하되, 
-- 각각의 컬럼명을 , 한글로 사원번호, 사원이름,연봉, 실급여,급여등급으로 출력
select*from emp where comm;
select*from salgrade;
select e.EMPNO AS "사원번호", e.ENAME as "이름",e.SAL as "연봉",
e.SAL+ifnull(e.COMM,5000) as "실급여",s.GRADE as "급여등급"
from emp as e
left join salgrade as s
on e.SAL between s.LOSAL and s.HISAL
where COMM != 0;

-- 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 출력하시오
select e.DEPTNO, d.DNAME, e.ENAME, e.SAL, s.GRADE
from emp as e
left join dept as d 
on e.DEPTNO = d.DEPTNO
join salgrade as s
on e.SAL between s.LOSAL and s.HISAL
where e.DEPTNO = 10;

select e.*,d.*,s.* 
from emp as e 
left join dept as d 
on e.DEPTNO = d.DEPTNO
join salgrade as s
on e.SAL between s.LOSAL and s.HISAL;			

-- 부서번호가 10번, 20번, 30번인 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 조회하시오
-- 단, 부서번호가 낮은 순, 같은 부서면 월급이 놉은 순으로 정렬
select e.DEPTNO,d.DNAME,e.ENAME,e.SAL, s.GRADE
from emp as e
join dept as d
on e.DEPTNO = d.DEPTNO
join salgrade as s
on e. SAL between s.LOSAL and s.HISAL
where e.DEPTNO in(10,20,30) -- or
order by e.DEPTNO,e.SAL desc;

-- database sakila
use sakila;

-- 엑터테이블에서 퍼스트네임 라스트네임 조회
select first_name,last_name 
from actor;

-- 퍼슽트네임과 라스트네임을 붙여서, 'Actor Name' 별칭으로 출력
select concat(first_name," ",last_name) as "Actor Name"
from actor;
-- 소문자 대문자 
select lower(concat(first_name," ",last_name)) as "Actor Name"
from actor; -- upper

-- 퍼스트네임이 Joe인 배우의 액터 아이디, 퍼스트네임, 라스트 네임 조회.
select * 
from actor;
select actor_id, first_name, last_name
from actor
where first_name = "Joe";

-- 컨트리 테이블을 조회해 보고,
-- 컨트리가 Afghanistan, Bangladesh, China인 컨트리 아이디와 컨트리를 조회하시오
select country_id,country
from country
where country in ("Afghanistan","Bangladesh","China");

-- 엑터 테이블에 middle_name 컬럼을 추가할 것임 이컬럼의 위치는 , 퍼스트네임 다음에 위치합니다
-- 이컬럼의 데이터는 문자열 20개 까지 저장하는 컬럼입니다. 이건 생략
alter table actor
add column middle_name varchar(20) -- char  문자열 두가지
after first_name;

select * from actor;
-- middle_name 컬럼 삭제하는 SQL
alter table actor
drop column middle_name;
-- 우리는테이블과 커러 조작은 마우스로함

-- 라스트네임으로 묶되, 같은 라스트네임이 몇개씩었는지 세어서 출력 라스트네임과 카운팅한 숫자를 조회.
select last_name,count(last_name)
from actor
group by last_name;
-- 위의 결과에서, 사람수가 3명 이상인 데이터만 조회
select last_name,count(last_name)
from actor
group by last_name having count(last_name) >= 3;

-- 퍼스트네임이 GROUCHO 이고, 라스트네임이 WILLIAMS 인 사람의 퍼스트네임을 HARPO 로변경하시오
update actor set first_name = "HARPO"  
where first_name = "GROUCHO" and last_name = "WILLIAMS";
select *
from actor
where first_name = "HARPO" and last_name = "WILLIAMS";


