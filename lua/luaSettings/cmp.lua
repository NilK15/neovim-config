require("luasnip.loaders.from_vscode").lazy_load()

-- Function to help with Super Tab completion (use tab to complete and other functions)
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Icons for completion window
local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = ""
}

-- Setup nvim-cmps.
local luasnip = require("luasnip")
local cmp = require 'cmp'
cmp.setup({
	-- sets the color scheme of completion window kind texts (icon and string after it)
	vim.api.nvim_command [[autocmd ColorScheme * highlight CmpItemKind guifg=none guibg=#4a0444]],
	completion = {
		completeopt = 'menu, menuone,noselect,noinsert',
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	-- set the border and color of the window to show completion information
	window = {
		completion = {
			-- this bordered() sets border/text colors (in config folder of nvim-cmp
			-- cmp.config.window.bordered(),
			border = 'rounded',
			winhighlight = 'Normal:Pmenu,FloatBorder:Normal,CursorLine:PmenuSel,Search:None',
		},
		documentation = {
			-- cmp.config.window.bordered(),
			border = 'rounded',
			winhighlight = 'Normal:Pmenu,FloatBorder:Normal,CursorLine:PmenuSel,Search:None',
		},
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-l>'] = cmp.mapping.complete(),
		['<Cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	-- Sourcing snippets into nvim-cmp to show up in completion
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }, -- default snips from LSP
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'cmdline' },
	}),

	-- Setup for vim commandline completion
	cmp.setup.cmdline(':', {
		-- mapping = cmp.mapping.preset.cmdline(),
		mapping = cmp.mapping.preset.cmdline {
			-- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			-- ['<Cr>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.ConfirmBehavior.Replace }), { 'i', 'c' }),
			-- ["<C-Space>"] = cmp.mapping(function(fallback)
			-- 	if cmp.visible() then
			-- 		cmp.select_next_item()
			-- 	elseif luasnip.expand_or_jumpable() then
			-- 		luasnip.expand_or_jump()
			-- 	elseif has_words_before() then
			-- 		cmp.complete()
			-- 	else
			-- 		fallback()
			-- 	end
			-- end, { "i", "s" }),
		},
		sources = cmp.config.sources({
			{ name = 'path' },
			-- { name = 'buffer' },
			-- This helps stop polluting the list with ../..\blahblah nonsense
			-- { name = 'cmdline', keyword_pattern = [[\!\@<!\w*]] },
		}),
		-- Shows entries horizontally instead of vertically
		-- view = {
		-- 	entries = { name = 'wildmenu', separator = ' . ' }
		-- },
		formatting = {
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				-- Source
				vim_item.menu = ({
					path = "[Path]",
					cmdline = "[Cmd]"
				})[entry.source.name]
				return vim_item
			end
		},
	}),
	-- Setup to populate search (/)
	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			-- keyword pattern allows to use symbols to search as well (*, [, = etc)
			{ name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
		}),
		-- Shows entries horizontally instead of vertically
		-- view = {
		-- 	entries = { name = 'wildmenu', separator = ' . ' }

		-- },
		formatting = {
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				-- Source
				vim_item.menu = ({
					buffer = "[Buffer]",
				})[entry.source.name]
				return vim_item
			end
		},

	})
})
