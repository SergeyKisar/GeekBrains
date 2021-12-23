# Урок № 6, задача № 3:
# Реализовать базовый класс Worker (работник), в котором определить атрибуты: name, surname, position (должность), income (доход).
# Последний атрибут должен быть защищенным и ссылаться на словарь, содержащий элементы: оклад и премия, например, {"wage": wage, "bonus": bonus}.
# Создать класс Position (должность) на базе класса Worker.
# В классе Position реализовать методы получения полного имени сотрудника (get_full_name) и дохода с учетом премии (get_total_income).
# Проверить работу примера на реальных данных
# (создать экземпляры класса Position, передать данные, проверить значения атрибутов, вызвать методы экземпляров).

class Worker:

    def __init__(self, firstname, lastname, position, wage, bonus):
        self.firstname = firstname
        self.lastname = lastname
        self.position = position
        self._finance = {'wage': wage, 'bonus': bonus}

class Position(Worker):

    def get_name(self):
        return f'{self.firstname} {self.lastname}'

    def get_wage(self):
        return f'{sum(self._finance.values())}'

programmer = Position('Иван', 'Иванов', 'Программист', 150000, 50000)

print(programmer.get_name(), programmer.position, programmer.get_wage())
