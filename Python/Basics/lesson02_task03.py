# Урок № 2, задача № 3:
# Пользователь вводит месяц в виде целого числа от 1 до 12. Сообщить к какому времени года относится месяц (зима, весна, лето, осень). Напишите решения через list и через dict.

user_month = int(input('Введите номер месяца:\n'))
while user_month <=0 or user_month > 12:
    user_month = int(input('Некорректное значение. Введите номер месяца:\n'))



# С помощью оператора if
if user_month == 12 or user_month == 1 or user_month == 2:
    print('Время года: Зима')
elif user_month >= 3 and user_month <= 5:
    print('Время года: Весна')
elif user_month >= 6 and user_month <= 8:
    print('Время года: Лето')
elif user_month >= 9 and user_month <= 11:
    print('Время года: Осень')
else:
    print('Некорректный ввод')



# C помощью листа
months_list = ['Январь. Время года: Зима',
           'Февраль. Время года: Зима',
           'Март. Время года: Весна',
           'Апрель. Время года: Весна',
           'Май. Время года: Весна',
           'Июнь. Время года: Лето',
           'Июль. Время года: Лето',
           'Август. Время года: Лето',
           'Сентябрь. Время года: Осень',
           'Октябрь. Время года: Осень',
           'Ноябрь. Время года: Осень',
           'Декабрь. Время года: Зима'
]
months_index = user_month - 1
print('Результат из листа: ', months_list[months_index])



# С помощью словаря
months_dict = {
    1: 'Январь. Время года: Зима',
    2: 'Февраль. Время года: Зима',
    3: 'Март. Время года: Весна',
    4: 'Апрель. Время года: Весна',
    5: 'Май. Время года: Весна',
    6: 'Июнь. Время года: Лето',
    7: 'Июль. Время года: Лето',
    8: 'Август. Время года: Лето',
    9: 'Сентябрь. Время года: Осень',
    10: 'Октябрь. Время года: Осень',
    11: 'Ноябрь. Время года: Осень',
    12: 'Декабрь. Время года: Зима'
}
print(f'Результат из словаря: {months_dict[user_month]}')