touch  helloworld-black.yaml
kubectl get deployments
kubectl delete deployment helloworld-deployment-with-bad-liveness-probe
kubectl create -f helloworld-black.yaml
kubectl get deployments
kubectl delete deployment navbar-deployment
kubectl get services
kubectl delete service helloworld-all-service
kubectl delete service hw
kubectl delete service navbar-service
clear
kubectl create -f helloworld-black.yaml --record
minikube service navbar-service
kubectl get services
kubectl get pods
kubectl get deployments
kubectl set image deployment/navbar-deployment helloworld=karthequian/helloworld:blue
kubectl get deployments
kubectl get services
minikube service navbar-service
kubectl get rs
kubectl get pods
clear
kubectl rollout history deployment/navbar-deployment
kubectl rollout history deployment/navbar-deployment
kubectl set image deployment/navbar-deployment helloworld=karthequian/helloworld:blue
kubectl get pods
kubectl rollout history deployment/navbar-deployment
kubectl rollout undo deployment/navbar-deployment
kubectl rollout history deployment/navbar-deployment
kubectl rollout history deployment/navbar-deployment --to-revision=
clear
history | cut -c 8-