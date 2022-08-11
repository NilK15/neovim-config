-- require('luaSettings.lsp.java')
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '~/workspace/' .. project_name
local config = {
	-- The command that starts the language server
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xms1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-jar', 'C:/Program Files/Java/java-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
		'-configuration', 'C:/Program Files/Java/java-language-server/config_win',
		'-data', vim.fn.expand('~/workspace') .. workspace_dir
	},


	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir

	root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
	capabilities = capabilities
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
require 'jdtls.setup'.add_commands()

-- Format on Save
vim.api.nvim_command [[augroup Format]]
vim.api.nvim_command [[autocmd! * <buffer>]]
vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
vim.api.nvim_command [[augroup END]]
-- if client.resolved_capabilities.document_formatting then
--   vim.api.nvim_command [[augroup Format]]
--   vim.api.nvim_command [[autocmd! * <buffer>]]
--   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
--   vim.api.nvim_command [[augroup END]]
-- end
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
vim.keymap.set("n", " dn", vim.diagnostic.goto_next, { buffer = 0 })
vim.keymap.set("n", " dp", vim.diagnostic.goto_prev, { buffer = 0 })
vim.keymap.set("n", " td", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
vim.keymap.set("n", " r", vim.lsp.buf.rename, { buffer = 0 })
vim.keymap.set("n", " ca", vim.lsp.buf.code_action, { buffer = 0 })
-- local map = vim.api.nvim_buf_set_keymap
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer= 0})
-- map(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
-- map(0, "n", " r", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
-- map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
-- map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
-- map(0, "n", " td", "<cmd>Telescope diagnostics<cr>", {silent = true, noremap = true})
-- map(0, "n", " dl", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
-- map(0, "n", " dc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", {silent = true, noremap = true})
-- map(0, "n", " dn", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
-- map(0, "n", " dp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
-- map(0, "n", " lf", "<cmd>Lspsaga lsp_finder<cr>", {silent = true, noremap = true})
-- map(0, "n", " ts", "<cmd>Telescope lsp_document_symbols<cr>", {silent = true, noremap = true})
-- map(0, "n", " pd", "<cmd>Lspsaga preview_definition <cr>", {silent = true, noremap = true})
-- map(0, "n", " gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {silent = true, noremap = true})
-- map(0, "n", " ca", "<cmd>lua require('jdtls').code_action()(true)<CR>", {silent = true, noremap = true})
