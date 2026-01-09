{
  host,
  options,
  ...
}:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        8080
      ];
      allowedUDPPorts = [
        51820
        59010
        59011
      ];
    };
    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = [ "wg0" ];
    };
  };

  # environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
