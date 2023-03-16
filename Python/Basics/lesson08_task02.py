# Урок № 8, задача № 2:
# Создайте собственный класс-исключение, обрабатывающий ситуацию деления на нуль.
# Проверьте его работу на данных, вводимых пользователем.
# При вводе пользователем нуля в качестве делителя программа должна корректно обработать эту ситуацию и не завершиться с ошибкой.

from traceback import print_exc

class MyZeroDivError(Exception):

    def __init__(self, text):
        self.text = text

input('Введите два числа для деления. Для продолжения нажмите Enter')
a = int(input('Введите делимое: '))
b = int(input('Введите делитель: '))

try:
    if b == 0:
        raise MyZeroDivError('Деление на ноль невозможно. <<<Своя ошибка>>>.')
except MyZeroDivError:
    print(print_exc())
    while b == 0:
        b = int(input('Введите корректный делитель: '))

result = a / b
print('Результат:', result)
