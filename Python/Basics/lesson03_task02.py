# Урок № 3, задача № 2:
# Реализовать функцию, принимающую несколько параметров, описывающих данные пользователя: имя, фамилия, год рождения, город проживания, email, телефон.
# Функция должна принимать параметры как именованные аргументы. Реализовать вывод данных о пользователе одной строкой.

def person_info(firstname='default_firstname', lastname='default_lastname', birthyear='default_birthyear', sity='default_sity', email='default_email', phone='default_phone_number'):
    person_list = [firstname, lastname, birthyear, sity, email, phone]
    return person_list


person = person_info(lastname='Ivanov', firstname='Ivan', phone='+7 777 777 77 77', email='IvanIvanov2000@mail.ru', birthyear='2000', sity='Moscow')
print(person)
