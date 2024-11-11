-- 학생 테이블 생성
-- 학번, 이름, 학과명, 평점
CREATE TABLE STUDENT(
	STD_NO CHAR(8), 
	STD_NAME VARCHAR2(50),
	MAJOR_NAME VARCHAR2(50), 
	STD_SCORE NUMBER(3,2)
);

-- 데이터 추가
INSERT INTO STUDENT(STD_NO, STD_NAME, MAJOR_NAME , STD_SCORE)
VALUES('20201111', '홍길동', '컴퓨터공학과', 3.24);

-- 데이터 전체 조회 (학생 테이블)
SELECT * FROM STUDENT; -- *은 전체
SELECT STD_NO, STD_NAME FROM STUDENT;

-- DDL : Data Definition Language, 데이터 정의어
--		 데이터베이스 구성 요소를 정의, 변경, 삭제
--		 CREATE : 데이터베이스 구성 요소를 생성(테이블, 인덱스, 시퀸스, 사용자 등)
--		 ALTER : 생성된 데이터베이스 구성 요소를 변경
--		 DROP : 생성된 데이터베이스 구성 요소를 삭제
--		 TRUNCATE : 테이블의 모든 데이터를 빠르게 삭제하고, 공간을 해제하고, 구조는 유지함

-- 테이블 생성
CREATE TABLE 테이블_이름 (
	컬럼명1 데이터타입 PRIMARY KEY,
	컬럼명2 데이터타입 [NULL | NOT NULL],
	컬럼명3 데이터타입 DEFAULT 기본값,
	컬럼명4 데이터타입,
	...,
	마지막컬럼명 데이터타입,
	CONSTRAINT 제약조건이름 PRIMARY KEY (컬럼명)
);

-- 데이터 타입
-- 문자열 : CHAR(고정 길이 문자열, 2000 바이트까지 지원), VARCHAR2(가변 길이 문자열, 4000바이트까지 지원), CLOB(128TB까지 지원)
-- 숫자 : NUMBER(자리 수, 소수점 개수) - 최대 38자리, FLOAT - 최대 128자리
-- 날짜 시간 : DATE(날짜/시간), TIMESTAMP(소수점까지 저장 가능, 최대 9자리)

-- PERSON 테이블
-- 이름 -> 문자열
-- 나이 -> 숫자
CREATE TABLE PERSON (
	PNAME VARCHAR2(30),
	PAGE NUMBER(3)
);

-- 데이터 5건 넣는 SQL문
INSERT INTO PERSON(PNAME, PAGE) VALUES('John', 25);
INSERT INTO PERSON(PNAME, PAGE) VALUES('Emma', 30);
INSERT INTO PERSON(PNAME, PAGE) VALUES('Michael', 40);
-- 테이블의 모든 컬럼에 데이터를 저장 (테이블 작성 시 작성한 순서대로)
INSERT INTO PERSON VALUES('Sophia', 21);
INSERT INTO PERSON(PNAME, PAGE) VALUES('Becky', 23);


-- PERSON 테이블에 있는 모든 데이터를 조회
SELECT * FROM PERSON;

-- 나이가 4자리인 PERSON 데이터 추가
INSERT INTO PERSON(PNAME, PAGE) VALUES('Mike', 1000);

-- PERSON 테이블 삭제 구문 --> 삭제 시 모든 데이터가 날아감
DROP TABLE PERSON;

-- 컬럼에 기본값 설정
CREATE TABLE PERSON(
	PNAME VARCHAR(30),
	PAGE NUMBER(3) DEFAULT 30
);

-- PAGE에 데이터를 넣지 않았기 때문에 기본값 지정한 30이 저장됨
INSERT INTO PERSON(PNAME) VALUES('김철수');
INSERT INTO PERSON(PNAME, PAGE) VALUES('김철수', NULL);

-- PERSON 테이블 데이터 삭제
TRUNCATE TABLE PERSON;

-- 학생 테이블 삭제
DROP TABLE STUDENT;

-- 학생 테이블 
-- 학번, 이름, 학과명, 학점
CREATE TABLE STUDENT(
	STD_NO CHAR(8) PRIMARY KEY, -- 기본키 설정
	STD_NAME VARCHAR2(30) NOT NULL, -- 데이터를 반드시 입력해야함
	MAJOR_NAME VARCHAR2(30),
	STD_SCORE NUMBER(3, 2) DEFAULT 0 NOT NULL -- 기본값 0으로 설정, NULL이 올 수 없게 처리
);

-- 학생 데이터 5건 저장
INSERT INTO STUDENT VALUES ('1', 'Kim Minho', '컴퓨터공학', 4.25);
INSERT INTO STUDENT VALUES ('2', 'Lee Jieun', '생명공학', 3.24);
INSERT INTO STUDENT VALUES ('3', 'Park Jihoon', '광고홍보학', 2.19);
INSERT INTO STUDENT VALUES ('4', 'Choi Yuna', '멀티미디어학', 3.92);
INSERT INTO STUDENT VALUES ('5', 'Jung Wooyoung', '경영학', 3.83);
INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME) VALUES ('6', 'Kim Miyoung', '자율전공');
INSERT INTO STUDENT (STD_NO, STD_NAME, MAJOR_NAME, STD_SCORE) VALUES ('2024000', '이영수', '물리학', 2.9);

-- 학생 데이터 검색
SELECT * FROM STUDENT WHERE STD_NO = '20230001';
SELECT * FROM STUDENT WHERE STD_NO LIKE '20230001';
SELECT * FROM STUDENT WHERE STD_NO LIKE '2024000';
SELECT * FROM STUDENT WHERE STD_NO LIKE '2024000 ';
-- LIKE로 조회를 할 때는 정확하게 데이터를 비교하고, 문자열 8자리로 설정해놓았기 때문에 8자리보다 적은 길이로 데이터를 저장해놓았다면 뒤에 공백을 넣어주어야함
-- CHAR 고정 길이 문자열이기 때문에 공간이 남으면 뒤에 공백으로 채워짐

-- 평점이 3.0 이상인 데이터만 조회
SELECT * FROM STUDENT WHERE STD_SCORE >= 3.0; 

-- 테이블 컬럼 추가
ALTER TABLE STUDENT ADD STD_GENDER NUMBER(1) DEFAULT 0 NOT NULL;

-- 테이블 컬럼 변경
ALTER TABLE STUDENT MODIFY STD_GENDER CHAR(1) DEFAULT 'M';
ALTER TABLE STUDENT MODIFY STD_GENDER NUMBER(1) DEFAULT 0 NULL;

UPDATE STUDENT SET STD_GENDER = NULL;

-- 테이블 컬럼 삭제
ALTER TABLE STUDENT DROP COLUMN STD_GENDER;

-- 테이블 컬럼 이름 변경
ALTER TABLE STUDENT RENAME COLUMN STD_NAME TO STD_NEW_NAME;

-- 테이블 이름 변경
ALTER TABLE STUDENT RENAME TO NEW_STUDENT;

-- 날짜 컬럼 추가 및 데이터 추가
ALTER TABLE PERSON  ADD BIRTH DATE;

-- PERSON 데이터 추가
INSERT INTO PERSON(PNAME, PAGE, BIRTH) VALUES ('박명수', 42, '1984-04-29');
INSERT INTO PERSON(PNAME, PAGE, BIRTH) VALUES ('유재석', 41, '1985/05/10');
INSERT INTO PERSON(PNAME, PAGE, BIRTH) VALUES ('하하하', 38, '88/12/20');
INSERT INTO PERSON(PNAME, PAGE, BIRTH) VALUES ('지드래공', 32, SYSDATE);

SELECT * FROM PERSON;

-- 현재 날짜 시간 확인 방법
SELECT SYSDATE FROM DUAL;


DROP TABLE PERSON;
-------------------------------------------------------------------

-- Q. 사원 정보 저장할 테이블 생성
-- 샘플 데이터 50건 추가
-- 저장할 사원정보 데이터 (사번, 이름, 직급, 부서명, 연봉, 입사일)
-- 기본 키로 지정할 것, 입사일은 기본값으로 현재 날짜 시간
-- 연봉은 기본값 0, 직급은 기본값으로 사원 반드시 입력
--
-- 'A20231111’, ‘김철수’, ‘과장’, ‘회계부’, 45000000, ‘2023-09-12’
-- 사원번호는 첫 글자가 알파벳 대문자, 나머지는 연도 + 4자리 숫자

CREATE TABLE EMPLOYEE(
	NO CHAR(9) PRIMARY KEY,
	NAME VARCHAR2(30) NOT NULL,
	POSITION VARCHAR2(30) DEFAULT '사원' NOT NULL,
	DEPARTMENT VARCHAR2(30) NOT NULL,
	SALARY NUMBER DEFAULT 0 NOT NULL,
	JOIN_DATE DATE DEFAULT SYSDATE
);


INSERT INTO EMPLOYEE VALUES('A20231111', '김철수', '과장', '회계부', 45000000, '2023-09-12');


