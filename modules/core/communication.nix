{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop # Messaging App
  ];
}
