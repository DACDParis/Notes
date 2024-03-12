###### Project to make a very slim Debian install Script

### Thinigs to have:

wayland only
hyprland






### Thinigs to install:

w3m
finch
libavcodec-extra
vlc




sudo apt install flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    



sudo apt install build-essential git ninja-build meson  &&  sudo apt-get build-dep wlroots

 sudo apt install libcairo2-dev libpango1.0-dev




sudo nano /etc/apt/sources.list.d/backports.list

    deb http://deb.debian.org/debian bookworm-backports main
    deb https://www.deb-multimedia.org bookworm main non-free
    
  #### sudo apt install -t bookworm-backports package-name   


git clone --recursive https://github.com/hyprwm/Hyprland -b v0.30.0
cd Hyprland
cd subprojects
git clone https://gitlab.freedesktop.org/emersion/libdisplay-info
git clone https://github.com/emersion/libliftoff
cd ..
meson build
ninja -C build
sudo ninja -C build install
