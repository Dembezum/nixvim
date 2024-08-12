{
  # copilot-lua configuration

  plugins = {
    copilot-lua = {
      enable = true;
      panel.enabled = false;
      filetypes = {
        markdown = true;
        c = true;
        yaml = true;
        zig = true;
        nix = true;
        "." = false;
      };
    };
    copilot-chat = {
      enable = true;

    };
  };

}
