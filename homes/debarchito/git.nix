{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Debarchito Nath";
    userEmail = "dev.debarchito.nath@protonmail.com";
    signing = {
      key = "79647DA76CF74D66";
      signByDefault = true;
    };
    extraConfig.init.defaultBranch = "main";
  };
}
