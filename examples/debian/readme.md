Command line to generate a simple complete virtual machine Debian, using <code>su(1)</code>:

    su -c "genvm -f qcow2 -n client -l pkg.lst -p toor -t ./ -V stretch -s 15G -P simple.debian.part -v /tmp/simple.debian.qcow2"

using <code>sudo(8)</code>:

    sudo genvm -f qcow2 -n client -l pkg.lst -p toor -t ./ -V stretch -s 15G -P simple.debian.part -v /tmp/simple.debian.qcow2

Options:

 * Image name: /tmp/simple.debian.qcow2
 * Format: qcow2 (option -f)
 * OS: Debian
 * Version: Stretch (option -V)
 * Image virtual size: 15G
 * Image owner: fhh.users (as defined in 01.post.ChangeImageOwner)
 * Network config: DHCP (as defined in 50.chroot.networkDhcp)
 * Partitions: first 5G to / in ext4, second swap 1G and third 9G to /srv in ext4 (as defined in simple.debian.part)
 * Machine name: client (option -n)
 * Additional packages: openssh-server, vim-tiny, locales, dbus (as defined in pkg.lst file)
 * Root password: toor
 * Authorize ssh connection for root user (as defined in 05.chroot.sshd_configPermitRootLogin2Yes)

