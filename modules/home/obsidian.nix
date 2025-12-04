{
  programs.obsidian = {
    enable = true;
    vaults = {
      Obs = {
        enable = true;
        target = "docs/obs";
      };
    };

    defaultSettings = {
      app = {
        vimMode = true;
      };

      communityPlugins = [
      ];
    };
  };
}
