# В консольный файловый менеджер добавить проверку ввода пользователя для всех функции с параметрами (на уроке разбирали на примере одной функции).
# Добавить возможность изменения текущей рабочей директории.
# Добавить возможность развлечения в процессе работы с менеджером. Для этого добавить в менеджер запуск одной из игр: “угадай число” или “угадай число (наоборот)”.

import sys
from lesson16_task_01_core import save_info, get_list, change_dir, create_file, create_folder, copy_f, del_f, game



save_info('Начало работы')

try:
    command = sys.argv[1]
except IndexError:
    print('Необходимо выбрать команду. Введите help для отображения всех команд.')
else:
    if command == 'list':
        get_list()
    elif command == 'ch':
        try:
            name = sys.argv[2]
        except IndexError:
            print('Отсутствует название директории.')
        else:
            try:
                change_dir(name)
            except FileNotFoundError:
                print('Некорректное имя директории')
    elif command == 'create_file':
        try:
            name = sys.argv[2]
        except IndexError:
            print('Отсутствует название файла.')
        else:
            create_file(name)
    elif command == 'create_folder':
        try:
            name = sys.argv[2]
        except IndexError:
            print('Отсутствует название папки.')
        else:
            create_folder(name)
    elif command == 'copy':
        try:
            name = sys.argv[2]
            new_name = sys.argv[3]
        except IndexError:
            print('Необходимо ввести имя копируемого объекта и его новое имя.')
        else:
            copy_f(name, new_name)
    elif command == 'del':
        try:
            name = sys.argv[2]
        except IndexError:
            print('Отсутствует имя объекта.')
        else:
            del_f(name)
    elif command == 'game':
        game()
    elif command == 'help':
        print('list - список файлов и папок')
        print('ch - изменить рабочую дирректорию')
        print('create_file - создание файла')
        print('create_folder - создание папки')
        print('copy - копирование файла или папки')
        print('del - удаление файла или папки')
        print('game - игра "угадай число"')


save_info('Конец работы')
