# TOC <!-- omit in toc -->

- [1. Introduction](#1-introduction)
- [2. Install i3](#2-install-i3)
  - [2.1. Setting up networking](#21-setting-up-networking)
  - [2.2. Install nicer fonts](#22-install-nicer-fonts)
  - [2.3. Rofi](#23-rofi)
  - [2.4. i3blocks](#24-i3blocks)
    - [i3blocks contrib](#i3blocks-contrib)
- [3. Install the basics](#3-install-the-basics)
  - [3.1. Git](#31-git)
  - [3.2. VSCode](#32-vscode)
  - [3.3. VLC](#33-vlc)
  - [3.4. gnucash](#34-gnucash)
  - [3.5. Install chromium](#35-install-chromium)

# 1. Introduction

This repo contains notes for myself for setting up my computers.

# 2. Install i3

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

## 2.1. Setting up networking

[Reference](https://faq.i3wm.org/question/2/how-can-i-use-networkmanager-with-i3.1.html)

~~Add exec `--no-startup-id nm-applet` to `~/.config/i3/config` file to start the tray icon for networking.  [NOTE: I have tested this only on the i3blocks status bar. This might not work properly with i3-bar]~~ New versions of i3 comes with this line already in config file

## 2.2. Install nicer fonts

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

## 2.3. Rofi

I did `sudo apt install rofi`. TODO: Try out installation from release.

Next add the following to `~/.config/i3/config` 

```
bindsym $mod+d exec --no-startup-id rofi -combi-modi 'window#drun#run' -show combi -modi combi -font "System San Francisco Display 14"
```

(Make sure you comment out the other commands that get triggered with $mod+d)

## 2.4. i3blocks

i3blocks provides a better(subjective opinion) status bar than the i3bar that comes default with i3.

I've added the i3blocks git repo as a submodule to this repo by using the following:
(More info about submodules can be found [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules))

```bash
git submodule add https://github.com/vivien/i3blocks.git
```

### i3blocks contrib

```bash
git submodule add https://github.com/vivien/i3blocks-contrib.git
```

# 3. Install the basics

## 3.1. Git

```bash
sudo apt install git
```

## 3.2. VSCode

[REF](https://code.visualstudio.com/docs/setup/linux)

```bash
sudo snap install --classic code
```

## 3.3. VLC

[REF](https://www.videolan.org/vlc/download-ubuntu.html)

```bash
sudo snap install vlc
```

## 3.4. gnucash

```
sudo apt install gnucash
```

## 3.5. Install chromium

```bash
sudo snap install chromium
```