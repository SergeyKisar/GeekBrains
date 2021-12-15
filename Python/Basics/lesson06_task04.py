# Урок № 6, задача № 4:
# Реализуйте базовый класс Car.
# У данного класса должны быть следующие атрибуты: speed, color, name, is_police (булево).
# А также методы: go, stop, turn(direction), которые должны сообщать, что машина поехала, остановилась, повернула (куда).
# Опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar.
# Добавьте в базовый класс метод show_speed, который должен показывать текущую скорость автомобиля.
# Для классов TownCar и WorkCar переопределите метод show_speed.
# При значении скорости свыше 60 (TownCar) и 40 (WorkCar) должно выводиться сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам, выведите результат.
# Выполните вызов методов и также покажите результат.

class Car:

    def __init__(self, name, color, speed, is_police=False):
        self.name = name
        self.color = color
        self.speed = speed
        self.ispolice = is_police
        print(f'Новый авто: {self.name}, цвет: {self.color}, максимальная скорость: {self.speed}, авто полицейский: {self.ispolice}')

    def go(self):
        print(f'Автомобиль {self.name} начал движение')

    def stop(self):
        print(f'Автомобиль {self.name} закончил движение')

    def turn(self, direction):
        print(f'Автомобиль {self.name} повернул {"налево" if direction == 0 else "направо"}')

    def show_speed(self):
        print(f'Скорость автомобилья {self.name} равна {self.speed}')


class WorkCar(Car):

    def show_speed(self):
        print(f'Скорость автомобилья {self.name} равна {self.speed} - Превышение скорости!' if self.speed > 40 else f'Скорость автомобилья {self.name} равна {self.speed}')


class TownCar(Car):
    def show_speed(self):
        print(f'Скорость автомобилья {self.name} равна {self.speed} - Превышение скорости!' if self.speed > 60 else f'Скорость автомобилья {self.name} равна {self.speed}')


class PoliceCar(Car):
    def __init__(self, name, color, speed, is_police=True):
        super().__init__(name, color, speed, is_police)


class SportCar(Car):
    pass

my_workcar = WorkCar('Тойота', 'Белый', 50)
my_towncar = TownCar('Митсубиши', 'Серый', 70)
my_sportcar = SportCar('Ферари', 'Красный', 150)
my_policecar = PoliceCar('ДПС', 'Синий', 100)

my_towncar.go()
my_towncar.turn(0)
my_towncar.turn(1)
my_towncar.show_speed()
my_towncar.stop()
