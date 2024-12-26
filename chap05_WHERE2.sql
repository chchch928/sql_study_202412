-- # ���ڿ� ��

-- CHARŸ�Գ����� ��
DROP TABLE CHAR_COMPARE;

CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    char_6 CHAR(6)
);

INSERT INTO char_compare VALUES ('101', 'SQLD', 'SQLD');
INSERT INTO char_compare VALUES ('102', 'SQLD', 'SQLA');
INSERT INTO char_compare VALUES ('103', 'SQLD', '  SQLD');

SELECT * FROM char_compare;
--sn�÷��� �� ������ CHAR�� 10�� �������̷� ������� ������ 101 ���� ������ 7 ĭ�� �������� ����

SELECT * FROM char_compare
WHERE sn = '103'
    AND char_4 = char_6
    ;
-- �ٸ��ٰ� �����ϹǷ� ���X(�տ� ������ ����)
    
SELECT * FROM char_compare
WHERE sn = '101'
    AND char_4 = char_6
    ;
-- ���ٰ� �����ϹǷ� ���O (���� ������ ������ ����X)

--------------------------------------------------------------------

-- ������ VARCHARŸ���� ����� ��
DROP TABLE VARCHAR_COMPARE;

CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');
INSERT INTO varchar_compare VALUES ('103', 'SQLD', 'SQLD');

SELECT * 
FROM varchar_compare
WHERE sn = '101'
    AND char_4 = varchar_6
;
-- ���ٰ� �������� �����Ƿ� ��� X (varchar�� ���̵� �ľ��ϹǷ� �ٷ� �ٸ��ٰ� ����)

SELECT * 
FROM varchar_compare
WHERE sn = '103'
    AND char_4 = varchar_6
;
-- ���ٰ� �����ϹǷ� ��� O (varchar�� �ִ���̷� �����ϹǷ� ������ ����
-- ���� ������ ���̰� �� �Է��Ѵ�� ������ ��������Ƿ� ���ٰ� �� )
----------------------------------------------------------------------------------------

-- ��� ���ڿ� ��
SELECT 
    *
FROM varchar_compare
WHERE sn = '101'
    AND char_4 = 'SQLD  ' -- true
;

SELECT 
    *
FROM varchar_compare
WHERE sn = '101'
    AND varchar_6 = 'SQLD' -- false
;

