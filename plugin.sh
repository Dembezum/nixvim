#!/usr/bin/env bash

# Path to plugin directory
plugins_dir="./config/plugins"

# Plugin names extracted from your plugin.nix
plugins=(
	"colorscheme"
	"friendly-snippets"
	"surround"
	"lualine"
	"luasnip"
	"catppuccin"
	"clangd-extensions"
	"conform"
	"diffview"
	"which-key"
	"bufferline"
	"alpha"
	"vim-css-color"
	"notify"
	"nvim-colorizer"
	"screenkey"
	"telescope"
	"comment"
	"neo-tree"
	"nvim-autopairs"
	"twilight"
	"neorg"
	"treesitter"
	"markdown-preview"
	"indent-blankline"
	"copilot-lua"
	"cmp"
	"undotree"
	"git"
	"harpoon"
	"trouble"
)

# Create directories and files for each plugin
for plugin in "${plugins[@]}"; do
	# Create the plugin directory
	mkdir -p "$plugins_dir/$plugin"

	# Create the default.nix file
	cat >"$plugins_dir/$plugin/default.nix" <<EOL
{
	# $plugin configuration

	plugins = {
	  $plugin = {
		enable = true;
	};
};

}

EOL

done

echo "Plugin directories and files created successfully."
