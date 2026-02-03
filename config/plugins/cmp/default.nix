{ config, lib, ... }:
let
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
          table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
in
{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mapping = {
          "<C-d>" = # Lua
            "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = # Lua
            "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = # Lua
            "cmp.mapping.complete()";
          "<C-e>" = # Lua
            "cmp.mapping.close()";
          "<Tab>" = # Lua
            "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
          "<S-Tab>" = # Lua
            "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
          "<CR>" = # Lua
            "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
        };

        preselect = # Lua
          "cmp.PreselectMode.None";

        snippet.expand = # Lua
          "function(args) require('luasnip').lsp_expand(args.body) end";

        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_signature_help";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_document_symbol";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "treesitter";
            priority = 850;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "buffer";
            priority = 500;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "copilot";
            priority = 400;
          }
          {
            name = "rg";
            priority = 300;
          }
          {
            name = "path";
            priority = 300;
          }
          {
            name = "cmdline";
            priority = 300;
          }
          {
            name = "spell";
            priority = 300;
          }
          {
            name = "git";
            priority = 250;
          }
          {
            name = "zsh";
            priority = 250;
          }
          {
            name = "calc";
            priority = 150;
          }
          {
            name = "emoji";
            priority = 100;
          }
        ];
      };
    };

    friendly-snippets.enable = true;

  };
  keymaps = lib.mkIf config.plugins.cmp.enable [
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-k>";
      action.__raw = ''
        function()
         local ls = require "luasnip" 
         if ls.expand_or_jumpable() then
           ls.expand_or_jump()
         end
        end
      '';
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-j>";
      action.__raw = ''
        function()
         local ls = require "luasnip" 
         if ls.jumpable(-1) then
           ls.jump(-1)
         end
        end
      '';
    }
  ];
}

# {
#   # cmp configuration
#
#   plugins = {
#     cmp = {
#       enable = true;
#       settings = {
#         autoEnableSources = true;
#         experimental = { ghost_text = true; };
#         performance = {
#           debounce = 60;
#           fetchingTimeout = 200;
#           maxViewEntries = 30;
#         };
#         snippet = { expand = "luasnip"; };
#         formatting = { fields = [ "kind" "abbr" "menu" ]; };
#         sources = [
#           { name = "nvim_lsp"; }
#           { name = "emoji"; }
#           {
#             name = "buffer"; # text within current buffer
#             option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
#             keywordLength = 3;
#           }
#           { name = "copilot"; } # enable/disable copilot
#           {
#             name = "path"; # file system paths
#             keywordLength = 3;
#           }
#           {
#             name = "luasnip"; # snippets
#             keywordLength = 3;
#           }
#         ];
#
#         window = {
#           completion = { border = "solid"; };
#           documentation = { border = "solid"; };
#         };
#
#         mapping = {
#           "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
#           "<C-j>" = "cmp.mapping.select_next_item()";
#           "<C-k>" = "cmp.mapping.select_prev_item()";
#           "<C-e>" = "cmp.mapping.abort()";
#           "<C-b>" = "cmp.mapping.scroll_docs(-4)";
#           "<C-f>" = "cmp.mapping.scroll_docs(4)";
#           "<C-Space>" = "cmp.mapping.complete()";
#           "<CR>" = "cmp.mapping.confirm({ select = true })";
#           "<S-CR>" =
#             "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
#         };
#       };
#     };
#     cmp-buffer = { enable = true; };
#     cmp-path = {
#       enable = true; # file system paths
#     };
#     cmp_luasnip = {
#       enable = true; # snippets
#     };
#     cmp-cmdline = {
#       enable = true; # autocomplete for cmdline
#     };
#     cmp-nvim-lsp = {
#       enable = true; # LSP
#     };
#
#   };
#
# }
