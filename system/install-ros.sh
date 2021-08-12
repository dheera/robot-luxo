#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd && echo x)"
dir="${dir%x}"
cd $dir

# how life should be:

# sudo apt-add-repository ppa:ros/melodic
# sudo apt update && sudo apt install ros-melodic-desktop-full

# how life actually is:

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

cat apt-installs-ros.txt | xargs sudo apt-get install -y

source /opt/ros/melodic/setup.bash

sudo rosdep init
rosdep update

