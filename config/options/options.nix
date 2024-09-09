{ pkgs, ... }: {
  imports = [ ../plugins/style ];

  colorschemes = {
    enable = true;
    selected = "catppuccin";
  };

  wrapRc = true;
  enableMan = true;
  #  colorschemes.catppuccin = {
  #    enable = true;
  #    # transparentBackground = true;
  #  };
  opts = {
    number = true; # Show line numbers
    relativenumber = true; # Show relative line numbers
    autoindent = true;
    smartindent = true;
    backspace = "indent,eol,start";
    cmdheight = 1;
    colorcolumn = "80";
    cursorline = true;
    expandtab = true;
    updatetime = 100;
    foldenable = false;
    splitbelow = true;
    splitright = true;
    foldexpr = "nvim_treesitter#foldexpr()";
    foldlevel = 5;
    foldmethod = "expr";
    ignorecase = true;
    mouse = "a";
    shiftwidth = 4;
    showtabline = 1;
    signcolumn = "yes";
    smartcase = true;
    tabstop = 4;
    termguicolors = true;
    undofile = false;
    swapfile = false;
    wrap = true;
    clipboard = "unnamedplus";
    scrolloff = 999;
    virtualedit = "block";
    inccommand = "split";
  };

  extraPlugins = with pkgs.vimPlugins; [
    neoformat
    vim-test
    vimux
    vim-quickrun
    vim-be-good
    neorg
    neorg-telescope
  ];
  #  extraConfigLua = builtins.readFile ./config.lua;

  # extraConfigLuaPost =
  #   # lua
  #   ''
  #   '';

  autoCmd = [{
    event = [ "TermOpen" ];
    pattern = [ "*" ];
    command = "startinsert";
  }];
  # };
}
