#! /bin/sh

# Install RPMFusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable repo
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Install Intel HW acceleration drivers
# see https://rpmfusion.org/Howto/Multimedia
sudo dnf install intel-media-driver

# Install additional codec
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

# Swap FFmpeg packages
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

# Install vainfo utility
sudo dnf install libva-utils

# Add yourself to the dialout group for serial port access
sudo usermod -a -G dialout $USER

# Capslock as control key
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"

# Install a nice text editor
sudo dnf install helix
