```sql

-- 테이블 생성

CREATE TABLE email
(
  email_no NUMBER ,
  member_no NUMBER,
  email_mid VARCHAR(20),
  email_address VARCHAR(200),
  email_name VARCHAR(100),
  email_title VARCHAR(300),
  email_date DATE,
  email_contents CLOB,
  email_mailbox NUMBER DEFAULT 3,
  email_chk CHAR(4),
  email_delete NUMBER DEFAULT 0,

  CONSTRAINT email_main_pk PRIMARY KEY (email_no),
  CONSTRAINT email_main_fk FOREIGN KEY (member_no) REFERENCES member (member_no)
);



CREATE TABLE email_receiver 
(
    email_rev_no NUMBER,
    email_no NUMBER,
    email_rev_name VARCHAR(100),
    email_rev_address VARCHAR(500),
    email_rev_department VARCHAR(100),
    email_ref NUMBER,
    email_mid VARCHAR(200),

    CONSTRAINT email_rev_pk PRIMARY KEY (email_rev_no),
    CONSTRAINT email_rev_fk FOREIGN KEY (email_no) REFERENCES email (email_no)
);

CREATE TABLE email_files
(
	files_no NUMBER,
	email_no NUMBER,
	file_sysfile VARCHAR(4000),
	file_orifile VARCHAR(4000),

    CONSTRAINT email_files_pk PRIMARY KEY (files_no),
    CONSTRAINT email_files_fk FOREIGN KEY (email_no) REFERENCES email (email_no)
    
);

CREATE SEQUENCE member_seq NOCACHE;

CREATE TABLE MEMBER(

MEMBER_NO NUMBER,
MEMBER_MID VARCHAR2(50) NOT NULL,
MEMBER_PWD VARCHAR2(200) NOT NULL,
MEMBER_NAME VARCHAR2(50) NOT NULL,
MEMBER_EMAIL VARCHAR2(100) NOT NULL,
MEMBER_DEPARTMENT VARCHAR2(50) NOT NULL,
MEMBER_TEAM VARCHAR2(50) NOT NULL,
MEMBER_PHONENUMBER VARCHAR2(50) NOT NULL,
MEMBER_ZIPCODE VARCHAR2(50) NOT NULL, 
MEMBER_ADDRESS VARCHAR2(200) NOT NULL,
MEMBER_POSITION VARCHAR2(200) NOT NULL,

CONSTRAINT member_pk PRIMARY KEY (MEMBER_NO)
);


INSERT INTO member
VALUES(1, 
'song', 
'1234', 
'송코딩', 
'song1234@gmail.com', 
'IT개발부', 
'개발팀', '01041235123', 
'06013', '서울 강남구 학동로 지하 102 ', '사원');
select * from email;


-- 테이블 삭제
DROP TABLE email;
DROP TABLE email_receiver;
DROP TABLE email_files;

-- SEQ
CREATE SEQUENCE EMAIL_MAIN_SEQ;
CREATE SEQUENCE EMAIL_REV_SEQ;
CREATE SEQUENCE EMAIL_FILES_SEQ;

-- SEQ 삭제
DROP SEQUENCE EMAIL_MAIN_SEQ;
DROP SEQUENCE EMAIL_REV_SEQ;
DROP SEQUENCE EMAIL_FILES_SEQ;


-- DEFAULT
ALTER TABLE email MODIFY email_mailbox DEFAULT 3;
ALTER TABLE email MODIFY email_delete DEFAULT 0;


-- PK , FK


ALTER TABLE email ADD CONSTRAINT email_main_pk PRIMARY KEY (email_no);

ALTER TABLE email_receiver ADD CONSTRAINT email_rev_pk PRIMARY KEY (email_rev_no);
ALTER TABLE email_receiver ADD CONSTRAINT email_rev_fk FOREIGN KEY (email_no) REFERENCES email (email_no);

ALTER TABLE email_files ADD CONSTRAINT email_files_pk PRIMARY KEY (files_no);
ALTER TABLE email_files ADD CONSTRAINT email_files_fk FOREIGN KEY (email_no) REFERENCES email (email_no);


INSERT ALL
INTO email VALUES(
    email_main_seq.nextval,
    1, 
    'song', 
    'song@gmail.com', 
    '송연주', 
    '안녕하세요 프론트 작업 중입니다.', 
    SYSDATE, 
    '내용', 
    DEFAULT, 
    '', 
    DEFAULT)

-- 받은 사람
INTO email_receiver (
    email_rev_no,
    email_no,
    email_rev_address,
    email_ref
    )
VALUES(emailMainSeq(), email_main_seq.currval, 'song1234@gmail.com', 0)

-- 파일
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')

SELECT * FROM dual;
commit;

```

- 함수
```sql
CREATE OR REPLACE FUNCTION emailMainSeq 
RETURN NUMBER 
IS
    seq NUMBER;
BEGIN
    SELECT EMAIL_MAIN_SEQ.nextval INTO seq FROM dual;
    RETURN seq;
END;