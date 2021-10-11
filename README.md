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
  - [2.4. Sensors](#24-sensors)
  - [2.5. xautolock](#25-xautolock)
  - [2.6. Aptitude](#26-aptitude)
  - [2.7. tmux](#27-tmux)
    - [2.7.1. Setup tmux](#271-setup-tmux)
  - [2.8. Python](#28-python)
- [3. Install i3](#3-install-i3)
  - [3.1. Setting up networking](#31-setting-up-networking)
  - [3.2. Install nicer fonts](#32-install-nicer-fonts)
  - [3.3. Rofi](#33-rofi)
  - [3.4. Audio control](#34-audio-control)
  - [3.5. Screen resolution and display control](#35-screen-resolution-and-display-control)
    - [3.5.1. xrandr](#351-xrandr)
    - [3.5.2. arandr (Optional)](#352-arandr-optional)
  - [3.6. i3blocks](#36-i3blocks)
    - [3.6.1. Installing i3blocks](#361-installing-i3blocks)
    - [3.6.2. i3blocks contrib](#362-i3blocks-contrib)
    - [3.6.3. i3block: apt-upgrades](#363-i3block-apt-upgrades)
    - [3.6.4. i3block: Bandwidth](#364-i3block-bandwidth)
    - [3.6.5. i3block: Volume control](#365-i3block-volume-control)
    - [3.6.6. i3block: memory](#366-i3block-memory)
    - [3.6.7. i3block: disk](#367-i3block-disk)
    - [3.6.8. i3block: cpu and hdd temperature](#368-i3block-cpu-and-hdd-temperature)
    - [3.6.9. i3block: wifi](#369-i3block-wifi)
    - [3.6.10. i3block: cpu_usage](#3610-i3block-cpu_usage)
    - [3.6.11. i3block: load_average](#3611-i3block-load_average)
    - [3.6.12. i3block: gpu-load](#3612-i3block-gpu-load)
    - [3.6.13. i3block: timer_and_stopwatch](#3613-i3block-timer_and_stopwatch)
    - [3.6.14. i3block: keyindicator](#3614-i3block-keyindicator)
    - [3.6.15. i3block: shutdown_menu](#3615-i3block-shutdown_menu)
  - [3.7. Get programs to start automatically](#37-get-programs-to-start-automatically)
    - [3.7.1. Dropbox](#371-dropbox)
  - [3.8. Copy modified i3 config file to ~/.config/i3/](#38-copy-modified-i3-config-file-to-configi3)
- [4. Install other everyday programs](#4-install-other-everyday-programs)
  - [4.1. Fail2ban (Needed only if you have enabled connections through your firewall)](#41-fail2ban-needed-only-if-you-have-enabled-connections-through-your-firewall)
  - [4.2. VSCode](#42-vscode)
    - [4.2.1. VSCode plugins](#421-vscode-plugins)
  - [4.3. VLC](#43-vlc)
  - [4.4. gnucash](#44-gnucash)
  - [4.5. Install chromium](#45-install-chromium)
  - [4.6. 7-zip](#46-7-zip)
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

## 2.4. Sensors

```bash
sudo apt install lm-sensors 
sudo sensors-detect
# Selected yes to everything
sensors
```

## 2.5. xautolock

xautolock is required for automatically locking the screen with i3. If you are not using i3, this is not needed

```bash
sudo apt install xautolock
```

## 2.6. Aptitude

Aptitude is not required to be install as Ubuntu already comes with apt and apt-get. However, if you are using i3blocks with a checkupdates script as mentioned in the next section, please install aptitude by doing;

```bash
sudo apt install aptitude
```

## 2.7. tmux

```bash
sudo apt install tmux
```

### 2.7.1. Setup tmux

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

## 2.8. Python

[Pyenv](https://github.com/pyenv/pyenv) helps keep multiple Python version in your machine.

Pyenv has been added to this repo as a submodule.

Follow the instructions [here](https://github.com/pyenv/pyenv/wiki#suggested-build-environment) to install the prerequisites.

And then do the [basic github checkout method using the submodule here to install pyenv](https://github.com/pyenv/pyenv#basic-github-checkout). Following are the steps I followed:

```bash
cd ~/pc-setup/pyenv/
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
pyenv install <version>
# For example;
pyenv install 3.9.7 

# set up global python
pyenv global 3.9.7

# set local python version:
# Navigate to a project folder and do 
pyenv local 3.9.7

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
  - You can use the [fontawesome cheatsheet](https://fontawesome.com/v5/cheatsheet) to copy icons

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

I've added these scripts to the [i3/my-i3blocks/shutdown_menu](i3/my-i3blocks/shutdown_menu) file as options for quickly switching between them.

### 3.5.2. arandr (Optional)

Install arandr (if you need a gui to control screens) by doing `sudo apt install arandr`

## 3.6. i3blocks

i3blocks provides a better(subjective opinion) status bar than the i3bar that comes default with i3.

I've added the i3blocks git repo as a submodule to this repo by using the following:
(More info about submodules can be found [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules))

```bash
git submodule add https://github.com/vivien/i3blocks.git
```

### 3.6.1. Installing i3blocks

Since the i3blocks included with Ubuntu apt is outdated, I installed it from source.
[Ref](https://github.com/vivien/i3blocks#installation)

```bash
sudo apt install autoconf build-essential
cd i3blocks
./autogen.sh
./configure
make
# IG: Had to use sudo here instead of just make install as the reference suggests
sudo make install
```

### 3.6.2. i3blocks contrib

I've added i3blocks-contrib as a submodule to this repo.

```bash
git submodule add https://github.com/vivien/i3blocks-contrib.git
```

You can check the differences between the i3blocks-config scripts in my repo vs the ones from the original repo by doing:

```bash
meld i3/my-i3blocks/<SCRIPT-NAME> i3blocks-contrib/<SCRIPT-FOLDER-NAME>/<SCRIPT-NAME>
```

The corresponding commands to quickly check differences in the modules I've used are as follows:

```bash
# apt-upgrades
meld i3/my-i3blocks/checkupdates i3blocks-contrib/apt-upgrades/apt-upgrades

# bandwidth (folder compare)
meld i3/my-i3blocks/bandwidth2-source/ i3blocks-contrib/bandwidth2/

#volume
meld i3/my-i3blocks/volume i3blocks-contrib/volume/volume

#memory
meld i3/my-i3blocks/memory i3blocks-contrib/memory/memory 

#disk
meld i3/my-i3blocks/disk i3blocks-contrib/disk/disk 

#gradient-temp
meld i3/my-i3blocks/gradient-temp i3blocks-gradient-temp/gradient-temp 

# wifi

# cpu usage

# load_average

# gpu-load

# timer_and_stopwatch

# keyindicator

# shutdown_menu

```

**IMPORTANT: Please make sure that you give the scripts permission to run by doing `chmod +x <scriptname.sh>` for all the scripts you use.**

### 3.6.3. i3block: apt-upgrades

NOTE: I have changed this script and renamed it to [i3/my-i3blocks/checkupdates](i3/my-i3blocks/checkupdates). So check with meld and include any new changes from the i3blocks-contrib repo as necessary.

```bash
meld i3/my-i3blocks/checkupdates i3blocks-contrib/apt-upgrades/apt-upgrades
```

### 3.6.4. i3block: Bandwidth

```bash
# Copy source
cp i3blocks-contrib/bandwidth2/* i3/my-i3blocks/bandwidth2-source/
cd i3/my-i3blocks/bandwidth2-source/
make
mv bandwidth2 ..
```

### 3.6.5. i3block: Volume control

```bash
cp i3blocks-contrib/volume/volume i3/my-i3blocks/
```

### 3.6.6. i3block: memory

```bash
cp i3blocks-contrib/memory/memory i3/my-i3blocks/
```

### 3.6.7. i3block: disk

```bash
cp i3blocks-contrib/disk/disk i3/my-i3blocks/
```

### 3.6.8. i3block: cpu and hdd temperature

I've added a nicer gradient temperature script from [here](https://github.com/hastinbe/i3blocks-gradient-temp) instead of the default temperature script.


```bash
# Does not need to be done again. This is just the command I used to add the submodule.
git submodule add https://github.com/hastinbe/i3blocks-gradient-temp
```

```bash
cp i3blocks-gradient-temp/gradient-temp i3/my-i3blocks
```

### 3.6.9. i3block: wifi

```bash
cp i3blocks-contrib/wifi/wifi i3/my-i3blocks
```

### 3.6.10. i3block: cpu_usage

```bash
cp i3blocks-contrib/cpu_usage/cpu_usage i3/my-i3blocks
```

### 3.6.11. i3block: load_average

```bash
cp i3blocks-contrib/load_average/load_average i3/my-i3blocks
```

### 3.6.12. i3block: gpu-load

```bash
cp i3blocks-contrib/gpu-load/gpu-load i3/my-i3blocks
```

### 3.6.13. i3block: timer_and_stopwatch

```bash
cp i3blocks-contrib/timer_and_stopwatch/timer_and_stopwatch i3/my-i3blocks
```

### 3.6.14. i3block: keyindicator

```bash
cp i3blocks-contrib/keyindicator/keyindicator i3/my-i3blocks
```

### 3.6.15. i3block: shutdown_menu

```bash
cp i3blocks-contrib/shutdown_menu/shutdown_menu i3/my-i3blocks
```

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

## 4.2. VSCode

[REF](https://code.visualstudio.com/docs/setup/linux)

```bash
sudo snap install --classic code
```

### 4.2.1. VSCode plugins

1. [Markdown emoji](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-emoji)
2. [Markdown all in one](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

## 4.3. VLC

[REF](https://www.videolan.org/vlc/download-ubuntu.html)

```bash
sudo snap install vlc
```

## 4.4. gnucash

```
sudo apt install gnucash
```

## 4.5. Install chromium

```bash
sudo snap install chromium
```

## 4.6. 7-zip

```bash
sudo apt install p7zip-full
```

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