-- 모든 SQL에서 사용가능
-- JOIN ON (ANSI 표준 조인)
-- 1. FROM절 뒤, WHERE 절 앞
-- 2. JOIN 키워드 뒤에는 조인할 테이블명을 명시
-- 3. ON 키워드 뒤에는 조인 조건을 명시
-- 4. 조인 조건 서술부(ON절) 일반 조건 서술부 (WHERE절)를 분리해서 작성하는 방법
-- 5. ON절을 이용하면 JOIN 이후의 논리연산이나 서브쿼리와 같은 추가 서술이 가능

SELECT 
    E.emp_no,
    E.emp_nm,
    E.addr,
    E.dept_cd,
    D.dept_nm
FROM tb_emp E
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
;

SELECT 
    E.emp_no
    , E.emp_nm
    , E.addr
    , E.dept_cd
    , D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND E.addr LIKE '%용인%'
    AND E.emp_nm LIKE '김%'
;

SELECT 
    E.emp_no
    , E.emp_nm
    , E.addr
    , E.dept_cd
    , D.dept_nm
FROM tb_emp E
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE E.addr LIKE '%용인%'
    AND E.emp_nm LIKE '김%'
;

SELECT 
    E.emp_no
    , E.emp_nm
    , EC.certi_cd
    , C.certi_nm
    , C.issue_insti_nm
    , EC.acqu_de
FROM tb_emp_certi EC, tb_emp E, tb_certi C
WHERE EC.emp_no = E.emp_no
    AND EC.certi_cd = C.certi_cd
;

SELECT 
    E.emp_no
    , E.emp_nm
    ,D.dept_nm
    , EC.certi_cd
    , C.certi_nm
    , C.issue_insti_nm
    , EC.acqu_de
FROM tb_emp_certi EC
JOIN tb_emp E
ON EC.emp_no = E.emp_no
JOIN tb_certi C
ON EC.certi_cd = C.certi_cd
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE D.dept_cd IN (100004,100006)
    AND EC.acqu_de >= '20180101'
;

-- 1980년대생 사원들의 사번, 사원명, 부서명,
-- 자격증명, 취득일자 조회

SELECT
    E.emp_no
    ,E.emp_nm
    ,D.dept_nm
    ,C.certi_nm
    ,EC.acqu_de
FROM tb_emp E
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
JOIN tb_emp_certi EC
ON E.emp_no = EC.emp_no
JOIN tb_certi C
ON C.certi_cd = EC.certi_cd
WHERE E.birth_de BETWEEN '19800101' AND '19891231'
;

-- INNER 조인은 두 테이블 간에 
-- 연관데이터가 있는 경우에만 사용
-- 어떤 쇼핑몰회원이 한건도 주문하지 않은 경우
-- INNER JOIN에서는 해당 회원이 조회되지 않음

-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];

-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동으로 조인조건을 생성하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이 때 조인되는 동일 이름의 컬럼은 데이터 타입이 같아야 하며, 
--    ALIAS나 테이블명을 자동 조인 컬럼 앞에 표기하면 안됩니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼은 집합에서 한번만 표기됩니다.
-- 5. 공통 컬럼이 n개 이상이면 조인 조건이 n개로 처리됩니다.
-- 사원 테이블과 부서 테이블을 조인 (사번, 사원명, 부서코드, 부서명)

SELECT 
    E.emp_no,
    E.emp_nm,
    dept_cd,
    D.dept_nm
FROM tb_emp E
NATURAL JOIN tb_dept D
;

SELECT 
    *
FROM tb_emp E
NATURAL JOIN tb_dept D
-- ON E.dept_cd = D.dept_cd
;
-- 회사에서는 NATURAL JOIN을 좋아하지 않는다.(명확하지 않은 결과)

-- # USING절 조인
-- 1. NATURAL조인에서는 자동으로 이름과 타입이 일치하는 모든 컬럼에 대해
-- 조인이 일어나지만 USING을 사용하면 원하는 컬럼에 대해서면 선택적 조인조건을 
-- 부여할 수 있습니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 표기하시면 안됩니다.
SELECT 
    E.emp_no,
    E.emp_nm,
    dept_cd,
    D.dept_nm
FROM tb_emp E
JOIN tb_dept D
USING (dept_cd)
;

SELECT 
    * 
from test_a
CROSS JOIN test_b
;
