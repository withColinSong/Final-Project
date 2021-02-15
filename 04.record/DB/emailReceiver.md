# Email_Receiver Table
> 테이블명 : email_recevier

```sql
CREATE TABLE email_receiver 
(
    email_receiver_no NUMBER,
    email_no NUMBER,
    email_rev_name VARCHAR(100),
    email_rev_address VARCHAR(200),
    email_rev_department VARCHAR(100),
    email_ref VARCHAR(100),
    email_mid VARCHAR(100),
);


-- SEQ
CREATE SEQUENCE EMAIL_REV_SEQ;

-- Primary Key
ALTER TABLE email_receiver ADD CONSTRAINT email_rev_pk PRIMARY KEY (email_no);

-- FOREIGN KEY
ALTER TABLE email_receiver ADD CONSTRAINT email_rev_fk FOREIGN KEY (email_no) REFERENCES email (email_no);

-- 데이터 조회


-- 데이터 삽입
INSERT INTO email_files
VALUES(EMAIL_REV_SEQ.nextval, 1, '송송송', 'song@gmail.com', '개발팀', 'ref@gmail.com', 'song');


-- 데이터 삭제
DROP SEQUENCE EMAIL_REV_SEQ;
drop table email_receiver;

commit;

```
