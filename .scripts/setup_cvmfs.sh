#!/bin/bash
set -x

apt install lsb-release
wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest_all.deb
dpkg -i cvmfs-release-latest_all.deb
apt-get update
apt install cvmfs cvmfs-config
cvmfs_config setup

cp default.local  /etc/cvmfs/default.local
cp galaxyproject.org.conf  /etc/cvmfs/domain.d/galaxyproject.org.conf
cp ./*.galaxyproject.org.pub /etc/cvmfs/keys/
mkdir /cvmfs
mount -t cvmfs main.galaxyproject.org /cvmfs/main.galaxyproject.org
