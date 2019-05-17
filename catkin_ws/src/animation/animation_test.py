#!/usr/bin/env python3

import json
import rospy
import time
from std_msgs.msg import String

rospy.init_node("animation_test")

animation = [
        {"name": "head", "start_time": 0.0, "end_time": 3.0, "start_value": 10000, "end_value": 40000}
]

animation2 = [
        {"name": "head", "start_time": 0.0, "end_time": 3.0, "start_value": 40000, "end_value": 20000}
]

pub = rospy.Publisher("/animation", String, queue_size = 1)
m = String()
m.data = json.dumps([animation, animation2])
time.sleep(0.5)
pub.publish(m)
