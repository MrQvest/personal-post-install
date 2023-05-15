#!/bin/bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y; 
sudo dnf groupupdate core -y;
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y; 
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y;
sudo dnf groupupdate sound-and-video -y; 
sudo dnf install intel-media-driver -y;
sudo dnf install libva-intel-driver -y; 
sudo dnf install nvidia-vaapi-driver -y; 
sudo dnf install rpmfusion-free-release-tainted -y;
sudo dnf install libdvdcss -y; 
sudo dnf install rpmfusion-nonfree-release-tainted -y;
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware" -y; 
sudo dnf install gnome-tweaks easyeffects ffmpegthumbnailer steam-devices yaru-theme neovim -y; 
sudo dnf remove firefox -y; 
flatpak install -y --noninteractive flathub com.spotify.Client com.valvesoftware.Steam org.videolan.VLC io.github.shiftey.Desktop com.heroicgameslauncher.hgl org.prismlauncher.PrismLauncher com.unity.UnityHub org.keepassxc.KeePassXC com.visualstudio.code com.github.micahflee.torbrowser-launcher org.mozilla.firefox com.mattjakeman.ExtensionManager com.github.tchx84.Flatseal org.qbittorrent.qBittorrent io.github.spacingbat3.webcord org.mozilla.Thunderbird; 
sudo dnf update -y && flatpak update -y --noninteractive;
sudo dnf install akmod-nvidia -y;
