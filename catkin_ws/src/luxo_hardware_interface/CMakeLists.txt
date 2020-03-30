cmake_minimum_required(VERSION 2.8.3)
project(luxo_hardware_interface)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  hardware_interface
  controller_manager
  roscpp
  control_msgs
  trajectory_msgs
  actionlib
  pluginlib
  transmission_interface
  urdf
  control_toolbox
  joint_limits_interface
)

catkin_package(
  INCLUDE_DIRS 
    include
  CATKIN_DEPENDS 
    hardware_interface
    controller_manager
    roscpp
    control_msgs
    trajectory_msgs
    pluginlib
    transmission_interface
    urdf
    control_toolbox
    joint_limits_interface

  LIBRARIES 
    luxo_hardware_interface
)

include_directories(
  include/
  ${catkin_INCLUDE_DIRS})

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.h"
  PATTERN ".svn" EXCLUDE)

add_library(luxo_hardware_interface src/luxo_hardware_interface.cpp)
target_link_libraries(luxo_hardware_interface
	${catkin_LIBRARIES})

add_executable(luxo_hardware_interface_node src/luxo_hardware_interface_node.cpp)
add_dependencies(luxo_hardware_interface_node luxo_hardware_interface)

target_link_libraries(luxo_hardware_interface_node
	luxo_hardware_interface
	${catkin_LIBRARIES})

install(TARGETS luxo_hardware_interface_node luxo_hardware_interface
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY
  launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(DIRECTORY
  config
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
