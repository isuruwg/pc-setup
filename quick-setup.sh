sudo apt install ufw
sudo ufw enable

sudo apt install git
sudo apt install meld

cd ~
git clone --recurse-submodules git@github.com:isuruwg/pc-setup.git

sudo snap install --classic code

# Install i3
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2021.02.02_all.deb keyring.deb SHA256:cccfb1dd7d6b1b6a137bb96ea5b5eef18a0a4a6df1d6c0c37832025d2edaa710
    sudo dpkg -i ./keyring.deb

# at this point do sudo -i:
sudo -i
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list

# exit superuser mode
exit
sudo apt update
sudo apt install i3


# Copy configuration files and setup permissions
sudo chmod +x ~/pc-setup/i3/autolock.sh 
sudo chmod +x ~/pc-setup/i3/lock_and_turn_off_screen.sh

cp i3/config ~/.config/i3/
