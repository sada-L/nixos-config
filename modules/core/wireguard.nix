{ ... }:
{
  networking.wireguard.enable = true;

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.191.226.110/19" ];
      dns = [
        "9.9.9.9"
        "149.112.112.112"
      ];

      privateKey = "yEiteFWNSw5TIEoN7yeYm825kCsXj1ukaX3QwiWi7HM=";
      peers = [
        {
          publicKey = "L3uTfoIBkb7zfZcbbptdsv3aFfGsa7zS2Oabmwz3Ji4=";
          presharedKey = "hidzbSxE3Ax4SKO9q0IOsK9i/T9bwZ0y7/2Uoz5n+lQ=";
          endpoint = "93.115.203.142:443";
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
