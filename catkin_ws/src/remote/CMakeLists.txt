cmake_minimum_required(VERSION 2.8.3)
project(remote)

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


execute_process(COMMAND npm install
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})


catkin_install_python(PROGRAMS
  nodes/remote_node
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY
  nodes/node_modules
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

