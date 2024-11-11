1. STUDENT 테이블과 MAJOR 테이블을 조인하여 각 학생의 학번, 이름, 학과명, 평점을 조회하는 뷰 STUDENT_VIEW를 생성하는데 이때,
평점이 3.5 이상인 학생만 포함되도록 하며, 학과명은 MAJOR_NAME 컬럼을 사용하여 만들었으나 오류가 생겼다.
해당 오류를 보고 에러 원인을 쓰고 수정한 SQL문을 제출하세요.

CREATE OR REPLACE VIEW STUDENT_VIEW
IS
SELECT
	*
FROM
	STUDENT S
JOIN MAJOR M
WHERE
	S.STD_SCORE >= 3.5;
----------------------------------------------------
CREATE OR REPLACE VIEW STUDENT_VIEW
AS
SELECT
	S.STD_NO, S.STD_NAME, M.MAJOR_NAME, S.STD_SCORE
FROM
	STUDENT S
JOIN MAJOR M ON S.MAJOR_NO = M.MAJOR_NO
WHERE
	S.STD_SCORE >= 3.5;

SELECT * FROM STUDENT_VIEW;


2. MAJOR 테이블의 MAJOR_NO 컬럼에 자동으로 학과 번호를 부여하기 위한 시퀀스 SEQ_MAJOR_NO를 생성하여 데이터를 넣는 도중 문제가 생겼다.
무슨 문제인지 파악 후 해당 시퀸스를 만드는 SQL문을 수정하여 제출하세요.

CREATE SEQUENCE SEQ_MAJOR_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SEQ_MAJOR_NO
START WITH 11
INCREMENT BY 1
NOCACHE;

3. STUDENT 테이블에서 STD_TEL 컬럼을 사용하여 학생 정보를 효율적으로 검색할 수 있도록
IDX_STUDENT_TEL이라는 이름의 인덱스를 생성 중에 오류가 생겼다.
무슨 문제인지 파악 후 해당 인덱스를 만드는 SQL문을 수정하여 제출하세요.

CREATE INDEX IDX_STUDENT_TEL ON STUDENT(STD_TEL);


4. 학생의 평점(STD_SCORE)을 입력받아 성적 등급을 반환하는 함수 FN_GET_GRADE를 작성하는데 오류가 생겼다.
성적 등급은 다음 기준에 따릅니다. 어떤 문제가 생겼는지 적고, 이를 수정한 SQL문을 제출하세요

• 4.0 이상: A
• 3.5 이상 4.0 미만: B
• 3.0 이상 3.5 미만: C
• 2.5 이상 3.0 미만: D
• 2.5 미만: F

CREATE OR REPLACE
FUNCTION FN_GET_GRADE(p_score NUMBER)
RETURN VARCHAR2
IS
v_grade CHAR(1);
BEGIN
IF p_score >= 4.0 THEN
v_grade := 'A';
ELSIF p_score >= 3.5 THEN
v_grade := 'B';
ELSIF p_score >= 3.0 THEN
v_grade := 'C';
ELSIF p_score >= 2.5 THEN
v_grade := 'D';
ELSE
v_grade := 'F';
END IF;
RETURN v_grade;
END;

SELECT FN_GET_GRADE(3.9) FROM DUAL;


5. 학생 데이터를 STUDENT 테이블에 추가 후에 실행되는 트리거 TRG_STUDENT_INSERT_LOG를 작성하는데 문제가 생겼다.
이 트리거는 방금 만든 SQL_LOGS 테이블에 다음 정보를 저장합니다. 어떤 문제가 생겼는지 적고, 이를 수정한 SQL문을 제출하세요.

CREATE OR REPLACE TRIGGER TRG_STUDENT_INSERT_LOG
AFTER
INSERT ON STUDENT
FOR EACH ROW
BEGIN
	INSERT INTO
	SQL_LOGS (EXECUTED_COMMAND, TABLE_NAME, CHANGED_CONTENT)
VALUES ('INSERT','STUDENT','STD_NO: ' || :NEW.STD_NO || ', STD_NAME: ' || :NEW.STD_NAME ||
', MAJOR_NO: ' || TO_CHAR(:NEW.MAJOR_NO));
END;

Insert into STUDENT (STD_NO,MAJOR_NO,STD_NAME,STD_SCORE,STD_TEL,STD_EMAIL) values ('20230050',10,'김도연',4.3,'01091223345','doyeon.kim@example.com');
SELECT * FROM SQL_LOGS;
