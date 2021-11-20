# Урок №8, задача №2: Создайте функцию, принимающую на вход 3 числа и возвращающую наибольшее из них.

def biggest(num1, num2, num3):
    result = max([num1, num2, num3])
    return result

numbers = biggest(4, 13, 11)
print(numbers)
