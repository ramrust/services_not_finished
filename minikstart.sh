#!bin/bash

tput setaf 1
read -p "Are you sure you want to reinstall minikube? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo "Deleting Minikube . . ."
echo ""
tput sgr 0
minikube delete
echo ""
tput setaf 4
echo "Creating Minikube . . ."
echo ""
tput sgr 0
minikube start --vm-driver=virtualbox #--cpus=2 --memory=1901mb --disk-size=4gb
echo ""


# brew reinstall minikube
# Minikube — инструмент, который создает виртуальную машину на вашей локальной машине 
# и разворачивает кластер Kubernetes c одним узлом. То есть нам нужно установить на 
# нашу физическую машину Minikube, запуск которого развернет Kubernetes.
# Чтобы установить Minikube мы используем менеджер пакетов Homebrew


# brew reinstall kubectl
# mv ../.minikube .././goinfre # двигаем папку в фри

# ln -sf ~/goinfre/.minikube ~/.minikube # создаем ссылку

# minikube start --vm-driver=virtualbox # start kluster in kubernetes
tput setaf 3
echo "EVAL Docker inside . . ."
echo ""
tput sgr 0
eval $(minikube docker-env) # switch docker inside cluster 

# minikube delete / status
tput setaf 2
echo "Enabling Loadbalancer . . ."
echo ""
minikube addons enable metallb # start of metallb, loadbalancer, распределение нагрузки и выдача ip
kubectl apply -f ./srcs/configmap.yaml
tput setaf 9
echo ""
echo "Minikube is READY . . ."
echo "" & sleep 10
tput sgr 0
fi
echo ""
echo "Setting up NGINX . . ."
echo "" 
docker build -t nginx_image ./srcs/nginx/
echo ""
echo "Setting up WORDPRESS . . ."
echo ""
docker build -t wordpress_image ./srcs/wordpress/
echo ""
echo "Setting up PHP . . ."
echo ""
docker build -t phpmyadmin_image ./srcs/phpMyAdmin/
echo ""
echo "Setting up MYSQL . . ."
echo ""
docker build -t mysql_image ./srcs/mysql/
echo ""
echo "Setting up INFLUX . . ."
echo ""
docker build -t influxdb_image ./srcs/influx/
docker build -t grafana_image ./srcs/grafana/
echo ""
# create a pod via yaml file
tput setaf 4
echo "Creating Deployments . . ."
tput sgr 0
echo ""
kubectl apply -f ./srcs/nginx/nginx.yaml
echo ""
kubectl apply -f ./srcs/wordpress/wordpress.yaml
echo ""
kubectl apply -f ./srcs/phpMyAdmin/phpmyadmin.yaml
echo ""
kubectl apply -f ./srcs/mysql/mysql.yaml
echo ""
kubectl apply -f ./srcs/influx/influxdb.yaml
echo ""
kubectl apply -f ./srcs/grafana/grafana.yaml
echo ""
tput setaf 5
echo "Opening dashboard . . ."
echo ""
tput sgr 0
minikube dashboard

# kubectl get pods # show all pod
# kubectl delete pods "nginx" # to delete pods
# docker login --username 6565654 --password korston12