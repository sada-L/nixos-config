{
  pkgs,
  lib,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "my_theme";

      editor = {
        scroll-lines = 1;
        scrolloff = 5;
        cursorline = true;
        cursorcolumn = false;
        completion-timeout = 50;
        completion-trigger-len = 1;
        true-color = true;
        bufferline = "multiple";
        color-modes = true;
        trim-final-newlines = true;
        trim-trailing-whitespace = true;
        popup-border = "all";

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        indent-guides = {
          render = true;
        };

        lsp = {
          auto-signature-help = true;
          display-inlay-hints = true;
        };

        statusline = {
          left = [
            "mode"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          center = [ "diagnostics" ];
          right = [
            "file-type"
            "total-line-numbers"
            "position"
            "file-encoding"
            "spinner"
          ];
          separator = "|";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
          diagnostics = [
            "warning"
            "error"
          ];
          workspace-diagnostics = [
            "warning"
            "error"
          ];

        };

        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "disable";
        };
      };

      keys = {
        normal = {
          space = {
            q = ":wq";
            Q = ":q!";
            c = {
              c = ":buffer-close";
              o = ":buffer-close-others";
            };
          };

          H = ":buffer-previous";
          L = ":buffer-next";
          C-s = ":write";
          K = "hover";
        };
      };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
    ];

    themes = {
      my_theme = {
        "inherits" = "tokyonight_moon";
        "ui.virtual.inlay-hint" = {
          fg = "#636da6";
        };
      };
    };
  };
}
