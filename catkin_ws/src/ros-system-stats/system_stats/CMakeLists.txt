cmake_minimum_required(VERSION 2.8.3)
project(system_stats)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES roboteq_transfer_command
#  CATKIN_DEPENDS roboteq_msgs roscpp rospy std_msgs
#  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS
  nodes/system_stats_node
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

