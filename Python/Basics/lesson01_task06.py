# Урок №1, задача №6: Спортсмен занимается ежедневными пробежками. В первый день его результат составил a километров. Каждый день спортсмен увеличивал результат на 10 % относительно предыдущего. Требуется определить номер дня, на который общий результат спортсмена составить не менее b километров. Программа должна принимать значения параметров a и b и выводить одно натуральное число — номер дня.

distance_length_a = int(input('Введите результат пробежки спортсмена в километрах в первый день:\n'))
distance_length_b = int(input('Введите количество километров чтобы определить на какой день спортсмен достигнет результата:\n'))

days_count = 0

while distance_length_b - distance_length_a > 0:
    distance_length_a *= 1.1 # Отредактировано в соответствии комментарию преподавателя
    days_count += 1 # Сокращено

print(days_count)
