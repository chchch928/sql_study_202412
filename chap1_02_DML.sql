CREATE TABLE goods (
    id NUMBER (6) PRIMARY KEY,
    goods_name VARCHAR2(50) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    created_at DATE
);

-- 데이터 생성 : INSERT
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES 
-- 현재 시각: SYSDATE
    (1,'선풍기',120000, SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES 
    (2,'에어컨',2000000, SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name,created_at)
VALUES 
    (3,'달고나', SYSDATE);
-- 가격을 생략한 경우 디폴트값으로 입력해둔 1000이 price로 출력

-- NOT NULL 제약조건으로 이름입력안하면 오류 발생
INSERT INTO GOODS
    (id, price, created_at)
VALUES 
    (4,10000, SYSDATE);
    
-- created at과 price는 필수입력값이 아니므로 오류발생하지 않음
INSERT INTO GOODS
    (id, goods_name)
VALUES 
    (5,'달걀');

-- 입력할 시 컬럼 순서 관계없이 컬럼에 맞는 값만 입력하면 생성    
INSERT INTO GOODS
    (goods_name,id,created_at)
VALUES 
    ('건조기',6, SYSDATE);    
    
-- VALUES 앞에 컬럼명을 생략하면
-- 테이블 생성 시 정해진 컬럼 순서대로
-- 값을 모조리 넣어야함
-- BUT, 컬럼명 생략 하지  않는 것이 좋음
INSERT INTO GOODS
  VALUES 
    (7,'탕수육',30000,SYSDATE);
    
-- 데이터 수정 :UPDATE
UPDATE GOODS
SET goods_name ='컴퓨터'
WHERE id = 1;

UPDATE GOODS
SET 
    goods_name ='짜장면'
    , price = 8000
WHERE id = 3;

COMMIT;

-- WHERE 조건절이 없는 UPDATE (모든 데이터를 수정)
UPDATE GOODS
SET price = 9999;

-- id는 변경하는 것이 좋지 않다. 
UPDATE GOODS
SET id =11
WHERE id=2;

-- NOT NULL 제약조건은 NULL값 수정불가
UPDATE GOODS
SET goods_name = null
WHERE id=6;

-- 데이터 삭제: DELETE
DELETE FROM GOODS
WHERE id = 1;

COMMIT;

-- WHERE절이 없는 DELETE는 전체삭제 효과를 지닌다.
-- 그러나 이것은 복구가 가능, TRUNCATE는 복구 불가능

DELETE FROM GOODS;
ROLLBACK;    

TRUNCATE TABLE GOODS;

-- 데이터 조회
SELECT * FROM GOODS;

SELECT 
    certi_cd,
    certi_nm,
    issue_insti_nm

FROM TB_CERTI
;
-- 어떤 칼럼을 SELECT하느냐에 따라 내가 보고싶은 목록만 골라서 볼 수 있다
SELECT 
    certi_nm,
    issue_insti_nm

FROM TB_CERTI
;

-- 중복을 제거하고 싶은 경우 : DISTINCT 
SELECT DISTINCT
    issue_insti_nm

FROM TB_CERTI
;

-- 가져올 열이 두개이상인 경우에는 두 값전부 일치해야 중복으로 인식함
SELECT DISTINCT 
    certi_nm,
    issue_insti_nm

FROM TB_CERTI
;

-- 모든 칼럼 조회
SELECT 
    *
FROM TB_CERTI
;

-- 칼럼 지정명 변경 AS (AS생략가능)
SELECT 
    emp_nm AS "사원명"
    , addr AS "주소"
FROM TB_EMP
;

SELECT 
    emp_nm  "사원명"
    , addr  "주소"
FROM TB_EMP
;

-- 문자열 결합
SELECT 
   '자격증 정보:' || certi_nm AS certi_detail
FROM TB_CERTI
;

SELECT 
    certi_nm || '(' || issue_insti_nm || ')' AS certi_detail
FROM TB_CERTI
;