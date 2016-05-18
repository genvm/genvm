Command line to generate a simple complete virtual machine Debian using "su" :

    su -c "genvm -f qcow2 -n client -l pkg.lst -p toor -t ./ -V stretch -s 15G -P simple.debian.part -v /tmp/simple.debian.qcow2"

by using "sudo":

    sudo genvm -f qcow2 -n client -l pkg.lst -p toor -t ./ -V stretch -s 15G -P simple.debian.part -v /tmp/simple.debian.qcow2

Caracteristic:
 image name: /tmp/simple.debian.qcow2
 format: qcow2 (option -f)
 OS: Debian
 Version: Stretch (option -V)
 image virtual size: 15G
 image owner: fhh.users (as define in 01.post.ChangeImageOwner)
 network config: DHCP (as define in 50.chroot.networkDhcp)
 partitions: first 5G to / in ext4, second swap 1G and third 9G to /srv in ext4 (as define in simple.debian.part)
 name of machine: client (option -n)
 additionnals packages: openssh-server, vim-tiny, locales, dbus (as define in pkg.lst file)
 root password: toor
 connection ssh to root autorized (as define in 05.chroot.sshd_configPermitRootLogin2Yes)

