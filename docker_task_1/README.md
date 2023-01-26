## Task 1

1. Install docker
2. Prepare a dockerfile based on Apache or Nginx image
3. Added your own index.html page with your name and surname to the docker image
4. Run the docker container at port 8080
5. Open page in Web Browser
6. Report save in GitHub repository

## Solution

### Install docker
The following sequence of commands can be used to install Docker CE on Ubuntu 20.04:

```
# update existing list of packages
sudo apt update -y

# install prerequisite packages
sudo apt install -y apt-transport-https ca-certificates software-properties-common
sudo apt install -y curl git

# add the GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"


# install Docker CE
sudo apt -y install docker-ce

# download Dockerfile
sudo curl -LJO https://raw.githubusercontent.com/serhieiev/gl-hw10/main/docker_task_1/Dockerfile
```

### Prepare a dockerfile based on Apache or Nginx image
Done! Please have a look on the attached Dockerfile with corresponding comments:

### Added your own index.html page with your name and surname to the docker image
Done!

### Run the docker container at port 8080
Build the Dockerfile using the `docker build` command and give it a customized name:

`sudo docker build -t apache_image:1.0 .`

Run the Docker image as a container in detached mode so that it runs continuously in the background, map the port 8080 on the host to port 80 inside the container:

`sudo docker run --name apache_server -d -p 8080:80 apache_image:1.0`

### Open page in Web Browser

<img width="279" alt="docker_task_1_results" src="https://user-images.githubusercontent.com/12089303/214614686-d7a064dd-fbe1-433a-840c-3ac17360b0e4.png">

