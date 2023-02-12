# GL Homework k8s: Task4

## Kubernetes Helm Home Task

## Task 1
Deploy Nginx via helm with Ingress configuration

a. Set variables via value yaml

b. Use “helm upgrade --install --atomic ...” to change some parameters (Example: number of pods)

Install Helm 3 in your Workstation where Kubectl is installed and configured:
````
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
````

Validate Helm version:
![helm_version_output](https://user-images.githubusercontent.com/12089303/218286852-3f9adc6c-5830-46d8-90a2-743cd3a917b8.png)


## Task 2
Create and deploy your own chart with the Pacman ( https://hub.docker.com/r/golucky5/pacman ) game. ( https://helm.sh/docs/chart_template_guide/getting_started/ )

## Task 3 (Extra)
Deploy MERN stack (MongoDB, Express.js, React.js, Node.js) via helm
