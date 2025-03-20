{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        bufferline = "multiple";
        color-modes = true;
        completion-replace = true;
        line-number = "relative";
        true-color = true;
        scroll-lines = 1;
        idle-timeout = 200;
        end-of-line-diagnostics = "hint";
        file-picker.hidden = false;
        statusline = {
          left = [
            "mode"
            "spacer"
            "version-control"
            "spacer"
            "file-name"
            "file-modification-indicator"
          ];
          right = [
            "spinner"
            "spacer"
            "workspace-diagnostics"
            "spacer"
            "diagnostics"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
        };
        cursor-shape.insert = "bar";
        indent-guides = {
          render = true;
          character = "╎";
        };
        soft-wrap = {
          enable = true;
          max-wrap = 10;
        };
        inline-diagnostics.cursor-line = "error";
      };
      keys = {
        normal = {
          esc = [
            "collapse_selection"
            "keep_primary_selection"
            ":w"
          ];
          g = {
            q = ":bc";
            Q = ":bc!";
          };
        };
        insert.C-space = "completion";
      };
    };
  };
}
