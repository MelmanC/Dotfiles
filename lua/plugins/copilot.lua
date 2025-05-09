-- Neovim plugin for GitHub Copilot
return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "VeryLazy",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {
			debug = false,
			window = {
				layout = "float",
				width = 0.9,
				height = 0.9,
				border = "rounded",
				title = "Copilot Chat",
			},
			mappings = {
				close = {
					normal = "<Esc>",
				},
			},
			model = "claude-3.7-sonnet",
			question_header = "  Melman ",
			answer_header = "  Copilot ",
			error_header = "  Error ",
			auto_follow_cursor = false,
			insert_at_end = true,
			context = "buffers",
			highlight_selection = false,
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)

			local telescope = require("telescope.builtin")
			local wk = require("which-key")
			wk.add({
				{
					group = "Copilot",
					"<leader>c",
					{ "<leader>cc", chat.toggle, mode = { "n", "v" }, desc = "Toggle Copilot Chat", icon = { icon = "󰭹", color = "white" } },
					{ "<leader>ca", "<Cmd>CopilotChatAgents<CR>", mode = { "n", "v" }, desc = "Select agent", icon = { icon = "󰵰", color = "white" } },
					{ "<leader>cm", "<Cmd>CopilotChatModels<CR>", mode = { "n", "v" }, desc = "Select model", icon = { icon = " ", color = "white" } },
					icon = { icon = " ", color = "white" },
				},
			})
		end,
	},
}
