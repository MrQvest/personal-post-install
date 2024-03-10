#!/bin/bash

# dotfiles configuration
git clone --bare https://github.com/MrQvest/.dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout -f
dotfiles config --local status.showUntrackedFiles no

# Install Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# dnf configuration
echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf

# GDM configuration
sudo touch /etc/dconf/db/gdm.d/06-tap-to-click
#sudo touch /etc/dconf/db/gdm.d/11-icon-settings

echo '[org/gnome/desktop/peripherals/touchpad]' | sudo tee -a /etc/dconf/db/gdm.d/06-tap-to-click
echo 'tap-to-click=true' | sudo tee -a /etc/dconf/db/gdm.d/06-tap-to-click

#echo '[org/gnome/desktop/interface]' | sudo tee -a /etc/dconf/db/gdm.d/11-icon-settings
#echo 'icon-theme="Papirus-Dark"' | sudo tee -a /etc/dconf/db/gdm.d/11-icon-settings

sudo dconf update

##################################################################
# RPMFusion stuff
# Install RPM Fusion repositories
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# AppStream metadata
sudo dnf groupupdate core -y

# Multimedia stuff / codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

# Install hardware accelerated codecs
sudo dnf install intel-media-driver -y
sudo dnf install libva-intel-driver -y
sudo dnf install nvidia-vaapi-driver -y

# DVD
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install libdvdcss -y

# Firmware
sudo dnf install rpmfusion-nonfree-release-tainted -y
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware" -y
##################################################################

# Personal stuff

# .heic extension support (for Apple photos), Utilities, Essetials, NVIDIA Drivers
sudo dnf install heif-pixbuf-loader libheif-tools restic neovim util-linux-user gnome-shell-extension-appindicator gnome-shell-extension-just-perfection gnome-shell-extension-gsconnect gnome-shell-extension-user-theme gnome-shell-extension-blur-my-shell gnome-shell-extension-dash-to-dock gnome-tweaks ffmpegthumbnailer google-noto-sans-runic-fonts neofetch htop strawberry steam adw-gtk3-theme yt-dlp fish gh papirus-icon-theme gnome-shell-theme-yaru yaru-sound-theme solaar akmod-nvidia xorg-x11-drv-nvidia-cuda -y

# Not needed apps
sudo dnf remove libreoffice-core rhythmbox totem gnome-extensions-app simple-scan mediawriter gnome-connections gnome-clocks gnome-contacts gnome-weather gnome-text-editor gnome-calculator gnome-tour gnome-system-monitor gnome-shell-extension-gamemode gnome-classic-session gnome-font-viewer gnome-characters loupe gnome-calendar cheese gnome-maps firefox -y
sudo dnf group remove Libreoffice -y

# Gnome Shell extensions
# Espresso
# Firefox PiP Always on Top
# Status Area Horizontal Spacing
# Tiling Assistant
