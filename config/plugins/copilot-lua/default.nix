{
  # copilot-lua configuration
  plugins = {
    copilot-lua = {
      settings = {
        suggestion.enabled = false;
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
      enable = false;
    };
    copilot-chat = { enable = true; };
  };
}
