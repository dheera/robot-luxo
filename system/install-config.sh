#!/bin/bash
echo "Copying files ..."
sudo cp -rv root/* /

echo "Fixing file permissions ..."
sudo chown -R root /root/
sudo chown -R root /etc/sudoers.d/
sudo chown -R robot /etc/robot.launch
sudo chown -R robot /home/robot/

echo "Configuring robot service ..."
sudo systemctl daemon-reload
sudo systemctl enable robot

echo "Creating robot user ..."
# create a user "robot" with password "robot". user should change this password promptly
sudo useradd -m -p '$6$oOyJsdFz2pFfmR$/UvNGWIpzVujiIiBBA.USbojNHvK3s4XPsKFP/DMHspVB65EznpGMQ/fyTwyyga9VnBqiEibs0Z7sPIBqjJGQ1' -s /bin/bash robot

echo "Setting robot user groups ..."
sudo usermod -aG admin robot
sudo usermod -aG i2c robot
sudo usermod -aG dialout robot
sudo usermod -aG sudo robot
sudo usermod -aG tty robot
sudo usermod -aG video robot

echo "Done"
