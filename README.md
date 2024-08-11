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

## Plugins

Below is a list of all the plugins included in this configuration. Each plugin
is managed in its own module under the `config/plugins/` directory.

### List of Plugins

- **alpha**: A Neovim startup screen.
- **bufferline**: Displays a buffer line with tabs at the top of the editor.
- **catppuccin**: A soothing Neovim color scheme.
- **clangd-extensions**: Extensions for the Clangd language server.
- **cmp**: Autocompletion plugin.
- **colorscheme**: Custom color schemes configuration.
- **comment**: Plugin for easy commenting.
- **copilot-lua**: GitHub Copilot integration for Neovim.
- **diffview**: View diffs in Neovim.
- **friendly-snippets**: Snippets collection.
- **harpoon**: Quick navigation between files.
- **indent-blankline**: Adds indentation guides to Neovim.
- **lualine**: A fast and easy-to-configure statusline.
- **luasnip**: Snippet engine for Neovim.
- **markdown-preview**: Preview markdown files in the browser.
- **neorg**: Neovim-specific note-taking plugin.
- **neo-tree**: A file explorer tree.
- **notify**: Notifications for Neovim.
- **nvim-autopairs**: Autopairs plugin for Neovim.
- **nvim-colorizer**: Color highlighter.
- **surround**: Manipulate surroundings like parentheses, brackets, quotes, etc.
- **telescope**: Fuzzy finder over lists.
- **treesitter**: Enhanced syntax highlighting and code structure understanding.
- **trouble**: A pretty list for showing diagnostics, references, etc.
- **twilight**: Dim inactive portions of the code you're editing.
- **undotree**: Visualize the undo history.
- **vim-css-color**: Highlight CSS colors in code.
- **which-key**: Displays available keybindings in Neovim.


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



