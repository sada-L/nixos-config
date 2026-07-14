{ pkgs, ... }:
{
  home.packages = with pkgs; [
    catppuccin-kvantum # Пример пакета с темой (Catppuccin)
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  qt = {
    enable = true;
    style.name = "kvantum";
  };
}
