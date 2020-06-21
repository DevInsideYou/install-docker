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

# install docker
sudo apt install -y docker-ce

# add current user to docker
sudo usermod -aG docker ${USER}

# echo docker version
echo
sudo docker -v
echo
echo '"docker" is now on the path'

echo
echo "You were added to the 'docker' group so that you can run docker without 'sudo'. However the changes to the group are not yet applied. Run 'exec su -l $USER' without the single quotes OR logout and log back in to apply the changes to the group."
