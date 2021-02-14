# Email Table
> 테이블명 : email

![](https://images.velog.io/images/withcolinsong/post/632312f6-22b2-4508-8870-c9f5d1ee0d99/image.png)

```sql
CREATE TABLE email
(
  email_no NUMBER ,
  email_mid VARCHAR(20),
  email_address VARCHAR(100),
  email_name VARCHAR(100),
  email_title VARCHAR(300),
  email_date DATE,
  email_contents CLOB,
  email_mailbox NUMBER,
  email_file VARCHAR(300),
  email_chk VARCHAR(20),
  email_delete NUMBER
);

-- SEQ
CREATE SEQUENCE EMAIL_MAIN_SEQ;

-- 데이터 조회
SELECT * FROM email ORDER BY email_date DESC;

-- 데이터 삽입
INSERT INTO email 
VALUES(email_main_seq.nextval, 'song', 'song@gmail.com', '송연주', '안녕하세요 프론트 작업 중입니다.', SYSTIMESTAMP, 
'내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내'
, 1, '파일.png', '!', 0);

INSERT INTO email 
VALUES(email_main_seq.nextval, 'song', 'songsong3@gmail.com', '송연주', '안녕하세요 프론트 작업 중입니다. 안녕하세요 프론트 작업 중입니다.', SYSTIMESTAMP, 
'내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용'
, 1, '파일.png', '!', 0);

INSERT INTO email 
VALUES(email_main_seq.nextval, 'song', 'songsong31235@gmail.com', '송연주', '안녕하세요 프론트 작업 중입니다. 안녕하세요 프론트 작업 중입니다.', SYSTIMESTAMP, 
'내용내용내용내용내용내용'
, 1, '파일.png', '!', 0);

INSERT INTO email 
VALUES(email_main_seq.nextval, 'song', 'song@gmail.com', '송연주', '안녕하세요 프론트 작업 중입니다.', SYSTIMESTAMP, 
'내용'
, 1, '파일.png', '', 0);


-- 데이터 삭제
DROP SEQUENCE EMAIL_MAIN_SEQ;
DROP TABLE email;

commit;

```
