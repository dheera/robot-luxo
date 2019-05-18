#!/usr/bin/env python3

from pprint import pprint

import json
import rospy
import time
from std_msgs.msg import String

rospy.init_node("animation_test")

animation = [
        {"name": "base", "start_time": 0.0, "end_time": 3.0, "start_value": 0.4, "end_value": 0.6, "ease": "inout_quad"},
        {"name": "base", "start_time": 4.0, "end_time": 7.0, "start_value": 0.6, "end_value": 0.4, "ease": "inout_quad"},
        {"name": "neck", "start_time": 1.0, "end_time": 2.0, "start_value": 0.6, "end_value": 0.4, "ease": "inout_quad"},
        {"name": "neck", "start_time": 2.0, "end_time": 3.0, "start_value": 0.4, "end_value": 0.6, "ease": "inout_quad"},
        {"name": "neck", "start_time": 3.0, "end_time": 4.0, "start_value": 0.6, "end_value": 0.4, "ease": "inout_quad"},
        {"name": "neck", "start_time": 4.0, "end_time": 5.0, "start_value": 0.4, "end_value": 0.6, "ease": "inout_quad"},
        {"name": "neck", "start_time": 5.0, "end_time": 6.0, "start_value": 0.6, "end_value": 0.4, "ease": "inout_quad"},
        {"name": "neck", "start_time": 6.0, "end_time": 7.0, "start_value": 0.4, "end_value": 0.6, "ease": "inout_quad"},
]

animation2 = [
        {"name": "neck", "start_time": 0.0, "end_time": 2.0, "start_value": 0.6, "end_value": 0.4, "ease": "inout_quad"},
        {"name": "neck", "start_time": 2.0, "end_time": 4.0, "start_value": 0.4, "end_value": 0.6, "ease": "inout_quad"},
]

pub = rospy.Publisher("/pwm/animation", String, queue_size = 1)
m = String()
m.data = json.dumps([animation]) #, animation2])
time.sleep(0.5)
pub.publish(m)
