cd 08_jobs/
kubectl create -f simplejob.yaml
kubectl get deployments
kubectl delete deployment logreader logreader-dynamic secretreader
kubectl get services
minikube restart
minikube stop
kubectl create -f simplejob.yaml
minikube start
kubectl get services
kubectl get deployments
kubectl create -f simplejob.yaml
kubectl get services
kubectl get deployments
kubectl get jobs
kubectls get pods --show-all
kubectl get pods --show-all
kubectl logs finalcountdown-nk244
kubectl create -f cronjob.yaml
kubectl get cronjobs
kubectl get cronjobs
kubectl get cronjobs
kubectl get cronjobs
kubectl edit cronjobs/hellocron
kubectl edit cronjobs/hellocron
kubectl get cronjobs
clear
history | cut -c 8-