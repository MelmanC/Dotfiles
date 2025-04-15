return {
	-- GitHub's Neovim themes
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		name = "github-theme",
		priority = 1000,
		opts = {},
		config = function()
			require("github-theme").setup({
				options = {
					styles = {
						comments = "italic",
					},
				},
			})
		end,
	},
	-- Catppuccin's Neovim themes
	{
		{
			"catppuccin/nvim",
			lazy = true,
			name = "catppuccin",
			priority = 1000,
		},
	},
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				background = "hard",
			})
		end,
	},
}
