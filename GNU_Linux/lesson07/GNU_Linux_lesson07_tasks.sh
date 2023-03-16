#задача 1

#подключение репозитория
sudo apt-add-repository ppa:nginx/stable && sudo apt update
#установка и удаление
sudo apt install nginx
sudo apt remove nginx



#задача 2

#уже установлены в моей системе
cal@deus-ex-machina:~$ snap list
Название           Версия                      Правка  Канал            Издатель          Примечание
atom               1.57.0                      282     latest/stable    snapcrafters      classic
bare               1.0                         5       latest/stable    canonical✓        base
core               16-2.54.2                   12603   latest/stable    canonical✓        core
core18             20211215                    2284    latest/stable    canonical✓        base
core20             20220114                    1328    latest/stable    canonical✓        base
discord            0.0.16                      131     latest/stable    snapcrafters      -
gnome-3-28-1804    3.28.0-19-g98f9e67.98f9e67  161     latest/stable    canonical✓        -
gnome-3-34-1804    0+git.3556cb3               77      latest/stable/…  canonical✓        -
gnome-3-38-2004    0+git.cd626d1               87      latest/stable    canonical✓        -
gtk-common-themes  0.1-59-g7bca6ae             1519    latest/stable/…  canonical✓        -
pycharm-community  2021.3.2                    267     latest/stable    jetbrains✓        classic
snap-store         3.38.0-66-gbd5b8f7          558     latest/stable/…  canonical✓        -
snapd              2.54.2                      14549   latest/stable    canonical✓        snapd
telegram-desktop   3.4.3                       3544    latest/stable    telegram.desktop  -
tor-mkg20001       tor-0.4.1.6                 16      latest/stable    mkg20001          -



# задача 3

#закрываем входящие порты:
iptables -P INPUT DROP
#открываем входящие соединения для 22 и 80 портов:
iptables -A INPUT --dport 22 -j ACCEPT
iptables -A INPUT --dport 80 -j ACCEPT

# задача 4

# Насколько я понимаю, для ЛОКАЛЬНОГО проброса необходимо использовать цепочку output, в таком варианте я предполагаю что команда будет приблизительно такая:
sudo iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 8080
# Если перенаправлять из вне, то так:
sudo iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-ports 8080
# предполагаю потому что сам конкретно это не делал ещё никогда, и вебинар посмотреть не успел - работы очень много. Но до вебинара по докеру обязательно это исправлю.
