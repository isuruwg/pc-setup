# TOC <!-- omit in toc -->

- [1. Introduction](#1-introduction)
  - [1.1. Quick and easy setup without following this full guide](#11-quick-and-easy-setup-without-following-this-full-guide)
  - [1.2. Submodules and notes for cloning this repo](#12-submodules-and-notes-for-cloning-this-repo)
    - [1.2.1. Updating submodules to latest](#121-updating-submodules-to-latest)
    - [1.2.2. Adding new submodules](#122-adding-new-submodules)
- [2. Install/configure the essentials](#2-installconfigure-the-essentials)
  - [2.1. Enable firewall](#21-enable-firewall)
  - [2.2. Git](#22-git)
  - [2.3. Meld](#23-meld)
  - [2.4. VSCode](#24-vscode)
    - [2.4.1. My preferred settings](#241-my-preferred-settings)
    - [2.4.2. VSCode plugins](#242-vscode-plugins)
  - [2.5. Sensors](#25-sensors)
  - [2.6. Python](#26-python)
    - [2.6.1. Install pyenv](#261-install-pyenv)
    - [2.6.2. Install Poetry](#262-install-poetry)
  - [2.7. Install Ansible](#27-install-ansible)
  - [2.8. Setup pre-commit for git [optional]](#28-setup-pre-commit-for-git-optional)
  - [2.9. xautolock](#29-xautolock)
  - [2.10. Aptitude](#210-aptitude)
  - [2.11. tmux](#211-tmux)
    - [2.11.1. Setup tmux](#2111-setup-tmux)
- [3. Install i3](#3-install-i3)
  - [3.1. Setting up networking](#31-setting-up-networking)
  - [3.2. Install nicer fonts](#32-install-nicer-fonts)
  - [3.3. Rofi](#33-rofi)
  - [3.4. Audio control](#34-audio-control)
  - [3.5. Screen resolution and display control](#35-screen-resolution-and-display-control)
    - [3.5.1. xrandr](#351-xrandr)
    - [3.5.2. arandr (Optional)](#352-arandr-optional)
  - [3.6. Status bar replacement](#36-status-bar-replacement)
  - [3.7. Get programs to start automatically](#37-get-programs-to-start-automatically)
    - [3.7.1. Dropbox](#371-dropbox)
  - [3.8. Copy modified i3 config file to ~/.config/i3/](#38-copy-modified-i3-config-file-to-configi3)
- [4. Install other everyday programs](#4-install-other-everyday-programs)
  - [4.1. Fail2ban (Needed only if you have enabled connections through your firewall)](#41-fail2ban-needed-only-if-you-have-enabled-connections-through-your-firewall)
  - [4.2. VLC](#42-vlc)
  - [4.3. gnucash](#43-gnucash)
  - [4.4. Install chromium](#44-install-chromium)
  - [4.5. 7-zip](#45-7-zip)
  - [4.6. Set-up VirtualBox](#46-set-up-virtualbox)
  - [4.7. Set-up Kubernetes](#47-set-up-kubernetes)
    - [4.7.1. Method1: Using KIND](#471-method1-using-kind)
    - [4.7.2. Method 2: Using Vagrant and Ansible](#472-method-2-using-vagrant-and-ansible)
      - [4.7.2.1. Install Vagrant](#4721-install-vagrant)
      - [4.7.2.2. Install Ansible](#4722-install-ansible)
      - [4.7.2.3. Up and running (and troubleshooting :sweat_smile: ) with Vagrant and Ansible](#4723-up-and-running-and-troubleshooting-sweat_smile--with-vagrant-and-ansible)
- [5. Troubleshooting](#5-troubleshooting)
  - [5.1. SD card mounts as read only on Ubuntu](#51-sd-card-mounts-as-read-only-on-ubuntu)

# 1. Introduction

This repo contains notes for myself for setting up my computers.

## 1.1. Quick and easy setup without following this full guide

This repo contains a shell script to set everything up easily without having to follow this full readme. Use `bash quick-setup.sh` to do a quick and easy setup. **THIS SETUP SCRIPT IS STILL UNDER CONSTRUCTION**

However, it's recommended to go through the full readme. Especially if you want to have the latest scripts (eg: i3blocks-contrib)


## 1.2. Submodules and notes for cloning this repo

This repo contains some submodules. Hence there are multiple ways to clone this repo depending on what you want. ([More info about submodules can be found here](https://git-scm.com/book/en/v2/Git-Tools-Submodules))

1. Just regular clone: `git clone git@github.com:isuruwg/pc-setup.git` 
   1. With this method, you get the directories that contain submodules, but none of the files within them yet.
   2. Run `git submodule init` to initialize your local configuration file and `git submodule update` to fetch all the data from that project and check out the appropriate commit listed in the subproject. (or `git submodule update --init --recursive`)
2. Automatically initialize and update each submodule in the repository, including nested submodules if any of the submodules in the repository have submodules themselves. `git clone --recurse-submodules git@github.com:isuruwg/pc-setup.git`

The configuration here also assumes that you have cloned this repo to your home directory:

```bash
cd ~
git clone --recurse-submodules git@github.com:isuruwg/pc-setup.git
```

### 1.2.1. Updating submodules to latest

By default, the above commands only get the submodule versions that were used in the last commit of this repo.
You can check what's changed in the submodule in the remote by doing `git fetch` followed by a `git merge` to merge the upstream branch to update the local files (from within the submodule folder).

You can manually check what's changed by doing `git fetch` followed by `git difftool origin`.

If you just want to get updates from the submodules, overwrite what's in local to use the latest version, you can do `git submodule update --remote`

If you get an error saying `HEAD` is detached in submodule, please do `git checkout master` (The main branch of both i3blocks and i3blocks-contrib is called `master`) in the submodule folder.

### 1.2.2. Adding new submodules

You can add new submodules to this repo by doing: 

```bash
git submodule add https://github.com/link/to/submodule
```

# 2. Install/configure the essentials

## 2.1. Enable firewall 

Install [ufw](https://help.ubuntu.com/community/UFW) if it's not already installed by doing `sudo apt install ufw`. This usually comes pre-installed with Ubuntu distributions. Then enable ufw as follows:

```bash
sudo ufw enable
```

Other useful commands:
```bash
# Check status:
sudo ufw status verbose

# Enable ssh access (Only if needed)
sudo ufw allow ssh

# Limit login attempts on ssh ports to 6 times per 30 seconds
sudo ufw limit ssh/tcp
```

If you did enable any connections into your pc, please also consider installing fail2ban. See [section on fail2ban](#41-fail2ban-needed-only-if-you-have-enabled-connections-through-your-firewall) for more info.


## 2.2. Git

```bash
sudo apt install git
```

## 2.3. Meld

```bash
sudo apt install meld
```

## 2.4. VSCode

[REF](https://code.visualstudio.com/docs/setup/linux)

```bash
sudo snap install --classic code
```

### 2.4.1. My preferred settings

Color theme: Monokai

Editor Font size: 16

### 2.4.2. VSCode plugins

1. [Markdown emoji](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-emoji)
2. [Markdown all in one](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

## 2.5. Sensors

```bash
sudo apt install lm-sensors 
sudo sensors-detect
# Selected yes to everything
watch -d sensors
# or just do, "sensors" to view temperature once. 
```

## 2.6. Python

### 2.6.1. Install pyenv

[Pyenv](https://github.com/pyenv/pyenv) helps keep multiple Python version in your machine.

Pyenv has been added to this repo as a submodule.

Follow the instructions [here](https://github.com/pyenv/pyenv/wiki#suggested-build-environment) to install the prerequisites.

And then do the [basic github checkout method using the submodule here to install pyenv](https://github.com/pyenv/pyenv#basic-github-checkout). Following are the steps I followed:

```bash
cd ~/pc-setup/pyenv/

# OPTIONAL: Fetch the latest version from remote
git fetch
git difftool origin
# Or do "git merge" (or just git pull) to get all the updates automatically.

src/configure && make -C src # Optional

# the sed invocation inserts the lines at the start of the file
# after any initial comment lines
sed -Ei -e '/^([^#]|$)/ {a \
export PYENV_ROOT="$HOME/pc-setup/pyenv"
a \
export PATH="$PYENV_ROOT/bin:$PATH"
a \
' -e ':a' -e '$!{n;ba};}' ~/.profile
echo 'eval "$(pyenv init --path)"' >>~/.profile

echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

(You might need to log out and log back in after)

Do the following after installation to set up a python environment

```bash
# List all available Python versions
pyenv install --list
pyenv install <version>
# For example;
pyenv install 3.10.1 

# set up global python
pyenv global 3.10.1

# set local python version:
# Navigate to a project folder and do 
pyenv local 3.10.1
```

### 2.6.2. Install Poetry

[[REF](https://github.com/python-poetry/poetry#installation)]

```bash
curl -sSL https://install.python-poetry.org | python3 -

# Add $HOME/.local/bin to PATH using ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# Open a new terminal and check if Poetry is installed properly
poetry --version
```

If you would like to uninstall poetry, you can do so anytime by doing: `curl -sSL https://install.python-poetry.org | python3 - --uninstall`

## 2.7. Install Ansible

Ref: [Ansible doc](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pip)

Ansible can be installed easily with pip. Let's first create a virtual environment: 
(Please note that the following instructions assume that you have `pyenv` installed in your system. If you don't have `pyenv` installed, please adjust the commnands below as necessary)

```bash
cd setup-using-ansible
poetry install
```

## 2.8. Setup pre-commit for git [optional]


```bash
cd setup-using-ansible
poetry install --no-root
pre-commit install
```

## 2.9. xautolock

xautolock is required for automatically locking the screen with i3. If you are not using i3, this is not needed

```bash
sudo apt install xautolock
```

## 2.10. Aptitude

Aptitude is not required to be install as Ubuntu already comes with apt and apt-get. However, if you are using i3blocks with a checkupdates script as mentioned in the next section, please install aptitude by doing;

```bash
sudo apt install aptitude
```

## 2.11. tmux

```bash
sudo apt install tmux
```

### 2.11.1. Setup tmux

```bash
# create ~/.tmux.conf
vi ~/.tmux.conf
```

Add the following to the `tmux.conf` file: 

```conf
# To enable mouse scroll in tmux pane
set -g mouse on

# Improve colors
set -g default-terminal 'screen-256color'

# Set scrollback buffer to 10000
set -g history-limit 10000

# Customize the status line
set -g status-fg  green
set -g status-bg  black

# Change the default prefix from C-b to C-z
# set -g prefix C-z
# unbind C-b
```



# 3. Install i3

- Follow the instructions from [here](https://i3wm.org/docs/repositories.html)

    ```bash
    /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2021.02.02_all.deb keyring.deb SHA256:cccfb1dd7d6b1b6a137bb96ea5b5eef18a0a4a6df1d6c0c37832025d2edaa710
    sudo dpkg -i ./keyring.deb

    # at this point do sudo -i:
    sudo -i
    echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list

    # exit superuser mode
    exit
    sudo apt update
    sudo apt install i3
    ```

- Check i3 version by `i3 --version`
- Upon login you will be asked to select config file location, select the default one.
- Next you will be asked to select the MOD key. I chose the ALT key for this. Throughout this guide the mod key will be referred to as `$mod`

## 3.1. Setting up networking

[Reference](https://faq.i3wm.org/question/2/how-can-i-use-networkmanager-with-i3.1.html)

~~Add exec `--no-startup-id nm-applet` to `~/.config/i3/config` file to start the tray icon for networking.  [NOTE: I have tested this only on the i3blocks status bar. This might not work properly with i3-bar]~~ New versions of i3 comes with this line already in config file

## 3.2. Install nicer fonts

- Make folder: `mkdir ~/.fonts`
- Install font-awesome [[REF](https://youtu.be/8-S0cWnLBKg?t=1616)]
  - Download and extract the latest web release .zip from [here](https://github.com/FortAwesome/Font-Awesome/releases)

    ```bash
    cd Downloads/fontawesome-free-5.15.3-web
    cd webfonts
    mv *.ttf ~/.fonts/
    ```
  - The individual files moved above are the following:          
    ```bash
    mv Downloads/fontawesome-free-5.13.0-web/webfonts/fa-solid-900.ttf .fonts/
    mv Downloads/fontawesome-free-5.13.0-web/webfonts/fa-brands-400.ttf .fonts/
    mv Downloads/fontawesome-free-5.13.0-web/webfonts/fa-regular-400.ttf .fonts/
    ```
  - You can use the [fontawesome cheatsheet](https://fontawesome.com/v5/cheatsheet) to copy icons that you want to use in config files.

- Install Yosemite San Fransisco Font [[REF](https://youtu.be/ARKIwOlazKI?t=156)]
  - Download [YosemiteSanFranciscoFont](https://github.com/supermarin/YosemiteSanFranciscoFont) (Download the zip files from the [manual install section](https://github.com/supermarin/YosemiteSanFranciscoFont#manual-install).) 
  - Unzip and move the `.ttf` files to `~/.fonts/` folder by: `mv *.ttf ~/.fonts/`
  - Change the font line in i3 config to: `font pango:System San Francisco Display Thin 16`

## 3.3. Rofi

I did `sudo apt install rofi`. TODO: Try out installation from release.

Next add the following to `~/.config/i3/config` 

```
bindsym $mod+d exec --no-startup-id rofi -combi-modi 'window#drun#run' -show combi -modi combi -font "System San Francisco Display 14"
```

(Make sure you comment out the other commands that get triggered with $mod+d)

## 3.4. Audio control

```bash
sudo apt install pavucontrol
```

## 3.5. Screen resolution and display control

### 3.5.1. xrandr

Run `xrandr` on a terminal to see the active display configuration.

Following are some scripts I use for configuration:

1. Two screens on my desk:  
    `xrandr --output HDMI-0 --mode 1920x1080 --right-of DP-0 --output DP-0 --mode 2560x1440 --output DP-3 --off`

2. Two screens on desk (144Hz for 24 inch monitor)  
    `xrandr --output HDMI-0 --mode 1920x1080 --right-of DP-0 --rate 144.00 --output DP-0 --mode 2560x1440 --output DP-3 --off`

3. TV only  
    `xrandr --output DP-3 --mode 3840x2160 --right-of DP-0 --scale 0.5x0.5 --output HDMI-0 --off --output DP-0 --off`

4. Smaller laptop: Laptop screen only

    `xrandr --output eDP --mode 1920x1080 --right-of HDMI-A-0 --output HDMI-A-0 --off`

5. Smaller laptop: Laptop screen + hdmi (big screen)

    `xrandr --output eDP --mode 1920x1080 --right-of HDMI-A-0 --output HDMI-A-0 --mode 2560x1440`

I've added these scripts to the [i3/my-i3blocks/shutdown_menu](i3/my-i3blocks/shutdown_menu) file as options for quickly switching between them.

### 3.5.2. arandr (Optional)

Install arandr (if you need a gui to control screens) by doing `sudo apt install arandr`

## 3.6. Status bar replacement

There are many options for replacing the status bar. In this section we'll explore replacing the status bar with [i3blocks](https://github.com/vivien/i3blocks). More details about replacing the i3bar and i3status can be found [here](https://wiki.archlinux.org/title/i3#i3status)

Please follow the steps in [i3blocks-setup.md](i3blocks-setup.md) to install and set up i3blocks


## 3.7. Get programs to start automatically

### 3.7.1. Dropbox

Add the following to your `~/.config/i3/`

```bash
# Get Dropbox to start
exec --no-startup-id dropbox start
```

## 3.8. Copy modified i3 config file to ~/.config/i3/

Check the differences between your default config file and the config file available in your new i3 installation

```bash
meld ~/.config/i3/config i3/config
```

Copy the config file:

```bash
cp i3/config ~/.config/i3/
```

# 4. Install other everyday programs

## 4.1. Fail2ban (Needed only if you have enabled connections through your firewall)

[fail2ban](https://www.fail2ban.org/wiki/index.php/Main_Page) ([GitHub](https://github.com/fail2ban/fail2ban)) scans log files and bans IPs that show malicious signs. 

**Please note that you do not need to install this if you didn't enable any ssh or other types of connections to your pc through your firewall. [see ufw section above](#21-enable-firewall)**. 

```bash
sudo apt install fail2ban
# Create a new local config file by copying the jail.conf
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local
```

Add the following at the end of the `/etc/fail2ban/jail.local` file: ( You may already have a [sshd] section, if so, update that section)

```bash
[ssh]
enabled  = true
port     = ssh
filter   = sshd
logpath  = /var/log/auth.log
maxretry = 6
```
Other useful fail2ban commands

- If you get banned you can unban by: `sudo fail2ban-client set sshd unbanip IP_ADDRESS` 
- Check sshd status: `sudo fail2ban-client status sshd`
- Check auth log: `cat /var/log/auth.log`
- View all banned IPs: `sudo zgrep 'Ban' /var/log/fail2ban.log*` [[source](https://serverfault.com/questions/841183/how-to-show-all-banned-ip-with-fail2ban)] ( or `sudo zgrep 'NOTICE' /var/log/fail2ban.log*` to view all `NOTICE` level messages.

[OPTIONAL] : You can also make fail2ban and ufw work together better by following [this](https://askubuntu.com/questions/54771/potential-ufw-and-fail2ban-conflicts)

## 4.2. VLC

[REF](https://www.videolan.org/vlc/download-ubuntu.html)

```bash
sudo snap install vlc
```

## 4.3. gnucash

```
sudo apt install gnucash
```

## 4.4. Install chromium

```bash
sudo snap install chromium
```

## 4.5. 7-zip

```bash
sudo apt install p7zip-full
```

## 4.6. Set-up VirtualBox

Reference: [official virtualbox documentation](https://www.virtualbox.org/wiki/Linux_Downloads)

This is required for setting up Kubernetes using Vagrant and Ansible as described in the section below.  

Add the source for deb package: The official guide tells to add this to `/etc/apt/sources.list`. But I added it to a separate file insied `etc/apt/sources.list.d/`

```bash
# The official guide tells to add the following with <mydist> replaced with distribution name to /etc/apt/sources.list
# deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian <mydist> contrib

# instead of the above I did the following: 

sudo -i 
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) contrib" >> /etc/apt/sources.list.d/virtualbox.list

# Add the Oracle public key for apt
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# Install virtualbox
sudo apt install virtualbox-6.1
```

## 4.7. Set-up Kubernetes

There are multiple ways to set-up K8S; 

### 4.7.1. Method1: Using KIND

Please refer to the notes [in this GitHub repo](https://github.com/isuruwg/ml-k8s-tutorial#21-installing-for-local-development)

### 4.7.2. Method 2: Using Vagrant and Ansible

Reference : [Install K8S with Vagrant and Ansible](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/)

#### 4.7.2.1. Install Vagrant

Ref: [vagrantup](https://www.vagrantup.com/downloads)

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install vagrant
```

Try a simple vagrant image:

```bash
vagrant init hashicorp/bionic64
vagrant up
vagrant ssh # ssh into the new machine

#inside the vm: 
logout # to log out from the vm

# After logging out from the vm, in the host machine: 
vagrant destroy
```

#### 4.7.2.2. Install Ansible

Please refer to the [section on installing the essentials](#2-installconfigure-the-essentials) above to install Ansible if you haven't already done so.

```bash
mkdir K8S
cd K8S

pyenv local 3.10.1

#create and activate virtual environment
python -m venv venv
. ./venv/bin/activate

# install Ansible
pip install ansible

# Create and save requirements.txt file
pip freeze > requirements.txt
```

#### 4.7.2.3. Up and running (and troubleshooting :sweat_smile: ) with Vagrant and Ansible

I had to change the IP ranges used in the reference document as Virtualbox > 6.1.28 restricts host only network adapters to IPs in the range 192.168.56.0/21 by default. ([ref](https://stackoverflow.com/questions/69722254/vagrant-up-failing-for-virtualbox-provider-on-ubuntu)), the [virtualbox documentation](https://www.virtualbox.org/manual/ch06.html#network_hostonly) and the stackoverflow answer wrongly mentions this range as 192.68.56.0/21, but this doesn't work. It's apparently 192.**168**.56.0/21.

**Note:** TODO##### Write about the kubernetes repos using xenial apt repos instead of dist specific. Figure out if an if failed try xenial line to ansible playbooks for both master and node#######################################################

```bash
cd K8S
vagrant up
```

I got an error with `join-command` file not available. I fixed this by doing, `cd K8S/kubernetes-setup/` then `touch join-command`

You might also get an error the first time on the `TASK [Initialize the Kubernetes cluster using kubeadm]` step when you you run `vagrant up`, try running it a second time if this happens.

# 5. Troubleshooting

## 5.1. SD card mounts as read only on Ubuntu

When trying to edit files in the newly created SD card for things like setting up a static IP, one of the problems could be the SD card mounting as read-only on Ubuntu. 

Following solution worked for me: [[Source](https://askubuntu.com/questions/488264/my-microsd-mounted-read-only)] , [[alternate source](https://maxwyb.github.io/linux,/disk,/partition/2020/01/14/microsd-read-only.html)]

- Check the device name 
  ```bash
  sudo fdisk -l
  ```
  You can also use `mount -v` to get a list of mounted drives with their permissions
  
- Unmount and remount it (Replace the device name in the command below with your one)
  ```bash
  sudo mount -o remount,rw /dev/mmcblk0p2
  ```
