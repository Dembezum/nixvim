{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "screenkey.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "NStefan002";
        repo = "screenkey.nvim";
        rev = "main";
        sha256 = "PqlzJ9m7lxrOI8YuykYqpTWMUdjjlkhj7J2nM/waz84=";
      };
    })
  ];

  extraConfigLua = ''
    require("screenkey").setup({
      win_opts = {
        relative = "editor",
        anchor = "NE",
        row = 0,
        col = 0,
        width = 40,
        height = 1,
        border = "rounded",
        style = "minimal",
      },
    })
  '';
}
