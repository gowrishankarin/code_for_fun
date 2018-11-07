mkdir 06_configurations
cd 06_configurations/
touch reader-deployment.yaml
kubectl get services
kubectl delete serivices frontend, kubernetes
clear
kubectl delete services frontend
kubectl delete services frontend, kubernetes
kubectl get services
kubectl delete service redis-master, redis-slave
kubectl get services
kubectl delete service redis-master
clear
kubectl get deployments
kubectl delete deployment frontend redis-master redis-slave
clear
kubectl create -f reader-deployment.yaml
kubectl get pods
kubectl logs logreader-79d45779fd-5qd79
kubectl logs logreader-79d45779fd-5qd79
kubectl get pods
kubectl create configmap logger --from-literal=log_level=debug
touch reader-configmap-deployment.yaml
clear
kubectl create -f reader-configmap-deployment.yaml
kubectl get configmaps
kubectl get configmap/logger -o yaml
kubectl get deployments
kubectl get pods
kubectl logs logreader-79d45779fd-5qd79
kubectl logs logreader-dynamic-7fc69448f6-zlwjm
kubectl logs logreader-dynamic-7fc69448f6-zlwjm
kubectl get pods
cd ..
mkdir 07_secrets
cd 07_secrets/
touch secretreader-deployment.yaml
clear
kubectl create secret generic apikey --from-literal=api_key=123456767
kubectl get sercrets
kubectl get secrets
kubectl get secret apikey
kubectl get secret apikey -o yaml
kubectl create -f secretreader-deployment.yaml
kubctl get pods
kubectl get pods
kubectl logs secretreader-598bc7845c-n79d6
clear
history | cut -c -8
history | cut -c 8-