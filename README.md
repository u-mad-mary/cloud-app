# Getting Started

### Running the Application

```
./gradlew bootRun
```

Open [http://localhost:8080](http://localhost:8080) in your browser.

### Building the Application

```
./gradlew bootJar
```

### Running the Application as a Docker Container

```
...
java -jar ./build/libs/tech-challenge-0.0.1-SNAPSHOT.jar
```

#### Running the Application as a Docker Container
1. Start minikube
```
minikube start --driver=docker
```

2. Enable addon for monitoring
```
minikube addons enable metrics-server
```

3. Enable access to the dashboard
```
minikube dashboard
```

4. Execute commands.sh
```
./commands.sh
```

5. Get services & port forwarding
```
kubectl get svc
kubectl port-forward svc/cloud-app-service 8080:80
```

6. Get deployments & rollout history
```
kubectl get deployments
kubectl rollout history deployment cloud-app-deployment
```

7. Get pods
```
kubectl top pods
kubectl get pods -o wide
```

8. Access a pod and ping localhost
```
kubectl exec -it <pod-name> -- sh
wget -qO- http://localhost:8080
```

9. Manual scalling
```
kubectl scale deployments/cloud-app-deployment --replicas=2
```

10. Autoscale
```
kubectl run cpu-loader --image=busybox --restart=Never -it -- /bin/sh
while true; do wget -q -O- http://cloud-app-service; done
watch kubectl get hpa
```

11. Version Control
```
kubectl rollout history deployment cloud-app-deployment
kubectl rollout undo deployment cloud-app-deployment --to-revision=1
```

### Requirements

1. This project should be made to run as a Docker image.
2. Docker image should be published to a Docker registry.
3. Docker image should be deployed to a Kubernetes cluster.
4. Kubernetes cluster should be accessible from the internet.
5. Kubernetes cluster should be able to scale the application.
6. Kubernetes cluster should be able to update the application without downtime.
7. Kubernetes cluster should be able to rollback the application to a previous version.
8. Kubernetes cluster should be able to autoscale the application based on the load.
