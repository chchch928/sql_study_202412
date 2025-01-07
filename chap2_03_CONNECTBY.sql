
-- �� SELECT������ ����� �ڽ��̰� ������� �θ��̴�.

SELECT
    emp_no
    ,direct_manager_emp_no

FROM tb_emp
;

-- ������ ���� 
-- START WITH : ������ ù �ܰ踦 ��� ������ �������� ���� ����
-- CONNECT BY PRIOR �ڽ� = �θ�  -> ������ Ž��
-- CONNECT BY �ڽ� = PRIOR �θ�  -> ������ Ž��
-- ORDER SIBLINGS BY : ���� ���������� ������ ����.
-- PRIOR�� �ڽľտ� ���̸� ������, �θ�տ� ���̸� ������

SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF -- �ش� ���� ���������� ����
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
 START WITH A.direct_manager_emp_no IS NULL -- LEVEL 1�� �����ϴ� ��
-- START WITH A.emp_no = 1000000001
CONNECT BY PRIOR A.emp_no = A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no ASC -- ���� ���������� ������ ��� ����
;

-- ������ ����
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF -- �ش� ���� ���������� ����
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd

 START WITH A.emp_no = 1000000005
-- START WITH A.emp_no = 1000000001
CONNECT BY  A.emp_no = PRIOR A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no ASC -- ���� ���������� ������ ��� ����
;