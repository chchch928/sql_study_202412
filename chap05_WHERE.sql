
-- WHERE 조건절: 데이터를 필터링
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM TB_EMP
-- 남성들만 조회
WHERE sex_cd = 1
;

-- PK로 필터링하면 무조건 0건또는 1건이 조회됨
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM TB_EMP
-- 기본키를 이용해서 한명만 조회
WHERE emp_no = 1000000003
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
-- 남자가 아닌 성별인 것들만 출력
WHERE sex_cd != 1
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM TB_EMP
-- 남자가 아닌 성별인 것들만 출력
WHERE sex_cd <> 1 -- NOT EQUAL
;

-- 90년대 생만 출력하고 싶어
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM TB_EMP
WHERE birth_de > = '19900101'
    AND birth_de <= '19991231'
;

-- 사이 데이터를 조회 : BETWEEN A AND B
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

-- 90년대생이 아닌 사람만 조회
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;

-- IN 연산자: OR 연산
-- OR 사용 시
SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE dept_cd =100002
    OR dept_cd = 100007
    OR dept_cd = 100009
;
--IN 사용 시
SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE dept_cd IN (100002,100007,100009)
;

SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE dept_cd NOT IN (100002,100007,100009)
;

-- LIKE 연산 
-- 특정 단어가 포함된 검색
-- 와일드카드 매핑 (%: 0글자 이상, _: 딱 1글자)
SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- addr에 용인이 포함되어있으면 다 조회
WHERE addr LIKE '%용인%'
;

SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- 성이 이씨인 사람들만 조회
WHERE emp_nm LIKE '이%'
;

SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- 성이 이씨이고 이름이 세글자인 사람들만 조회
WHERE emp_nm LIKE '이__'
;

SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- 이름이 심으로 끝나는 사람들만 조회
WHERE emp_nm LIKE '%심'
;

-- 성씨가 김씨이면서
-- 부서가 100003, 100004 중에 하나면서
-- 90년대생인 사원의 
-- 사번, 이름, 생일, 부서코드를  조회

SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM TB_EMP
-- 실무에서는 편리하게 하기위해서 첫줄에 무조건 충족하는 줄을 넣어서 다 AND로 처리함 (지우기 쉽게하려고)
WHERE 1=1
    AND emp_nm LIKE '김%'
    AND dept_cd IN (100003,100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;

-- NULL값 조회
-- NULL조회는 무조건 IS NULL

SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM TB_EMP
--WHERE direct_manager_emp_no = NULL 불가능
WHERE direct_manager_emp_no IS NULL
;

SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM TB_EMP
-- NOT IS NULL아님 주의!
WHERE direct_manager_emp_no IS NOT NULL
;

-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- 의도는 김씨이면서 일산혹은 수원사는 사람들을 조회하고자 했으나
-- AND가 OR보다 쎄서 김씨이면서 일산 살거나 모든 수원에 사는 사람들이 조회됨
WHERE emp_nm LIKE '김%'
    AND addr LIKE '%일산%' 
        OR addr LIKE '%수원%'
;

SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- 의도는 김씨이면서 일산혹은 수원사는 사람들을 조회
WHERE emp_nm LIKE '김%'
    AND (addr LIKE '%일산%' 
        OR addr LIKE '%수원%')
;