# Урок № 8, задача № 1:
# Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата «день-месяц-год».
# В рамках класса реализовать два метода.
# Первый, с декоратором @classmethod, должен извлекать число, месяц, год и преобразовывать их тип к типу «Число».
# Второй, с декоратором @staticmethod, должен проводить валидацию числа, месяца и года (например, месяц — от 1 до 12).
# Проверить работу полученной структуры на реальных данных.

class MyDate:

    def __init__(self, date):
        self.date = date

    @classmethod
    def my_extract(cls):
        result = my_date.date.split('.')
        day = int(result[0])
        month = int(result[1])
        year = int(result[2])
        return [day, month, year]

    @staticmethod
    def my_check(func):
        if func[0] > 31:
            print('Укажите корректный номер дня')
        else:
            pass
        if func[1] > 12:
            print('Укажите корректный номер месяца')
        else:
            pass
        return func

# Евгений, в задаче не указано что при некорректном вводе работу программы надо остановить. Поэтому только принты.

my_date = MyDate(input('Введите текущее число в формате ДД.ММ.ГГГГ: '))
print(my_date.my_check(my_date.my_extract()))
