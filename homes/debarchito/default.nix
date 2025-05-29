{ pkgs, ... }:

{
  # General home stuff.
  home.username = "debarchito";
  home.homeDirectory = "/home/debarchito";
  home.stateVersion = "24.11"; # DO NOT CHANGE!
  home.packages = [
    # themes and icons
    (pkgs.catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "mauve" ];
      winDecStyles = [ "classic" ];
    })
    pkgs.bibata-cursors
    # programs
    pkgs.external.blender
    pkgs.devenv
    pkgs.distrobox
    pkgs.external.snippets-ls
    pkgs.external.kwin-effects-forceblur
    pkgs.fd
    pkgs.ffmpeg
    pkgs.ferium
    pkgs.foliate
    pkgs.inkscape
    pkgs.inotify-tools
    pkgs.jq
    pkgs.just
    pkgs.jetbrains.idea-ultimate
    pkgs.krita
    pkgs.kdePackages.kconfig
    pkgs.kdePackages.krohnkite
    pkgs.kdePackages.kde-gtk-config
    pkgs.legcord
    pkgs.libreoffice-qt-fresh
    pkgs.mpv
    pkgs.marksman
    pkgs.nixd
    pkgs.nix-alien
    pkgs.nixfmt-rfc-style
    pkgs.obsidian
    pkgs.protonvpn-gui
    pkgs.prismlauncher
    pkgs.podman-compose
    pkgs.quickemu
    pkgs.qbittorrent
    pkgs.ripgrep
    pkgs.ripgrep-all
    pkgs.unzip
    pkgs.unrar
    pkgs.wget
    pkgs.wl-clipboard
    pkgs.youtube-music
    pkgs.zed-editor-fhs
    # fonts
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Fontconfig stuff.
  fonts.fontconfig.enable = true;

  # Let home-manager update itself.
  programs.home-manager.enable = true;

  # Allow unfree.
  nixpkgs.config.allowUnfree = true;

  # Catppuccin!
  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  # Modules.
  imports = [
    ./eza.nix
    ./ghostty.nix
    ./jujutsu.nix
    ./kdeconnect.nix
    ./librewolf.nix
    ./bat.nix
    ./direnv.nix
    ./fzf.nix
    ./fish.nix
    ./flatpak.nix
    ./gpg.nix
    ./git.nix
    ./helix.nix
    ./nushell.nix
    ./starship.nix
    ./yazi.nix
    ./zoxide.nix
    ./zellij.nix
  ];
}
