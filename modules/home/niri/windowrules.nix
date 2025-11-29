{ host, ... }:
''
  // Global window styling
  window-rule {
      geometry-corner-radius 9
      clip-to-geometry true
      draw-border-with-background false
  }

  // Opacity rules for specific applications
  /-window-rule {
      match app-id=r#"^(kitty|thunar|org\.telegram\.desktop|discord|vesktop|org\.gnome\.Nautilus|nemo)$"#
      opacity 0.9
  }

  window-rule {
      match app-id=r#"^(org\.telegram\.desktop)$"#
      open-floating true
      open-focused true
      default-column-width { proportion 0.2; }
      default-floating-position x=15 y=15 relative-to="top-right"
  }

  window-rule {
      match title="^(.*[Ff]iles.*)$"
      match app-id="^(org.quickshell)$"
      open-floating true
      open-focused true
  }
''
