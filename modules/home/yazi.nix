{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    plugins = {
      rich-preview = pkgs.yaziPlugins.rich-preview;
    };

    settings = {
      mgr = {
        ratio = [
          0
          2
          5
        ];
      };

      preview = {
        wrap = "yes";
      };

      # plugin = {
      #   prepend_previewers = [
      #     {
      #       name = "*.csv";
      #       run = "rich-preview";
      #     }
      #     {
      #       name = "*.md";
      #       run = "rich-preview";
      #     }
      #     {
      #       name = "*.json";
      #       run = "rich-preview";
      #     }
      #   ];
      # };
    };
  };
}
