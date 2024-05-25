#!/bin/bash

# Enable flathub and install personal flatpak collection
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# EasyEffects
flatpak install -y --noninteractive flathub com.github.wwmm.easyeffects
# LibreOffice
flatpak install -y --noninteractive flathub org.libreoffice.LibreOffice 
# Obsidian
flatpak install -y --noninteractive flathub md.obsidian.Obsidian 
# Heroic Games Launcher
flatpak install -y --noninteractive flathub com.heroicgameslauncher.hgl 
# Prism Launcher
flatpak install -y --noninteractive flathub org.prismlauncher.PrismLauncher 
# Mindustry
flatpak install -y --noninteractive flathub com.github.Anuken.Mindustry
# Osu!
flatpak install -y --noninteractive flathub sh.ppy.osu
# KeePassXC
flatpak install -y --noninteractive flathub org.keepassxc.KeePassXC 
# mpv
flatpak install -y --noninteractive flathub io.mpv.Mpv
# Vesktop (Discord)
flatpak install -y --noninteractive flathub dev.vencord.Vesktop
# qBittorrent
flatpak install -y --noninteractive flathub org.qbittorrent.qBittorrent 
# Tor Browser
flatpak install -y --noninteractive flathub org.torproject.torbrowser-launcher 
# ProtonUp-Qt
flatpak install -y --noninteractive flathub net.davidotek.pupgui2
# GIMP
flatpak install -y --noninteractive flathub org.gimp.GIMP
# Kdenlive
flatpak install -y --noninteractive flathub org.kde.kdenlive
# Inkscape
flatpak install -y --noninteractive flathub org.inkscape.Inkscape
