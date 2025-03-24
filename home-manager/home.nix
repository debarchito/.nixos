{ pkgs, ... }:

{
  # General home stuff.
  home.username = "debarchito";
  home.homeDirectory = "/home/debarchito";
  home.stateVersion = "24.11"; # DO NOT CHANGE!
  home.packages = [
    pkgs.blender
    pkgs.deno
    pkgs.distrobox
    pkgs.devenv
    pkgs.eza
    pkgs.fd
    pkgs.erdtree
    pkgs.fd
    pkgs.ffmpeg
    pkgs.ferium
    pkgs.inkscape
    pkgs.inotify-tools
    pkgs.jetbrains.idea-ultimate
    pkgs.jq
    pkgs.just
    pkgs.krita
    pkgs.kdePackages.kcalc
    pkgs.kdePackages.kmail
    pkgs.kdePackages.ktorrent
    pkgs.kdePackages.krohnkite
    pkgs.kdePackages.korganizer
    pkgs.kdePackages.kde-gtk-config
    pkgs.kdePackages.kaccounts-providers
    pkgs.kdePackages.kaccounts-integration
    pkgs.legcord
    pkgs.libreoffice-qt-fresh
    pkgs.mpv
    pkgs.marksman
    pkgs.nixd
    pkgs.nixfmt-rfc-style
    pkgs.obs-studio
    pkgs.prismlauncher
    pkgs.podman-compose
    pkgs.ripgrep
    pkgs.rainfrog
    pkgs.ripgrep-all
    pkgs.taplo
    pkgs.unzip
    pkgs.umu-launcher
    pkgs.vscode-langservers-extracted
    pkgs.wget
    pkgs.wl-clipboard
    pkgs.youtube-music
    pkgs.yaml-language-server
  ];

  # Let home-manager update itself.
  programs.home-manager.enable = true;

  # Allow unfree.
  nixpkgs.config.allowUnfree = true;

  # Modules.
  imports = [
    ./desktop/plasma.nix
    ./apps/ghostty.nix
    ./apps/kdeconnect.nix
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
