# aws-ubuntu-tig
![dev](https://github.com/phillhocking/aws-ubuntu-tig/actions/workflows/tflint-dev.yml/badge.svg?branch=dev) ![main](https://github.com/phillhocking/aws-ubuntu-tig/actions/workflows/tflint-main.yml/badge.svg)

This project instantiates the "TIG" stack - Telegraf/Influxdb/Grafana on Ubuntu 20.04 AWS EC2 Instance

If you are using this in production or intend to have this facing production infrastructure even within your own VPC let alone the public internet, please note that it is important to change the password in the `cloudinit.yml` file on line `33` and `48`.

You can find a detailed howto at: https://phillhocking.com/telegraf-influx-grafana-tig-stack-on-aws-via-terraform-on-ubuntu-20-04/

Feel free to reach out to me directly with any questions, pull requests are welcome! 