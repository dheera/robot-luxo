#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd && echo x)"
dir="${dir%x}"
cd $dir

ISSUE=`cat /etc/issue`

if [[ $ISSUE == *"18.04"* ]]; then
	echo "Installing melodic for 18.04"

	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

	sudo apt update

	sudo apt install -y ros-melodic-desktop

	source /opt/ros/melodic/setup.bash

	sudo rosdep init
	rosdep update

elif [[ $ISSUE == *"20.04"* ]]; then
	echo "Building noetic for 20.04"

	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu buster main" > /etc/apt/sources.list.d/ros-noetic.list'
	sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
	sudo apt update

	# sudo apt install ros-noetic-desktop # doesn't work damnit

	sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake

	sudo rosdep init
	rosdep update

	mkdir ~/ros_catkin_ws
	cd ~/ros_catkin_ws

	rosinstall_generator desktop --rosdistro noetic --deps --wet-only --tar > noetic-desktop-wet.rosinstall

	wstool init src noetic-desktop-wet.rosinstall

	rosdep install -y --from-paths src --ignore-src --rosdistro noetic -r --os=debian:buster

	sudo src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic -j1 -DPYTHON_EXECUTABLE=/usr/bin/python3
fi


