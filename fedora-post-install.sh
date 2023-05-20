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
sudo dnf install gnome-tweaks easyeffects ffmpegthumbnailer steam-devices neovim yt-dlp -y &&

# NVIDIA Driver
sudo dnf install akmod-nvidia -y &&

# More personal stuff
sudo dnf remove firefox totem -y &&

# Install personal flatpak collection
flatpak install -y --noninteractive flathub org.mozilla.firefox com.spotify.Client com.valvesoftware.Steam org.videolan.VLC io.github.shiftey.Desktop com.heroicgameslauncher.hgl org.prismlauncher.PrismLauncher com.unity.UnityHub org.keepassxc.KeePassXC com.visualstudio.code com.github.micahflee.torbrowser-launcher com.mattjakeman.ExtensionManager com.github.tchx84.Flatseal org.qbittorrent.qBittorrent io.github.spacingbat3.webcord org.mozilla.Thunderbird org.freedesktop.Sdk.Extension.dotnet7 org.freedesktop.Sdk.Extension.dotnet6 org.freedesktop.Sdk.Extension.mono6 
