#!/bin/bash

# Kernel argument to improve system responsiveness
# To revert it, enter:
# sudo grubby --remove-args="preempt=full" --update-kernel=ALL
sudo grubby --args="preempt=full" --update-kernel=ALL

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
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y
sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686 -y
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686 -y
sudo dnf install nvidia-vaapi-driver -y

# DVD
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install libdvdcss -y

# Firmware
sudo dnf install rpmfusion-nonfree-release-tainted -y
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware" -y 
##################################################################

# Personal stuff

# Security
#sudo dnf install firejail -y

# .heic extension support (for Apple iOS photos)
sudo dnf install heif-pixbuf-loader libheif-tools -y

# Utilities
sudo dnf install transmission grsync neovim util-linux-user gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator gnome-shell-extension-just-perfection gnome-shell-extension-gsconnect gnome-shell-extension-blur-my-shell gnome-shell-extension-user-theme gnome-tweaks ffmpegthumbnailer -y 

# Essentials
sudo dnf install torbrowser-launcher chromium steam discord vlc adw-gtk3-theme soundconverter papirus-icon-theme zsh yt-dlp -y

# Not needed apps
sudo dnf remove rhythmbox totem gnome-extensions-app libreoffice-writer libreoffice-impress libreoffice-calc -y 

# Updating the system
sudo dnf update -y

# NVIDIA Drivers
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y

# Set up firejail
#sudo firecfg

# Allow DRM in browsers
#sudo sed -i 's/^# browser-allow-drm no$/browser-allow-drm yes/' /etc/firejail/firejail.config
#sudo sed -i 's/^# browser-disable-u2f yes$/browser-disable-u2f no/' /etc/firejail/firejail.config

# Remove vlc.desktop for it to appear in GNOME Settings
#rm  ~/.local/share/applications/vlc.desktop

# Install personal flatpak collection

# easy effects
flatpak install -y --noninteractive flathub com.github.wwmm.easyeffects
# libreoffice
flatpak install -y --noninteractive flathub org.libreoffice.LibreOffice
# spotify
flatpak install -y --noninteractive flathub com.spotify.Client
# mail (thunderbird)
flatpak install -y --noninteractive flathub org.mozilla.Thunderbird
# heroic games launcher
flatpak install -y --noninteractive flathub com.heroicgameslauncher.hgl
# prism launcher
flatpak install -y --noninteractive flathub org.prismlauncher.PrismLauncher
# unity hub
flatpak install -y --noninteractive flathub com.unity.UnityHub
# vscode
flatpak install -y --noninteractive flathub com.visualstudio.code
# extension manager
flatpak install -y --noninteractive flathub com.mattjakeman.ExtensionManager
# flatseal
flatpak install -y --noninteractive flathub com.github.tchx84.Flatseal
# OBS Studio
flatpak install -y --noninteractive flathub com.obsproject.Studio
# Kdenlive
flatpak install -y --noninteractive flathub org.kde.kdenlive
# image converter
flatpak install -y --noninteractive flathub io.gitlab.adhami3310.Converter
# element
flatpak install -y --noninteractive flathub im.riot.Riot
# epic asset manager (Unreal Engine)
flatpak install -y --noninteractive flathub io.github.achetagames.epic_asset_manager
# godot game engine
flatpak install -y --noninteractive flathub org.godotengine.Godot
# blender
flatpak install -y --noninteractive flathub org.blender.Blender
# keepassxc
flatpak install -y --noninteractive flathub org.keepassxc.KeePassXC
# blanket
flatpak install -y --noninteractive flathub com.rafaelmardojai.Blanket
# SDK extensions
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.dotnet7
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.dotnet6
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.mono6

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

# Setup zsh
# https://fedoramagazine.org/set-zsh-fedora-system/
# https://ohmyz.sh/
# https://github.com/romkatv/powerlevel10k
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting

# Discord modifications (Vencord)
# https://vencord.dev/
# Script to download and install: 
# sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
