{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {
      diagnostics = {
        golangci_lint.enable = true;
        ktlint.enable = true;
        statix.enable = true;
        cmake_lint.enable = true;
        markdownlint.enable = true;
        yamllint.enable = true;
        zsh.enable = true;
        buf.enable = true;
      };
      formatting = {
        nixfmt.enable = true;
        markdownlint.enable = true;
        clang_format.enable = true;
        stylua.enable = true;
        djlint.enable = true;
        stylelint.enable = true;
        black.enable = true;
        fantomas.enable = true;
        gleam_format.enable = true;
        gofmt.enable = true;
        goimports.enable = true;
        shellharden.enable = true;
        shfmt.enable = true;
        terragrunt_fmt.enable = true;
        yamlfmt.enable = true;
      };
    };
  };
}
