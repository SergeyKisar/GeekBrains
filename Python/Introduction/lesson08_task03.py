# Урок №8, задача №3: Давайте опишем пару сущностей player и enemy через словарь, который будет иметь ключи и значения:
#     name - строка полученная от пользователя,
#     health = 100,
#     damage = 50. ### Поэкспериментируйте с значениями урона и жизней по желанию. ### Теперь надо создать функцию attack(person1, person2). Примечание: имена аргументов можете указать свои. ### Функция в качестве аргумента будет принимать атакующего и атакуемого. ### В теле функция должна получить параметр damage атакующего и отнять это количество от health атакуемого. Функция должна сама работать со словарями и изменять их значения.

player_name = input('Введите Ваше имя: ')
enemy_name = input('Введите имя Вашего противника: ')

player = {
    'name': player_name,
    'health': 100,
    'damage': 50
}

enemy = {
    'name': enemy_name,
    'health': 50,
    'damage': 25
}

def attack(attacker, target):
    target['health'] -= attacker['damage']

attack(enemy, player)
attack(player, enemy)

print(player)
print(enemy)
