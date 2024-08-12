{
  plugins.lazygit = { enable = true; };

  keymaps = [{
    mode = "n";
    key = "<leader>l";
    action = "<cmd>LazyGit<CR>";
    options.desc = "Open Lazygit";
  }];
}
