{ pkgs, ... }:
let
  bin = pkgs.writeShellScriptBin "broot-picker" ''
    #!${pkgs.bash}/bin/bash

    zellij action move-focus right
    zellij action write 27
    zellij action write-chars ":open $1"
    zellij action write 13
  '';
in
{
  home.packages = [ bin ];

  programs.broot = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      modal = true;
      default_flags = "-g --sort-by-type";
      show_selection_mark = true;
      icon_theme = "nerdfont";
      special_paths = {
        "./.git" = {
          show = "never";
          list = "never";
          sum = "never";
        };
      };
      verbs = [
        {
          invocation = "edit";
          key = "enter";
          apply_to = "file";
          external = "broot-picker {file}";
          leave_broot = false;
        }
      ];
    };
  };
}
