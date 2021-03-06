#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd && echo x)"
dir="${dir%x}"
cd $dir

echo "Installing apt packages ..."
./install-apt.sh
echo "Installing pip packages ..."
./install-pip.sh
echo "Installing ROS ..."
./install-ros.sh
echo "Installing nodejs ..."
./install-nodejs.sh
echo "Configuring system ..."
./install-config.sh
