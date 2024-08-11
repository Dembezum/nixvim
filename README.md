# NixVim Configuration

This repository contains my Nix-based Neovim configuration, managed through a
Nix flake. The setup is modular, allowing for easy customization and extension.
Below, you'll find an overview of the plugins included, the flake structure,
and how to make adjustments to the configuration to fit your needs.

## Overview of Flake Structure

The flake structure is designed to be modular, making it easier to manage and
extend. Here's a brief explanation of the main directories:

- `config/`: Contains the core configuration files.
  - `keymaps/`: Contains custom keymaps. You can add or modify keymaps in `default.nix` and `keymaps.nix`.
  - `lsp/`: Contains LSP (Language Server Protocol) related configurations.
  - `options/`: Contains general Neovim options that you can customize.
  - `plugins/`: Contains individual configurations for each plugin. Each plugin has its own directory with a `default.nix` file.

The root of the repository includes `flake.nix` and `flake.lock`, which are the
main entry points for building the configuration.

## Customizing Plugins, Options, and Keymaps

Each plugin, option, and keymap is configured in its respective `default.nix` file within the appropriate directory. To customize any aspect of your Neovim setup:

1. **Plugins**: Navigate to `config/plugins/<plugin_name>/default.nix`. Here, you can modify the settings or even replace the plugin with another one.
  
2. **Options**: For general Neovim options, edit `config/options/default.nix` or `config/options/options.nix`. This is where you can set various `vim.opt` settings to your preference.
  
3. **Keymaps**: Custom keybindings can be found in `config/keymaps/default.nix` or `config/keymaps/keymaps.nix`. You can add, remove, or modify keybindings as needed.

Simply make the changes and rebuild your flake to apply the new configuration.

## Keybindings Overview
Here are some of the most important keybindings configured in this setup:

<details>
  <summary>#### Navigation and Search</summary>

- `n`         -- Next search result and center
- `N`         -- Previous search result and center
- `Space + w` -- Write file
- `Space + q` -- Quit file

</details>

<details>
  <summary>#### File and Buffer Management</summary>

- `Space + n`   -- Toggle Neotree (File Explorer)
- `Space + pf` -- Telescope find files
- `Space + ps` -- Telescope live grep
- `Space + pg` -- Telescope buffers
- `Space + fb` -- Telescope file browser
- `Space + cb` -- Kill opened output buffer

</details>

<details>
  <summary>#### Code Editing</summary>

- `Space + =`  -- Format code (Neoformat)
- `Space + r`  -- Run selected code (SnipRun)
- `Space + x`  -- Make the current file executable
- `Shift + J`  -- Move selected text down (Visual mode)
- `Shift + K`  -- Move selected text up (Visual mode)

</details>

## Plugins

Below is a list of all the plugins included in this configuration. Each plugin
is managed in its own module under the `config/plugins/` directory.

<details>
  <summary>### List of Plugins</summary>

- [**alpha**](https://github.com/goolord/alpha-nvim): A Neovim startup screen.
- [**bufferline**](https://github.com/akinsho/bufferline.nvim): Displays a buffer line with tabs at the top of the editor.
- [**catppuccin**](https://github.com/catppuccin/nvim): A soothing Neovim color scheme.
- [**clangd-extensions**](https://github.com/p00f/clangd_extensions.nvim): Extensions for the Clangd language server.
- [**cmp**](https://github.com/hrsh7th/nvim-cmp): Autocompletion plugin.
- [**colorscheme**](https://github.com/neovim/nvim-lspconfig/wiki/Installing-language-servers#colorscheme): Custom color schemes configuration.
- [**comment**](https://github.com/numToStr/Comment.nvim): Plugin for easy commenting.
- [**copilot-lua**](https://github.com/github/copilot.vim): GitHub Copilot integration for Neovim.
- [**diffview**](https://github.com/sindrets/diffview.nvim): View diffs in Neovim.
- [**friendly-snippets**](https://github.com/rafamadriz/friendly-snippets): Snippets collection.
- [**harpoon**](https://github.com/ThePrimeagen/harpoon): Quick navigation between files.
- [**indent-blankline**](https://github.com/lukas-reineke/indent-blankline.nvim): Adds indentation guides to Neovim.
- [**lualine**](https://github.com/nvim-lualine/lualine.nvim): A fast and easy-to-configure statusline.
- [**luasnip**](https://github.com/L3MON4D3/LuaSnip): Snippet engine for Neovim.
- [**markdown-preview**](https://github.com/iamcco/markdown-preview.nvim): Preview markdown files in the browser.
- [**neorg**](https://github.com/nvim-neorg/neorg): Neovim-specific note-taking plugin.
- [**neo-tree**](https://github.com/nvim-neo-tree/neo-tree.nvim): A file explorer tree.
- [**notify**](https://github.com/rcarriga/nvim-notify): Notifications for Neovim.
- [**nvim-autopairs**](https://github.com/windwp/nvim-autopairs): Autopairs plugin for Neovim.
- [**nvim-colorizer**](https://github.com/norcalli/nvim-colorizer.lua): Color highlighter.
- [**surround**](https://github.com/kylechui/nvim-surround): Manipulate surroundings like parentheses, brackets, quotes, etc.
- [**telescope**](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder over lists.
- [**treesitter**](https://github.com/nvim-treesitter/nvim-treesitter): Enhanced syntax highlighting and code structure understanding.
- [**trouble**](https://github.com/folke/trouble.nvim): A pretty list for showing diagnostics, references, etc.
- [**twilight**](https://github.com/folke/twilight.nvim): Dim inactive portions of the code you're editing.
- [**undotree**](https://github.com/mbbill/undotree): Visualize the undo history.
- [**vim-css-color**](https://github.com/ap/vim-css-color): Highlight CSS colors in code.
- [**which-key**](https://github.com/folke/which-key.nvim): Displays available keybindings in Neovim.

</details>

## How to run and Use

[Siph](https://github.com/siph), did a fantastic job explaining this:

## Installing into NixOS configuration

Your `nixvim` flake will output a derivation that you can easily include in
either `home.packages` for `home-manager`, or `environment.systemPackages` for
`NixOS`. Or whatever happens with darwin?

You can add your `nixvim` configuration as an input to your `NixOS` configuration like:

```nix
{
 inputs = {
    nixvim-flake.url = "github:<USER>/<REPOSITORY>";
 };
}
```

### Direct installation

With the input added you can reference it directly.

```nix
{ inputs, system, ... }:
{
  # NixOS
  environment.systemPackages = [ inputs.nixvim-flake.packages.${system}.default ];
  # home-manager
  home.packages = [ inputs.nixvim-flake.packages.${system}.default ];
}
```

The binary built by `nixvim` is already named as `nvim` so you can call it just
like you normally would.

### Bonus lazy method

You can just straight up alias something like `nix run
'github:siph/nixvim-flake'` to `nvim`.
