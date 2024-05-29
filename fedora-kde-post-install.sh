#!/bin/bash

# Improve system responsiveness (Audio crackling is gone with this)
sudo grubby --args="preempt=full" --update-kernel=ALL

# dotfiles configuration
git clone --bare https://github.com/MrQvest/.dotfiles $HOME/.dotfiles
#alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
#dotfiles checkout -f
#dotfiles config --local status.showUntrackedFiles no

# Install Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Install Homebrew (unattended)
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# copr repos
#sudo dnf copr enable che/nerd-fonts

# dnf configuration
echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf

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

# Not needed apps
sudo dnf group remove Libreoffice -y
sudo dnf remove mediawriter kwrite kontact kmail dragonplayer elisa-player firewall-config kamoso kmahjongg kmines kmousetool kmouth kolourpaint kpat krdc krfb ktnef akregator libreoffice-core neochat skanpage korganizer kaddressbook kfind kcharselect kgpg virtualbox-guest-additions -y

# .heic extension support (for Apple photos), Utilities, Essetials, NVIDIA Drivers
sudo dnf install heif-pixbuf-loader libheif-tools neovim google-noto-sans-runic-fonts fastfetch btop steam fish solaar akmod-nvidia strawberry handbrake-gui mozilla-openh264 git-core -y
# Install cli tools with Homebrew
/home/linuxbrew/.linuxbrew/bin/brew install yt-dlp gh gallery-dl topgrade
