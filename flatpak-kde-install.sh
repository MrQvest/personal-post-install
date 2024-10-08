#!/bin/bash

# Enable flathub and install personal flatpak collection
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# EasyEffects
flatpak install -y --noninteractive flathub com.github.wwmm.easyeffects
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
# ProtonUp-Qt
flatpak install -y --noninteractive flathub net.davidotek.pupgui2
# GIMP
flatpak install -y --noninteractive flathub org.gimp.GIMP
# Kdenlive
flatpak install -y --noninteractive flathub org.kde.kdenlive
# Inkscape
flatpak install -y --noninteractive flathub org.inkscape.Inkscape
# LocalSend
flatpak install -y --noninteractive flathub org.localsend.localsend_app
# OBS Studio
flatpak install -y --noninteractive flathub com.obsproject.Studio
# Audacious
flatpak install -y --noninteractive fedora org.atheme.audacious
