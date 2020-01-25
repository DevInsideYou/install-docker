#!/bin/bash

# remove yourself
rm $0

sudo apt update

# install prerequisites
sudo apt install -yqqq apt-transport-https ca-certificates curl software-properties-common

# add the GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# apt-update runs automatically after add-apt-repository since Ubuntu 18

# install docker and docker-compose
sudo apt install -y docker-ce docker-compose

# add current user to docker
sudo usermod -aG docker ${USER}

# echo docker version
echo
sudo docker -v
echo
echo '"docker" is now on the path'

# apply the group modification (this has to be the last thing in the script)
echo
echo "Switching current user to yourself: ${USER} to apply the group modification (Current user: ${USER} was added to the docker group so that you can run docker without sudo). If you enter the wrong password simply run 'su -u ${USER}' without the single quotes."

su - ${USER}
