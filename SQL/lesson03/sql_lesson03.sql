DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;

# сегодня фантазия работать нехочет, поэтому просто открыл ВК и содрал те вкладки, которых небыло на уроке)

DROP TABLE IF EXISTS news;  # подразумевается как лента новостей
CREATE TABLE news(
	news_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, # индификатор самой новости
	user_id BIGINT UNSIGNED NOT NULL, # индифтикатор пользователя, запостившего новость
	created_at DATETIME ON UPDATE NOW(),
	body TEXT,
	
	PRIMARY KEY (news_id, user_id), # первичным ключем убеждаемся что сама запись и информация о создателе хранятся в одной записи
	FOREIGN KEY (user_id) REFERENCES users(id) # внешний ключ в данном случае ссылается на несуществующую таблицу пользователей т.к. как и было сказано - весь урок не переписываю
);

DROP TABLE IF EXISTS calls; # подразумевается как список вызовов
CREATE TABLE calls(
	call_id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	called_at DATETIME ON UPDATE NOW(),
	
	FOREIGN KEY (from_user_id) REFERENCES users(id), # ссылка на несуществующую таблицу
	FOREIGN KEY (to_user_id) REFERENCES users(id), # ссылка на несуществующую таблицу
	CHECK (from_user_id != to_user_id) # себе звонить нельзя
);
 
DROP TABLE IF EXISTS games; # список игр, в которые играет юзер :)
CREATE TABLE games(
	game_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	game_name VARCHAR(100) NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (to_user_id) REFERENCES users(id) # ссылка на несуществующую таблицу
);
