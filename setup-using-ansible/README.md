# Automatic setup using Ansible <!-- omit in toc -->

# TOC <!-- omit in toc -->

- [1. Introduction](#1-introduction)
- [2. Testing on a VM](#2-testing-on-a-vm)
  - [Installing Ansible and setting up the Python environment](#installing-ansible-and-setting-up-the-python-environment)
- [3. Setting up on a baremetal machine](#3-setting-up-on-a-baremetal-machine)
- [Appendix](#appendix)
  - [Set up the environment from scratch](#set-up-the-environment-from-scratch)

# 1. Introduction

This folder contains scripts and instructions on how to automate the setup using Ansible. 

This folder also contains a [Vagrantfile](Vagrantfile) so that you can test the setup script in a VM before you do a full setup on a physical baremetal machine. 

# 2. Testing on a VM

Please install Virtual-box and Vagrant as described in the [readme file](../README.md) on the top level of this repo. 

## Installing Ansible and setting up the Python environment

There are two methods to do this, you can use the 



# 3. Setting up on a baremetal machine

# Appendix

## Set up the environment from scratch

```bash
# navigate into this folder. Eg: cd setup-using-ansible/

poetry init
poetry add ansible
poetry add -D pre-commit
```