{ ... }: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    systemd.enable = true;
    settings = {
      font-size = 15;
      theme = "TokyoNight Storm";
      background = "#1a1b26";
      background-opacity = 0.9;
      background-blur = true;
      confirm-close-surface = false;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-padding-x = 5;
      window-padding-y = 5;
      window-vsync = true;
      window-decoration = "none";
      shell-integration = "fish";
      split-inherit-working-directory = true;
      keybind = [
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+j=goto_split:down"
        "ctrl+h=goto_split:left"
        "ctrl+l=goto_split:right"
        "ctrl+k=goto_split:up"
        "ctrl+alt+j=resize_split:down,10"
        "ctrl+alt+h=resize_split:left,10"
        "ctrl+alt+l=resize_split:right,10"
        "ctrl+alt+k=resize_split:up,10"
        "ctrl+enter=toggle_split_zoom"
        "ctrl+t=new_split:down"
        "ctrl+r=close_surface"
      ];
    };
  };
}
