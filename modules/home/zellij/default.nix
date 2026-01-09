{
  imports = [
    ./layouts.nix
  ];

  programs.zellij = {
    enable = true;
    exitShellOnExit = false;
    settings = {
      default_mode = "locked";
      default_shell = "fish";
      pane_frames = false;
      scrollback_editor = "hx";
      on_force_close = "quit";
      styler_underline = true;
      show_startup_tips = false;
      show_release_note = false;
      session_serialization = false;
      simplified_ui = true;

      theme = "tokyonight_moon";

      themes = {
        tokyonight_moon = {
          fg = "#c8d3f5";
          bg = "#2f334d";
          black = "#222436";
          red = "#ff757f";
          green = "#c3e88d";
          yellow = "#ffc777";
          blue = "#82aaff";
          magenta = "#c099ff";
          cyan = "#86e1fc";
          white = "#828bb8";
          orange = "#ff966c";
        };
      };

      ui = {
        pane_frames = {
          rounded_corners = false;
          hide_session_name = true;
        };
      };

      keybinds._props.clear-default = true;
      keybinds.locked._children = [
        {
          bind = {
            _args = [ "Ctrl h" ];
            MoveFocus = [ "left" ];
          };
        }
        {
          bind = {
            _args = [ "Ctrl j" ];
            MoveFocus = [ "down" ];
          };
        }
        {
          bind = {
            _args = [ "Ctrl k" ];
            MoveFocus = [ "up" ];
          };
        }
        {
          bind = {
            _args = [ "Ctrl l" ];
            MoveFocus = [ "right" ];
          };
        }
        {
          bind = {
            _args = [ "Ctrl q" ];
            Quit = [ ];
          };
        }
      ];
    };
  };
}
