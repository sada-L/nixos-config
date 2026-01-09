{ ... }:
{
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.134.233.206/32" ];
      # dns = [ "" ];
      privateKey = "4NIg+NLBOF7CtnS09T8siRqiMuwS75W21ode2B1dc0Q=";
      peers = [
        {
          publicKey = "44pm4MjsnZK1r+JzdG1D6pA1Nw1eC0PMpIkfzoSsaw0=";
          # presharedKeyFile = "";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "146.70.42.235:51820";
          persistentKeepalive = 10;
        }
      ];
    };
  };
}
