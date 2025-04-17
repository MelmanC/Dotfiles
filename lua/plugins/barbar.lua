return {
	"romgrk/barbar.nvim",
	event = "VeryLazy",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		auto_hide = 1,
		animation = true,
		exclude_ft = { "alpha" },
		icons = {
			button = false,
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true },
				[vim.diagnostic.severity.WARN] = { enabled = false },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = false },
			},
			separator_at_end = false,
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
		},
		sidebar_filetypes = {
			["neo-tree"] = {
				text = "File Explorer",
				align = "center",
			},
		},
		no_name_title = "Oops",
	},
	config = function(_, opts)
		require("barbar").setup(opts)
		local function toggle_bufferline()
			if vim.o.showtabline == 0 then
				vim.o.showtabline = 2
			else
				vim.o.showtabline = 0
			end
		end

		-- Keymaps
		local wk = require("which-key")
		wk.add({
			{ "<C-i>", "<Cmd>BufferPrevious<CR>", mode = "n", desc = "Previous buffer", icon = { icon = "", color = "white" } },
			{ "<C-o>", "<Cmd>BufferNext<CR>", mode = "n", desc = "Next buffer", icon = { icon = "", color = "white" } },
			{ "<C-S-I>", "<Cmd>BufferMovePrevious<CR>", mode = "n", desc = "Move buffer left", icon = { icon = "", color = "white" } },
			{ "<C-S-O>", "<Cmd>BufferMoveNext<CR>", mode = "n", desc = "Move buffer right", icon = { icon = "", color = "white" } },
			{ "<leader>bt", toggle_bufferline, mode = "n", desc = "Toggle bufferline", icon = { icon = "", color = "white" } },
			{ "<leader>bp", "<Cmd>BufferLinePick<CR>", mode = "n", desc = "Pick buffer", icon = { icon = "󰝁", color = "white" } },
			{ "<C-x>", "<Cmd>BufferClose<CR>", mode = { "n", "i" }, desc = "Delete current buffer", icon = { icon = "󱧖", color = "white" } },
		})
	end,
}
