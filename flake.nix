{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    catppuccin.url = "github:catppuccin/nix";
    cachix.url = "github:debarchito/cachix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi = {
      url = "github:sxyazi/yazi/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snippets-ls = {
      url = "github:quantonganh/snippets-ls";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:
    let
      system = "x86_64-linux";
      overlay = final: prev: {
        external = {
          snippets-ls = inputs.snippets-ls.packages.${prev.system}.snippets-ls;
          blender = inputs.cachix.packages.${prev.system}.blender;
          obs-studio = inputs.cachix.packages.${prev.system}.obs-studio;
        };
      };
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          overlay
          inputs.helix.overlays.default
          inputs.nur.overlays.default
          inputs.nix-alien.overlays.default
          inputs.yazi.overlays.default
        ];
      };
      treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    in
    {
      formatter.${system} = treefmtEval.config.build.wrapper;
      checks.${system}.formatting = treefmtEval.config.build.check inputs.self;
      nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop
          ./games
        ];
      };
      homeConfigurations.debarchito = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          inputs.catppuccin.homeModules.catppuccin
          inputs.nix-flatpak.homeManagerModules.nix-flatpak
          ./homes/debarchito
        ];
      };
    };
}
