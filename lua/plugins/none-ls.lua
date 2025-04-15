-- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = "nvimtools/none-ls-extras.nvim",
	config = function()
		local null_ls = require("null-ls")

		--    Enabled format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				local ext = vim.fn.expand("%:e") -- Récupère l'extension du fichier
				if ext ~= "c" and ext ~= "h" then
					vim.lsp.buf.format()
				end
			end,
		})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					extra_args = {
						"--column-width",
						"195",
					},
				}),
				null_ls.builtins.formatting.clang_format,
				-- require("none-ls.diagnostics.eslint_d"),
			},
		})
	end,
}
