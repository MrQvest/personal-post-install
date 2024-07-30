#!/bin/bash

# Improve system responsiveness (Audio crackling is gone with this)
#sudo grubby --args="preempt=full" --update-kernel=ALL

# dotfiles configuration
git clone --bare https://github.com/MrQvest/.dotfiles $HOME/.dotfiles
#alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
#dotfiles checkout -f
#dotfiles config --local status.showUntrackedFiles no

# Install Homebrew (unattended)
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# copr repos
sudo dnf copr enable che/nerd-fonts

# dnf configuration
echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf

# GDM configuration
# Not needed as of Fedora 40
#sudo touch /etc/dconf/db/gdm.d/06-tap-to-click
#sudo touch /etc/dconf/db/gdm.d/11-icon-settings

#echo '[org/gnome/desktop/peripherals/touchpad]' | sudo tee -a /etc/dconf/db/gdm.d/06-tap-to-click
#echo 'tap-to-click=true' | sudo tee -a /etc/dconf/db/gdm.d/06-tap-to-click

#echo '[org/gnome/desktop/interface]' | sudo tee -a /etc/dconf/db/gdm.d/11-icon-settings
#echo 'icon-theme="Papirus-Dark"' | sudo tee -a /etc/dconf/db/gdm.d/11-icon-settings

#sudo dconf update

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
sudo dnf install heif-pixbuf-loader libheif-tools neovim util-linux-user gnome-tweaks ffmpegthumbnailer google-noto-sans-runic-fonts fastfetch steam adw-gtk3-theme fish akmod-nvidia yt-dlp nerd-fonts audacious -y

# Install cli tools with Homebrew
/home/linuxbrew/.linuxbrew/bin/brew install gallery-dl topgrade starship

# Not needed apps
sudo dnf group remove Libreoffice -y
sudo dnf remove libreoffice-core rhythmbox totem gnome-extensions-app simple-scan mediawriter gnome-connections gnome-clocks gnome-contacts gnome-weather gnome-text-editor gnome-calculator gnome-tour gnome-system-monitor gnome-classic-session gnome-boxes gnome-shell-extension-background-logo virtualbox-guest-additions -y

# Gnome Shell extensions
# PiP on top
# Status Area Horizontal Spacing
# Tiling Assistant
# Open Bar
# Coverflow Alt-Tab
# Clipboard Indicator
