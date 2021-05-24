#!bin/bash

brew reinstall minikube

# Minikube — инструмент, который создает виртуальную машину на вашей локальной машине 
# и разворачивает кластер Kubernetes c одним узлом. То есть нам нужно установить на 
# нашу физическую машину Minikube, запуск которого развернет Kubernetes.
# Чтобы установить Minikube мы используем менеджер пакетов Homebrew

brew reinstall kubectl

minikube start --vm-driver=virtualbox
mv ../.minikube .././goinfre # двигаем папку в фри

ln -sf ~/goinfre/.minikube ~/.minikube # создаем ссылку

# minikube start --vm-driver=virtualbox # start kluster in kubernetes

eval $(minikube docker-env) # switch docker inside cluster 

# minikube delete / status

# minikube addons enable metallb # start of metallb, loadbalancer, распределение нагрузки и выдача ip
docker build -t nginx_image .

# create a pod via yaml file
# kubectl apply -f nginx.yaml
# kubectl get svc
# check if it is done 
# kubectl get pods kubectl delete pod



# kubectl get pods # show all pod
# kubectl delete pods "nginx" # to delete pods
# docker login --username 6565654 --password korston12