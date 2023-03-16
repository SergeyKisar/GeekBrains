# Урок №8, задача №4: Давайте усложним предыдущее задание. Измените сущности, добавив новый параметр - armor = 1.2 (величина брони персонажа)
# Теперь надо добавить новую функцию, которая будет вычислять и возвращать полученный урон по формуле damage / armor
# Следовательно, у вас должно быть 2 функции:
#     Наносит урон. Это улучшенная версия функции из задачи 3.
#     Вычисляет урон по отношению к броне.
#     Примечание. Функция номер 2 используется внутри функции номер 1 для вычисления урона и вычитания его из здоровья персонажа.

player_name = input('Введите Ваше имя: ')
enemy_name = input('Введите имя Вашего противника: ')

player = {
    'name': player_name,
    'health': 100,
    'damage': 50,
    'armor': 1.5
}

enemy = {
    'name': enemy_name,
    'health': 50,
    'damage': 25,
    'armor': 1.25

}

def calc_damage(damage, armor):
    return damage / armor

def attack(attacker, target):
    damage = calc_damage(attacker['damage'], target['armor'])
    target['health'] -= damage

attack(enemy, player)
attack(player, enemy)

print(player)
print(enemy)
