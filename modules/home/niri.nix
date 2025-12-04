{ inputs, pkgs, ... }:
{

  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    setting = {

    };
  };

  programs.niri = {
    asd = {

    };
  };
}
