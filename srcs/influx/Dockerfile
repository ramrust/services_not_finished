FROM alpine:3.12

# Подключаем необходимые пакеты
RUN apk update
RUN apk add\
    libc6-compat\
    supervisor\
    influxdb

# Установка telegraf
RUN apk add telegraf --repository\
    http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache

COPY telegraf.conf /etc/telegraf/

# Переносим скрипт запуска сервера
COPY    supervisord.conf /etc/supervisord.conf
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем необходимые порты
EXPOSE 3000

# Запускаем контейнер
CMD     [ "sh", "start_supervisord.sh" ]

