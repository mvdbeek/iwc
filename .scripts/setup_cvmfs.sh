#!/bin/bash
set -x

cd "${BASH_SOURCE%/*}/" || exit

sudo apt install lsb-release
wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest_all.deb
sudo dpkg -i cvmfs-release-latest_all.deb
sudo apt-get update
sudo apt install cvmfs cvmfs-config
sudo cvmfs_config setup

sudo cp default.local  /etc/cvmfs/default.local
sudo cp galaxyproject.org.conf  /etc/cvmfs/domain.d/galaxyproject.org.conf
sudo cp ./*.galaxyproject.org.pub /etc/cvmfs/keys/

mkdir -p /home/runner/cvmfs/data
mkdir -p /home/runner/cvmfs/main
sudo mount -t cvmfs main.galaxyproject.org /home/runner/cvmfs/main
sudo mount -t cvmfs data.galaxyproject.org /home/runner/cvmfs/data
