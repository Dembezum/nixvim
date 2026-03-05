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
        anchor = "SE",
        width = 40,
        height = 1,
        row = -2,
        col = -2,
        border = "rounded",
        style = "minimal",
      },
      show_in_insert = true,
      show_in_cmd = true,
    })
  '';
}
