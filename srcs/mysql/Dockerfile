FROM    alpine:3.12

# Устанавливаем необходимые пакеты
RUN     apk update &&\
        apk add mysql \
        mysql-client\
        supervisor\
        libc6-compat\
        openrc

# Установка telegraf
RUN apk add telegraf --repository\
    http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache

COPY telegraf.conf /etc/telegraf/

# Копируем необходимые базы данных и конфиги в образ
COPY    supervisord.conf /etc/supervisord.conf
COPY    my.cnf /etc/my.cnf
COPY    main_bd.sql ./main_bd.sql
COPY    wordpress_bd.sql ./wordpress_bd.sql

# Копируем инициализацию баз данных
COPY    bd_init.sh /bd_init.sh
RUN     chmod +x /bd_init.sh

# Копируем и даем права на запуск скрипта supervisord
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем 3306 порт
# Порт 3306 - это порт по умолчанию для классического протокола MySQL
EXPOSE  3306

# Запускаем контейнер 
CMD    ["sh", "start_supervisord.sh"]