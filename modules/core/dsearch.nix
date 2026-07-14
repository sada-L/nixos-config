{ ... }:
{
  programs.dsearch = {
    enable = true;

    systemd = {
      enable = true; # Enable systemd user service
      target = "default.target"; # Start with user session
    };
  };
}
