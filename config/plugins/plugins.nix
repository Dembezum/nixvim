{
  plugins = {
    friendly-snippets.enable = true;
    surround.enable = true;
    lualine.enable = true;
    which-key.enable = true;
    bufferline.enable = true;

    ## startup theme...
    alpha = {
      enable = true;
      theme = "startify";
      iconsEnabled = true;
    };

    vim-css-color.enable = true;
    notify.enable = true;

    nvim-colorizer.enable = true;

    telescope = {
      enable = true;
      extensions = {
        file-browser = { enable = true; };
        ui-select = { enable = true; };
      };
    };

    comment.enable = true;
    neo-tree.enable = true;
    twilight.enable = true;

    nvim-autopairs.enable = true;

    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = { indent.enable = true; };
    };

    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };
    markdown-preview = {
      enable = true;
      settings = {
        browser = "firefox";
        echo_preview_url = true;
        port = "6969";
        preview_options = {
          disable_filename = true;
          disable_sync_scroll = true;
          sync_scroll_type = "middle";
        };
        theme = "dark";
      };
    };
    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          char = "│"; # "│" or "▎"
        };
        scope = {
          enabled = true;
          show_start = true;
        };
        exclude = {
          buftypes = [ "terminal" "nofile" ];
          filetypes = [
            "help"
            "alpha"
            "dashboard"
            "neo-tree"
            "Trouble"
            "trouble"
            "lazy"
            "mason"
            "notify"
            "toggleterm"
            "lazyterm"
          ];
        };
      };
    };
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
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = { expand = "luasnip"; };
        formatting = { fields = [ "kind" "abbr" "menu" ]; };
        sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          { name = "copilot"; } # enable/disable copilot
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
        ];

        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };

        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" =
            "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true; # LSP
    };
    cmp-buffer = { enable = true; };
    cmp-path = {
      enable = true; # file system paths
    };
    cmp_luasnip = {
      enable = true; # snippets
    };
    cmp-cmdline = {
      enable = true; # autocomplete for cmdline
    };
		undotree = {
			enable = true;
			settings = {
				autoOpenDiff = true;
				focusOnToggle = true;
			};
		};
		keymaps = [{
			mode = "n";
			key = "<leader>ut";
			action = "<cmd>UndotreeToggle<CR>";
			options = {
				silent = true;
				desc = "Undotree";
			};
		}];
  };
}
