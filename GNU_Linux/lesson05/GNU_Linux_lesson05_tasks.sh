### задание 1
touch file1 && echo line1 > file1 && cp file1 file2 && ln -s file1 file3 && ln file1 file4 && ll -i

итого 20
9437265 drwxrwxr-x 2 cal cal 4096 янв 28 00:21 ./
9437216 drwxrwxr-x 3 cal cal 4096 янв 28 00:14 ../
9437267 -rw-rw-r-- 2 cal cal    6 янв 28 00:21 file1
9437268 -rw-rw-r-- 1 cal cal    6 янв 28 00:21 file2
9437269 lrwxrwxrwx 1 cal cal    5 янв 28 00:21 file3 -> file1
9437267 -rw-rw-r-- 2 cal cal    6 янв 28 00:21 file4

rm file1
ll -i

итого 16
9437265 drwxrwxr-x 2 cal cal 4096 янв 28 00:22 ./
9437216 drwxrwxr-x 3 cal cal 4096 янв 28 00:14 ../
9437268 -rw-rw-r-- 1 cal cal    6 янв 28 00:21 file2
9437269 lrwxrwxrwx 1 cal cal    5 янв 28 00:21 file3 -> file1
9437267 -rw-rw-r-- 1 cal cal    6 янв 28 00:21 file4

# "мягкая ссылка" не работает, жесткая ссылка хранит содержимое удаленного файла, копия это копия)



### задание 2
mv file1 f1 && mv file2 f2 && ln -s /home/cal/Рабочий\ стол/Education/GNU_Linux/lesson05/testdir/f1 sl_f1 && ll

итого 12
drwxrwxr-x 2 cal cal 4096 янв 28 00:35 ./
drwxrwxr-x 3 cal cal 4096 янв 28 00:14 ../
-rw-rw-r-- 1 cal cal    0 янв 28 00:28 f1
-rw-rw-r-- 1 cal cal    0 янв 28 00:28 f2
lrwxrwxrwx 1 cal cal   73 янв 28 00:35 sl_f1 -> '/home/cal/Рабочий стол/Education/GNU_Linux/lesson05/testdir/f1'
# в ссылке указан абсолютный путь

mv sl_f1 /home/cal/Рабочий\ стол/Education/GNU_Linux/lesson05/ && cd .. && ll

итого 28
drwxrwxr-x 3 cal cal  4096 янв 28 00:38 ./
drwxrwxr-x 7 cal cal  4096 янв 28 00:09 ../
-rw-rw-r-- 1 cal cal     0 янв 28 00:10 GNU_Linux_lesson03_tasks.sh
-rw-r--r-- 1 cal cal 12288 янв 28 00:37 .GNU_Linux_lesson03_tasks.sh.swp
lrwxrwxrwx 1 cal cal    73 янв 28 00:35 sl_f1 -> '/home/cal/Рабочий стол/Education/GNU_Linux/lesson05/testdir/f1'
drwxrwxr-x 2 cal cal  4096 янв 28 00:38 testdir/



### задание 3
touch f1 f2 && ll

итого 8
drwxrwxr-x 2 cal cal 4096 янв 28 00:41 ./
drwxrwxr-x 3 cal cal 4096 янв 28 00:39 ../
-rw-rw-r-- 1 cal cal    0 янв 28 00:41 f1
-rw-rw-r-- 1 cal cal    0 янв 28 00:41 f2

chmod 664 f1 && chmod 600 f2 && ll

итого 8
drwxrwxr-x 2 cal cal 4096 янв 28 00:41 ./
drwxrwxr-x 3 cal cal 4096 янв 28 00:39 ../
-rw-rw-r-- 1 cal cal    0 янв 28 00:41 f1
-rw------- 1 cal cal    0 янв 28 00:41 f2



### задание 4
sudo chown :sudo . && sudo chmod 760 . && ll

итого 8
drwxrw---- 2 cal sudo 4096 янв 28 00:46 ./
drwxrwxr-x 3 cal cal  4096 янв 28 00:39 ../

# пользователей и группы делать не стал, просто назначил каталогу владельца группы sudo (это общий каталог для всех кто входит в эту группу) и поменял права: пользователь - ЧТЕНИЕ, ЗАПИСЬ, ИСПОЛНЕНИЕ; группа - ЧТЕНИЕ, ЗАПИСЬ; остальные - НИЧЕГО.



### задание 5
chmod +t . && ll
итого 8
drwxrw---T 2 cal sudo 4096 янв 28 00:46 ./
drwxrwxr-x 3 cal cal  4096 янв 28 00:39 ../



### задание 6
touch testfile && echo testline > testfile && ll
итого 12
drwxrwxr-x 2 cal cal 4096 янв 28 01:08 ./
drwxrwxr-x 3 cal cal 4096 янв 28 00:39 ../
-rw-rw-r-- 1 cal cal    9 янв 28 01:08 testfile

cat testfile
testline
# создали файл и проверили содержимое

chmod 331 . && ls
ls: невозможно открыть каталог '.': Отказано в доступе

cat testfile
testline
# изменили права и проверили доступность файла

