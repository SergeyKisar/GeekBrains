# Урок №4, задача №1:
# Реализовать скрипт, в котором должна быть предусмотрена функция расчета заработной платы сотрудника.
# В расчете необходимо использовать формулу: (выработка в часах * ставка в час) + премия.
# Для выполнения расчета для конкретных значений необходимо запускать скрипт с параметрами.

from sys import argv


def wage_calc(total_hours= int or float, per_hour= int or float, bonus= int or float):
    try:
        result = (total_hours * per_hour) + bonus
    except ValueError:
        print('Программа работает только с числами')
    else:
        return result


try:
    total_hours = argv[1]
    per_hour = argv[2]
    bonus = argv[3]
except IndexError:
    print(
        'Для вычисления заработной платы сотруднику, при запуске программы укажите аргументами к ней (используя только цифры):\n'
        '1. Количество отработаных часов.\n'
        '2. Стоимость часа.\n'
        '3. Премия.')

try:
    print('Заработная плата сотрудника составит:', wage_calc(float(total_hours), float(per_hour), float(bonus)))
except ValueError:
    print('Программа работает только с числами')
except NameError:
    pass
