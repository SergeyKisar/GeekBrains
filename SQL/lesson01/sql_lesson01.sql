-- комментарий преподавателю: Добрый день! Домашняя ОС у меня убунту, с sql знаком поверхностно. Сервер sql установил из репозитория universe - стандартной для убунты, dbeaver снап-пакетом. Первичную конфигурацию сделал, но dbeaver подключаться не хочет - пишет что доступ запрещен. Разбираться глубоко в чем дело не вижу смысла т.к. я уже заказал себе новое аппаратное обеспечение для сборки домашнего ПК, орентировочно через неделю-две уже будет запушен, ОС естественно поменяется тоже. Надеюсь, что Вы не будете возражать если текущую домашку сдам только в терминальном виде. IDE поставлю уже на новый комп с новой ОС. --;

cal@deus-ex-machina:~$ sudo mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 8.0.28-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE lesson01_db;
Query OK, 1 row affected (0,01 sec)

mysql> USE lesson01_db;
Database changed

mysql> CREATE TABLE lesson01_tbl(id INT, name VARCHAR(100));
Query OK, 0 rows affected (0,03 sec)

mysql> INSERT lesson01_tbl VALUES (1, "cal");
Query OK, 1 row affected (0,01 sec)

mysql> INSERT lesson01_tbl VALUES (2, "student");
Query OK, 1 row affected (0,01 sec)

mysql> SELECT * FROM lesson01_tbl;
+------+---------+
| id   | name    |
+------+---------+
|    1 | cal     |
|    2 | student |
+------+---------+
2 rows in set (0,00 sec)

mysql> exit
Bye

