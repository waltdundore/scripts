#!/bin/bash

sudo dnf -y install vagrant-libvirt libvirt-client && sudo dnf -y install @vagrant
sudo systemctl enable libvirtd
lsmod | grep kvm
export CONFIGURE_ARGS="with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib64" 
vagrant plugin install vagrant-libvirt
vagrant plugin install vagrant-reload
vagrant plugin install vagrant-vbguest
sudo systemctl restart firewalld
sudo systemctl restart libvirtd
sudo virsh net-start default

