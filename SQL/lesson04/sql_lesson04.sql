# Задача 1 - заполнение данных (заполнил вручную, только те таблицы, которыми буду пользоваться в ходе этого ДЗ)

INSERT INTO users (firstname, lastname, email, phone)
VALUES
('John', 'Rambo', 'johnrambo@mail.com', '19001000001'),
('Ivan', 'Ivanov', 'ivanivanov@mail.com', '79002000002'),
('Petr', 'Petrov', 'petrpetrov@mail.com', '79003000003'),
('Bruce', 'Lee', 'brucelee@mail.com', '869004000004'),
('Jackie', 'Chan', 'jackiechan@mail.com', '19005000005');

INSERT INTO profiles (user_id, gender, birthday, hometown)
VALUES
('1', 'm', '1946/07/06', 'NewYork'),
('2', 'm', '2010/01/01', 'Moscow'),
('3', 'm', '2011/11/11', 'SaintPetersburg'),
('4', 'm', '1940/11/27', 'SanFrancisco'),
('5', 'm', '1954/04/07', 'HongKong');

INSERT INTO messages (from_user_id, to_user_id, body, created_at)
VALUES
('1', '2', 'test message from John Rambo to Bruce Lee', DEFAULT),
('4', '5', 'test message from Bruce Lee to Jackie Chan', DEFAULT),
('5', '1', 'test message from Jackie Chan to John Rambo', '2022/12/12 12-22-00'); #специально для задачи №4


# Задача 2 - скрипт, возвращающий список уникальных имен в алфавитном порядке

SELECT DISTINCT firstname FROM users ORDER BY firstname ASC;


# Задача 3 - скрипт, отмечающий несовершеннолетних пользователей как неактивных

UPDATE profiles
SET is_active = 1
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) > 18;


# Задача 4 - скрипт, удаляющий сообщения "из будущего"

DELETE FROM messages
WHERE created_at > NOW();
