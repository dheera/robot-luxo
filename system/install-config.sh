#!/bin/bash
sudo systemctl daemon-reload
sudo systemctl enable robot
sudo systemctl disable nvgetty

sudo usermod -aG i2c robot
sudo usermod -aG dialout robot
sudo usermod -aG tty robot
