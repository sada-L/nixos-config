{
  terminal,
  hostKeybinds ? "",
  browser,
  ...
}:
let
  # DMS-specific keybinds
  dmsKeybinds = ''
    // === DMS Controls ===
    Mod+D { spawn "dms" "ipc" "call" "spotlight" "toggle"; }

    Mod+Comma { spawn "ignis" "open-window" "Settings"; }

    Mod+Shift+V {
        spawn "dms" "ipc" "call" "clipboard" "toggle";
    }

    Mod+M {
        spawn "dms" "ipc" "call" "processlist" "toggle";
    }

    Mod+Alt+S {
        spawn "dms" "ipc" "call" "settings" "toggle";
    }

    Mod+N { spawn "dms" "ipc" "call" "notifications" "toggle"; }

    Mod+Shift+N { spawn "dms" "ipc" "call" "notepad" "toggle"; }

    // === Security ===
    Mod+Alt+L {
        spawn "dms" "ipc" "call" "lock" "lock";
    }
    Ctrl+Alt+Delete {
        spawn "dms" "ipc" "call" "processlist" "toggle";
    }

    // === Audio Controls ===
    XF86AudioRaiseVolume allow-when-locked=true {
        spawn "dms" "ipc" "call" "audio" "increment" "3";
    }
    XF86AudioLowerVolume allow-when-locked=true {
        spawn "dms" "ipc" "call" "audio" "decrement" "3";
    }
    XF86AudioMute allow-when-locked=true {
        spawn "dms" "ipc" "call" "audio" "mute";
    }
    XF86AudioMicMute allow-when-locked=true {
        spawn "dms" "ipc" "call" "audio" "micmute";
    }

    // === Monitor Brightness Controls ===
    XF86MonBrightnessUp allow-when-locked=true {
       spawn "dms" "ipc" "call" "brightness" "increment" "5" "";
    }
    XF86MonBrightnessDown allow-when-locked=true {
       spawn "dms" "ipc" "call" "brightness" "decrement" "5" "";
    }
  '';
in
''
  binds {
      // === System & Overview ===
      Mod+O repeat=false { toggle-overview; }
      Mod+Shift+Slash { show-hotkey-overlay; }

      // === Application Launchers ===
      Mod+Return { spawn "${terminal}"; }
      Mod+E { spawn-sh "${terminal} -e yazi"; }
      Mod+B { spawn "${browser}"; }
      Mod+T { spawn "Telegram"; }

      ${dmsKeybinds}

      // === Security ===
      Mod+Shift+Q { quit; }

      // === Keyboard Brightness Controls ===
      XF86KbdBrightnessUp allow-when-locked=true {
          spawn "kbdbrite.sh" "up";
      }
      XF86KbdBrightnessDown allow-when-locked=true {
          spawn "kbdbrite.sh" "down";
      }

      // === Window Management ===
      Mod+Q repeat=false { close-window; }
      Mod+F { maximize-column; }
      Mod+Alt+F { fullscreen-window; }
      Mod+W { toggle-window-floating; }

      // === Focus Navigation ===
      Mod+H     { focus-column-left; }
      Mod+L     { focus-column-right; }

      // === Window Movement ===
      Mod+Shift+Left  { move-column-left; }
      Mod+Shift+Right { move-column-right; }
      Mod+Shift+H     { move-column-left; }
      Mod+Shift+L     { move-column-right; }

      // === Monitor Navigation ===
      Mod+Ctrl+H     { focus-monitor-left; }
      Mod+Ctrl+J     { focus-monitor-down; }
      Mod+Ctrl+K     { focus-monitor-up; }
      Mod+Ctrl+L     { focus-monitor-right; }

      // === Move to Monitor ===
      Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
      Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
      Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
      Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

      // === Workspace Navigation ===
      Mod+J         { focus-workspace-down; }
      Mod+K         { focus-workspace-up; }
      Mod+Shift+J   { move-column-to-workspace-down; }
      Mod+Shift+K   { move-column-to-workspace-up; }

      // === Move Workspaces ===
      Mod+Shift+U         { move-workspace-down; }
      Mod+Shift+I         { move-workspace-up; }

      // === Mouse Wheel Navigation ===
      Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
      Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
      Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
      Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

      Mod+WheelScrollRight      { focus-column-right; }
      Mod+WheelScrollLeft       { focus-column-left; }
      Mod+Ctrl+WheelScrollRight { move-column-right; }
      Mod+Ctrl+WheelScrollLeft  { move-column-left; }

      Mod+Shift+WheelScrollDown      { focus-column-right; }
      Mod+Shift+WheelScrollUp        { focus-column-left; }
      Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
      Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

      // === Numbered Workspaces ===
      Mod+1 { focus-workspace 1; }
      Mod+2 { focus-workspace 2; }
      Mod+3 { focus-workspace 3; }
      Mod+4 { focus-workspace 4; }
      Mod+5 { focus-workspace 5; }
      Mod+6 { focus-workspace 6; }
      Mod+7 { focus-workspace 7; }
      Mod+8 { focus-workspace 8; }
      Mod+9 { focus-workspace 9; }

      // === Move to Numbered Workspaces ===
      Mod+Ctrl+1 { move-column-to-workspace 1; }
      Mod+Ctrl+2 { move-column-to-workspace 2; }
      Mod+Ctrl+3 { move-column-to-workspace 3; }
      Mod+Ctrl+4 { move-column-to-workspace 4; }
      Mod+Ctrl+5 { move-column-to-workspace 5; }
      Mod+Ctrl+6 { move-column-to-workspace 6; }
      Mod+Ctrl+7 { move-column-to-workspace 7; }
      Mod+Ctrl+8 { move-column-to-workspace 8; }
      Mod+Ctrl+9 { move-column-to-workspace 9; }

      // === Column Management ===
      Mod+BracketLeft  { consume-or-expel-window-left; }
      Mod+BracketRight { consume-or-expel-window-right; }
      Mod+Period { expel-window-from-column; }

      // === Sizing & Layout ===
      Mod+R { switch-preset-column-width; }
      Mod+Shift+R { switch-preset-window-height; }
      Mod+Ctrl+R { reset-window-height; }
      Mod+Ctrl+F { expand-column-to-available-width; }
      Mod+Ctrl+C { center-column; }

      // === Manual Sizing ===
      Mod+Minus { set-column-width "-10%"; }
      Mod+Equal { set-column-width "+10%"; }
      Mod+Shift+Minus { set-window-height "-10%"; }
      Mod+Shift+Equal { set-window-height "+10%"; }

      // === Screenshots ===
      Mod+Shift+S { screenshot; }
      XF86Launch1 { screenshot; }
      Ctrl+XF86Launch1 { screenshot-screen; }
      Alt+XF86Launch1 { screenshot-window; }
      Print { screenshot; }
      Ctrl+Print { screenshot-screen; }
      Alt+Print { screenshot-window; }

      // === Ignis Screen Recording ===
      Mod+Alt+Shift+R { spawn "ignis" "run-command" "recorder-record-screen"; }
      Mod+Alt+Shift+S { spawn "ignis" "run-command" "recorder-record-region"; }
      Mod+Alt+Shift+W { spawn "ignis" "run-command" "recorder-record-portal"; }

      // === System Controls ===
      Mod+Escape { spawn "ignis" "open-window" "PowerMenu"; }
      Mod+Alt+P { power-off-monitors; }

      // === Color picker ===
      Mod+Shift+C { spawn-sh "niri msg pick-color | grep 'Hex:' | cut -d' ' -f2 | wl-copy"; }

      // === Dynamic Cast ===
      Mod+P { set-dynamic-cast-monitor; }
      Mod+Shift+P { set-dynamic-cast-window; }
      Mod+Ctrl+P { clear-dynamic-cast-target; }

      ${hostKeybinds}
  }
''
