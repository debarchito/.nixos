alias hs := home-switch

home-switch:
    nix run home-manager/master -- switch --flake .

alias ssl := system-switch-laptop

system-switch-laptop:
    sudo nixos-rebuild switch --flake .#laptop
