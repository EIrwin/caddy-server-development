#! /bin/bash
# Provisioning script for Docker Compose
# Maintainer Eric Irwin <eric.irwin1124@gmail.com>

sudo -i
curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /vagrant
docker-compose up -d