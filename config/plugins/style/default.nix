{ lib, config, ... }:

{
  options = {
    colorschemes = {
      enable = lib.mkEnableOption "Enable colorschemes";

      selected = lib.mkOption {
        type = lib.types.enum [
          "catppuccin"
          "gruvbox"
          "nord"
          "cyberdream"
          "dracula"
          "onedark"
          "rose-pine"
          "ayu"
          "base16"
          "everforest"
          "kanagawa"
          "melange"
          "modus"
          "nightfox"
          "one"
          "oxocarbon"
          "palette"
          "poimandres"
          "tokyonight"
          "vscode"
        ];
        default = "catppuccin";
        description = "Select the colorscheme to apply.";
      };
    };
  };

  config = lib.mkIf config.colorschemes.enable {
    colorschemes = {
      catppuccin = lib.mkIf (config.colorschemes.selected == "catppuccin") {
        enable = true;
        settings = {
          flavour = "mocha";
          transparent_background = false;

        };
      };

      gruvbox =
        lib.mkIf (config.colorschemes.selected == "gruvbox") { enable = true; };

      nord =
        lib.mkIf (config.colorschemes.selected == "nord") { enable = true; };

      cyberdream = lib.mkIf (config.colorschemes.selected == "cyberdream") {
        enable = true;
      };

      dracula =
        lib.mkIf (config.colorschemes.selected == "dracula") { enable = true; };

      onedark =
        lib.mkIf (config.colorschemes.selected == "onedark") { enable = true; };

      rose-pine = lib.mkIf (config.colorschemes.selected == "rose-pine") {
        enable = true;
      };

      ayu = lib.mkIf (config.colorschemes.selected == "ayu") { enable = true; };

      base16 =
        lib.mkIf (config.colorschemes.selected == "base16") { enable = true; };

      everforest = lib.mkIf (config.colorschemes.selected == "everforest") {
        enable = true;
      };

      kanagawa = lib.mkIf (config.colorschemes.selected == "kanagawa") {
        enable = true;
      };

      melange =
        lib.mkIf (config.colorschemes.selected == "melange") { enable = true; };

      modus =
        lib.mkIf (config.colorschemes.selected == "modus") { enable = true; };

      nightfox = lib.mkIf (config.colorschemes.selected == "nightfox") {
        enable = true;
      };

      one = lib.mkIf (config.colorschemes.selected == "one") { enable = true; };

      oxocarbon = lib.mkIf (config.colorschemes.selected == "oxocarbon") {
        enable = true;
      };

      palette =
        lib.mkIf (config.colorschemes.selected == "palette") { enable = true; };

      poimandres = lib.mkIf (config.colorschemes.selected == "poimandres") {
        enable = true;
      };

      tokyonight = lib.mkIf (config.colorschemes.selected == "tokyonight") {
        enable = true;
      };

      vscode =
        lib.mkIf (config.colorschemes.selected == "vscode") { enable = true; };
    };
  };
}
