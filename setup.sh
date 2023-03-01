#!/usr/bin/env bash

curl  https://download.virtualbox.org/virtualbox/7.0.6/VirtualBox-7.0.6_BETA4-155176-macOSArm64.dmg -o vb_macos.dmg
hdiutil mount vb_macos.dmg
sudo installer -package "/Volumes/VirtualBox/VirtualBox.pkg" -target "/Volumes/Macintosh HD"
hdiutil unmount "/Volumes/VirtualBox/"
brew install vagrant vagrant-manager
vagrant init hashicorp/precise64
vagrant up
vagrant ssh
vagrant destroy
