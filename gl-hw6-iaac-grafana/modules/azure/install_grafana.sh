#!/bin/bash

# install required packages
sudo apt-get install -y software-properties-common wget
sudo apt-get install -y apt-transport-https

# add Grafana repo
sudo wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# update
sudo apt-get update -y

# install Grafana package
sudo apt-get -y install grafana-enterprise

# reload Grafana service
sudo systemctl daemon-reload

# start Grafana service
sudo systemctl start grafana-server

# enable Grafana service to run automatically on every reboot
sudo systemctl enable grafana-agent.service

# redirect port 80 to the Grafana port
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000