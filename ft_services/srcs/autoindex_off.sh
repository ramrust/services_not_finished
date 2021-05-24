#!bin/bash

replace "autoindex on" "autoindex off" -- etc/nginx/sites-available/nginx-config
echo "autoindex off"
service nginx restart