#!/bin/bash

cat pip-installs.txt | xargs -n 1 --verbose sudo pip3 install --upgrade
