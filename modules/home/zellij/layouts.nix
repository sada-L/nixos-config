{
  home.file.".config/zellij/dev.kdl".text = ''
    layout {
        pane split_direction="vertical" {
            pane split_direction="horizontal" {
                pane split_direction="vertical" {
                    pane size="20%" command="yazi-picker"
                    pane command="hx"
                }
                pane size="25%" split_direction="vertical"{
                    pane size="20%"
                    pane
                }
            }
        }
    }
  '';
}
