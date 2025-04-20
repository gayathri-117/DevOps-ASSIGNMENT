# DevOps-ASSIGNMENT
sytemsetup.sh
-------------
It is a script to automate the setup of a DevOps-ready Ubuntu environment. It includes installation of Docker, kubectl, UFW firewall setup, and cron job automation.

STEPS
1. Updating system packages.
2. Installing prerequisites for Docker.
3. Adding Docker's official GPG key.
4. Adding Docker repository.
5. Installing Docker Engine.
6. Installing kubectl.
7. Installing htop.
8. Creating user: devops-intern.
9. Adding devops-intern to sudo group.
10. Giving passwordless sudo to devops-intern.
11. Installing UFW.
12. Resetting UFW to default settings.
13. Setting default policies: deny incoming, allow outgoing.
14. Allowing SSH , HTTP, and HTTPS.
15. Enabling UFW.
16. Adding cron job.

HOW TO RUN THE SCRIPT
---------------------
1. Clone the project using the github link.
   git clone https://github.com/gayathri-117/DevOps-ASSIGNMENT/tree/main
2. Change to directory named "DevOps-ASSIGNMENT"
   cd DevOps-ASSIGNMENT
3. Provide the execute permission
   chmod +x systemsetup.sh
4. To run the script
   ./systemsetup.sh
================================================================================================

DOCKER AND CONTAINERIZATION
---------------------------

Builds a custom Docker image using debian:bullseye-slim as the base.
Installs and runs Nginx to run index.html page.
Creating a non root user named "devops".
Change the ownership of the files.
Exposes port 80.

HOW TO RUN DOCKER IMAGE
-----------------------
1. Clone the project using the github link.
    git clone https://github.com/gayathri-117/DevOps-ASSIGNMENT/tree/main
2. Change to directory named "DevOps-ASSIGNMENT"
    cd DevOps-ASSIGNMENT
3. Build the Docker Image. Make sure you're inside the http-server directory:
    docker build -t custom-image .
5. Run the Container
    docker run -d -p 8080:80 custom-image
6. Open your browser and launch the below url
    http://<<ip address>>:8080
You should see the custom index.html content.
================================================================================================
KUBERNETES
----------
Deploy a docker image with one replica

Kubernetes:
 deployment.yaml: Deploys the web app with 1 replica.
 service.yaml: Exposes the app via NodePort.
 configmap.yaml: Injects configuration into the container. Data and Metadata.

HOW TO RUN
----------
1. Start Minikube
  minikube start
2. Build Docker Image inside Minikube
  eval $(minikube docker-env)
  docker build -t my-docker-image .
3. Apply Kubernetes
  kubectl apply -f configmap.yaml   
  kubectl apply -f deployment.yaml
  kubectl apply -f service.yaml
4. Check Pods & Services
  kubectl get pods
  kubectl get svc
5. Access in Browser by running the below command
  minikube service my-app-service
6. It will open your browser to http://<minikube-ip>:<node-port>.
