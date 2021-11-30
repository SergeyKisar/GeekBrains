# Урок № 3, задача № 4:
# Программа принимает действительное положительное число x и целое отрицательное число y. Необходимо выполнить возведение числа x в степень y.
# Задание необходимо реализовать в виде функции my_func(x, y). При решении задания необходимо обойтись без встроенной функции возведения числа в степень.
# Подсказка: попробуйте решить задачу двумя способами.
# Первый — возведение в степень с помощью оператора **.
# Второй — более сложная реализация без оператора **, предусматривающая использование цикла.

def my_pow_oper(num1, num2):
    result = num1 ** num2
    return result

def my_pow_cycle(num1, num2):
    result = 1
    for i in range(abs(num2)):
        result *= num1
    if num2 >= 0:
        return result
    else:
        return 1 / result

result_oper = my_pow_oper(3, -5)
print('Возведение в степень оператором:', result_oper)

result_cycle = my_pow_cycle(3, -5)
print('Возведение в степень циклом:', result_cycle)