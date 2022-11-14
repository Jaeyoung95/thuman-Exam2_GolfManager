-- 테이블 만들기
create table TBL_TEACHER_202201(
	TEACHER_CODE char(3) not null primary key,
	TEACHER_NAME varchar2(15),
	CLASS_NAME varchar2(20),
	CLASS_PRICE number(8),
	TEACHER_REGIST_DATE varchar2(8)
)

create table TBL_MEMBER_202201(
	C_NO char(5) not null primary key,
	C_NAME varchar2(15),
	PHONE varchar2(11),
	ADDRESS varchar2(50),
	GRADE varchar2(6)
)

create table TBL_CLASS_202201(
	REGIST_MONTH varchar2(6) not null,
	C_NO char(5) not null,
	CLASS_AREA varchar2(15),
	TUITION number(8),
	TEACHER_CODE char(3),
	primary key(REGIST_MONTH,C_NO)
)

-- 강사정보 샘플 데이터
insert into TBL_TEACHER_202201(TEACHER_CODE,TEACHER_NAME,CLASS_NAME,CLASS_PRICE,TEACHER_REGIST_DATE)
values('100','이초급','초급반',100000,'20220101');
insert into TBL_TEACHER_202201(TEACHER_CODE,TEACHER_NAME,CLASS_NAME,CLASS_PRICE,TEACHER_REGIST_DATE)
values('200','김중급','중급반',200000,'20220102');
insert into TBL_TEACHER_202201(TEACHER_CODE,TEACHER_NAME,CLASS_NAME,CLASS_PRICE,TEACHER_REGIST_DATE)
values('300','박고급','고급반',300000,'20220103');
insert into TBL_TEACHER_202201(TEACHER_CODE,TEACHER_NAME,CLASS_NAME,CLASS_PRICE,TEACHER_REGIST_DATE)
values('400','정심화','심화반',400000,'20220104')

-- 회원정보 샘플 데이터
insert into TBL_MEMBER_202201(C_NO,C_NAME,PHONE,ADDRESS,GRADE)
values('10001','홍길동','01011112222','서울시 강남구','일반');
insert into TBL_MEMBER_202201(C_NO,C_NAME,PHONE,ADDRESS,GRADE)
values('10002','장발장','01022223333','성남시 분당구','일반');
insert into TBL_MEMBER_202201(C_NO,C_NAME,PHONE,ADDRESS,GRADE)
values('10003','임꺽정','01033334444','대전시 유성구','일반');
insert into TBL_MEMBER_202201(C_NO,C_NAME,PHONE,ADDRESS,GRADE)
values('20001','성춘향','01044445555','부산시 서구','VIP');
insert into TBL_MEMBER_202201(C_NO,C_NAME,PHONE,ADDRESS,GRADE)
values('20002','이몽룡','01055556666','대구시 북구','VIP')

-- 수강정보 샘플 데이터
insert into TBL_CLASS_202201(REGIST_MONTH,C_NO,CLASS_AREA,TUITION,TEACHER_CODE)
values('202203','10001','서울본원',100000,'100');
insert into TBL_CLASS_202201(REGIST_MONTH,C_NO,CLASS_AREA,TUITION,TEACHER_CODE)
values('202203','10002','성남분원',100000,'100');
insert into TBL_CLASS_202201(REGIST_MONTH,C_NO,CLASS_AREA,TUITION,TEACHER_CODE)
values('202203','10003','대전분원',200000,'200');
insert into TBL_CLASS_202201(REGIST_MONTH,C_NO,CLASS_AREA,TUITION,TEACHER_CODE)
values('202203','20001','부산분원',150000,'300');
insert into TBL_CLASS_202201(REGIST_MONTH,C_NO,CLASS_AREA,TUITION,TEACHER_CODE)
values('202203','20002','대구분원',200000,'400')

-- 샘플 데이터 삽입여부 확인
select * from TBL_TEACHER_202201
select * from TBL_MEMBER_202201
select * from TBL_CLASS_202201


-- 테이블 삭제
drop table TBL_TEACHER_202201
drop table TBL_MEMBER_202201
drop table TBL_CLASS_202201

-- 레코드 삭제
delete from TBL_TEACHER_202201
delete from TBL_MEMBER_202201
delete from TBL_CLASS_202201
delete from TBL_CLASS_202201 where REGIST_MONTH='202209'

-- 강사조회화면
-- 시험에서 필요로 하는 SQL to_char 오라클 교재 162페이지 참조. 문자열 추출 substr도 알아둡시다.
-- 시험에서 유용하니 잘 알아둡시다.

select TEACHER_CODE,TEACHER_NAME,CLASS_NAME,to_char(CLASS_PRICE,'L9,999,999') as CLASS_PRICE,
substr(TEACHER_REGIST_DATE,1,4) || '년' || substr(TEACHER_REGIST_DATE,5,2) || '월' || substr(TEACHER_REGIST_DATE,7,2) || '일'
as TEACHER_REGIST_DATE 
from TBL_TEACHER_202201 order by TEACHER_CODE

-- 회원정보조회화면
-- inner join에 대한 능숙도가 필요합니다. 최근 정보처리 문제에서 3개 이상 테이블 조인 문제 출제됩니다.
select 
substr(T.TEACHER_REGIST_DATE,1,4) || '년' || 
substr(T.TEACHER_REGIST_DATE,5,2) || '월' || 
substr(T.TEACHER_REGIST_DATE,7,2) || '일'
as TEACHER_REGIST_DATE,M.C_NO,M.C_NAME,T.CLASS_NAME,C.CLASS_AREA,to_char(C.TUITION,'L9,999,999') as TUITION,M.GRADE
from TBL_CLASS_202201 C,TBL_MEMBER_202201 M,TBL_TEACHER_202201 T
where C.C_NO=M.C_NO and T.TEACHER_CODE=C.TEACHER_CODE
order by C.C_NO

-- vo를 만들 때에는 실제로 select문의 검색내용의 항목을 포함하는 vo를 만든다.
-- vo를 만드는 목적은 여러 개의 데이터를 객체화해서 전달하려고 하는 목적...
-- 결국 리스트 출력 시 항목의 내용을 검토하여 vo를 만들어야 함.




-- 강사매출현황 as값에 동일한 필드를 쓰면 에러가 나니 적절한 이름을 써주세요.
select T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME,
to_char(sum(C.TUITION),'L9,999,999') as SUM_PRICE
from TBL_TEACHER_202201 T,TBL_CLASS_202201 C
where T.TEACHER_CODE=C.TEACHER_CODE
group by T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME
order by T.TEACHER_CODE


