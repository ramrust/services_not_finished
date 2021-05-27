FROM    alpine:3.12

# Устанавливаем необходимые пакеты
RUN     apk update;\
        apk add\
        nginx\
        supervisor\
        libc6-compat\
        php7 php7-fpm php7-mysqli \
        php7-zlib php7-curl php7-mbstring \
        php7-json php7-session

# Установка telegraf
RUN apk add telegraf --repository\
    http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache

COPY telegraf.conf /etc/telegraf/

# Установка wordpress
RUN     mkdir -p /www/ && \
        mkdir /run/nginx &&\
        chmod 744 /run/nginx &&\
        cd /www &&\
        wget http://wordpress.org/latest.tar.gz && \
        tar -xzvf latest.tar.gz && \
        rm latest.tar.gz && \
        cd -

# Копируем необходимые конфиги в образ
COPY    nginx.conf /etc/nginx/conf.d/default.conf
COPY    supervisord.conf /etc/supervisord.conf
COPY    wp-config.php /www/wordpress

# Копируем запуск скрипта supervisord в контейнер
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем 5050 порт
EXPOSE  5050

# Запускаем контейнер
CMD    ["sh", "start_supervisord.sh"]