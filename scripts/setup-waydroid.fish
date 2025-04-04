#!/usr/bin/env fish
# Setup waydroid things
sudo waydroid init -s GAPPS -c https://ota.waydro.id/system -v https://ota.waydro.id/vendor -f
sudo waydroid-script install libhoudini
echo -e "\nro.hardware.gralloc=default\nro.hardware.egl=swiftshader" | sudo tee -a /var/lib/waydroid/waydroid.cfg
sudo waydroid upgrade -o
