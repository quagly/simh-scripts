#!/usr/bin/env bash
# delete tun/tap network  
set -euf -o pipefail

# delete tun/tap network devices
# if I delete the switch I think it deletes the attach devices
sudo ip link delete dev SimhTap0
sudo ip link delete dev SimhTap1
sudo ip link delete dev SimhBridge
