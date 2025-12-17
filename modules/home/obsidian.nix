{ pkgs, ... }:
{
  programs.obsidian =
    let
      pluginSource = pkgs.nur.repos.Ev357;
    in
    {
      enable = true;
      vaults = {
        obs = {
          enable = true;
          target = "Documents/obs";
        };
      };

      defaultSettings = {
        app = {
          vimMode = true;
          showUnsupportedFiles = true;
          showLineNumber = false;
          livePreview = true;
          foldHeading = false;
          foldIndent = false;
          readableLineLength = false;
          smartIndentList = false;
        };
        communityPlugins = with pluginSource; [
          obsidian-excalidraw-plugin
        ];
      };
    };
}
