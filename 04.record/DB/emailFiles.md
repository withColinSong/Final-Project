# Email_Files Table
> 테이블명 : email_files

```sql
CREATE TABLE email_files
(
	files_no NUMBER,
	email_no NUMBER,
	file_sysfile CLOB,
	file_orifile CLOB
);

-- SEQ
CREATE SEQUENCE EMAIL_FILES_SEQ;

-- Primary Key
ALTER TABLE email_files ADD CONSTRAINT email_files_pk PRIMARY KEY (files_no));

-- FOREIGN KEY
ALTER TABLE email_files ADD CONSTRAINT email_files_fk FOREIGN KEY (email_no) REFERENCES email (email_no);


-- 데이터 조회
select b.* from email b , email_receiver a, email_files c WHERE b.email_no = 1;

-- 데이터 삽입
INSERT INTO email_files
VALUES(EMAIL_FILES_SEQ.nextval, 1, '파일.png', '파일.png');


-- 데이터 삭제
DROP SEQUENCE EMAIL_FILES_SEQ;
DROP TABLE email_files;

commit;

```
