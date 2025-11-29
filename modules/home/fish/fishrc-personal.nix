{ pkgs, ... }:
{
  home.packages = with pkgs; [ fish ];

  home.file."./.fishrc-personal".text = ''
    # This file allows you to define your own Fish shell customizations

    set -gx BROWSER "flatpak run app.zen_browser.zen"
    # set -gx EDITOR "hx"

    # Custom aliases can go here
    alias ef 'zellij --layout ~/.config/zellij/layouts/dev.kdl'
    alias er 'br && ef'

    # Custom functions can go here
    # function my_function
    #   echo "Hello from Fish!"
    # end
  '';
}
