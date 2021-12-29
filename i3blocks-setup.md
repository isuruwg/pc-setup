# TOC <!-- omit in toc -->

- [1. Introduction and housekeeping](#1-introduction-and-housekeeping)
- [2. Installing i3blocks](#2-installing-i3blocks)
- [3. i3blocks contrib](#3-i3blocks-contrib)
  - [3.1. i3block: apt-upgrades](#31-i3block-apt-upgrades)
  - [3.2. i3block: Bandwidth](#32-i3block-bandwidth)
  - [3.3. i3block: Volume control](#33-i3block-volume-control)
  - [3.4. i3block: memory](#34-i3block-memory)
  - [3.5. i3block: disk](#35-i3block-disk)
  - [3.6. i3block: cpu and hdd temperature](#36-i3block-cpu-and-hdd-temperature)
  - [3.7. i3block: wifi](#37-i3block-wifi)
  - [3.8. i3block: cpu_usage](#38-i3block-cpu_usage)
  - [3.9. i3block: load_average](#39-i3block-load_average)
  - [3.10. i3block: gpu-load](#310-i3block-gpu-load)
  - [3.11. i3block: timer_and_stopwatch](#311-i3block-timer_and_stopwatch)
  - [3.12. i3block: keyindicator](#312-i3block-keyindicator)
  - [3.13. i3block: shutdown_menu](#313-i3block-shutdown_menu)

# 1. Introduction and housekeeping

i3blocks provides a better(subjective opinion) status bar than the i3bar that comes default with i3.

I've added the i3blocks git repo as a submodule to this repo by using the following:
(More info about submodules can be found [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules))

```bash
git submodule add https://github.com/vivien/i3blocks.git
```

# 2. Installing i3blocks

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

# 3. i3blocks contrib

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

## 3.1. i3block: apt-upgrades

NOTE: I have changed this script and renamed it to [i3/my-i3blocks/checkupdates](i3/my-i3blocks/checkupdates). So check with meld and include any new changes from the i3blocks-contrib repo as necessary.

```bash
meld i3/my-i3blocks/checkupdates i3blocks-contrib/apt-upgrades/apt-upgrades
```

## 3.2. i3block: Bandwidth

```bash
# Copy source
cp i3blocks-contrib/bandwidth2/* i3/my-i3blocks/bandwidth2-source/
cd i3/my-i3blocks/bandwidth2-source/
make
mv bandwidth2 ..
```

## 3.3. i3block: Volume control

```bash
cp i3blocks-contrib/volume/volume i3/my-i3blocks/
```

## 3.4. i3block: memory

```bash
cp i3blocks-contrib/memory/memory i3/my-i3blocks/
```

## 3.5. i3block: disk

```bash
cp i3blocks-contrib/disk/disk i3/my-i3blocks/
```

## 3.6. i3block: cpu and hdd temperature

I've added a nicer gradient temperature script from [here](https://github.com/hastinbe/i3blocks-gradient-temp) instead of the default temperature script.


```bash
# Does not need to be done again. This is just the command I used to add the submodule.
git submodule add https://github.com/hastinbe/i3blocks-gradient-temp
```

```bash
cp i3blocks-gradient-temp/gradient-temp i3/my-i3blocks
```

## 3.7. i3block: wifi

```bash
cp i3blocks-contrib/wifi/wifi i3/my-i3blocks
```

## 3.8. i3block: cpu_usage

```bash
cp i3blocks-contrib/cpu_usage/cpu_usage i3/my-i3blocks
```

## 3.9. i3block: load_average

```bash
cp i3blocks-contrib/load_average/load_average i3/my-i3blocks
```

## 3.10. i3block: gpu-load

```bash
cp i3blocks-contrib/gpu-load/gpu-load i3/my-i3blocks
```

## 3.11. i3block: timer_and_stopwatch

```bash
cp i3blocks-contrib/timer_and_stopwatch/timer_and_stopwatch i3/my-i3blocks
```

## 3.12. i3block: keyindicator

```bash
cp i3blocks-contrib/keyindicator/keyindicator i3/my-i3blocks
```

## 3.13. i3block: shutdown_menu

```bash
cp i3blocks-contrib/shutdown_menu/shutdown_menu i3/my-i3blocks
```
