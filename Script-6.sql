--제품 테이블
--	샘플 데이터 50건
--	제품 번호, 제품명, 제조사 번호, 금액
--제조사 테이블
--	샘플 데이터 5건
--	제조사 번호, 제조사명
--
--테이블 생성, 데이터 셋팅
--SELECT, INSERT, UPDATE, DELETE

CREATE TABLE PRODUCT(
	PRO_NO CHAR(10) PRIMARY KEY,
	PRO_NAME CHAR(30),
	PRO_M_NO NUMBER(2) DEFAULT 1,
	PRO_PRICE NUMBER(7) DEFAULT 0
);

CREATE TABLE MAKER(
	M_NO NUMBER(2) DEFAULT 1,
	M_NAME CHAR(30)
);