{ pkgs, ... }:

{
  # General home stuff.
  home.username = "debarchito";
  home.homeDirectory = "/home/debarchito";
  home.stateVersion = "24.11"; # DO NOT CHANGE!
  home.packages = [
    pkgs.blender
    pkgs.distrobox
    pkgs.devenv
    pkgs.eza
    pkgs.fd
    pkgs.erdtree
    pkgs.fd
    pkgs.ffmpeg
    pkgs.inkscape
    pkgs.inotify-tools
    pkgs.jetbrains.idea-ultimate
    pkgs.jq
    pkgs.just
    pkgs.krita
    pkgs.kdePackages.krohnkite
    pkgs.kdePackages.kdeconnect-kde
    pkgs.legcord
    pkgs.libreoffice-qt-fresh
    pkgs.mpv
    pkgs.nixfmt-rfc-style
    pkgs.obs-studio
    pkgs.podman-compose
    pkgs.ripgrep
    pkgs.rainfrog
    pkgs.ripgrep-all
    pkgs.unzip
    pkgs.wget
  ];

  # Let home-manager update itself.
  programs.home-manager.enable = true;

  # Allow unfree.
  nixpkgs.config.allowUnfree = true;

  # Modules.
  imports = [
    ./desktop/plasma.nix
    ./apps/ghostty.nix
    ./apps/librewolf.nix
    ./tools/bat.nix
    ./tools/direnv.nix
    ./tools/fzf.nix
    ./tools/fish.nix
    ./tools/gpg.nix
    ./tools/git.nix
    ./tools/helix.nix
    ./tools/starship.nix
    ./tools/yazi.nix
    ./tools/zoxide.nix
    ./tools/zellij.nix
  ];
}
