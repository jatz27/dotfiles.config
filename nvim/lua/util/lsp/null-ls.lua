local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
--[[ local diagnostics = null_ls.builtins.diagnostics ]]
null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
		formatting.prettier,
		--[[ formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }), ]]
		--[[ formatting.black, ]]
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.latexindent,
		formatting.gofmt,
		--[[ formatting.rustfmt, ]]
		--[[ formatting.sql_formatter, ]]
		--[[ diagnostics.flake8, ]]
		--[[ diagnostics.eslint, ]]
	},
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd([[
                augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                augroup END
                ]])
		end
	end,
})
