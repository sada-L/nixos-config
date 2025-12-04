{ inputs, ... }:
{
  imports = [ inputs.yazelix.homeManagerModules.default ];

  programs.yazelix = {
    enable = true;
  };
}
