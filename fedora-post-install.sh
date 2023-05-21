#!/bin/bash

# Update the system
sudo dnf update -y &&

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
sudo dnf install gnome-tweaks gnome-shell-extension-user-theme easyeffects ffmpegthumbnailer steam-devices neovim yt-dlp gnome-shell-extension-appindicator gnome-shell-extension-dash-to-dock gnome-shell-extension-just-perfection gnome-shell-extension-gsconnect -y &&

# NVIDIA Driver
sudo dnf install akmod-nvidia -y &&

# More personal stuff
sudo dnf remove firefox totem rm gnome-extensions-app -y &&

# Install personal flatpak collection
flatpak install -y --noninteractive flathub org.mozilla.firefox
flatpak install -y --noninteractive flathub com.spotify.Client 
flatpak install -y --noninteractive flathub com.valvesoftware.Steam
flatpak install -y --noninteractive flathub org.videolan.VLC
flatpak install -y --noninteractive flathub io.github.shiftey.Desktop
flatpak install -y --noninteractive flathub com.heroicgameslauncher.hgl
flatpak install -y --noninteractive flathub org.prismlauncher.PrismLauncher
flatpak install -y --noninteractive flathub com.unity.UnityHub
flatpak install -y --noninteractive flathub org.keepassxc.KeePassXC
flatpak install -y --noninteractive flathub com.visualstudio.code
flatpak install -y --noninteractive flathub com.github.micahflee.torbrowser-launcher
flatpak install -y --noninteractive flathub com.mattjakeman.ExtensionManager
flatpak install -y --noninteractive flathub com.github.tchx84.Flatseal
flatpak install -y --noninteractive flathub org.qbittorrent.qBittorrent
flatpak install -y --noninteractive flathub io.github.spacingbat3.webcord
flatpak install -y --noninteractive flathub org.mozilla.Thunderbird
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.dotnet7
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.dotnet6
flatpak install -y --noninteractive flathub org.freedesktop.Sdk.Extension.mono6
flatpak install -y --noninteractive flathub org.soundconverter.SoundConverter
flatpak install -y --noninteractive flathub io.github.celluloid_player.Celluloid
flatpak install -y --noninteractive flathub im.riot.Riot
flatpak install -y --noninteractive flathub fr.handbrake.ghb
flatpak install -y --noninteractive flathub org.godotengine.Godot
