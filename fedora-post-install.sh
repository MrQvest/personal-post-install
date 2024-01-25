#!/bin/bash

# Kernel argument to improve system responsiveness
# To revert it, enter:
# sudo grubby --remove-args="preempt=full" --update-kernel=ALL
#sudo grubby --args="preempt=full" --update-kernel=ALL

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

# .heic extension support (for Apple photos)
sudo dnf install heif-pixbuf-loader libheif-tools -y

# Utilities
sudo dnf install transmission grsync neovim util-linux-user gnome-shell-extension-appindicator gnome-shell-extension-just-perfection gnome-shell-extension-gsconnect gnome-shell-extension-user-theme gnome-shell-extension-auto-move-windows gnome-shell-extension-drive-menu gnome-shell-extension-openweather gnome-tweaks ffmpegthumbnailer -y

# Essentials
sudo dnf install strawberry torbrowser-launcher steam adw-gtk3-theme zsh yt-dlp mpv -y

# Not needed apps
sudo dnf remove libreoffice-core rhythmbox totem gnome-extensions-app simple-scan mediawriter gnome-connections gnome-clocks gnome-contacts gnome-weather gnome-text-editor gnome-calculator -y
sudo dnf group remove Libreoffice -y

# Install oh-my-zsh (automated install)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# dotfiles configuration
git clone https://github.com/MrQvest/.dotfiles.git $HOME/.dotfiles

# link dotfiles
ln -sf "$HOME/.dotfiles/mpv" "$HOME/.config"

# Updating the system
sudo dnf update -y

# NVIDIA Drivers
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y

# Install personal flatpak collection

# easy effects
flatpak install -y --noninteractive flathub com.github.wwmm.easyeffects
# libreoffice
flatpak install -y --noninteractive flathub org.libreoffice.LibreOffice
# mail (thunderbird)
flatpak install -y --noninteractive flathub org.mozilla.Thunderbird
# obsidian (markdown editor)
flatpak install -y --noninteractive flathub md.obsidian.Obsidian
# heroic games launcher
flatpak install -y --noninteractive flathub com.heroicgameslauncher.hgl
# prism launcher
flatpak install -y --noninteractive flathub org.prismlauncher.PrismLauncher
# extension manager
flatpak install -y --noninteractive flathub com.mattjakeman.ExtensionManager
# flatseal
flatpak install -y --noninteractive flathub com.github.tchx84.Flatseal
# keepassxc
flatpak install -y --noninteractive flathub org.keepassxc.KeePassXC
# blanket
flatpak install -y --noninteractive flathub com.rafaelmardojai.Blanket
# discord
flatpak install -y --noninteractive flathub com.discordapp.Discord

# Gnome Shell extensions
# ArcMenu
# Espresso
# Clipboard Indicator
# Dash to Panel
# Desktop Icons NG (DING)
# Firefox PiP Always on Top
# Removable Drive Menu
# Rounded Window Corners
# Vitals
# Status Area Horizontal Spacing
