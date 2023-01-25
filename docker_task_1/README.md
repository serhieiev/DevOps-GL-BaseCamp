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
# update existing list of packages:
sudo apt update -y

# install prerequisite packages
sudo apt install -y apt-transport-https ca-certificates software-properties-common
sudo apt install -y curl git

# add the GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"


# install Docker
sudo apt -y install docker-ce
```
