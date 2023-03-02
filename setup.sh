#!/usr/bin/env bash

set -e

/usr/sbin/softwareupdate --install-rosetta --agree

if [ ! "$(command -v vmrun)" ]; then
  brew install vmware-fusion
fi

open /Applications/VMware\ Fusion.app
read -p "Press Enter to continue after you've configured VMware Fusion."

brew install vagrant vagrant-manager vagrant-vmware-utility
vagrant plugin install vagrant-vmware-desktop

vagrant up
vagrant ssh-config > vagrant-ssh
ssh -F vagrant-ssh default
vagrant destroy
