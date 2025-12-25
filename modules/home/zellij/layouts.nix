{ config, ... }:
{
  home.file.".config/zellij/dev.kdl".text = ''
    keybinds {
        locked {
            bind "Ctrl t" { NewPane "Down"; }
            bind "Ctrl r" { CloseFocus; }
        }
    }
    layout {
        pane split_direction="vertical" {
            pane split_direction="horizontal" {
                pane split_direction="vertical" {
                    pane size="20%" command="broot" {
                        args "--conf" "${config.home.homeDirectory}/.config/broot/conf.hjson"
                    }
                    pane command="hx"
                }
            }
        }
    }
  '';
}
