#!/bin/bash
sudo cp -rv root/* /
sudo systemctl daemon-reload
sudo systemctl enable robot

sudo usermod -aG i2c robot
sudo usermod -aG dialout robot
sudo usermod -aG tty robot
