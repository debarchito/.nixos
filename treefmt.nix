{
  projectRootFile = "flake.nix";
  programs = {
    deno.enable = true;
    fish_indent.enable = true;
    just.enable = true;
    nixfmt.enable = true;
    taplo.enable = true;
  };
}
