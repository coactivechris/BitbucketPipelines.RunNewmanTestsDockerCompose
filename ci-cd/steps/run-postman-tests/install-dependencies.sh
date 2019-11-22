#!/bin/bash
while getopts ":d:" opt; do
  case $opt in
    d) debug="$OPTARG"
    ;;
  esac
done
echo "Installing Dependencies....................................................................................................................."
echo "............................................................................................................................................"

echo "Installing python3-pip......................................................................................................................"
 apt-get update
 apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y
 apt-get dist-upgrade
 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 apt-get update

 apt-get install docker-ce

 apt-get install -y python3-pip

#if [ $debug = "true" ]; then

#efi

echo "Installing docker-compose..................................................................................................................."
pip3 install docker-compose
docker-compose -v

echo "Installing newman..........................................................................................................................."
npm i -g newman
newman --version

echo "............................................................................................................................................"
echo "......................................................................................................................Dependencies installed"