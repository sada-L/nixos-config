{ pkgs, ... }:
{
  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
      disabledDefaultBackends = [ "escl" ];
    };
    logitech.wireless.enable = false;
    logitech.wireless.enableGraphical = false;
    graphics.enable = true;
    enableRedistributableFirmware = true;
    keyboard.qmk.enable = false;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  hardware.opengl = {
    enable = true;
  };

  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd # или это для AMD
  ];

  environment.systemPackages = with pkgs; [
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
  ];

  # Udev rules for Corsair devices
  services.udev.extraRules = ''
    # Corsair devices
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1b1c", MODE="0666", GROUP="users"
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1b1c", MODE="0666", GROUP="users"
  '';
  local.hardware-clock.enable = false;
}
