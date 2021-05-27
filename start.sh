kubectl apply -f ./srcs/nginx/nginx.yaml
echo "" & sleep 15
kubectl apply -f ./srcs/wordpress/wordpress.yaml
echo "" & sleep 5
kubectl apply -f ./srcs/phpMyAdmin/phpmyadmin.yaml
echo ""
echo "" & sleep 5
kubectl apply -f ./srcs/mysql/mysql.yaml
echo ""