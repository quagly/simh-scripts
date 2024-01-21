#!/usr/bin/env bash
# show state and setting of tuntap network environment 
set -euf -o pipefail

# show bridge and subnet 
ip address show dev SimhBridge
# show tap0
ip address show dev SimhTap0
# show tap1
ip address show dev SimhTap1
# show all tuntap devices
ip tuntap 
# single ping test 
ping -c1 192.168.223.2
