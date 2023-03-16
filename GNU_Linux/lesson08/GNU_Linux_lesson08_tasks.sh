# Задача 1
Переустанвливать небуду т.к. основная система

# Задача 2
cal@deus-ex-machina:~$ docker --version
Docker version 20.10.7, build 20.10.7-0ubuntu5~20.04.2

# Задача 3
cal@deus-ex-machina:~$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

# Задача 4
FROM ubuntu:20.04
LABEL maintainer="Cal"
ENV DEBIAN_FRONTEND=noninteractive

# RUN apt-get update \
#     && apt-get install -y gnupg tzdata \
#     && echo "UTC" ? "/etc/timezone" \
#     && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
    && apt-get install -y curl zip unzip git supervisor \
       nginx php7.2-fpm php7.2-cli php7.2-curl \
       php7.2-mysql php7.2-mbstring php7.2-xml \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

ADD nginx.conf /etc/nginx/sites-available/default.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD initial.sh /usr/bin/initial
RUN chmod +x /usr/bin/initial

ENTRYPOINT [ "initial" ]
