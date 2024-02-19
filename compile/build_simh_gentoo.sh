#!/usr/bin/env bash
#
# The nice cmake parallel compile system that simh offers fails 
# on console only linux systems that do not have X11 / SDL / MESA graphical libraries
# as some sims require them.  Perhaps there is some configuration for this.
# For now I am just compiling the couple of sims that I use single threaded.
# If this gets slow and/or annoying then look at cmake again.
set -euf -o pipefail

# gentoo dependencies
# sudo emerge --ask dev-libs/libedit
# sudo emerge --ask dev-libs/libpcre
# sudo emerge --ask dev-util/pkgconf

# gentoo networking dependencies
# sudo emerge --ask net-libs/libpcap
# sudo emerge --ask net-misc/bridge-utils
# sudo emerge --ask net-misc/netifrc

# tools
# sudo emerge --ask net-misc/telnet-bsd

# I already have vde, but simh can use pcap support
# sudo echo "net-misc/vde pcap" | sudo tee /etc/portage/package.use/vde-flags
# sudo emerge --ask net-misc/vde


declare -rx GIT_DIR="${HOME}/repos/simh/.git"
declare -r -a SIMS=(
  "pdp11"
  "microvax2"
  "vax780"
)

# update project
git fetch
if [ "$(git rev-parse HEAD)" == "$(git rev-parse @"{u}")" ]; then
  echo "project not updated, nothing to do"
  exit 0
else 
  git merge
fi

for sim in "${SIMS[@]}"
do
  echo "compiling ${sim}"
  # this needs pwd set to project.  cd?
  make clean
  make "${sim}"
  cp "./BIN/${sim}" "${HOME}/bin/"
done
