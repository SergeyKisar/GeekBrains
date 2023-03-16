# Урок №12, задача №2: Создать модуль music_deserialize.py. В этом модуле открыть файлы group.json и group.pickle, прочитать из них информацию. И получить объект: словарь из предыдущего задания.

import json
import pickle

with open('lesson12_task01_music_group.json', 'r', encoding='utf-8') as f:
    deserialize_j = json.load(f)
print(deserialize_j, type(deserialize_j))

with open('lesson12_task01_music_group.pickle', 'rb') as f:
    deserialize_p = pickle.load(f)
print(deserialize_p, type(deserialize_p))
