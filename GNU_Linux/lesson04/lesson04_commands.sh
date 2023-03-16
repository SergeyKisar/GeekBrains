###
Задача №1:
cat /etc/*.* 1>lesson04_task1_read_result.txt 2>lesson04_task1_error_result.txt

###
Задача №2:
ll / > lesson04_task2_catalog.txt
cut -b 1-10 lesson04_task2_catalog.txt | sort | uniq

###
Задача №3:
sudo vim /etc/ssh/ssh_config
Добавляем запись в конец файла: PasswordAuthentication no
Сохраняем :w
И теперь изменяем дописаную строку на: PasswordAuthentication yes
Сохраняем и выходим :wq

В чём различие между действиями restart и reload?
Различие в том, что restart полностью перезапускает службу с другим PID; когда reload просто перечитывает конфигурацию PID, при это остается неизменным.

Не создаю (как сказано в задаче) а дополняю файл, и сейчас передам комбинацию ctrl+d что аналогично передаче сигнала -15 (SIGTERM) - "мягкого завершения".

Копия команды:
cal@deus-ex-machina:~/Рабочий стол/Education/GNU_Linux/lesson04(master)$ cat >> lesson04_commands.txt
Не создаю (как сказано в задаче) а дополняю файл, и сейчас передам комбинацию ctrl+d что аналогично передаче сигнала -15 (SIGTERM) - "мягкого завершения".

###
Задача №4:
ps -A | grep double
  13735 ?        00:00:01 doublecmd
kill -n 9 13735

