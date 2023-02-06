# GL Homework k8s: Task2

## Assignment

1. Get information about your worker node and save it in some file

link to the [describe_worker_node.txt](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task2/describe_worker_node.txt)

2. Create a new namespace (all resources below will create in this namespace)

link to the [create_namespace.txt](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task2/create_namespace.txt)

3. Prepare deployment.yaml file which will create a Deployment with 3 pods of Nginx or Apache and service for access to these pods via ClusterIP and NodePort. 

link to the [deployment.yaml](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task2/deployment.yaml)

a) Show the status of deployment, pods and services. Describe all resources which you will create and logs from pods

link to the [output.txt](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task2/output.txt)

4. Prepare two job yaml files:

a) One gets content via curl from an internal port (ClusterIP)

link to the [internal-port-job.yaml](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task2/internal-port-job.yaml)

b) Second, get content via curl from an external port (NodePort)

link to the [external-port-job.yaml](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task2/external-port-job.yaml)

5. Prepare Cronjob.yaml file which will test the connection to Nginx or Apache service every 3 minutes.

link to the [Cronjob.yaml](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task2/Cronjob.yaml)

Files and output from all tasks save in GitHub repository

done! link to the [output.txt](https://github.com/serhieiev/gl-hw-k8s/blob/main/Task2/output.txt)
