FROM debian:latest

WORKDIR /srv/

RUN apt update && \
 apt install -y --no-install-recommends --no-install-suggests ca-certificates qemu-utils parted debootstrap kmod git && \
 git clone https://github.com/genvm/genvm.git /opt/genvm && \
 ln -s /opt/genvm/genvm /sbin/genvm && \
 chmod 700 /opt/genvm/genvm


