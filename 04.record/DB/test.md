# 테스트

```sql
CREATE TABLE email
(
  email_no NUMBER ,
  email_mid VARCHAR(20),
  email_address VARCHAR(100),
  email_name VARCHAR(100),
  email_title VARCHAR(300),
  email_data DATE,
  email_contents CLOB,
  email_mailbox NUMBER,
  email_file VARCHAR(300),
  email_chk VARCHAR(20),
  email_delete NUMBER
);

CREATE TABLE email_receiver 
(
    email_receiver_no NUMBER,
    email_no NUMBER ,
    email_rev_name VARCHAR(100),
    email_rev_address VARCHAR(100),
    email_rev_department VARCHAR(100),
    email_ref VARCHAR(100), -- 메일 보낼 때 참조
    email_mid VARCHAR(100),
    email_reftest NUMBER -- 테스트
);


ALTER TABLE email ADD CONSTRAINT email_no_pk PRIMARY KEY (email_no);

ALTER TABLE email_receiver ADD CONSTRAINT email_rev_no_pk PRIMARY KEY (email_receiver_no);
ALTER TABLE email_receiver ADD CONSTRAINT email_rev_FK FOREIGN KEY (email_no) REFERENCES email (email_no);

```

- email
  - 이메일 DB
- email_receiver 
  - 받는 사람