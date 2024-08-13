{

  plugins = {
    clangd-extensions.enable = true;
    trouble.enable = true;
    lsp-format.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd = {
          enable = true;
          autostart = true;
        };
        jsonls.enable = true;
        lua-ls.enable = true;
        pyright.enable = true;
        bashls.enable = true;
        cssls.enable = true;
        marksman.enable = true;
        zls.enable = true;
        clangd = {
          enable = true;
          autostart = true;
        };
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };

      };

      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
  };
}
