# Урок № 8, задача № 5:
# Продолжить работу над первым заданием.
# Разработать методы, отвечающие за приём оргтехники на склад и передачу в определенное подразделение компании.
# Для хранения данных о наименовании и количестве единиц оргтехники,
# а также других данных, можно использовать любую подходящую структуру, например словарь.

class Warehouse:

    printer_dict = {}
    scanner_dict = {}
    xerox_dict = {}

    user_input = None

    def __init__(self, descr):
        self.descr = descr

    def start(self):
        print(f'{self.descr} начал работу на складе.')

    @classmethod
    def add_oe(cls):
        while True:
            Warehouse.user_input = input('Для добавление оргтехники в складской учёт выберите соответствующий её пункт:\n'
            '1 = добавить принтер\n'
            '2 = добавить сканер\n'
            '3 = добавить ксерокс\n'
            'Для остановки программы введите "quit".\n'
            'Ваш ввод: ')
            if str(Warehouse.user_input).upper() == 'QUIT':
                print('Программа остановлена')
                break
            elif int(Warehouse.user_input) == 1:
                p_k = input('Введите название Принтера: ')
                p_v = input('Введите количество: ')
                Warehouse.printer_dict[p_k] = p_v
                print('Принтеры:', Warehouse.printer_dict)

            elif int(Warehouse.user_input) == 2:
                s_k = input('Введите название Сканера: ')
                s_v = input('Введите количество: ')
                Warehouse.scanner_dict[s_k] = s_v
                print('Сканеры', Warehouse.scanner_dict)

            elif int(Warehouse.user_input) == 3:
                x_k = input('Введите название Сканера: ')
                x_v = input('Введите количество: ')
                Warehouse.xerox_dict[x_k] = x_v
                print('Ксероксы', Warehouse.xerox_dict)
# Закончить не успел!

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


loader = Warehouse('Складской погрузчик')
printer = Printer('Принтер')
scanner = Scanner('Сканер')
xerox = Xerox('Ксерокс')

Warehouse.add_oe()