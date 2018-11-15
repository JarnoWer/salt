#!/bin/bash

setxkbmap fi
sudo apt-get update
sudo apt-get -y install salt-minion
echo -e "master: 172.28.172.49\nid: vag001"|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion

