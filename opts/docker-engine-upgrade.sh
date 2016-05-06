#! /bin/bash
# credit http://askubuntu.com/questions/472412/how-do-i-upgrade-docker

echo 'Remove lxc-docker and upgrade to latest docker-engine'

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# ubuntu 14.04 trusty-tahr
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list

apt-get update

apt-get purge -y lxc-docker*

apt-get install -y docker-engine
