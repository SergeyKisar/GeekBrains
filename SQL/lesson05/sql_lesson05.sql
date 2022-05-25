# ---Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”--- #

# Задача №1
# Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

ALTER TABLE users ADD COLUMN created_at VARCHAR(255);
ALTER TABLE users ADD COLUMN updated_at VARCHAR(255);

UPDATE users
	SET created_at = NOW() AND updated_at = NOW();


# Задача №2
# Таблица users была неудачно спроектирована.
# Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
# Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

ALTER TABLE users ADD COLUMN created_at varchar(255);
ALTER TABLE users ADD COLUMN updated_at varchar(255);

INSERT INTO users (created_at, updated_at)
	VALUES
	('20.10.2017 8:10', '20.10.2017 8:10');

UPDATE users
	SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
		updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

ALTER TABLE users
	MODIFY COLUMN created_at DATETIME,
	MODIFY COLUMN updated_at DATETIME;

SELECT * FROM users;


# Задача №3
# В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
# 0, если товар закончился и выше нуля, если на складе имеются запасы.
# Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
# Однако, нулевые запасы должны выводиться в конце, после всех записей.

#У меня такой таблицы нет, поэтому создаю простейшую.
CREATE TABLE storehouses_products (
	storehouse_id VARCHAR(255),
	product_id VARCHAR(255),
	value VARCHAR(255),
	created_at VARCHAR(255),
	updated_at VARCHAR(255)
);

INSERT INTO storehouses_products (storehouse_id, product_id, value, created_at, updated_at)
	VALUES
	(1, 1, 2, now(), now()),
	(2, 2, 1, now(), now()),
	(3, 3, 5, now(), now()),
	(4, 4, 0, now(), now()),
	(5, 5, 4, now(), now()),
	(6, 6, 3, now(), now());

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN 999999999 ELSE value END;


# Задача №4 (По желанию)
# Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august').

SELECT
    name, birthday_at, 
    CASE 
        WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'may'
        WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'august'
    END AS mounth
FROM
    users WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;

SELECT
    name, birthday_at, DATE_FORMAT(birthday_at, '%m') as mounth_of_birth
FROM
    users;


# Задача №5 (По желанию)
# Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2);
# Отсортируйте записи в порядке, заданном в списке IN.

SELECT* FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 3, 1, 2);


# ---Практическое задание теме “Агрегация данных”--- #

# Задача №1: Подсчитайте средний возраст пользователей в таблице users.

# у меня возраст в таблице profiles
SELECT
      avg(
         (YEAR(CURRENT_DATE) - YEAR(birthday)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d')) 
          )
 FROM profiles;


# Задача №2: Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
# Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT
	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday), DAY(birthday))), '%W') AS day,
	COUNT(*) AS total
FROM
	profiles
GROUP BY
	day
ORDER BY
	total DESC;


# Задача №3 (по желанию): Подсчитайте произведение чисел в столбце таблицы.

SELECT EXP(SUM(LOG(id))) FROM users;

