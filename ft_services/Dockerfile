FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add nginx openssl

COPY srcs/nginx-config /etc/nginx/ccnf.d/default.conf

RUN openssl req -x509 -nodes -days 30 -subj "/C=RU/ST=Horosho/L=Chto/O=sprosil/CN=rulrikes_first_site" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.crt;

RUN mkdir -p /run/nginx
EXPOSE 443 80
  
CMD nginx -g 'daemon off;'