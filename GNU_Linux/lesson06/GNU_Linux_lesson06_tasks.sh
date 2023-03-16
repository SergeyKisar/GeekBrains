#!/bin/bash

echo 'task 1'
echo 'current user:' $USER $USER $USER



echo 'task 2'
i=0
while [ $i -le 100 ]
do
  echo 'number:' $i
  ((i++))
done



# task 3
# cal@deus-ex-machina:~$ crontab -l
# */10 * * * * cp -f -b /home/cal/Рабочий\ стол/Education/GNU_Linux/lesson06/GNU_Linux_lesson06_tasks.sh /home/cal/Рабочий\ стол/Education/GNU_Linux/lesson06/GNU_Linux_lesson06_tasks.sh.bak

# cal@deus-ex-machina:~$ ll /home/cal/Рабочий\ стол/Education/GNU_Linux/lesson06/
# итого 20
# drwxrwxr-x 2 cal cal 4096 фев  1 02:20 ./
# drwxrwxr-x 8 cal cal 4096 фев  1 00:32 ../
# -rw-rw-r-- 1 cal cal  403 фев  1 02:14 GNU_Linux_lesson06_tasks.sh
# -rw-rw-r-- 1 cal cal  403 фев  1 02:20 GNU_Linux_lesson06_tasks.sh.bak
# -rw-rw-r-- 1 cal cal  164 фев  1 02:03 GNU_Linux_lesson06_tasks.sh.bak~

