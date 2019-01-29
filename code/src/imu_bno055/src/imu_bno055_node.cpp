#include <imu_bno055/BNO055Activity.hpp>

int main(int argc, char *argv[]) {
    ros::NodeHandle *nh = NULL;
    ros::NodeHandle *nh_priv = NULL;
    imu_bno055::BNO055Activity *activity = NULL;

    ros::init(argc, argv, "imu_bno055_node");

    nh = new ros::NodeHandle( );
    if(!nh) {
        ROS_FATAL("Failed to initialize NodeHandle");
        ros::shutdown( );
        return -1;
    }

    nh_priv = new ros::NodeHandle("~");
    if( !nh_priv ) {
        ROS_FATAL("Failed to initialize private NodeHandle");
        delete nh;
        ros::shutdown( );
        return -2;
    }

    activity = new imu_bno055::BNO055Activity(*nh, *nh_priv);
    if(!activity) {
        ROS_FATAL("Failed to initialize activity");
        delete nh_priv;
        delete nh;
        ros::shutdown();
        return -3;
    }

    if(!activity->start()) {
        ROS_FATAL("Failed to start activity");
        delete activity;
        delete nh_priv;
        delete nh;
        ros::shutdown();
        return -4;
    }

    ros::Rate rate(200);
    while(ros::ok()) {
        rate.sleep();
        ros::spinOnce();
        activity->spinOnce();
    }

    activity->stop();

    delete activity;
    delete nh_priv;
    delete nh;

    return 0;
}
