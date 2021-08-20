#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd && echo x)"
dir="${dir%x}"
cd $dir

ISSUE=`cat /etc/issue`

if [[ $ISSUE == *"18.04"* ]]; then
	echo "Installing melodic for 18.04"

	sudo apt install -y \
		ros-melodic-ros-control \
		ros-melodic-control-toolbox \
		ros-melodic-realtime-tools \
		ros-melodic-usb-cam

	rm -rf ~/more_catkin_ws/src
	mkdir -p ~/more_catkin_ws/src
	cd ~/more_catkin_ws/src
	git clone https://github.com/dheera/rosboard
	git clone https://github.com/dheera/rosshow

	cd ..

	sudo bash -c "source /opt/ros/melodic/setup.bash && catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic -j1 -DPYTHON_EXECUTABLE=/usr/bin/python3"

elif [[ $ISSUE == *"20.04"* ]]; then
	echo "Building noetic for 20.04"

	rm -rf ~/more_catkin_ws/src
	mkdir -p ~/more_catkin_ws/src
	cd ~/more_catkin_ws/src

	git clone --branch noetic-devel https://github.com/ros-controls/ros_control
	git clone --branch melodic-devel https://github.com/ros-controls/control_toolbox
	git clone --branch noetic-devel https://github.com/ros-controls/realtime_tools
	git clone --branch noetic-devel https://github.com/ros-perception/image_common
	git clone --branch develop https://github.com/ros-drivers/usb_cam
	git clone https://github.com/dheera/rosboard
	git clone https://github.com/dheera/rosshow

	cd ..

	sudo bash -c "source /opt/ros/noetic/setup.bash && catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/noetic -j1 -DPYTHON_EXECUTABLE=/usr/bin/python3"

fi


