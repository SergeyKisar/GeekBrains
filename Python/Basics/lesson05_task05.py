# Урок № 5, задача № 5:
# Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами.
# Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.

from random import randint


with open('lesson05_task05.txt', 'w+', encoding='utf-8') as f:
    f.write(' '.join([str(randint(1, 100)) for _ in range(10)]))
    f.seek(0)
    print(sum(map(int, f.readline().split())))
