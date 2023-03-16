# Урок №10, задача №1: Создайте модуль (модуль - программа на Python, т.е. файл с расширением .py). В нем создайте функцию создающую директории от dir_1 до dir_9 в папке из которой запущен данный код. Затем создайте вторую функцию удаляющую эти папки. Проверьте работу функций в этом же модуле.

import os



def create_folders():
    for index in range(1, 10):
        folder_name = f'TestDir_{index}'
        os.mkdir(folder_name)

def delete_folders():
    for index in range(1, 10):
        folder_name = f'TestDir_{index}'
        os.rmdir(folder_name)

if __name__ == '__main__':
    input('Нажмите Enter чтобы создать 9 каталогов:')
    create_folders()
    input('Нажмите Enter чтобы удалить созданные каталоги:')
    delete_folders()

    print('Операции с каталогами успешно завершены')
