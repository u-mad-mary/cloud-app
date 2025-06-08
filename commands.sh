#!/bin/bash

TAG=$(git rev-parse HEAD)
COMMIT_MSG=$(git log -1 --pretty=%s)
IMAGE="umadmary/cloud-app:$TAG"

echo "Pulling $IMAGE"
docker pull $IMAGE

echo "Loading image into Minikube"
minikube image load $IMAGE

echo "Updating deployment.yaml"
sed "s|replace-me|$TAG|" deployment-template.yaml > deployment.yaml

echo "Deploying to local cluster"
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f hpa.yaml

echo "Annotating deployment with change cause"
kubectl annotate deployment cloud-app-deployment \
  kubernetes.io/change-cause="Deployed: $COMMIT_MSG" --overwrite

minikube service cloud-app-service
kubectl port-forward svc/cloud-app-service 8080:80