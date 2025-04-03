#!/usr/bin/env fish
# Setup Plasma the way I like it
lookandfeeltool -a Catppuccin-Mocha-Mauve
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key library --type string "org.kde.breeze"
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme --type string Breeze
kwriteconfig6 --file kcminputrc --group Mouse --key cursorTheme --type string catppuccin-mocha-dark-cursors
kwriteconfig6 --file kcminputrc --group Mouse --key cursorSize --type int 24
kwin_wayland --replace &
plasmashell --replace &
