#!/bin/bash

cat apt-installs.txt | xargs sudo apt-get install -y
