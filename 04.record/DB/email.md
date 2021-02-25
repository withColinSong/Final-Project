# Email Table
> 테이블명 : email

![](https://images.velog.io/images/withcolinsong/post/632312f6-22b2-4508-8870-c9f5d1ee0d99/image.png)

```sql
CREATE TABLE email
(
  email_no NUMBER ,
  member_no NUMBER,
  member_mid VARCHAR(20),
  email_address VARCHAR(200),
  email_name VARCHAR(100),
  email_title VARCHAR(300),
  email_date TIMESTAMP,
  email_contents CLOB,
  email_mailbox NUMBER DEFAULT 3, --받은 메일함 0	중요 메일함 1	임시 보관함 2	보낸 메일함 3	스팸 메일함 4	휴지통 5
  email_chk CHAR(4),
  email_delete NUMBER DEFAULT 0,

   CONSTRAINT email_main_pk PRIMARY KEY (email_no),
  CONSTRAINT email_main_fk FOREIGN KEY (member_no) REFERENCES member (member_no)
);



-- SEQ
CREATE SEQUENCE EMAIL_MAIN_SEQ;

-- Primary Key
ALTER TABLE email ADD CONSTRAINT email_main_pk PRIMARY KEY (email_no);

-- DEFAULT 
ALTER TABLE email MODIFY email_mailbox DEFAULT 3;
ALTER TABLE email MODIFY email_delete DEFAULT 0;

-- 데이터 조회
SELECT * FROM email ORDER BY email_date DESC;

-- 데이터 삽입
INSERT 
INTO email VALUES(email_main_seq.nextval, 'song', 'song@gmail.com', '송연주', 
'안녕하세요 프론트 작업 중입니다.', SYSDATE, '내용', DEFAULT, '', DEFAULT);

-- 메일함
INSERT ALL
INTO email VALUES(
    email_main_seq.nextval,
    1, 
    'song', 
    'song@gmail.com', 
    '송연주', 
    '안녕하세요 프론트 작업 중입니다.', 
    SYSTIMESTAMP, 
    '내용', 
    DEFAULT, 
    '', 
    DEFAULT)

-- 받은 사람
INTO email_receiver (
    email_rev_no,
    email_no,
    email_rev_address,
    email_ref -- 받는 사람 0, 참조 1
    )
VALUES(emailMainSeq(), email_main_seq.currval, 'song1234@gmail.com', 0)

-- 파일
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')

SELECT * FROM dual;

SELECT * FROM dual;

-- 데이터 삭제
DROP SEQUENCE EMAIL_MAIN_SEQ;
DROP TABLE email;

commit;

```



```sql
CREATE OR REPLACE FUNCTION emailMainSeq 
RETURN NUMBER 
IS
    seq NUMBER;
BEGIN
    SELECT EMAIL_MAIN_SEQ.nextval INTO seq FROM dual;
    RETURN seq;
END;
```
