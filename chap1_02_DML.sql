CREATE TABLE goods (
    id NUMBER (6) PRIMARY KEY,
    goods_name VARCHAR2(50) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    created_at DATE
);

-- ������ ���� : INSERT
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES 
-- ���� �ð�: SYSDATE
    (1,'��ǳ��',120000, SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES 
    (2,'������',2000000, SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name,created_at)
VALUES 
    (3,'�ް�', SYSDATE);
-- ������ ������ ��� ����Ʈ������ �Է��ص� 1000�� price�� ���

-- NOT NULL ������������ �̸��Է¾��ϸ� ���� �߻�
INSERT INTO GOODS
    (id, price, created_at)
VALUES 
    (4,10000, SYSDATE);
    
-- created at�� price�� �ʼ��Է°��� �ƴϹǷ� �����߻����� ����
INSERT INTO GOODS
    (id, goods_name)
VALUES 
    (5,'�ް�');

-- �Է��� �� �÷� ���� ������� �÷��� �´� ���� �Է��ϸ� ����    
INSERT INTO GOODS
    (goods_name,id,created_at)
VALUES 
    ('������',6, SYSDATE);    
    
-- VALUES �տ� �÷����� �����ϸ�
-- ���̺� ���� �� ������ �÷� �������
-- ���� ������ �־����
-- BUT, �÷��� ���� ����  �ʴ� ���� ����
INSERT INTO GOODS
  VALUES 
    (7,'������',30000,SYSDATE);
    
-- ������ ���� :UPDATE
UPDATE GOODS
SET goods_name ='��ǻ��'
WHERE id = 1;

UPDATE GOODS
SET 
    goods_name ='¥���'
    , price = 8000
WHERE id = 3;

COMMIT;

-- WHERE �������� ���� UPDATE (��� �����͸� ����)
UPDATE GOODS
SET price = 9999;

-- id�� �����ϴ� ���� ���� �ʴ�. 
UPDATE GOODS
SET id =11
WHERE id=2;

-- NOT NULL ���������� NULL�� �����Ұ�
UPDATE GOODS
SET goods_name = null
WHERE id=6;

-- ������ ����: DELETE
DELETE FROM GOODS
WHERE id = 1;

COMMIT;

-- WHERE���� ���� DELETE�� ��ü���� ȿ���� ���Ѵ�.
-- �׷��� �̰��� ������ ����, TRUNCATE�� ���� �Ұ���

DELETE FROM GOODS;
ROLLBACK;    

TRUNCATE TABLE GOODS;

-- ������ ��ȸ
SELECT * FROM GOODS;

SELECT 
    certi_cd,
    certi_nm,
    issue_insti_nm

FROM TB_CERTI
;
-- � Į���� SELECT�ϴ��Ŀ� ���� ���� ������� ��ϸ� ��� �� �� �ִ�
SELECT 
    certi_nm,
    issue_insti_nm

FROM TB_CERTI
;

-- �ߺ��� �����ϰ� ���� ��� : DISTINCT 
SELECT DISTINCT
    issue_insti_nm

FROM TB_CERTI
;

-- ������ ���� �ΰ��̻��� ��쿡�� �� ������ ��ġ�ؾ� �ߺ����� �ν���
SELECT DISTINCT 
    certi_nm,
    issue_insti_nm

FROM TB_CERTI
;

-- ��� Į�� ��ȸ
SELECT 
    *
FROM TB_CERTI
;

-- Į�� ������ ���� AS (AS��������)
SELECT 
    emp_nm AS "�����"
    , addr AS "�ּ�"
FROM TB_EMP
;

SELECT 
    emp_nm  "�����"
    , addr  "�ּ�"
FROM TB_EMP
;

-- ���ڿ� ����
SELECT 
   '�ڰ��� ����:' || certi_nm AS certi_detail
FROM TB_CERTI
;

SELECT 
    certi_nm || '(' || issue_insti_nm || ')' AS certi_detail
FROM TB_CERTI
;