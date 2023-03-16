# Урок №12, задача №1: Создать модуль music_serialize.py. В этом модуле определить словарь для вашей любимой музыкальной группы, например:
# my_favourite_group = {
# ‘name’: ‘Г.М.О.’,
# ‘tracks’: [‘Последний месяц осени’, ‘Шапито’],
# ‘Albums’: [{‘name’: ‘Делать панк-рок’,‘year’: 2016},
# {‘name’: ‘Шапито’,‘year’: 2014}]}
# С помощью модулей json и pickle сериализовать данный словарь в json и в байты, вывести результаты в терминал. Записать результаты в файлы group.json, group.pickle соответственно. В файле group.json указать кодировку utf-8.

import json
import pickle

my_favourite_group = {
    'name': 'Г.М.О.',
    'tracks': ['Последний месяц осени', 'Шапито'],
    'albums': [{'name': 'Делать панк-рок', 'year': 2016}, {'name': 'Шапито', 'year': 2014}]
}

serialize_j = json.dumps(my_favourite_group)
print(serialize_j)

serialize_p = pickle.dumps(my_favourite_group)
print(serialize_p)

with open('lesson12_task01_music_group.json', 'w', encoding='utf-8') as f:
    json.dump(my_favourite_group, f)

with open('lesson12_task01_music_group.pickle', 'wb') as f:
    pickle.dump(my_favourite_group, f)
