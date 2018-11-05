# Labels: Create, Search, Delete etc

create -f helloworld-pod-with-labels.yml
kubectl create -f helloworld-pod-with-labels.yml
kubectl create -f helloworld-pod-with-labels.yml
kubectl get pods
kubectl get pods --show-labels
kubectl label po/helloworld app=helloworldapp --overwrite
kubectl get pods --show-labels
kubectl get pods --show-labels
kubectl label pod/helloworld app-
kubectl get pods --show-labels
kubectl create -f sample-infrastructure-with-labels.yml
kubectl get pods --show-labels
clear
kubectl get pods
kubectls get pods --selecter env=production
kubectl get pods --selecter env=production
kubectl get pods --selector env=production
kubectl get pods --selecter dev-lead=carisa
kubectl get pods --selector dev-lead=carisa
kubectl get pods --selector dev-lea=karthik,env=staging
kubectl get pods --selector dev-lead=karthik,env=staging
kubectl get pods --selector dev-lead!=karthik,env=staging
kubectl get pods --selector dev-lead!=karthik,env=staging --show-labels
kubectl get pods -l 'release-version in (1.0, 2.0)' --show-labels
kubectl get pods -l 'release-version notin (1.0, 2.0)' --show-labels
kubectl get pods
kubectl delete pods -l dev-lead=karthik
kubectl get pods --show-labels
history
history | cut -c 8-