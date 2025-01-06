
-- WHERE ������: �����͸� ���͸�
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM TB_EMP
-- �����鸸 ��ȸ
WHERE sex_cd = 1
;

-- PK�� ���͸��ϸ� ������ 0�ǶǴ� 1���� ��ȸ��
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM TB_EMP
-- �⺻Ű�� �̿��ؼ� �Ѹ� ��ȸ
WHERE emp_no = 1000000003
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
-- ���ڰ� �ƴ� ������ �͵鸸 ���
WHERE sex_cd != 1
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM TB_EMP
-- ���ڰ� �ƴ� ������ �͵鸸 ���
WHERE sex_cd <> 1 -- NOT EQUAL
;

-- 90��� ���� ����ϰ� �;�
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM TB_EMP
WHERE birth_de > = '19900101'
    AND birth_de <= '19991231'
;

-- ���� �����͸� ��ȸ : BETWEEN A AND B
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

-- 90������ �ƴ� ����� ��ȸ
SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;

-- IN ������: OR ����
-- OR ��� ��
SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM TB_EMP
WHERE dept_cd =100002
    OR dept_cd = 100007
    OR dept_cd = 100009
;
--IN ��� ��
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

-- LIKE ���� 
-- Ư�� �ܾ ���Ե� �˻�
-- ���ϵ�ī�� ���� (%: 0���� �̻�, _: �� 1����)
SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- addr�� ������ ���ԵǾ������� �� ��ȸ
WHERE addr LIKE '%����%'
;

SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- ���� �̾��� ����鸸 ��ȸ
WHERE emp_nm LIKE '��%'
;

SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- ���� �̾��̰� �̸��� �������� ����鸸 ��ȸ
WHERE emp_nm LIKE '��__'
;

SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- �̸��� ������ ������ ����鸸 ��ȸ
WHERE emp_nm LIKE '%��'
;

-- ������ �达�̸鼭
-- �μ��� 100003, 100004 �߿� �ϳ��鼭
-- 90������ ����� 
-- ���, �̸�, ����, �μ��ڵ带  ��ȸ

SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM TB_EMP
-- �ǹ������� ���ϰ� �ϱ����ؼ� ù�ٿ� ������ �����ϴ� ���� �־ �� AND�� ó���� (����� �����Ϸ���)
WHERE 1=1
    AND emp_nm LIKE '��%'
    AND dept_cd IN (100003,100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;

-- NULL�� ��ȸ
-- NULL��ȸ�� ������ IS NULL

SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM TB_EMP
--WHERE direct_manager_emp_no = NULL �Ұ���
WHERE direct_manager_emp_no IS NULL
;

SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM TB_EMP
-- NOT IS NULL�ƴ� ����!
WHERE direct_manager_emp_no IS NOT NULL
;

-- ������ �켱 ����
-- NOT > AND > OR
SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- �ǵ��� �达�̸鼭 �ϻ�Ȥ�� ������� ������� ��ȸ�ϰ��� ������
-- AND�� OR���� �꼭 �达�̸鼭 �ϻ� ��ų� ��� ������ ��� ������� ��ȸ��
WHERE emp_nm LIKE '��%'
    AND addr LIKE '%�ϻ�%' 
        OR addr LIKE '%����%'
;

SELECT 
    emp_no,
    emp_nm,
    addr
FROM TB_EMP
-- �ǵ��� �达�̸鼭 �ϻ�Ȥ�� ������� ������� ��ȸ
WHERE emp_nm LIKE '��%'
    AND (addr LIKE '%�ϻ�%' 
        OR addr LIKE '%����%')
;