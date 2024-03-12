
sudo dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig -y
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

sudo dnf copr enable solopasha/hyprland -y

sudo dnf install gcc-c++ mesa-libGLU-devel libX11-devel libXi-devel libXmu-devel git -y

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install git wget ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel wayland-protocols-devel cairo-devel pango-devel -y
sudo dnf install wayland-devel libdrm-devel libxkbcommon-devel systemd-devel libseat-devel mesa-libEGL-devel libinput-devel xcb-util-wm-devel xorg-x11-server-Xwayland-devel mesa-libgbm-devel xcb-util-renderutil-devel -y

wget https://ftp.lysator.liu.se/pub/opensuse/tumbleweed/repo/oss/x86_64/libxcb-errors0-1.0.1-1.1.x86_64.rpm -y
sudo dnf install libxcb-errors0-1.0.1-1.1.x86_64.rpm -y

sudo dnf update -y
sudo dnf install hyprland-nvidia hyprland-plugins hyprpaper hyprpicker hyprshot waybar-hyprland xdg-desktop-portal-hyprland
sudo dnf remove xorg-x11-drv-nouveau -y
#hyprland-git

#sudo dnf install wget git ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel wayland-protocols-devel cairo-devel pango-devel gdb rust-xkbcommon-devel libudev-devel libseat-devel mesa-libEGL-devel libinput-devel


#git clone --recursive https://github.com/hyprwm/Hyprland

#dnf copr enable jaques22/hyprland-extras
#dnf copr enable jaques22/hyprland
#dnf copr enable jaques22/xdg-desktop-portal-hyprland

#Edit /etc/default/grub
#rhgb quiet rd.driver.blacklist=nouveau nvidia-drm.modeset=1

sudo grub2-mkconfig -o /boot/grub2/grub.cfg

## Backup old initramfs nouveau image ##
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img

## Create new initramfs image ##
dracut /boot/initramfs-$(uname -r).img $(uname -r)
