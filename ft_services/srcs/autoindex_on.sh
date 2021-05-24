#!bin/bash

replace "autoindex off" "autoindex on" -- etc/nginx/sites-available/nginx-config
echo "autoindex on"
service nginx restart