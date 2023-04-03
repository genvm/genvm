# Generate a virtual machine
A simple debian bullseye :
```
genvm -l bullseye/pkg.lst -t bullseye simple.debian.bullseye.vmdk
```

Features :

- OS : Debian
- Version : bullseye (11.X)
- Image format : vmdk
- Image size : arround 816M
- Partitions : only one "/"
- Additionals packages : definded in "bullseye/pkg.lst" (openssh-server, systemd, dbus)
- Specification : definded in scripts in "bullseye/"

# Start the machine
```
qemu-system-x86_64 --enable-kvm -m 2G -net nic -net user,hostfwd=tcp::2222-:22 simple.debian.bullseye.vmdk
```

