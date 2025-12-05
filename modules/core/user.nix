{
  pkgs,
  inputs,
  username,
  host,
  profile,
  system,
  ...
}:
let
  variables = import ../../hosts/${host}/variables.nix;
  inherit (variables) gitUsername;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  programs.fish.enable = true;

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        profile
        system
        ;
    };

    users.${username} = {
      imports = [ ./../home ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        preferXdgDirectories = true;
        stateVersion = "25.05";
      };
    };
  };

  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "${gitUsername}";
    extraGroups = [
      "adbusers"
      "docker"
      "libvirtd" # For VirtManager
      "lp"
      "networkmanager"
      "scanner"
      "wheel" # sudo access
      "vboxusers" # For VirtualBox
    ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
