# Урок № 5, задача № 2:
# Создать текстовый файл (не программно), сохранить в нем несколько строк, выполнить подсчет количества строк, количества слов в каждой строке.

with open('lesson05_task02.txt', 'r', encoding='utf=8') as f:
    data = [f'{num}) {" ".join(line.split())} - {len(line.split())} слов ' for num, line in enumerate(f, 1)]
    print(*data, f'всего строк - {len(data)}.', sep='\n')
