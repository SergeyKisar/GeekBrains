# Урок № 6, задача № 5:
# Реализовать класс Stationery (канцелярская принадлежность).
# Определить в нем атрибут title (название) и метод draw (отрисовка).
# Метод выводит сообщение “Запуск отрисовки.”
# Создать три дочерних класса Pen (ручка), Pencil (карандаш), Handle (маркер).
# В каждом из классов реализовать переопределение метода draw.
# Для каждого из классов методы должен выводить уникальное сообщение.
# Создать экземпляры классов и проверить, что выведет описанный метод для каждого экземпляра.

class Stationery:

    def __init__(self, descr='Stationery item'):
        self.descr = descr

    def draw(self):
        print('Запуск отрисовки')


class Pen(Stationery):
    def draw(self):
        print(f'Запуск отрисовки предметом "{self.descr}"')


class Pencil(Stationery):
    def draw(self):
        print(f'Запуск отрисовки предметом "{self.descr}"')


class Handle(Stationery):
    def draw(self):
        print(f'Запуск отрисовки предметом "{self.descr}"')


stationery = Stationery('Канцелярская пренадлежность')
stationery.draw()

pen = Pen('Ручка')
pen.draw()

pencil = Pencil('Карандаш')
pencil.draw()

handle = Handle('Маркер')
handle.draw()
