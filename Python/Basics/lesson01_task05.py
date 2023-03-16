# Урок №1, задача №5: Запросите у пользователя значения выручки и издержек фирмы. Определите, с каким финансовым результатом работает фирма (прибыль — выручка больше издержек, или убыток — издержки больше выручки). Выведите соответствующее сообщение. Если фирма отработала с прибылью, вычислите рентабельность выручки (соотношение прибыли к выручке). Далее запросите численность сотрудников фирмы и определите прибыль фирмы в расчете на одного сотрудника.

user_gain = int(input('Введите сумму выручки фирмы (в числовом значении):\n'))
while user_gain <= 0:
    user_gain = int(input('Некорректное значение. Введите положительную сумму:\n'))

user_expense = int(input('Введите сумму издержек фирмы (в числовом значении):\n'))
while user_expense <= 0:
    user_expense = int(input('Некорректное значение. Введите положительную сумму:\n'))

if user_gain > user_expense:
    user_employee_count = int(input('Введите количество сотрудников фирмы (в числовом значении):\n'))
    user_profit = user_gain - user_expense
    user_profit_proc = round(((user_profit / user_gain) * 100), 2)
    user_profit_per_employee = round(user_profit / user_employee_count, 2)
    print(f'Выручка: {user_profit}, рентабельность выручки: {user_profit_proc}%\nКоличество сотрудников: {user_employee_count}, прибыль в расчете на одного сотрудника: {user_profit_per_employee}')

elif user_gain == user_expense:
    print('Доход равен издержкам. Фирма работает "в ноль".')

else:
    print('Фирма работает в убыток.')
