#!/bin/bash

sudo useradd -m -p $(openssl passwd -1 -salt abc 123) adminuser
sudo usermod -a -G sudo adminuser
sudo useradd -m poweruser
sudo passwd -d poweruser
echo 'poweruser All=(All:All) /usr/sbin/iptables' >> /etc/sudoers
sudo usermod -a -G adminuser poweruser
ln -s /home/poweruser/etc/mtab link