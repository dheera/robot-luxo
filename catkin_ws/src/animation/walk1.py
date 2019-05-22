#!/usr/bin/env python3

from pprint import pprint

import json
import rospy
import time
from std_msgs.msg import String

rospy.init_node("animation_test")

animation = [
#        {"name": "base", "start_time": 0.0, "end_time": 2.0, "start_value": 0.3, "end_value": 0.6, "ease": "inout_quad"},
#        {"name": "base", "start_time": 2.0, "end_time": 4.0, "start_value": 0.6, "end_value": 0.3, "ease": "inout_quad"},
        {"name": "ankle", "start_time": 0.0, "end_time": 0.5, "start_value": 0.2, "end_value": 0.2, "ease": "inout_quad"},
        {"name": "ankle", "start_time": 1.0, "end_time": 1.1, "start_value": 0.2, "end_value": 0.9, "ease": "inout_quad"},
        {"name": "ankle", "start_time": 1.3, "end_time": 1.4, "start_value": 0.9, "end_value": 0.2, "ease": "inout_quad"},
        {"name": "ass", "start_time": 0.0, "end_time": 0.5, "start_value": 0.7, "end_value": 0.7, "ease": "inout_quad"},
        {"name": "ass", "start_time": 1.0, "end_time": 1.2, "start_value": 0.7, "end_value": 0.2, "ease": "inout_quad"},
        {"name": "ass", "start_time": 1.2, "end_time": 1.3, "start_value": 0.2, "end_value": 0.7, "ease": "inout_quad"},
        {"name": "neck", "start_time": 0.0, "end_time": 0.5, "start_value": 0.2, "end_value": 0.2, "ease": "inout_quad"},
        {"name": "neck", "start_time": 1.2, "end_time": 1.3, "start_value": 0.2, "end_value": 0.1, "ease": "inout_quad"},
        {"name": "head", "start_time": 0.0, "end_time": 0.5, "start_value": 0.5, "end_value": 0.5, "ease": "inout_quad"},
        {"name": "base", "start_time": 0.0, "end_time": 0.5, "start_value": 0.5, "end_value": 0.5, "ease": "inout_quad"},
#        {"name": "neck", "start_time": 0.0, "end_time": 1.0, "start_value": 0.7, "end_value": 0.2, "ease": "inout_quad"},
]

animation2 = [
        {"name": "head", "start_time": 0.0, "end_time": 2.0, "start_value": 0.5, "end_value": 0.0, "ease": "inout_quad"},
        {"name": "head", "start_time": 2.0, "end_time": 3.0, "start_value": 0.0, "end_value": 0.5, "ease": "inout_quad"},
        {"name": "head", "start_time": 3.0, "end_time": 3.2, "start_value": 0.7, "end_value": 0.3, "ease": "inout_quad"},
        {"name": "head", "start_time": 3.2, "end_time": 3.40, "start_value": 0.3, "end_value": 0.7, "ease": "inout_quad"},
        {"name": "head", "start_time": 3.40, "end_time": 3.6, "start_value": 0.7, "end_value": 0.3, "ease": "inout_quad"},
        {"name": "head", "start_time": 3.6, "end_time": 3.8, "start_value": 0.3, "end_value": 0.7, "ease": "inout_quad"},
        {"name": "head", "start_time": 3.8, "end_time": 4.0, "start_value": 0.7, "end_value": 0.3, "ease": "inout_quad"},
        {"name": "head", "start_time": 4.0, "end_time": 4.2, "start_value": 0.3, "end_value": 0.7, "ease": "inout_quad"},
        {"name": "head", "start_time": 4.2, "end_time": 4.4, "start_value": 0.7, "end_value": 0.3, "ease": "inout_quad"},
        {"name": "head", "start_time": 4.4, "end_time": 4.6, "start_value": 0.3, "end_value": 0.7, "ease": "inout_quad"},
        {"name": "head", "start_time": 4.6, "end_time": 4.8, "start_value": 0.7, "end_value": 0.3, "ease": "inout_quad"},
        {"name": "head", "start_time": 4.8, "end_time": 5.0, "start_value": 0.3, "end_value": 0.5, "ease": "inout_quad"},
        {"name": "neck", "start_time": 2.0, "end_time": 5.0, "start_value": 0.1, "end_value": 0.9, "ease": "inout_quad"},
]

pub = rospy.Publisher("/pwm/animation", String, queue_size = 1)
m = String()
m.data = json.dumps([animation, animation, animation2]) #, animation2])
time.sleep(0.5)
pub.publish(m)
