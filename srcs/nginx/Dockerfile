FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add nginx openssl\
    openssh\
    --no-cache libc6-compat\
    supervisor

RUN apk add telegraf --repository\
    http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache

COPY telegraf.conf /etc/telegraf/

# Создаем пользователя
RUN     adduser -D -g 'www' www

# Создаем необходимые директории и выдаем права
RUN     mkdir /www;\
        chown -R www:www /var/lib/nginx;\
        chown -R www:www /www;\
        mkdir -p /run/nginx

# Перезаписываем конфиги nginx и supervisord, закидываем страницу index.html
COPY    nginx-config.conf /etc/nginx/nginx.conf
COPY    index.html /www/index.html
COPY    supervisord.conf /etc/supervisord.conf

# RUN ssh-keygen -A
# RUN yes "" 
RUN openssl req -x509 -nodes -days 30 -subj "/C=RU/ST=Horosho/L=Chto/O=sprosil/CN=rulrikes_first_site"\
 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.crt


# Переносим скрипт запуска сервера
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем необходимые порты 
EXPOSE  80 443 22

# Запускаем контейнер 
CMD     [ "sh", "start_supervisord.sh" ]