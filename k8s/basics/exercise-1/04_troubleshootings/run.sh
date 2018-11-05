cd 04_troubleshootings/
kubectl get services
kubectl detele navbar-service
kubectl delete navbar-service
kubectl delete sevice navbar-service
kubectl delete deployment navbar-service
kubectl get deployments
kubectl delete deployment navbar-deployment
clear
touch helloworld-with-bad-pod.yaml
kubectl create -f helloworld-with-bad-pod.yaml
kubectl get deployments
kubectl get pods
kubectl describe deployment bad-helloworld-deployment
kubectl get pods
kubectl describe po/bad-helloworld-deployment-86445d9955-nv69r
clear
kubectl get deployments
touch helloworld-deployment
kubectl create -f helloworld-deployment
kubectl get pods
kubectl log helloworld-deployment-7c46b4c7dc-s5t66
kubectl logs helloworld-deployment-7c46b4c7dc-s5t66
kubectl logs helloworld
kubectl logs bad-helloworld-deployment-86445d9955-nv69r
kubectl logs po/helloworld-deployment-7c46b4c7dc-s5t66
kubectl  exec -it  helloworld-deployment-7c46b4c7dc-s5t66
kubectl  exec -it  helloworld-deployment-7c46b4c7dc-s5t66 /bin/bash
history | cut -c 8-