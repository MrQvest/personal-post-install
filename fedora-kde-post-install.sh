#!/bin/bash

# Improve system responsiveness (Audio crackling is gone with this)
sudo grubby --args="preempt=full" --update-kernel=ALL

# dotfiles configuration
git clone --bare https://github.com/MrQvest/.dotfiles $HOME/.dotfiles
#alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
#dotfiles checkout -f
#dotfiles config --local status.showUntrackedFiles no

# Install Homebrew (unattended)
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# copr repos
sudo dnf copr enable che/nerd-fonts -y

# dnf configuration
echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf

# RPM Fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Appstream data
sudo dnf group update core -y

# ffmpeg
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y

# Codecs
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf update @sound-and-video -y

# Hardware Acceleration
sudo dnf install intel-media-driver libva-intel-driver libva-nvidia-driver -y

# DVD
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install libdvdcss -y

# Firmware
sudo dnf install rpmfusion-nonfree-release-tainted -y
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware" -y

# Personal stuff

# Not needed apps
sudo dnf remove mediawriter kontact kmail okular dragonplayer elisa-player firewall-config kamoso kmahjongg kmines kmousetool kmouth kolourpaint kpat krdc krfb ktnef akregator neochat skanpage korganizer kaddressbook kfind kcharselect kgpg virtualbox-guest-additions kwalletmanager5 -y

# .heic extension support (for Apple photos), Utilities, Essetials, NVIDIA Drivers
sudo dnf install heif-pixbuf-loader libheif-tools neovim google-noto-sans-runic-fonts fira-code-fonts fastfetch steam fish akmod-nvidia git-core yt-dlp nerd-fonts -y
# Install cli tools with Homebrew
/home/linuxbrew/.linuxbrew/bin/brew install gallery-dl topgrade
