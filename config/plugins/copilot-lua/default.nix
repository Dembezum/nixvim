{
  # copilot-lua configuration

  plugins = {
    copilot-lua = {
      enable = true;
      filetypes = {
        markdown = true;
        c = true;
        yaml = true;
        zig = true;
        nix = true;
        "." = false;
      };
    };
  };

}
