#!/usr/bin/env python3

from pprint import pprint

import json
import rospy
import time
from std_msgs.msg import String

rospy.init_node("animation_test")

animation = [
#        {"name": "base", "start_time": 0.0, "end_time": 2.0, "start_value": 0.3, "end_value": 0.6, "ease": "inout_quad"},
        {"name": "base", "start_time": 0.0, "end_time": 0.5, "start_value": 0.5, "end_value": 0.5, "ease": "inout_quad"},
        {"name": "head", "start_time": 0.0, "end_time": 0.5, "start_value": 0.5, "end_value": 0.5, "ease": "inout_quad"},
        {"name": "ankle", "start_time": 0.0, "end_time": 0.5, "start_value": 0.2, "end_value": 0.2, "ease": "inout_quad"},
        {"name": "ankle", "start_time": 1.0, "end_time": 1.1, "start_value": 0.2, "end_value": 0.9, "ease": "inout_quad"},
        {"name": "ankle", "start_time": 1.3, "end_time": 1.4, "start_value": 0.9, "end_value": 0.2, "ease": "inout_quad"},
        {"name": "ass", "start_time": 0.0, "end_time": 0.5, "start_value": 0.7, "end_value": 0.7, "ease": "inout_quad"},
        {"name": "ass", "start_time": 1.0, "end_time": 1.2, "start_value": 0.7, "end_value": 0.2, "ease": "inout_quad"},
        {"name": "ass", "start_time": 1.2, "end_time": 1.4, "start_value": 0.2, "end_value": 0.7, "ease": "inout_quad"},
        {"name": "neck", "start_time": 0.0, "end_time": 0.5, "start_value": 0.2, "end_value": 0.2, "ease": "inout_quad"},
#        {"name": "neck", "start_time": 0.0, "end_time": 1.0, "start_value": 0.7, "end_value": 0.2, "ease": "inout_quad"},
#        {"name": "head", "start_time": 0.0, "end_time": 0.25, "start_value": 0.7, "end_value": 0.3, "ease": "inout_quad"},
#        {"name": "head", "start_time": 0.25, "end_time": 0.50, "start_value": 0.3, "end_value": 0.7, "ease": "inout_quad"},
#        {"name": "head", "start_time": 0.50, "end_time": 0.75, "start_value": 0.7, "end_value": 0.3, "ease": "inout_quad"},
#        {"name": "head", "start_time": 0.75, "end_time": 1.0, "start_value": 0.3, "end_value": 0.7, "ease": "inout_quad"},
#        {"name": "head", "start_time": 1.0, "end_time": 1.25, "start_value": 0.7, "end_value": 0.3, "ease": "inout_quad"},
#        {"name": "head", "start_time": 1.25, "end_time": 1.5, "start_value": 0.3, "end_value": 0.7, "ease": "inout_quad"},
]

pub = rospy.Publisher("/pwm/animation", String, queue_size = 1)
m = String()
m.data = json.dumps([animation, animation, animation]) #, animation2])
time.sleep(0.5)
pub.publish(m)
