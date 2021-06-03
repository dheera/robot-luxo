#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd && echo x)"
dir="${dir%x}"
cd $dir

cat vars/pip-installs.txt | xargs -n 1 --verbose sudo pip3 install --upgrade
