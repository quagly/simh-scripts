# install netbsd 10 on vax
using the vax binary which emulates vax3900

I want to install a current system to have the os tools to help diagnose vax issues.

Following [netbsd-simh](https://github.com/kernelzeroday/netbsd-simh)
and [netbsd-vax](https://www.netbsd.org/ports/vax/emulator-howto.html)
which are almost the same instructions

ini files called directly
* manual.ini just initializes the install and you have to do the rest by hand
* auto.ini is a fully automated install
* step.ini makes the menu selections but waits for enter so you can see each step
* first-boot.ini takes a parameter of install type. `vax first-boot.ini auto`

ini files called by other ini files via `do` for items that are shared
* env-shared.ini enviornment variables that are shared by all processes
* gloabl-shared.ini devices shared by all processes
* install-shared.ini environment and devices shared by all installs


to ssh after first-boot.ini use port forwarding from localhost
user is the user the install was run as
`ssh -p 2222 ${USER}@localhost`

## TODO

* document data directory items here
* document all install types
* automate copy of install data files to boot data files
* automate install and boot together 
