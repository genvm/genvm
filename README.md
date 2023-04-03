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

Soon available.

# Examples

## Simple Debian

    $ su -c "./genvm -l examples/bullseye/pkg.lst -t examples/bullseye simple.debian.bullseye.vmdk"
    Password:
    Set password to root > 
    Enter new UNIX password: 
    Retype new UNIX password: 
    passwd: password updated successfully
    $ ls -lh simple.debian.bullseye.vmdk
    -rw-r--r-- 1 root users 875M Jul 27 17:33 simple.debian.bullseye.vmdk

