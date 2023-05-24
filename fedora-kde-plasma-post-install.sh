#!/bin/bash

# Install RPM Fusion repositories 
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y && 

# AppStream metadata
sudo dnf groupupdate core -y &&

# Multimedia stuff / codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y && 
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y &&
sudo dnf groupupdate sound-and-video -y &&

# Install hardware accelerated codecs
sudo dnf install intel-media-driver -y &&
sudo dnf install libva-intel-driver -y &&
sudo dnf install nvidia-vaapi-driver -y &&

# DVD
sudo dnf install rpmfusion-free-release-tainted -y &&
sudo dnf install libdvdcss -y &&

# Firmware
sudo dnf install rpmfusion-nonfree-release-tainted -y &&
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware" -y &&

# Personal stuff
sudo dnf install easyeffects ffmpegthumbnailer steam-devices yt-dlp -y &&

# NVIDIA Driver
sudo dnf install akmod-nvidia -y &&

# Remove dnfdragora
sudo dnf remove dnfdragora -y &&

# Update the system
sudo dnf update -y &&

# Install personal flatpak collection

# backup
flatpak install -y --noninteractive flathub org.gnome.World.PikaBackup
# spotify
flatpak install -y --noninteractive flathub com.spotify.Client 
# steam
flatpak install -y --noninteractive flathub com.valvesoftware.Steam
# vlc
flatpak install -y --noninteractive flathub org.videolan.VLC
# github desktop
flatpak install -y --noninteractive flathub io.github.shiftey.Desktop
# heroic games launcher
flatpak install -y --noninteractive flathub com.heroicgameslauncher.hgl
# prism launcher
flatpak install -y --noninteractive flathub org.prismlauncher.PrismLauncher
# unity hub
flatpak install -y --noninteractive flathub com.unity.UnityHub
# keepassxc
flatpak install -y --noninteractive flathub org.keepassxc.KeePassXC
# vscode
flatpak install -y --noninteractive flathub com.visualstudio.code
# tor browser launcher
flatpak install -y --noninteractive flathub com.github.micahflee.torbrowser-launcher
# flatseal
flatpak install -y --noninteractive flathub com.github.tchx84.Flatseal
# qbittorrent
flatpak install -y --noninteractive flathub org.qbittorrent.qBittorrent
# webcord
flatpak install -y --noninteractive flathub io.github.spacingbat3.webcord
# SDK extensions
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.dotnet7
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.dotnet6
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.mono6
# sound converter
flatpak install -y --noninteractive flathub org.soundconverter.SoundConverter
# element
flatpak install -y --noninteractive flathub im.riot.Riot
# handbrake
flatpak install -y --noninteractive flathub fr.handbrake.ghb
# godot game engine
flatpak install -y --noninteractive flathub org.godotengine.Godot
# blender
flatpak install -y --noninteractive flathub org.blender.Blender
# i2pd
flatpak install -y --noninteractive flathub website.i2pd.i2pd