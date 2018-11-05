cd 02_probes/
ls
kubectl create -f helloworld-with-probes.yaml
kubectl get deployments
kubectl get pods
clear
history
clear
touch helloworld-with-bad-readiness-probe.yaml
kubectl create -f helloworld-with-bad-readiness-probe.yaml
kubectl get deployments
kubectl get pods
kubectl describe pod/helloworld-deployment-with-bad-readiness-probe-9447b7b49-98nr2
kubectl get pods
kubectl get pods --show-labels
kubectl delete pods -l release-version=2.0
kubectl get pods --show-labels
kubectl delete pods -l team=marketing
kubectl delete pods -l team=purchasing
kubectl delete pods -l team=ecommerce
kubectl get pods --show-labels
kubectl delete pods -l team=auth
kubectl get pods --show-labels
kubectl delete pods -l app=helloworld
kubectl get pods --show-labels
kubectl get pods helloworld*
ls
kubectl delete pods helloworld*
kubectl get pods helloworld*
kubectl get pods --show-labels
kubectl get pods --show-labels
kubectl create -f helloworld-with-bad-liveness-probe.yaml
kubectl get pods
kubectl get deployments
kubectl get pods
clear
history
history | cut -c 8-