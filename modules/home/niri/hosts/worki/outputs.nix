{ host, ... }:
''
  // Host-specific output configuration for worki
  // Configure your monitors here

  output "eDP-1" {
    mode "1920x1080@60.000"
    scale 1.5
    position x=0 y=0
  }
''
