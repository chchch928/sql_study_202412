-- # 문자열 비교

-- CHAR타입끼리의 비교
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
--sn컬럼이 긴 이유는 CHAR로 10을 고정길이로 만들었기 때문에 101 이후 나머지 7 칸을 공백으로 설정

SELECT * FROM char_compare
WHERE sn = '103'
    AND char_4 = char_6
    ;
-- 다르다고 생각하므로 출력X(앞에 공백의 유무)
    
SELECT * FROM char_compare
WHERE sn = '101'
    AND char_4 = char_6
    ;
-- 같다고 생각하므로 출력O (뒤의 공백의 유무는 생각X)

--------------------------------------------------------------------

-- 한쪽이 VARCHAR타입일 경우의 비교
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
-- 같다고 생각하지 않으므로 출력 X (varchar는 길이도 파악하므로 바로 다르다고 생각)

SELECT * 
FROM varchar_compare
WHERE sn = '103'
    AND char_4 = varchar_6
;
-- 같다고 생각하므로 출력 O (varchar는 최대길이로 지정하므로 공백이 없다
-- 따라서 지정한 길이가 길어도 입력한대로 공간이 만들어지므로 같다고 봄 )
----------------------------------------------------------------------------------------

-- 상수 문자열 비교
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

