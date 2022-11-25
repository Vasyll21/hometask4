#!/bin/bash

sudo useradd -m -s /bin/bash -p $(openssl passwd -1 -salt abc 123) adminuser
sudo usermod -a -G sudo adminuser
sudo useradd -m -s /bin/bash poweruser
sudo passwd -d poweruser
echo 'poweruser All=(All:All) /usr/sbin/iptables' >> /etc/sudoers
sudo usermod -a -G adminuser poweruser
ln -s /etc/mtab /home/poweruser/link