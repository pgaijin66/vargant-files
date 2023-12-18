#!/bin/bash

set -eux

# Backup the original sources.list file
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

# Create a new sources.list file with the specified content
sudo echo "deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse" > /etc/apt/sources.list
sudo echo "deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse" >> /etc/apt/sources.list

sudo echo "deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list

sudo echo "deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list

sudo echo "deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
sudo echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list

sudo echo "deb http://archive.canonical.com/ubuntu focal partner" >> /etc/apt/sources.list
sudo echo "deb-src http://archive.canonical.com/ubuntu focal partner" >> /etc/apt/sources.list

# Update the package list
sudo apt update
  
# Install necessary dependencies for eBPF development
sudo apt install -y bison \
                    build-essential \
                    clang \
                    llvm \
                    libelf-dev \
                    libssl-dev \
                    bpfcc-tools \
                    libbpfcc-dev \
                    linux-headers-$(uname -r)
