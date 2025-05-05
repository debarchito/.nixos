default:
    @just --list

alias ssl := system-switch-laptop
system-switch-laptop:
    sudo nixos-rebuild switch --flake .#laptop

alias hsd := home-switch-debarchito
home-switch-debarchito:
    nix run home-manager/master -- switch --flake .#debarchito
