{ lib, pkgs, ... }:
{
  plugins = {
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd = {
          enable = true; # Enable Nix language server
          autostart = true; # Automatically start Nix language server
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

        # Lua
        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        # Rust
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };

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

        ts_ls.enable = true; # TS/JS
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

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
  '';
}

# {
#
#   # Enable various plugins for enhanced LSP support in Neovim
#   plugins = {
#     clangd-extensions.enable = true;
#     lsp-format.enable = true; # Enable automatic formatting via LSP
#     web-devicons.enable = true; # Enable web devicons
#     csvview.enable = true;
#     lsp-signature = {
#       enable = true;
#       autoLoad = true;
#
#     };
#     lsp-lines = {
#       enable = true; # Enable inline diagnostics via LSP
#       autoLoad = true;
#
#     };
#
#     # Configure LSP settings
#     lsp = {
#       enable = true; # Enable LSP support
#       inlayHints = true; # Enable inlay hints for better code understanding
#       servers = {
#         nixd = {
#           enable = true; # Enable Nix language server
#           autostart = true; # Automatically start Nix language server
#         };
#         ts_ls.enable = true; # Enable TypeScript language server
#         gopls.enable = true; # Enable GO LSP
#         denols.enable = true; # Enable Deno language server
#         html.enable = true; # Enable HTML language server
#         jsonls.enable = true; # Enable JSON language server
#         lua_ls.enable = true; # Enable Lua language server
#         terraformls.enable = true; # Enable Terraform language server
#         pyright.enable = true; # Enable Python language server
#         bashls.enable = true; # Enable Bash language server
#         yamlls = {
#           enable = true;
#           filetypes = [ "yaml" "yml" ];
#         };
#         docker_compose_language_service.enable = true;
#         cssls.enable = true; # Enable CSS language server
#         zls.enable = true; # Enable Zig language server
#         clangd = {
#           enable = true; # Enable Clangd language server for C/C++
#           autostart = true; # Automatically start Clangd language server
#         };
#         helm_ls = {
#           enable = true;
#           filetypes = [ "helm" ];
#         };
#         rust_analyzer = {
#           enable = true; # Enable Rust language server
#           installRustc = true; # Install Rust compiler
#           installCargo = true; # Install Cargo package manager
#         };
#       };
#
#       # Key mappings for LSP functionalities in Neovim
#       keymaps.lspBuf = {
#         gd = {
#           action =
#             "definition"; # Action to go to the definition of the symbol under the cursor
#           desc = "Goto Definition"; # Description for the 'gd' key mapping
#         };
#         gr = {
#           action =
#             "references"; # Action to find all references to the symbol under the cursor
#           desc = "Goto References"; # Description for the 'gr' key mapping
#         };
#         gD = {
#           action =
#             "declaration"; # Action to go to the declaration of the symbol under the cursor
#           desc = "Goto Declaration"; # Description for the 'gD' key mapping
#         };
#         gI = {
#           action =
#             "implementation"; # Action to go to the implementation of the symbol under the cursor
#           desc = "Goto Implementation"; # Description for the 'gI' key mapping
#         };
#         gT = {
#           action =
#             "type_definition"; # Action to go to the type definition of the symbol under the cursor
#           desc = "Type Definition"; # Description for the 'gT' key mapping
#         };
#         K = {
#           action =
#             "hover"; # Action to show hover information for the symbol under the cursor
#           desc = "Hover"; # Description for the 'K' key mapping
#         };
#         "<leader>cw" = {
#           action =
#             "workspace_symbol"; # Action to search for symbols across the entire workspace
#           desc =
#             "Workspace Symbol"; # Description for the '<leader>cw' key mapping
#         };
#         "<leader>cr" = {
#           action =
#             "rename"; # Action to rename the symbol under the cursor across the codebase
#           desc = "Rename"; # Description for the '<leader>cr' key mapping
#         };
#       };
#     };
#   };
# }
