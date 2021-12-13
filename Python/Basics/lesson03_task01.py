# Урок № 3, задача № 1:
# Реализовать функцию, принимающую два числа (позиционные аргументы) и выполняющую их деление. Числа запрашивать у пользователя, предусмотреть обработку ситуации деления на ноль.

def my_div(num1, num2):
    """Деление двух значений"""
    try:
        result = num1 / num2
    except ZeroDivisionError:
        print('Ошибка. Деление на ноль невозможно')
    else:
        return result


user_number_1 = int(input('Введите первое число: '))
user_number_2 = int(input('Введите второе число: '))

user_result = my_div(user_number_1, user_number_2)
print(user_result)
