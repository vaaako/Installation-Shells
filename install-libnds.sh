#!/usr/bin/env bash

if ! [ $(id -u) = 0 ]; then
  echo "Need root privilege to install!"
  exit 1
fi


wget https://apt.devkitpro.org/install-devkitpro-pacman
chmod +x ./install-devkitpro-pacman
sudo ./install-devkitpro-pacman

sudo ln -s /proc/self/mounts /etc/mtab


sudo dkp-pacman -S nds-dev
