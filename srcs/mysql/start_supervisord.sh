#!/bin/sh

# Запускаем скрипт который проинициализирует наши бд
sh bd_init.sh

# Запускаем supervisord
supervisord -c /etc/supervisord.conf