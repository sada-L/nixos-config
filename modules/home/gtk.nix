{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-purple-dark";
      package = pkgs.tela-icon-theme;
    };

    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis-Grey-Dark";
    };

    # cursorTheme = {
    #   name = "Vanilla-DMZ";
    #   size = 15;
    # };

    colorScheme = "dark";
  };
}
