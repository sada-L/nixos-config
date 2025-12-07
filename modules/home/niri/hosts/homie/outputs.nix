{ host, ... }:
''
  // Host-specific output configuration for homie
  // Configure your monitors here

  output "DP-2" {
    mode "1920x1080@165.003"
    scale 1
    position x=0 y=0
  }

  output "DP-3" {
    mode "1920x1080@144.001"
    scale 1
    position x=0 y=0
  }
''
