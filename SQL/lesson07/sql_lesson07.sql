# Урок №7. Тема “Сложные запросы”



# Задача №1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

# т.к. моя ДБ не магазин а соц сеть, по аналогии задачи я выведу пользователей которые отправили хотябы одно сообщение.

SELECT id, firstname, lastname FROM users
WHERE id IN (SELECT from_user_id FROM messages);


# Задача №2. Выведите список товаров products и разделов catalogs, который соответствует товару.

# т.к. моя ДБ не магазин а соц сеть, по аналогии задачи я выведу всю информация о пользователях.
SELECT
	id as 'Индефикатор',
	u.firstname,
	u.lastname,
	u.email,
	u.phone,
	CASE (p.gender) WHEN 'm' THEN 'Мужчина' WHEN 'f' THEN 'Женщина' END AS 'Пол',
	p.hometown,
	p.created_at
	FROM
		users AS u JOIN profiles AS p
ON
	u.id = p.user_id
ORDER BY p.created_at  
;


# Задача №3 (по желанию)
# Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское.
# Выведите список рейсов flights с русскими названиями городов.

# Подготовка таблиц
DROP TABLE IF EXISTS flights;
CREATE TABLE flights(
	id SERIAL,
	from_p VARCHAR(255),
	to_p VARCHAR(255)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
	label VARCHAR(255),
	name VARCHAR(255)
);

INSERT INTO flights (from_p, to_p)
VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

INSERT INTO cities (label, name)
VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

SELECT * FROM flights;
SELECT * FROM cities;

SELECT
	f.id AS 'ИД',
	c1.name AS 'Из города',
	c2.name AS 'В город'
	FROM
	flights AS f
	JOIN
	cities AS c1
	JOIN
	cities AS c2
ON
	f.from_p = c1.label AND f.to_p = c2.label
ORDER BY f.id;
