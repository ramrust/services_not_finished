#!/bin/sh
# Alpine Linux использует OpenRC для своей системы инициализации.
# Сервис можно запустить с помощью команд
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
# Устанавливаем наши бд
mysql -u root mysql < main_bd.sql
mysql -u root wordpress < wordpress_bd.sql
# Завершаем инициализацию
rc-service mariadb stop