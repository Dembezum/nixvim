{
  plugins = {
    web-devicons.enable = true;
    lsp-format.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd = {
          enable = true;
          autostart = true;
        };
        yamlls = {
          enable = true;
          settings = {
            schemaStore = {
              enable = false;
              url = "";
            };
          };
        };

        # Golang
        gopls = {
          enable = true;
          autostart = true;
        };

        # astro = {
        #   enable = true;
        # };

        # Lua
        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        # Rust
        # rust_analyzer = {
        #   enable = true;
        #   installRustc = true;
        #   installCargo = true;
        # };

        # Spellcheck
        harper_ls = {
          enable = true;
          settings.settings = {
            "harper-ls" = {
              linters = {
                boring_words = true;
                linking_verbs = true;
                # Rarely useful with coding
                sentence_capitalization = false;
                spell_check = false;
              };
              codeActions = {
                forceStable = true;
              };
            };
          };
        };

        # ts_ls.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        pyright.enable = true; # Python
        # nil_ls.enable = true; # Nix
        dockerls.enable = true; # Docker
        bashls.enable = true; # Bash
        /*
          clangd.enable = true; # C/C++
          csharp_ls.enable = true; # C#
        */
        markdown_oxide.enable = true; # Markdown
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          # Use LSP saga keybinding instead
          K = {
            action = "hover";
            desc = "Hover";
          };
          # "<leader>cw" = {
          #   action = "workspace_symbol";
          #   desc = "Workspace Symbol";
          # };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };

  extraConfigLua = ''
    local _border = "rounded"
    local null_ls = require("null-ls")

    vim.lsp.handlers.hover = { border = _border }
    vim.lsp.handlers.signature_help = { border = _border }

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end;

    null_ls.register({
      name = "alloy_fmt",
      method = null_ls.methods.FORMATTING,
      filetypes = { "alloy" },
      generator = null_ls.generator({
        command = "alloy",
        args = { "fmt", "-" },
        to_stdin = true,
      }),
    })
  '';
}
