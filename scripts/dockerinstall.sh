#!/bin/bash


#Add key

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#add repo

 sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#INstall

echo "[INFO] Installing Docker "

sudo apt-get update

sudo apt-get install docker-ce



#Install Docker engine

echo "[NOTICE] Installing docker-machine for swarm"

curl -L https://github.com/docker/machine/releases/download/v0.10.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&

chmod +x /tmp/docker-machine &&
  sudo cp /tmp/docker-machine /usr/local/bin/docker-machine



#Make experimental

echo " Changing /etc/docker/daemon.json configuration file"

echo '{
    "experimental": true
}'> /etc/docker/daemon.json


echo "Restarting docker"

service docker restart 

echo "Checking docker version"
docker version
