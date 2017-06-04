#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some desktop tools for further installation"
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections 
echo keyboard-configuration keyboard-configuration/layout select 'English (US)' | debconf-set-selections
echo keyboard-configuration keyboard-configuration/layoutcode select 'us' | debconf-set-selections 
echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections 
apt-key add /public.key 
rm /public.key 
apt-get update 
apt-get install -y ubuntu-minimal ubuntu-standard neon-desktop plasma-workspace-wayland kwin-wayland kwin-wayland-backend-x11 kwin-wayland-backend-wayland kwin 
apt-get dist-upgrade -y 
#groupadd admin 
#useradd -G admin,video -ms /bin/bash neon 
# Refresh apt cache once more now that appstream is installed \
apt-get clean -y
