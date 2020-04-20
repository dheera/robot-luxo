#include <luxo_hardware_interface/luxo_hardware_interface.h>
int main(int argc, char** argv)
{
    ros::init(argc, argv, "luxo_hardware_interface");
    // ros::CallbackQueue ros_queue;

    ros::NodeHandle nh;
    // nh.setCallbackQueue(&ros_queue);
    //
    ros::AsyncSpinner spinner(4);
    spinner.start();

    luxo_hardware_interface::LuxoHardwareInterface rhi(nh);

    // ros::spin();
    ros::waitForShutdown();
    // ros::MultiThreadedSpinner spinner(0);
    //spinner.spin(&ros_queue);
    return 0;
}
