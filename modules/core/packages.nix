{
  pkgs,
  ...
}:
{
  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    hyprlock.enable = true; # Resolve pam issue, can be disabled per-host via enableHyprlock
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Virtualization support for GNOME Boxes
  virtualisation.libvirtd.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    blender-hip
    kdePackages.okular
    rich-cli
    alsa-utils
    appimage-run # Needed For AppImage Support
    brightnessctl # For Screen Brightness Control
    cmatrix # Matrix Movie Effect In Terminal
    cowsay # Great Fun Terminal Program
    docker-compose # Allows Controlling Docker From A Single File
    duf # Utility For Viewing Disk Usage In Terminal
    dysk # disk usage util
    eza # Beautiful ls Replacement
    ffmpeg # Terminal Video / Audio Editing
    file-roller # Archive Manager
    gdu # graphical disk usage
    gedit # Simple Graphical Text Editor
    gimp # Great Photo Editor
    gnumake
    # glxinfo # Needed for inxi -G GPU info
    mesa-demos
    gping # graphical ping
    tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    hyprpicker # Color Picker
    eog # For Image Viewing
    fuzzel # Application Launcher (default for niri)
    inxi # CLI System Information Tool
    killall # For Killing All Instances Of Programs
    libnotify # For Notifications
    lm_sensors # Used For Getting Hardware Temps
    lolcat # Add Colors To Your Terminal Command Output
    lshw # Detailed Hardware Information
    mpv # Incredible Video Player
    ncdu # Disk Usage Analyzer With Ncurses Interface
    nitch # small fetch util
    nixfmt-rfc-style # Nix Formatter
    nixd # Nix Language Server
    nil # Nix Language Server
    onefetch # shows current build info and stats
    pavucontrol # For Editing Audio Levels & Devices
    pciutils # Collection Of Tools For Inspecting PCI Devices
    picard # For Changing Music Metadata & Getting Cover Art
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    playerctl # Allows Changing Media Volume Through Scripts
    rhythmbox
    ripgrep # Improved Grep
    socat # Needed For Screenshots
    sox # audio support for FFMPEG
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    v4l-utils # Used For Things Like OBS Virtual Camera
    wget # Tool For Fetching Files With Links
    xwayland-satellite # Xwayland outside your Wayland compositor
    ytmdl # Tool For Downloading Audio From YouTube
    nwg-displays # Manage Displays
    nwg-drawer # drawer GUI
    nwg-look # Look GUI
    rofi-emoji # rofi-emoji-wayland merged into rofi-emoji in nixpkgs-unstable
    popsicle
    gum
    # gtk3
    # gtk4
    localsend
  ];
}
