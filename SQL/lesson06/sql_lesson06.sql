# Урок №6
#Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. Работаем с БД vk и данными, которые вы сгенерировали ранее:

# Задача №1: Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT COUNT(from_user_id) AS number_of_messages, from_user_id FROM messages
WHERE to_user_id = 2 
GROUP BY from_user_id
ORDER BY number_of_messages desc
#LIMIT 1 # если хотим ограничить вывод инфо
;

# Задача №2: Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

SELECT
	COUNT(*) AS number_of_likes,
	user_id
	FROM likes
WHERE user_id IN (SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) <= 10)
GROUP BY user_id
ORDER BY number_of_likes DESC
;

# Задача №3: Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT
	CASE (gender)
		WHEN 'm' THEN 'Мужчина'
		WHEN 'f' THEN 'Женщина'
		END AS 'who_is_more',
	COUNT(*)
	FROM profiles
WHERE user_id IN (SELECT user_id FROM likes)
GROUP BY gender  
HAVING count(*) > 1
;
