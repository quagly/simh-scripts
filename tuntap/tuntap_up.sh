#!/usr/bin/env bash
# create tun/tap network  
# if I am running this a lot then it should be network startup scripts
# TODO set number of Tap devices and create them all dynamically
set -euf -o pipefail

declare USER_ID
USER_ID=$(id -u)

# create bridge
sudo ip link add SimhBridge type bridge 
sudo ip addr add 192.168.223.1/24 dev SimhBridge
sudo ip link set SimhBridge up

# create first tap device
# unsure of how order of these command matter
sudo ip tuntap add SimhTap0 mode tap user "${USER_ID}" 
sudo ifconfig SimhTap0 192.168.223.2
sudo ip link set SimhTap0 up
sudo ip link set SimhTap0 master SimhBridge

# create second tap device
sudo ip tuntap add SimhTap1 mode tap user "${USER_ID}" 
sudo ifconfig SimhTap1 192.168.223.3
sudo ip link set SimhTap1 up
sudo ip link set SimhTap1 master SimhBridge



exit 0

# I don't think I need set them down first
sudo ip link set SimhTap1 down
sudo ip link set SimhTap0 down
sudo ip link set Simh down

# delete tun/tap network devices
# if I delete the switch I think it deletes the attach devices
sudo ip link delete dev SimhTap0
sudo ip link delete dev SimhTap1
sudo ip link delete dev Simh
