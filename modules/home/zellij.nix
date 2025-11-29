{
  programs.zellij = {
    enable = true;
    settings = {
      default_mode = "locked";
      default_shell = "fish";
      pane_frames = false;
      scrollback_editor = "hx";
      theme = "tokyo-night-storm";
      session_serialization = false;
    };
  };
}
