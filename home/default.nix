{ pkgs, ... }:

{
  # General home stuff.
  home.username = "debarchito";
  home.homeDirectory = "/home/debarchito";
  home.stateVersion = "24.11"; # DO NOT CHANGE!
  home.packages = [
    # programs
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
    pkgs.kdePackages.ktorrent
    pkgs.kdePackages.krohnkite
    pkgs.kdePackages.kde-gtk-config
    pkgs.legcord
    pkgs.libreoffice-qt-fresh
    pkgs.mpv
    pkgs.marksman
    pkgs.nixd
    pkgs.nixfmt-rfc-style
    pkgs.obs-studio
    pkgs.prismlauncher
    pkgs.podman-compose
    pkgs.quickemu
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.taplo
    pkgs.thunderbird
    pkgs.unzip
    pkgs.umu-launcher
    pkgs.vscode-langservers-extracted
    pkgs.wget
    pkgs.wl-clipboard
    pkgs.youtube-music
    pkgs.yaml-language-server
    # fonts
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Fontconfig styff.
  fonts.fontconfig.enable = true;

  # Let home-manager update itself.
  programs.home-manager.enable = true;

  # Allow unfree.
  nixpkgs.config.allowUnfree = true;

  # Modules.
  imports = [
    ./ghostty.nix
    ./kdeconnect.nix
    ./librewolf.nix
    ./bat.nix
    ./direnv.nix
    ./fzf.nix
    ./fish.nix
    ./gpg.nix
    ./git.nix
    ./helix.nix
    ./starship.nix
    ./yazi.nix
    ./zoxide.nix
    ./zellij.nix
  ];
}
