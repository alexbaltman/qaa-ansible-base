# qaa-ansible-base
This repo is used to setup our baremetal servers and VMs in a uniform way prior to using in one of our K8 environments.

Currently it will:
Fdisk partitions # [checkbox:unchecked]
LVM for Docker # [checkbox:unchecked]
Setup Base repos # [checkbox:checked]
Install base packages # [checkbox:checked]
Add docker cleanup cron # [checkbox:checked]

### Pre-Requisites
 1. ansible version 2.x

### Usage
For servers:
```
./getinventory.sh
ansible-playbook -i qaa-ansible-inventory/inventory --limit <myserver> deploy.yaml -vv
```

For local development:
```
cd local_dev
vagrant up
```

This will run the deploy.yaml against the vm that is created using Vagrant's dynamic inventory.

### Notes
Some of the uniformity on the physical side still needs to be done, as in the fdisk partitioning, and then the logical disk constructing with lvm for docker. There are additional notes in the plays to help guide would-be future developers on the plays.
