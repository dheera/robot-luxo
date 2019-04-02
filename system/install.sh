#!/bin/bash
sudo apt-get update
cat apt-installs.txt | xargs sudo apt-get install -y
cat pip-installs.txt | xargs sudo pip install --update
cat pip-installs.txt | xargs sudo pip3 install --update

sudo cp -rv root/* /
sudo systemctl enable autossh
sudo systemctl enable robot

if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -f id_rsa -t rsa -N ''
fi
