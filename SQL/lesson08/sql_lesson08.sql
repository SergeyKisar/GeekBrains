# Урок №8. Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. Работаем с БД vk и данными, которые вы сгенерировали ранее:
# Задачи необходимо решить с использованием объединения таблиц (JOIN)!

# Задача №1: Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT
	u.id, CONCAT(u.firstname, ' ', u.lastname) 
	FROM users AS u
	JOIN messages AS m 
WHERE m.from_user_id = u.id AND m.to_user_id = 2
GROUP BY u.id
ORDER BY COUNT(m.from_user_id) DESC
#LIMIT 1 # если хотим ограничить вывод инфо
;
	
	
# Задача №2: Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

SELECT
	COUNT(*) AS number_of_likes,
	p.user_id
	FROM likes AS l
	JOIN profiles AS p
WHERE p.user_id = l.user_id AND TIMESTAMPDIFF(YEAR, birthday, NOW()) <= 10
GROUP BY p.user_id
ORDER BY p.user_id
#LIMIT 1 # если хотим ограничить вывод инфо
;


# Задача №3: Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT
	CASE (gender)
		WHEN 'm' THEN 'Мужчина'
		WHEN 'f' THEN 'Женщина'
		END AS 'who_is_more',
	COUNT(*)
	FROM profiles AS p
	JOIN likes AS l
WHERE p.user_id = l.user_id
GROUP BY p.user_id 
;
