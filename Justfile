alias hs := home-switch

home-switch:
    nix run home-manager/master -- switch --flake .

alias ssd := system-switch-dell

system-switch-dell:
    sudo nixos-rebuild switch --flake .#dell
