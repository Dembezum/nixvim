{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPluginFromGitHub {
      name = "screenkey.nvim";
      owner = "NStefan002";
      repo = "screenkey.nvim";
      rev = "main";
      sha256 = "0000000000000000000000000000000000000000000000000000";
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
