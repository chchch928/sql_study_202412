
-- 이 SELECT문에서 사번이 자식이고 상사사번이 부모이다.

SELECT
    emp_no
    ,direct_manager_emp_no

FROM tb_emp
;

-- 계층형 쿼리 
-- START WITH : 계층의 첫 단계를 어디서 시작할 것인지의 대한 조건
-- CONNECT BY PRIOR 자식 = 부모  -> 순방향 탐색
-- CONNECT BY 자식 = PRIOR 부모  -> 역방향 탐색
-- ORDER SIBLINGS BY : 같은 레벨끼리의 정렬을 정함.
-- PRIOR가 자식앞에 붙이면 순방향, 부모앞에 붙이면 역방향

SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF -- 해당 행이 말단행인지 여부
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
 START WITH A.direct_manager_emp_no IS NULL -- LEVEL 1을 결정하는 것
-- START WITH A.emp_no = 1000000001
CONNECT BY PRIOR A.emp_no = A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no ASC -- 같은 레벨끼리는 정렬을 어떻게 할지
;

-- 역방향 전개
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF -- 해당 행이 말단행인지 여부
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd

 START WITH A.emp_no = 1000000005
-- START WITH A.emp_no = 1000000001
CONNECT BY  A.emp_no = PRIOR A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no ASC -- 같은 레벨끼리는 정렬을 어떻게 할지
;