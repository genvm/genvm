![GenVM](http://www.genvm.eu/img/logo.png "GenVM")

GenVM Is a powerful script designed to generate minimum and complete Debian
virtual machines for KVM/QEMU (so usable in ProxMox, libvirtd, ...), VirtualBox
and VMWare.

GenVM is distributed under the GPL3.

Sources and documentation are available from GitHub (http://github.com/genvm).

# Tested distributions

GenVM was tested on Debian from Wheezy to bookworm and Ubuntu. Its work from
docker on all linux.

# Generated VM

| Distrib. | Name     | Rev    | Arch  |
| -------- |:--------:|:------:|:-----:|
| debian   | wheezy   |  7.X   | i386  |
| debian   | wheezy   |  7.X   | amd64 |
| debian   | jessie   |  8.X   | i386  |
| debian   | jessie   |  8.X   | amd64 |
| debian   | stretch  |  9.X   | i386  |
| debian   | stretch  |  9.X   | amd64 |
| debian   | buster   |  10.X  | amd64 |
| debian   | Bullseye |  11.X  | amd64 |
| debian   | Bookworm |  12.X  | amd64 |

# Installation

No special installation needed, only download the latest version of GenVM,
adjust permissions and launch it via sudo or su.

Another solution consist to use a dockerised version

## From sources

    $ git clone https://github.com/genvm/genvm.git
    Cloning into 'genvm'...
    remote: Counting objects: 125, done.
    remote: Compressing objects: 100% (45/45), done.
    remote: Total 125 (delta 39), reused 123 (delta 39), pack-reused 0
    Receiving objects: 100% (125/125), 44.15 KiB | 0 bytes/s, done.
    Resolving deltas: 100% (39/39), done.
    Checking connectivity... done.
    $ cd genvm
    $ ls
    genvm

## From archive

### Last version (dev)

    $ wget -q https://github.com/genvm/genvm/archive/master.zip
    $ unzip master.zip
    Archive:  master.zip
    1d5aa137931b15e6307a0fedb0c30f118c79a959
      creating: genvm-master/
      inflating: genvm-master/genvm      

### Stable version

You can find stable versions from GitHub on this page :
https://github.com/genvm/genvm/releases

Download the latest version and extract it.

## From docker

### Create your own image

	$ git clone https://github.com/genvm/genvm.git
	$ cd genvm
	$ docker build -t genvm --no-cache=true .

### Use official image

	$ docker pull genvm/genvm

# Examples

Note than using `-v` in examples is better to see whats happen.

## Simple Debian

    $ su -c "./genvm -l examples/bullseye/pkg.lst -t examples/bullseye simple.debian.bullseye.vmdk"
    Password:
    Set password to root > 
    Enter new UNIX password: 
    Retype new UNIX password: 
    passwd: password updated successfully
    $ ls -lh simple.debian.bullseye.vmdk
    -rw-r--r-- 1 root users 875M Jul 27 17:33 simple.debian.bullseye.vmdk

## Simple Debian with docker

If you are using your own image :

	$ docker run -it --rm --privileged --cap-add=ALL -v ./somewhere:/srv -v /dev:/dev -v/lib/modules:/lib/modules:ro genvm
    root@2e8c0ba4488f:/srv# genvm -l /opt/genvm/examples/bullseye/pkg.lst -t /opt/genvm/examples/bullseye debian.bullseye.vmdk

Retrive generated image in `./somewhere`.

If you're using official image replace `genvm` by `genvm/genvm` when you specify image name.

GenVM use nbd modules, access to loopdevices and create partitions, reload it, etc. that's why it need large privileges.

You can use genvm directly from docker invocation :

	$ docker run -h genvm --name genvm -it --rm --privileged \
		--cap-add=ALL -v ./data/:/srv/ -v/dev:/dev -v/lib/modules:/lib/modules:ro genvm/genvm \
		genvm -f qcow2 \
			-n simple \
			-l /opt/genvm/examples/bullseye/pkg.lst \
			-l /opt/genvm/examples/bookworm/pkg.lst \
			-S http://ftp.lip6.fr/pub/linux/distributions/debian \
			-p toor \
			-t /opt/genvm/examples/bullseye \
			-V bookworm \
			-v \
			-P /:4G \
			-P sw \
			-s 5G \
			-F \
			simple.bookworm.qcow2

In this example, we use the fact that bookworm install is the same as bullseye but with an additionnal package (systemd-resolved), so we use evrything from `/opt/genvm/examples/bullseye` and add list of packages from `/opt/genvm/examples/bookworm/pkg.lst`. Another way to do that can be use of `-A` option (`-A systemd-resolved`) insted of creating a file and use it by `-l /opt/genvm/examples/bookworm/pkg.lst`.

`-V bookworm` fix the version deployed.

The partition schema is modified too (image size is 5G with a swap partition).

