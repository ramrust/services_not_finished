kubectl delete -f ./srcs/nginx/nginx.yaml
echo ""
kubectl delete -f ./srcs/wordpress/wordpress.yaml
echo ""
kubectl delete -f ./srcs/phpMyAdmin/phpmyadmin.yaml
echo ""
kubectl delete -f ./srcs/mysql/mysql.yaml
echo ""
kubectl delete -f ./srcs/influx/influxdb.yaml
echo ""
kubectl delete -f ./srcs/grafana/grafana.yaml