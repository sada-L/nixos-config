{ host, ... }:
''
  // Host-specific output configuration for homie
  // Configure your monitors here

  output "DP-2" {
    mode "1920x1080@165.000"
    scale 1
    position x=0 y=0
  }

  output "DP-3" {
    mode "1920x1080@144.000"
    scale 1
    position x=0 y=0
  }

  // Add more outputs as needed
  // output "HDMI-A-1" {
  //   mode "2560x1440@144.000"
  //   scale 1.0
  //   position x=1920 y=0
  // }
''
