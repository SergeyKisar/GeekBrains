# Урок № 8, задача № 4:
# Начните работу над проектом «Склад оргтехники». Создайте класс, описывающий склад.
# А также класс «Оргтехника», который будет базовым для классов-наследников.
# Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс).
# В базовом классе определить параметры, общие для приведенных типов.
# В классах-наследниках реализовать параметры, уникальные для каждого типа оргтехники.

class Warehouse:

    def __init__(self, descr):
        self.descr = descr

    def start(self):
        print(f'{self.descr} начал работу на складе.')


class OfficeEquipment:

    def __init__(self, typename):
        self.typename = typename

class Printer(OfficeEquipment):
    def start(self):
        print(f'{self.typename} включен и готов к работе.')

    def printing(self):
        print(f'{self.typename} начал печать.')

class Scanner(OfficeEquipment):
    def start(self):
        print(f'{self.typename} включен и готов к работе.')

    def scanning(self):
        print(f'{self.typename} начал сканирование.')

class Xerox(OfficeEquipment):
    def start(self):
        print(f'{self.typename} включен и готов к работе.')

    def copying(self):
        print(f'{self.typename} начал копирование.')

if __name__ == '__main__':
    loader = Warehouse('Складской погрузчик')
    printer = Printer('Принтер')
    scanner = Scanner('Сканер')
    xerox = Xerox('Ксерокс')

    loader.start()
    printer.start()
    printer.printing()
    scanner.start()
    scanner.scanning()
    xerox.start()
    xerox.copying()
