# install netbsd 10 on vax
using the vax binary which emulates vax3900

I want to install a current system to have the os tools to help diagnose vax issues.

Following [netbsd-simh](https://github.com/kernelzeroday/netbsd-simh)
and [netbsd-vax](https://www.netbsd.org/ports/vax/emulator-howto.html)
which are almost the same instructions

* manual.ini just initializes the install and you have to do the rest by hand
* install.ini is a fully automated install
* step.ini makes the menu selections but waits for enter so you can see each step
* boot.ini takes a parameter of install type.  

to ssh after boot.ini use port forwarding from localhost
`ssh -p 2222 test@localhost`

## TODO

* document data directory items here
* document all install types
* automate copy of install data files to boot data files
* solve for simh exit at sim> prompt on install
* automate install and boot together 
