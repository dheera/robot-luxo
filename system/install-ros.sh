#!/bin/bash

# ros installer because they are too lazy to create a ppa

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt install \
  ros-melodic-desktop-full \
  ros-melodic-serial \
  ros-melodic-dynamic-reconfigure \
  ros-melodic-ddynamic-reeconfigure \
  ros-melodic-joint-limits-interface \
  ros-melodic-transmission-interface \
  ros-melodic-ros-control \
  ros-melodic-joint-state-publisher \
  ros-melodic-joint-state-controller \
  ros-melodic-joint-trajectory-controller
  ros-melodic-ros-controllers \
  ros-melodic-controller-manager

sudo rosdep init
rosdep update

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

