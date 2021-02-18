# Email_Receiver Table
> 테이블명 : email_recevier

```sql
CREATE TABLE email_receiver 
(
    email_receiver_no NUMBER,
    email_no NUMBER,
    email_rev_name VARCHAR(100),
    email_rev_address VARCHAR(500),
    email_rev_department VARCHAR(100),
    email_ref NUMBER, -- 받는 사람은 0, 참조는 1
    email_mid VARCHAR(200)
);


-- SEQ
CREATE SEQUENCE EMAIL_REV_SEQ;

-- Primary Key
ALTER TABLE email_receiver ADD CONSTRAINT email_rev_pk PRIMARY KEY (email_no);

-- FOREIGN KEY
ALTER TABLE email_receiver ADD CONSTRAINT email_rev_fk FOREIGN KEY (email_no) REFERENCES email (email_no);

-- 데이터 조회


-- 데이터 삽입

INSERT ALL
INTO email VALUES(email_main_seq.nextval, 'song', 'song@gmail.com', '송연주', 
'안녕하세요 프론트 작업 중입니다.', SYSTIMESTAMP, '내용', DEFAULT, DEFAULT, DEFAULT)

-- 받은 사람
INTO email_receiver (
    email_rev_no,
    email_no,
    email_rev_address,
    email_ref
    )
VALUES(emailMainSeq(), email_main_seq.currval, 'song1234@gmail.com', '참조')

-- 파일
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')
INTO email_files VALUES(emailMainSeq(), email_main_seq.currval, '', '파일.png')

SELECT * FROM dual;

-- 데이터 삭제
DROP SEQUENCE EMAIL_REV_SEQ;
DROP Table email_receiver;

commit;

```
