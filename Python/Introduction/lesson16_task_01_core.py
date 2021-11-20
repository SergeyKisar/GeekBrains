# В консольный файловый менеджер добавить проверку ввода пользователя для всех функции с параметрами (на уроке разбирали на примере одной функции).
# Добавить возможность изменения текущей рабочей директории.
# Добавить возможность развлечения в процессе работы с менеджером. Для этого добавить в менеджер запуск одной из игр: “угадай число” или “угадай число (наоборот)”.

import os
import shutil
import datetime
import random



def save_info(message):
    current_time = datetime.datetime.now()
    result = f'{current_time} {message}'
    with open('log.txt', 'a', encoding='utf-8') as f:
        f.write(result + '\n')

def get_list(folders_only=False):
    result = os.listdir()
    if folders_only:
        result = [f for f in result if os.path.isdir(f)]
    print(result)

def change_dir(name):
    os.chdir(name)
    print(os.getcwd())

def create_file(name, text=None):
    with open(name, 'w', encoding='utf-8') as f:
        if text:
            f.write(text)

def create_folder(name):
    try:
        os.mkdir(name)
    except FileExistsError:
        print('Ошибка. Такая папка уже есть.')

def copy_f(name, new_name):
    if os.path.isdir(name):
        try:
            shutil.copytree(name, new_name)
        except FileExistsError:
            print('Ошибка. Такая папка уже есть.')
    else:
        shutil.copy(name, new_name)

def del_f(name):
    if os.path.isdir(name):
        os.rmdir(name)
    else:
        os.remove(name)

def game():
    print('Здравствуйте. Загадайте цифру от 1 до 100, а я попробую угадать за пять попыток.')
    input('Нажмите Enter по готовности.')
    count = 1
    max_count = 5
    min_number = 1
    max_number = 100
    result = None

    while result != '=':
        number = random.randint(min_number, max_number)
        print(f'Моя попытка № {count},', 'мое число:', number)
        result = input('Введите знаки "<", ">" или "=": ')
        if count == max_count:
            print('Вы победили!')
            break
        elif result == '<':
            max_number = number - 1
            count += 1
        elif result == '>':
            min_number = number + 1
            count += 1
        elif result == '=':
            print('Я победил :)')
            break
        elif result != '<' or '>' or '=':
            result = input('Неверный ввод. Введите знаки "<", ">" или "=": ')
