#include <sstream>
#include <iostream>
#include <cstdlib>
#include <luxo_hardware_interface/luxo_hardware_interface.h>
#include <joint_limits_interface/joint_limits_interface.h>
#include <joint_limits_interface/joint_limits.h>
#include <joint_limits_interface/joint_limits_urdf.h>
#include <joint_limits_interface/joint_limits_rosparam.h>

#include <std_msgs/Int32.h>
#include <std_msgs/Int32MultiArray.h>

using namespace hardware_interface;
using joint_limits_interface::JointLimits;
using joint_limits_interface::SoftJointLimits;
using joint_limits_interface::PositionJointSoftLimitsHandle;
using joint_limits_interface::PositionJointSoftLimitsInterface;

namespace luxo_hardware_interface
{
    LuxoHardwareInterface::LuxoHardwareInterface(ros::NodeHandle& nh) : nh_(nh) {
        init();
        controller_manager_.reset(new controller_manager::ControllerManager(this, nh_));
        nh_.param("/luxo/hardware_interface/loop_hz", loop_hz_, 0.1);
        ros::Duration update_freq = ros::Duration(1.0/loop_hz_);
        non_realtime_loop_ = nh_.createTimer(update_freq, &LuxoHardwareInterface::update, this);

	pub_command_ = nh_.advertise<std_msgs::Int32MultiArray>("/command", 1);
    }

    LuxoHardwareInterface::~LuxoHardwareInterface() {

    }

    void LuxoHardwareInterface::init() {
        // Get joint names
        nh_.getParam("/luxo/hardware_interface/joints", joint_names_);
        num_joints_ = joint_names_.size();

        // Resize vectors
        joint_position_.resize(num_joints_);
        joint_velocity_.resize(num_joints_);
        joint_effort_.resize(num_joints_);
        joint_position_command_.resize(num_joints_);
        joint_velocity_command_.resize(num_joints_);
        joint_effort_command_.resize(num_joints_);

	int i;

	pwm_min_.resize(num_joints_);
	pwm_max_.resize(num_joints_);
	pwm_channel_.resize(num_joints_);

        // Initialize Controller 
        for (i = 0; i < num_joints_; ++i) {
	    double initial_state;
            nh_.getParam("/luxo/hardware_interface/initial_states/" + joint_names_[i], initial_state);
	    joint_position_command_[i] = initial_state;

	    int pwm_min, pwm_max, pwm_channel;
            nh_.getParam("/luxo/hardware_interface/pwm/" + joint_names_[i] + "/min", pwm_min);
	    pwm_min_[i] = pwm_min;
            nh_.getParam("/luxo/hardware_interface/pwm/" + joint_names_[i] + "/max", pwm_max);
	    pwm_max_[i] = pwm_max;
            nh_.getParam("/luxo/hardware_interface/pwm/" + joint_names_[i] + "/channel", pwm_channel);
	    pwm_channel_[i] = pwm_channel;

	}

        for (i = 0; i < num_joints_; ++i) {
            // Create joint state interface
            JointStateHandle jointStateHandle(joint_names_[i], &joint_position_[i], &joint_velocity_[i], &joint_effort_[i]);
            joint_state_interface_.registerHandle(jointStateHandle);

            // Create position joint interface
            JointHandle jointPositionHandle(jointStateHandle, &joint_position_command_[i]);
            JointLimits limits;
            getJointLimits(joint_names_[i], nh_, limits);

	    PositionJointSaturationHandle jointLimitsHandle(jointPositionHandle, limits);
	    positionJointSaturationInterface.registerHandle(jointLimitsHandle);

            position_joint_interface_.registerHandle(jointPositionHandle);

        }

        registerInterface(&joint_state_interface_);
        registerInterface(&position_joint_interface_);
        registerInterface(&positionJointSaturationInterface);
    }

    void LuxoHardwareInterface::update(const ros::TimerEvent& e) {
        elapsed_time_ = ros::Duration(e.current_real - e.last_real);
        read();
        controller_manager_->update(ros::Time::now(), elapsed_time_);
        write(elapsed_time_);
    }

    void LuxoHardwareInterface::read() {
        for (int i = 0; i < num_joints_; i++) {
	  joint_position_[i] = joint_position_command_[i];
        }
    }

    void LuxoHardwareInterface::write(ros::Duration elapsed_time) {
        positionJointSaturationInterface.enforceLimits(elapsed_time);

	std_msgs::Int32MultiArray msg_command;
	msg_command.data = std::vector<int>(16, -1);
	msg_command.layout.dim = std::vector<std_msgs::MultiArrayDimension>(1);
	msg_command.layout.dim[0].label = "data";
	msg_command.layout.dim[0].size = 16;
	msg_command.layout.dim[0].stride = 16;

	for(int i=0; i<num_joints_; i++) {
//            std::cout << "setting joint " << i << " to " << joint_position_command_[i] << "\n";
	    msg_command.data[pwm_channel_[i]] = 
                (int)((pwm_max_[i] - pwm_min_[i]) * joint_position_command_[i] + pwm_min_[i]);
	}

	pub_command_.publish(msg_command);

    }
}
