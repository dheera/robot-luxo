#ifndef _BNO055Activity_hpp
#define _BNO055Activity_hpp

#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/MagneticField.h>
#include <sensor_msgs/Temperature.h>
#include "serial/serial.h"

namespace imu_bno055 {

class BNO055Activity {
  public:
    BNO055Activity(ros::NodeHandle &_nh, ros::NodeHandle &_nh_priv);

    bool open();
    void close();
    bool start();
    void stop();
    bool spinOnce();

  private:
    bool isOpen() const;

    std::string frame_id;
    std::string port;
    int baud;
    int seq;

    serial::Serial ser;
    ros::NodeHandle nh;
    ros::NodeHandle nh_priv;
    ros::Publisher pub_data;
    ros::Publisher pub_raw;
    ros::Publisher pub_mag;
    ros::Publisher pub_temp;
};

}

#endif /* _BNO055Activity_hpp */

