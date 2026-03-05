{ pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.screenkey-nvim
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
