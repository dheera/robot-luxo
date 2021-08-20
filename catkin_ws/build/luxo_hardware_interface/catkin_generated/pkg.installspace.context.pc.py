# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "hardware_interface;controller_manager;roscpp;control_msgs;trajectory_msgs;pluginlib;transmission_interface;urdf;control_toolbox;joint_limits_interface".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lluxo_hardware_interface".split(';') if "-lluxo_hardware_interface" != "" else []
PROJECT_NAME = "luxo_hardware_interface"
PROJECT_SPACE_DIR = "/opt/ros/noetic"
PROJECT_VERSION = "0.0.1"
