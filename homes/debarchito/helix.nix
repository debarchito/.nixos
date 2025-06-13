let
  common-options = {
    indent = {
      tab-width = 2;
      unit = " ";
    };
    auto-format = true;
  };
in
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
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
          C-y = [
            ":sh rm -f /tmp/unique-file"
            ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
            ":insert-output echo '\x1b[?1049h\x1b[?2004h' > /dev/tty"
            ":open %sh{cat /tmp/unique-file}"
            ":redraw"
            ":set mouse false"
            ":set mouse true"
          ];
        };
        insert.C-space = "completion";
      };
    };
    languages = {
      language = [
        (
          {
            name = "nix";
            formatter.command = "nixfmt";
          }
          // common-options
        )
        (
          {
            name = "html";
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "html"
              ];
            };
          }
          // common-options
        )
        (
          {
            name = "css";
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "css"
              ];
            };
          }
          // common-options
        )
        (
          {
            name = "json";
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "json"
              ];
            };
          }
          // common-options
        )
        (
          {
            name = "jsonc";
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "jsonc"
              ];
            };
          }
          // common-options
        )
        (
          {
            name = "yaml";
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "yaml"
              ];
            };
          }
          // common-options
        )
        (
          {
            name = "markdown";
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "md"
              ];
            };
          }
          // common-options
        )
        (
          {
            name = "sql";
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "sql"
              ];
            };
          }
          // common-options
        )
        (
          {
            name = "fish";
            formatter.command = "fish_indent";
          }
          // common-options
        )
        (
          {
            name = "toml";
            formatter = {
              command = "taplo";
              args = [
                "format"
                "-"
              ];
            };
          }
          // common-options
        )
        (
          {
            name = "typst";
            formatter.command = "typstyle";
          }
          // common-options
        )
      ];
    };
  };
}
