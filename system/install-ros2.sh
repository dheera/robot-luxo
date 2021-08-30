#!/bin/bash

ISSUE=`cat /etc/issue`

if [[ $ISSUE == *"20.04"* ]]; then

echo "Installing ROS2 (Foxy) ..."

sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

sudo apt install -y \
	ros-foxy-ros-base \
	ros-foxy-hardware-interface \
	ros-foxy-controller-interface \
	ros-foxy-controller-manager \
	ros-foxy-joint-state-broadcaster \
	ros-foxy-joint-state-controller \
	ros-foxy-joint-state-publisher \
	ros-foxy-joint-trajectory-controller

else

echo "Bad Linux distro. Use Ubuntu 20.04."

fi
