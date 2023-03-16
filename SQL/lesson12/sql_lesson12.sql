# Требования к курсовому проекту:
# Составить общее текстовое описание БД и решаемых ею задач;
# минимальное количество таблиц: 10;
# скрипты создания структуры БД (DDL, с первичными ключами, индексами, внешними ключами);
# создать ERDiagram для БД;
# скрипты наполнения БД данными (дамп, не более 20 строк в таблицах);
# скрипты характерных выборок (SELECT, включающие группировки, JOIN'ы, вложенные запросы);
# представления (минимум 2);
# Хранимая процедура / функция / триггер (на выбор, 1 шт.);

#---------------Курсовой проект---------------#



# Создание БД и таблиц

DROP DATABASE IF EXISTS candidates;
CREATE DATABASE candidates;

USE candidates;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  INDEX users_id_idx (id),
  INDEX users_firstname_lastname_idx (firstname, lastname),
  INDEX users_email_idx (email)
);

DROP TABLE IF EXISTS passwords;
CREATE TABLE passwords (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY,
  password VARCHAR(50) NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  CONSTRAINT passwords_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id)
  );
 
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY,
  sex CHAR(1) NOT NULL,
  birthday DATE,
  vk_link VARCHAR(250),
  fb_link VARCHAR(250),
  hh_link VARCHAR(250),
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  CONSTRAINT profiles_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS  experience;
CREATE TABLE experience (
  user_id INT UNSIGNED NOT NULL,
  company VARCHAR(100) NOT NULL,
  position VARCHAR(100) NOT NULL,
  recomendations VARCHAR(250),
  start_date DATE NOT NULL,
  end_date DATE,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  CONSTRAINT experience_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS extraprofiles_points;
CREATE TABLE extraprofiles_points (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  serial_number INT NOT NULL UNIQUE COMMENT 'Порядковый номер в анкете',
  body VARCHAR(250) NOT NULL COMMENT 'Вопрос',
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
);

DROP TABLE IF EXISTS extraprofiles;
CREATE TABLE extraprofiles (
  user_id INT UNSIGNED NOT NULL,
  point_id INT UNSIGNED NOT NULL,
  answer VARCHAR(250) COMMENT 'Ответ на вопрос',
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (user_id, point_id),
  CONSTRAINT extraprofiles_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id),
  CONSTRAINT extraprofiles_point_id_fk FOREIGN KEY (point_id) REFERENCES extraprofiles_points(id)
);

DROP TABLE IF EXISTS skills;
CREATE TABLE skills (
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название компетенции',
  UNIQUE unique_name(name(25))
);

DROP TABLE IF EXISTS skills_points;
CREATE TABLE skills_points (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  serial_number INT NOT NULL UNIQUE COMMENT 'Порядковый номер в тесте',
  skill_id INT UNSIGNED NOT NULL,
  body VARCHAR(250) NOT NULL COMMENT 'Вопрос',
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  CONSTRAINT skills_points_skill_id_fk FOREIGN KEY (skill_id) REFERENCES skills(id)
);

DROP TABLE IF EXISTS answer_choices;
CREATE TABLE answer_choices (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  point_id INT UNSIGNED NOT NULL,
  serial_number INT NOT NULL COMMENT 'Порядковый номер варианта ответа',
  answer VARCHAR(250) NOT NULL COMMENT 'Вариант ответа',
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  CONSTRAINT answer_choices_skill_id_fk FOREIGN KEY (point_id) REFERENCES skills_points(id)
);

DROP TABLE IF EXISTS right_answers;
CREATE TABLE right_answers (
  point_id INT UNSIGNED NOT NULL,
  answer_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (point_id, answer_id),
  CONSTRAINT answer_choices_point_id_fk FOREIGN KEY (point_id) REFERENCES skills_points(id),
  CONSTRAINT answer_choices_answer_id_fk FOREIGN KEY (answer_id) REFERENCES answer_choices(id)
);

DROP TABLE IF EXISTS user_answers;
CREATE TABLE user_answers (
  user_id INT UNSIGNED NOT NULL,
  point_id INT UNSIGNED NOT NULL,
  answer_id INT UNSIGNED NOT NULL,
  answer_date DATE NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (user_id, answer_date, point_id, answer_id),
  CONSTRAINT user_answers_point_id_fk FOREIGN KEY (point_id) REFERENCES skills_points(id),
  CONSTRAINT user_answers_answer_id_fk FOREIGN KEY (answer_id) REFERENCES answer_choices(id),
  CONSTRAINT user_answers_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id)
);



# Вставка данных

INSERT INTO users VALUES ('1','Luis','Moore','hbailey@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('2','Annamae','Morar','monty.yost@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('3','Gerda','Maggio','laurianne40@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('4','Fay','Torphy','aubree.lubowitz@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('5','Angelina','Keeling','asia83@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('6','Shane','Hickle','flatley.justice@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('7','Kurtis','Beatty','elinor32@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('8','Sandy','Rutherford','ona51@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('9','Larissa','Smith','korey.gerhold@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('10','Dayana','Sipes','williamson.easter@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('11','Elaina','Schulist','zullrich@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('12','Adrien','Boyer','willard03@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('13','Wendell','Kemmer','gutkowski.elliot@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('14','Drake','Borer','trinity.reichert@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('15','Janae','O\'Conner','shields.joany@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('16','Lyda','Doyle','hfeil@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('17','Elroy','Jacobson','elody.bogan@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('18','Tyra','Walker','thurman20@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('19','Emil','Glover','gilbert15@example.org','2019-08-04 14:25:27','2019-08-04 14:25:27'),
('20','Linwood','Kemmer','blangosh@example.com','2019-08-04 14:25:27','2019-08-04 14:25:27'); 

INSERT INTO passwords VALUES ('1','fcbf42e2c96619dfbaafb03422dd18536a1fcec0','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('2','73bdb2dad79b5f06e4360bcbe85d617966a284ef','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('3','22c4e3b30abc28edfde47c71322a347a39444acf','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('4','1fcd46058ae5e567d4d5cf342457a37c367d965f','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('5','aea72c6874d61cecdca9cbffe77de75bd1dc9c12','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('6','8e65a60d24d5a899f4bd3d3f304498b20c14ad5b','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('7','3a7d77dfe7c836712ec58eb75ee39b3af2bad667','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('8','63f28bbe1d251247fe75c3d7239dca84993fd2ac','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('9','8d4633dba3fe1cd0d53346000aa37685a09000aa','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('10','99eb80584b6e8d7130b095e1a4b9e6c185baeb7c','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('11','60498fcb8267e02a6d50863d0e4c90290f8b0caf','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('12','e98032a3b1ffe16534d1886d8d9ba27e731fd5dc','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('13','dee9904810796cd259ee32d071c8927c543af3af','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('14','06ba4e69a08fbb69badd7961f9770a1301b2c2dc','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('15','f0148bb24e25c6bf3c01ca3c22a44cc5ca3b2398','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('16','dc941942ca0ebafa1141a9ab8469044a68b11551','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('17','4fcb2d96aec483c3f35b6c832ffaa0212e679741','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('18','5851621097a9d264052f42fe78bb3f55746279df','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('19','2ccb406e314d726ded7224f3509ed635df438616','2019-08-04 14:27:12','2019-08-04 14:27:12'),
('20','f0adf93208f56caf84fd57efb7ad506bafc5d973','2019-08-04 14:27:12','2019-08-04 14:27:12'); 

INSERT INTO profiles VALUES ('1','m','1973-11-21','http://stiedemanncole.biz/','http://gleason.net/','http://kertzmann.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('2','f','1975-02-06','http://www.mckenzie.com/','http://weimannrunolfsdottir.com/','http://www.turner.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('3','f','1997-07-03','http://www.watsicawolf.com/','http://rippin.com/','http://www.mitchell.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('4','m','2002-08-13','http://langhoeger.info/','http://www.cronindietrich.org/','http://koelpin.net/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('5','m','1989-03-16','http://www.funkjenkins.com/','http://www.baileynader.info/','http://www.schaefersteuber.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('6','m','2018-11-17','http://www.gerhold.net/','http://jacobimedhurst.com/','http://homenickborer.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('7','m','1974-05-14','http://purdyherman.com/','http://simonis.com/','http://marvin.info/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('8','f','2005-03-26','http://nolanhaag.com/','http://www.wisozknitzsche.org/','http://lowerau.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('9','m','2014-06-17','http://goodwin.com/','http://www.walkervolkman.com/','http://www.champlin.org/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('10','m','1979-06-05','http://townemohr.biz/','http://johnson.com/','http://mills.net/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('11','m','2013-09-23','http://kleinkoch.com/','http://www.pfeffer.com/','http://www.labadiejohns.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('12','m','2000-10-19','http://russel.com/','http://cassin.com/','http://schowalter.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('13','m','1996-02-24','http://www.koepp.net/','http://harris.com/','http://bruenschmitt.net/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('14','f','1983-09-16','http://price.com/','http://www.oberbrunnerreilly.net/','http://koelpinlueilwitz.org/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('15','f','1981-01-12','http://oconnell.biz/','http://howell.com/','http://www.keebler.org/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('16','f','1971-03-23','http://bogisich.com/','http://oberbrunner.com/','http://www.hudson.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('17','m','1979-10-24','http://www.schamberger.net/','http://bergstrom.com/','http://connellymurazik.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('18','m','1970-01-28','http://www.howell.com/','http://www.rohan.net/','http://koch.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('19','f','1977-09-21','http://cristjohns.com/','http://lubowitz.com/','http://kuhlman.biz/','2019-08-04 14:28:50','2019-08-04 14:28:50'),
('20','m','2001-11-05','http://kunzedach.com/','http://baumbach.com/','http://www.boehm.com/','2019-08-04 14:28:50','2019-08-04 14:28:50'); 


INSERT INTO extraprofiles_points VALUES 
('1',1,'Образование','2019-08-04 14:33:39','2019-08-04 14:33:39'),
('2',2,'Опыт программирования','2019-08-04 14:33:39','2019-08-04 14:33:39'),
('3',3,'Учебное заведение','2019-08-04 14:33:39','2019-08-04 14:33:39'),
('4',4,'Специальность','2019-08-04 14:33:39','2019-08-04 14:33:39'),
('5',5,'Личностные качества','2019-08-04 14:33:39','2019-08-04 14:33:39'); 

INSERT INTO extraprofiles VALUES ('1','4','iure','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('1','5','nisi','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('2','2','occaecati','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('2','4','dolores','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('2','5','labore','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('3','1','molestiae','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('3','2','sint','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('3','3','id','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('3','4','natus','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('3','5','ea','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('4','1','dolorem','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('4','2','molestiae','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('4','3','sit','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('4','5','molestiae','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('5','1','est','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('5','3','aliquid','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('5','4','sint','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('6','2','eos','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('6','4','ut','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('6','5','perferendis','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('7','1','autem','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('7','2','neque','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('7','4','necessitatibus','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('7','5','maxime','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('8','4','et','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('8','5','fugiat','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('9','4','exercitationem','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('10','2','quia','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('11','2','repudiandae','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('11','3','qui','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('11','4','deleniti','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('11','5','iusto','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('12','1','perferendis','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('12','2','et','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('12','3','voluptatibus','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('12','4','nisi','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('12','5','modi','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('13','1','accusantium','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('13','2','in','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('14','1','sed','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('14','4','inventore','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('14','5','recusandae','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('15','1','veniam','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('15','2','minus','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('15','4','eligendi','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('16','1','occaecati','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('16','2','voluptas','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('16','3','qui','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('16','4','in','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('16','5','maxime','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('17','2','ut','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('17','3','eum','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('17','4','dolorem','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('17','5','adipisci','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('18','1','est','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('18','3','dolor','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('18','4','alias','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('18','5','ea','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('19','1','recusandae','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('19','3','atque','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('19','4','nobis','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('19','5','veritatis','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('20','1','atque','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('20','2','adipisci','2019-08-04 14:40:45','2019-08-04 14:40:45'),
('20','5','corrupti','2019-08-04 14:40:45','2019-08-04 14:40:45'); 

INSERT INTO experience VALUES ('17','Wolff, Schmitt and Emard','totam',NULL,'1996-07-31','1999-11-28','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('14','Harber-Sauer','voluptas',NULL,'1981-05-26','1983-11-02','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('13','Grady-Borer','ut',NULL,'1997-03-23','2019-06-09','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('2','Block-Turcotte','est',NULL,'2009-04-16','1999-01-14','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('10','Hamill LLC','impedit',NULL,'1975-05-15','1970-02-04','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('13','Steuber Inc','non',NULL,'1984-08-16','1993-12-30','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('15','Lebsack-Rempel','ut',NULL,'2004-02-19','2000-07-22','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('4','Collins Inc','veniam',NULL,'1990-08-31','1982-07-29','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('2','Gulgowski, Wisoky and Barrows','asperiores',NULL,'2014-12-04','2005-07-23','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('6','Olson Inc','nam',NULL,'1991-03-18','2014-04-25','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('13','Christiansen, Wehner and Rosenbaum','ut',NULL,'1972-07-30','2017-02-07','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('2','Gerlach-Nikolaus','nesciunt',NULL,'1999-11-21','2012-04-12','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('2','D\'Amore and Sons','recusandae',NULL,'1996-07-08','1993-08-18','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('14','Goldner-Deckow','qui',NULL,'1972-10-18','1990-06-30','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('14','Braun-Sipes','laborum',NULL,'2006-01-22','1980-05-29','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('5','Von-Ebert','quasi',NULL,'2008-02-09','1991-11-26','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('5','Friesen-Mraz','sed',NULL,'1976-04-28','1992-02-25','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('16','Harvey Group','laboriosam',NULL,'1974-05-15','1971-05-01','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('11','Keeling, Turner and Rempel','eos',NULL,'2009-02-14','2011-06-25','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('3','Mante Group','aut',NULL,'2011-04-04','1970-05-23','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('20','Stark-Crona','sint',NULL,'2017-08-23','1999-09-01','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('14','O\'Kon-Bins','rem',NULL,'2010-03-31','2006-12-17','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('15','Rutherford, Anderson and Marvin','quia',NULL,'1984-03-12','1981-04-21','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('10','Bernhard LLC','reprehenderit',NULL,'2017-05-03','2003-12-31','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('9','Dibbert, Lueilwitz and Hickle','est',NULL,'2008-04-12','1970-07-23','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('20','McKenzie Ltd','aut',NULL,'2016-10-24','2019-07-31','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('18','Cremin Group','dicta',NULL,'2006-03-03','2011-06-05','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('1','Heathcote-Windler','sit',NULL,'2019-05-05','2013-12-31','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('12','Friesen-Feeney','eos',NULL,'1992-08-18','1991-04-11','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('12','Streich PLC','eum',NULL,'1991-06-28','2004-04-16','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('11','Barton, Nienow and Lindgren','explicabo',NULL,'2007-03-14','1993-06-25','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('8','Bogisich, Crooks and Rippin','sit',NULL,'2004-01-27','1982-09-01','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('9','White Group','officia',NULL,'2000-10-30','1979-10-01','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('13','Paucek, Schroeder and Collier','delectus',NULL,'1990-10-16','2014-03-17','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('12','West, Fisher and Pagac','labore',NULL,'1998-01-09','2007-12-15','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('14','Lemke and Sons','dolorum',NULL,'1999-05-21','2017-09-21','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('8','Ritchie, Schultz and Quigley','porro',NULL,'1985-10-05','2013-11-10','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('13','O\'Kon Inc','modi',NULL,'1990-02-11','1997-07-15','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('15','Hudson-Ledner','aut',NULL,'1997-07-12','2015-01-09','2019-08-04 14:45:28','2019-08-04 14:45:28'),
('17','Veum, Hyatt and Bergstrom','aspernatur',NULL,'2001-10-11','2014-02-05','2019-08-04 14:45:28','2019-08-04 14:45:28'); 


INSERT INTO skills VALUES ('1','Командный игрок'),
('2','Самостятельность'),
('3','Стрессоустойчивость'),
('4','Аналитический склад ума'),
('5','Внимательность'); 

INSERT INTO skills_points VALUES ('1','76','3','Est commodi iure rerum quia odit.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('2','124','5','Enim ex consequatur quo eos.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('3','170','1','Ut velit nobis enim.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('4','23','2','Dolor fugit officia dolor ducimus minima dolor.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('5','22','4','Optio qui iste soluta nemo cumque vel sed.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('6','42','1','Quam voluptatibus maxime neque et cumque recusandae minus.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('7','151','3','Voluptatem aliquid id corrupti alias aut molestiae non perspiciatis.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('8','85','4','Sequi perspiciatis consequatur nulla sed est qui ut.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('9','149','4','In atque eligendi voluptatibus doloribus.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('10','117','3','Vel accusantium tenetur perferendis facilis error aut sint quas.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('11','20','5','Sed similique minus illum expedita doloribus ab culpa ratione.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('12','147','5','In minima quia totam sapiente.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('13','172','3','Officiis autem molestiae itaque occaecati nihil.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('14','61','2','Dolor earum qui enim.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('15','49','2','Ratione ut qui quia corrupti.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('16','30','5','Accusantium at veniam ex id.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('19','160','3','Nesciunt saepe debitis accusantium sunt est facilis maxime.','2019-08-04 15:24:10','2019-08-04 15:24:10'),
('20','132','1','Quia itaque quam dolor dolor et vitae aut.','2019-08-04 15:24:10','2019-08-04 15:24:10'); 


INSERT INTO answer_choices VALUES 
('61','1','1','rem','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('62','1','2','rerum','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('63','1','3','adipisci','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('64','2','1','enim','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('65','2','2','eum','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('66','2','3','exercitationem','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('69','3','1','pariatur','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('70','3','2','id','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('71','3','3','inventore','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('72','4','1','maxime','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('73','4','2','voluptatem','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('76','4','3','excepturi','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('77','5','1','ducimus','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('78','5','2','eligendi','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('79','5','3','molestiae','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('80','6','1','quia','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('81','6','2','sint','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('82','6','3','recusandae','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('83','7','1','eum','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('85','7','2','sequi','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('87','7','3','laborum','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('88','8','1','voluptates','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('89','8','2','sed','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('90','8','3','eos','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('91','9','1','reiciendis','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('92','9','2','beatae','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('94','9','3','repudiandae','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('95','10','1','sed','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('96','10','2','rerum','2019-08-04 15:33:42','2019-08-04 15:33:42'),
('97','10','3','commodi','2019-08-04 15:33:42','2019-08-04 15:33:42');

INSERT INTO right_answers VALUES 
('1','61'),
('2','62'),
('3','63'),
('4','64'),
('5','65'),
('6','66'),
('7','69'),
('8','70'),
('9','71'),
('10','72'); 

INSERT INTO user_answers VALUES 
('1','3','87','1977-05-18','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('1','1','61','1991-08-27','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('1','7','77','2009-06-21','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('2','4','88','1998-06-23','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('2','2','62','2001-04-10','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('2','8','78','2013-08-20','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('3','3','63','1980-01-29','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('3','9','79','1987-01-30','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('3','5','89','1992-09-28','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('4','10','80','1979-03-22','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('4','4','64','1991-03-13','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('4','6','90','1996-08-30','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('5','7','91','1984-08-10','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('5','5','65','2008-03-18','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('5','11','81','2019-04-10','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('6','6','66','1988-08-20','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('6','12','82','1990-01-16','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('6','8','92','2002-02-10','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('7','9','94','1981-04-09','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('7','13','83','1984-03-12','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('7','7','69','2003-01-04','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('8','8','70','1983-07-28','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('8','14','85','2000-07-17','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('8','10','95','2001-03-28','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('9','13','61','1973-05-25','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('9','11','96','1985-02-14','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('9','9','71','1986-07-28','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('9','15','87','2008-02-10','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('10','12','97','1986-11-02','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('10','16','88','1987-10-12','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('10','14','62','1999-05-20','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('10','10','72','2014-10-06','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('11','19','89','2001-01-14','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('11','11','73','2002-11-05','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('11','15','63','2019-06-14','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('12','20','90','1985-10-27','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('12','16','64','2009-05-13','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('13','1','91','2006-11-25','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('13','19','65','2014-07-26','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('13','13','77','2017-06-13','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('14','14','78','1978-04-18','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('14','20','66','1989-09-04','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('14','2','92','2013-05-24','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('15','1','69','1973-07-26','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('15','15','79','2001-12-02','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('15','3','94','2008-12-07','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('16','2','70','1988-06-16','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('16','4','95','2002-12-11','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('16','16','80','2010-02-16','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('17','19','81','1985-11-10','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('17','7','61','1993-07-25','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('17','5','96','1995-08-17','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('17','3','71','2007-02-13','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('18','4','72','1974-08-28','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('18','6','97','1997-03-28','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('18','20','82','2008-11-17','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('18','8','62','2015-10-23','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('19','5','73','1979-02-03','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('19','9','63','1999-10-28','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('19','1','83','2016-07-06','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('20','2','85','1986-07-30','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('20','6','76','1988-03-19','2019-08-04 15:42:39','2019-08-04 15:42:39'),
('20','10','64','2014-09-08','2019-08-04 15:42:39','2019-08-04 15:42:39');



# Представления 

DROP VIEW IF EXISTS users_extended;
CREATE VIEW users_extended AS 
SELECT users.id AS id, users.firstname, users.lastname, CONCAT(users.firstname, ' ', users.lastname) AS all_name, users.email, 
	   profiles.sex, profiles.birthday, profiles.vk_link, profiles.fb_link, profiles.hh_link
  FROM users
	   LEFT JOIN profiles ON users.id = profiles.user_id;

SELECT * FROM users_extended;

DROP VIEW IF EXISTS questions_and_answers;
CREATE VIEW questions_and_answers AS 
SELECT sp.serial_number, s.name, sp.body, ac.serial_number AS answer_number, ac.answer
 FROM skills_points AS sp
      LEFT JOIN skills AS s ON sp.skill_id = s.id
      LEFT JOIN right_answers AS ra ON sp.id = ra.point_id
      LEFT JOIN answer_choices AS ac ON ra.answer_id = ac.id
ORDER BY sp.serial_number;

SELECT * FROM questions_and_answers;



# Функции и триггеры 

DELIMITER //
DROP TRIGGER IF EXISTS experience_control_insert//
CREATE TRIGGER experience_control_insert BEFORE INSERT ON experience
FOR EACH ROW
BEGIN
    IF NEW.start_date IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date cannot be NULL';
	END IF;
    
    IF NEW.end_date IS NOT NULL AND NEW.start_date > NEW.end_date THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date cannot be more than End date';
	END IF;
    
END//

DROP TRIGGER IF EXISTS password_control_insert//
CREATE TRIGGER password_control_insert BEFORE INSERT ON passwords
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.password) < 5 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Too short password. It must be more than 5 chars';
	END IF;
END//

DROP TRIGGER IF EXISTS password_control_update//
CREATE TRIGGER password_control_update BEFORE update ON passwords
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.password) < 5 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Too short password. It must be more than 5 chars';
	END IF;
END//
DELIMITER ;

DELIMITER //
DROP FUNCTION IF EXISTS AGE//
CREATE FUNCTION AGE(id INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE Y INT;
    SET Y = (SELECT timestampdiff(year,birthday, now()) FROM profiles WHERE user_id = id);
	RETURN Y;  
END//

SELECT AGE(1)//

DROP FUNCTION IF EXISTS BALLS//
CREATE FUNCTION BALLS(id INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE Y INT;
    SET Y = (SELECT COUNT(ua.answer_id)
			   FROM user_answers AS ua
				    LEFT JOIN skills_points AS sp
						   ON ua.point_id = sp.id
					     JOIN right_answers AS ra 
                           ON ua.answer_id = ra.answer_id AND sp.id = ra.point_id
 
			  WHERE user_id = id 
	          GROUP BY ua.user_id);
	RETURN Y;  
END//

SELECT BALLS(1)//
DELIMITER ;



# Выборки

# Опыт
SELECT us.id, us.all_name, ex.company, ex.position, ex.start_date, 
       CASE WHEN ISNULL(ex.end_date) THEN NOW() ELSE ex.end_date END AS end_date
  FROM users_extended AS us
       LEFT JOIN experience AS ex 
              ON us.id = ex.user_id
 ORDER BY us.all_name, end_date;
 
# Стаж
SELECT exp_start.user_id, exp_start.start_stage, exp_end.end_stage, 
        DATEDIFF(exp_end.end_stage, exp_start.start_stage) AS days
   FROM
	    (SELECT user_id, min(start_date) AS start_stage
           FROM experience
          GROUP BY user_id) AS exp_start
	     LEFT JOIN (SELECT user_id, max(CASE WHEN ISNULL(end_date) THEN NOW() ELSE end_date END) AS end_stage
                      FROM experience
                     GROUP BY user_id) AS exp_end 
			    ON exp_start.user_id = exp_end.user_id;

# Ответы
SELECT ua.user_id, sp.serial_number, sp.body, ac.serial_number AS answer_number, ac.answer
  FROM user_answers AS ua
       LEFT JOIN skills_points AS sp
              ON ua.point_id = sp.id
	   LEFT JOIN answer_choices AS ac ON ua.answer_id = ac.id
 ORDER BY ua.user_id, sp.serial_number;

# Баллы
SELECT ua.user_id, COUNT(ua.answer_id) AS balls
  FROM user_answers AS ua
       LEFT JOIN skills_points AS sp
              ON ua.point_id = sp.id
	        JOIN right_answers AS ra ON ua.answer_id = ra.answer_id AND sp.id = ra.point_id
 GROUP BY ua.user_id
 ORDER BY balls;
 