{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ./niri.nix
    ./startup.nix
    ./keybinds.nix
    ./layout.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
}
