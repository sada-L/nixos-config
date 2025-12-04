{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        shell = "fish";
        term = "foot";
        login-shell = "no";
        font = "JetBrainsMonoNerdFont:size=15";
      };
      colors = {
        alpha = 0.9;
        alpha-mode = "default";
      };
      cursor = {
        style = "hollow";
      };
    };
  };
}
