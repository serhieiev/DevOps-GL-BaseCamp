# GL Homework k8s: Task3

## Task 1
- Create VM
- Configure VM
- Add your SSH public key
- Test SSH connection from local machine
- Setup k8s using kubespray

All done. link to the [output.txt](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task3/output.txt)

## Task 2
- Install Ingress-controller

`helm` has been used to install an NGINX Ingress controller
```
helm install quickstart ingress-nginx/ingress-nginx
```

All done. link to the [output.txt](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task3/output.txt)

## Task 3
- Already owned `serhieiev.site` so just configured DNS properly by adding `External IP` of my GCP VM instance
- Configured cert-manager with Letsencrypt

All done. link to the [output.txt](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task3/output.txt)

## Task 4
Prepare Nginx deployment:
- Deployment
- Service
- Ingress (which will be connected to ClusterIssuer and use the letsencrypt
certificate)

The example service uses [kuard](https://github.com/kubernetes-up-and-running/kuard), a demo application.

`kubectl create --edit -f https://raw.githubusercontent.com/...` has been used to download the examples from GitHub , edit it, and submit the manifest to Kubernetes

## Demo
![serhieiev site-https](https://user-images.githubusercontent.com/12089303/217675067-f2cbfcc7-3ba5-41f2-924b-9999fa3d2ec2.png)
