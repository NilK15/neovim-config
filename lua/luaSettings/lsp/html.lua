local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require('lspconfig').html.setup {

	capabilities = capabilities,
	on_attach = function()
		-- Format on Save
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
		vim.api.nvim_command [[augroup END]]
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
		local map = vim.api.nvim_buf_set_keymap
		map(0, "n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, noremap = true })
		map(0, "n", " r", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
		map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
		map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
		map(0, "n", " td", "<cmd>Telescope diagnostics<cr>", { silent = true, noremap = true })
		map(0, "n", " dl", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
		map(0, "n", " dc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", { silent = true, noremap = true })
		map(0, "n", " dn", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, noremap = true })
		map(0, "n", " dp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, noremap = true })
		map(0, "n", " lf", "<cmd>Lspsaga lsp_finder<cr>", { silent = true, noremap = true })
		map(0, "n", " ts", "<cmd>Telescope lsp_document_symbols<cr>", { silent = true, noremap = true })
		map(0, "n", " pd", "<cmd>Lspsaga preview_definition <cr>", { silent = true, noremap = true })
		map(0, "n", " gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { silent = true, noremap = true })
	end,

}
