#!/bin/bash

echo "generating ssh key ..."
ssh-keygen -t rsa

echo "installing apt packages ..."
sudo apt-get -f install
sudo apt-get update
cat apt-installs.txt | xargs -n 1 sudo apt-get install -y

echo "install pip packages (python2) ..."
cat pip-install.txt | xargs -n 1 sudo pip install

echo "install pip packages (python3) ..."
cat pip-install.txt | xargs -n 1 sudo pip3 install

echo "installing root files ..."
sudo cp -rv root/* /

sudo systemctl enable robot
sudo systemctl enable autossh
