-- 2.4.1
SELECT name, surname, email
FROM app_user
WHERE login like 'LOGIN' and password like 'PASSWORD';

-- 2.4.2
UPDATE app_user
SET name = 'DENISKA'
WHERE login like 'LOGIN' and password like 'PASSWORD';

-- 2.4.5
INSERT INTO app_user
(login, password, name, surname, email)
VALUES ('mishasdk', '54321qwert', 'MiChAeL', 'SDK', 'msdk@ya.ru');