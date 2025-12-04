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
