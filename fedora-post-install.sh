#!/bin/bash

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

# Personal stuff
sudo dnf install borgbackup neovim util-linux-user gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator gnome-shell-extension-just-perfection gnome-shell-extension-gsconnect gnome-shell-extension-blur-my-shell gnome-shell-extension-user-theme gnome-tweaks ffmpegthumbnailer yt-dlp steam discord vlc evolution adw-gtk3-theme soundconverter papirus-icon-theme zsh -y
sudo dnf remove rhythmbox totem gnome-extensions-app libreoffice-writer libreoffice-impress libreoffice-calc -y 

# Update the system
sudo dnf update -y

# NVIDIA Drivers
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y

# Install personal flatpak collection

# backup
flatpak install -y --noninteractive flathub org.gnome.World.PikaBackup
# easy effects
flatpak install -y --noninteractive flathub com.github.wwmm.easyeffects
# libreoffice
flatpak install -y --noninteractive flathub org.libreoffice.LibreOffice
# spotify
flatpak install -y --noninteractive flathub com.spotify.Client
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
# torrent client
flatpak install -y --noninteractive flathub de.haeckerfelix.Fragments
# OBS Studio
flatpak install -y --noninteractive flathub com.obsproject.Studio
# Kdenlive
flatpak install -y --noninteractive flathub org.kde.kdenlive
# image converter
flatpak install -y --noninteractive flathub io.gitlab.adhami3310.Converter
# element
flatpak install -y --noninteractive flathub im.riot.Riot
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
