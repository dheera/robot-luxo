#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd && echo x)"
dir="${dir%x}"
cd $dir

cat vars/apt-installs.txt | xargs sudo apt-get install -y
