local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- This will run init.lua in the lsp folder
require("luaSettings.lsp")
require("luaSettings.cmp")
require("luaSettings.lspsaga")
