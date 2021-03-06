# Урок №4, задача №6:
# Реализовать два небольших скрипта:
# а) итератор, генерирующий целые числа, начиная с указанного,
# б) итератор, повторяющий элементы некоторого списка, определенного заранее.
# Подсказка: использовать функцию count() и cycle() модуля itertools.
# Обратите внимание, что создаваемый цикл не должен быть бесконечным. Необходимо предусмотреть условие его завершения.
# Например, в первом задании выводим целые числа, начиная с 3, а при достижении числа 10 завершаем цикл.
# Во втором также необходимо предусмотреть условие, при котором повторение элементов списка будет прекращено.

from itertools import count, cycle
from random import randint


for i in count(3):
    if i == 11:
        break
    print(i, '- count')

iter_count = 0
for i in cycle([1, 2, 3, 4, 5]):
    print(i, '- cycle')
    iter_count += 1
    if iter_count == 10:
        break
