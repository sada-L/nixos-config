{ lib, ... }:
{
  programs.alacritty =
    let
      font_family = lib.mkForce "JetBrainsMono Nerd Font";
    in
    {
      enable = true;

      settings = {
        font = {
          normal = {
            family = font_family;
            style = "Regular";
          };
          bold = {
            family = font_family;
            style = "Bold";
          };
          italic = {
            family = font_family;
            style = "Italic";
          };
          bold_italic = {
            family = font_family;
            style = "Bold Italic";
          };
          size = 15;
        };

        window = {
          opacity = 0.95;
          padding.x = 0;
          padding.y = 0;
          dynamic_padding = true;
          decorations = "None";
        };

        scrolling = {
          multiplier = 1;
        };

        terminal = {
          shell = "fish";
        };
      };
    };
}
