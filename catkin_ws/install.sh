#!/bin/bash
source /opt/ros/noetic/setup.bash

catkin_make install -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic -j1

