{
  inputs,
  system,
  ...
}:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
  ];

  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true;
    # enableClipboard = true;
    enableVPN = true;
    # enableBrightnessControl = true;
    # enableColorPicker = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    # enableSystemSound = true;

    # quickshell.package = inputs.quickshell.packages.${system}.default;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}
