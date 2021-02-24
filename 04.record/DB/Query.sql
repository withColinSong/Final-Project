BEGIN
    FOR i IN 1..300 LOOP
    INSERT INTO email
    values(email_main_seq.nextval, 'haha', 
    'haha@gmail.com', 
    'haha', 
    '안녕하세요 프론트 작업 중입니다.', 
    '2021-02-22', 
    '내용', 
    DEFAULT, 
    '', 
    DEFAULT);
    END LOOP;
END;