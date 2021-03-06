# Урок № 6, задача № 2:
# Реализовать класс Road (дорога), в котором определить атрибуты: length (длина), width (ширина).
# Значения данных атрибутов должны передаваться при создании экземпляра класса. Атрибуты сделать защищенными.
# Определить метод расчета массы асфальта, необходимого для покрытия всего дорожного полотна.
# Использовать формулу: длина * ширина * масса асфальта для покрытия одного кв метра дороги асфальтом,
# толщиной в 1 см * чи сло см толщины полотна. Проверить работу метода.
# Например: 20м * 5000м * 25кг * 5см = 12500 т

class Road:

    def __init__(self, length, width):
        self._lenght = length
        self._width = width

    def get_mass(self):
        return f'При длинне полотна в {self._lenght}м, ширине полотна в {self._width}м,' \
               f' \nдля покрытия всей площади полотна, из расчета 5000 м * 20 м * 25 кг * 5 см,' \
               f' \nобщая масса асфальта должна составлять {(self._lenght * self._width * 25 * 5) / 1000} т'

user_road = Road(5000, 20)
print(user_road.get_mass())
