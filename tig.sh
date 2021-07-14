#!/bin/bash
# This shell script is just for reference to ensure it works outside of the cloud-init process and so it can be formatted into the cloudinit.yml
sudo apt update ; sudo apt install -y build-essential net-tools curl git software-properties-common
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.19.1-1_amd64.deb
sudo dpkg -i telegraf_1.19.1-1_amd64.deb
sudo systemctl enable --now telegraf
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.8.6_amd64.deb
sudo dpkg -i influxdb_1.8.6_amd64.deb
sudo systemctl enable --now influxdb
influx -execute 'create database telegraf'
influx -execute "create user telegraf with password 'ExAmPl3PA55W0rD'"
influx -execute 'grant all on telegraf to telegraf'
sudo apt install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_8.0.5_amd64.deb
sudo dpkg -i grafana_8.0.5_amd64.deb
sudo systemctl daemon-reload ; sudo systemctl enable --now grafana-server
sudo mv /etc/telegraf/telegraf.conf{,.old}
sudo -i 
telegraf config -input-filter cpu:mem:swap:system:processes:disk -output-filter influxdb > /etc/telegraf/telegraf.conf
sudo cat << EOF >> /etc/telegraf/telegraf.conf
# Configuration for sending metrics to InfluxDB
[[outputs.influxdb]]
urls = ["http://127.0.0.1:8086"]
database = "telegraf"
username = "telegraf"
password = "ExAmPl3PA55W0rD"
EOF
sudo systemctl restart telegraf