#!/usr/bin/env fish
# Setup waydroid things
echo -e "\nro.hardware.gralloc=default\nro.hardware.egl=swiftshader" | sudo tee -a /var/lib/waydroid/waydroid.cfg
sudo waydroid upgrade -o
