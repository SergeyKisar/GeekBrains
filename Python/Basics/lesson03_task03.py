# Урок № 3, задача № 3:
# Реализовать функцию my_func(), которая принимает три позиционных аргумента, и возвращает сумму наибольших двух аргументов.

def my_big_sum(num1, num2, num3):
    """Сложение двух наибольших значений"""
    num_list = sorted([num1, num2, num3], reverse=True)
    a = num_list[0]
    b = num_list[1]
    result = a + b
    return result


result = my_big_sum(1, 5, 3)
print(result)
