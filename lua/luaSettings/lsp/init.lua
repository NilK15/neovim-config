local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require("luaSettings.lsp.handlers").setup()
require("luaSettings.lsp.typescript")
require("luaSettings.lsp.lua")
require("luaSettings.lsp.vim")
require("luaSettings.lsp.html")
-- require("luaSettings.lsp.java") Keep this commented as this is done via the file in ftplugin/java.lua
