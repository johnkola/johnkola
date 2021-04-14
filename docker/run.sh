#!/bin/bash 

echo "Hello World!"

# sudo minikube stop; sudo minikube delete &&
# docker stop $(docker ps -aq) &&
# docker system prune -f --volumes &&
# sudo rm -rf ~/.kube ~/.minikube &&
# sudo rm -rf /usr/local/bin/localkube /usr/local/bin/minikube &&
# sudo systemctl stop '*kubelet*.mount' &&
# sudo systemctl stop localkube.service &&
# sudo systemctl disable localkube.service &&
# sudo rm -rf /etc/kubernetes/



#  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
#  sudo install minikube-linux-amd64 /usr/local/bin/minikube
# minikube kubectl -- get po -A


minikube delete --all

sudo apt-get update

minikube start --driver=virtualbox
minikube status

kubectl create namespace jenkins
kubectl get namespaces

kubectl create -f jenkins-volume.yaml -n jenkins
kubectl create -f jenkins-pvc.yaml -n jenkins
kubectl create -f jenkins-service.yaml -n jenkins

kubectl get all -n jenkins -o wide
read -p "Press enter to continue"

kubectl create -f jenkins-deployment.yaml -n jenkins
kubectl get deployments -n jenkins

kubectl get all -n jenkins -o wide
read -p "Press enter to continue"

minikube ip

#CRD_FILE=kubernetes-operator/master/deploy/crds/jenkins_v1alpha2_jenkins_crd.yaml
#kubectl apply -f https://raw.githubusercontent.com/jenkinsci/$CRD_FILE

#DEPLOY_FILE=kubernetes-operator/master/deploy/all-in-one-v1alpha2.yaml
#kubectl apply -f https://raw.githubusercontent.com/jenkinsci/$DEPLOY_FILE


minikube addons list

kubectl get all -n jenkins -o wide

minikube dashboard
