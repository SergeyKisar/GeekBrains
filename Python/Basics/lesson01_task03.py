# Урок №1, задача №3: Узнайте у пользователя число n. Найдите сумму чисел n + nn + nnn. Например, пользователь ввёл число 3. Считаем 3 + 33 + 333 = 369

# from random import randint
#
# input('Придумайте и введите число. Компьютер случайным образом выберет ещё 2 числа и выведет общую сумму всех чисел. Нажмите "Enter" чтобы продолжить:\n')
# user_num_1 = int(input('Введите число:\n'))
#
# rand_num_1 = randint(1, 100)
# rand_num_2 = randint(100, 1000)
# print(f'Ваше число: {user_num_1},', 'первое случайно выбранное число: %i,' % rand_num_1, 'второе случайно выбранное число: {}.'.format(rand_num_2))
# print('Сумма чисел:', user_num_1 + rand_num_1 + rand_num_2)

# Отредактировано в соответствии комментарию преподавателя

user_num = int(input('Введите цифру от 1 до 9:\n'))
print(user_num + (user_num * 11) + (user_num * 111))
