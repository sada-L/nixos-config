{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop.override {
      rocmSupport = true;
      cudaSupport = true;
    };
    settings = {
      color_theme = "tokyo-night";
      theme_background = false;
      truecolor = true;
      update_ms = 500;
      vim_keys = true;
      rounded_corners = true;
      proc_tree = false;
      show_gpu_info = "on";
      show_uptime = true;
      show_coretemp = true;
      cpu_sensor = "auto";
      show_disks = true;
      only_physical = true;
      io_mode = true;
      io_graph_combined = false;
    };
  };
}
