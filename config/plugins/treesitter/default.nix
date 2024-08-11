{
  # treesitter configuration

  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true;
      settings = { indent.enable = true; };
    };
    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };
    keymaps = [{
      mode = "n";
      key = "<leader>tc";
      action = "<cmd>TSContextToggle<CR>";
      options.desc = "Toggle treesitter context";
    }];
  };

}
