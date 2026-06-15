local M = {}

local C = {
	yellow = "#FFDA63",
	orange = "#FFA500",
	cyan = "#46D2E8",
	blue = "#1E90FF",
	royal = "#7B68EE",
	plum = "#DA70D6",
	red = "#DC143C",
	burgundy = "#8B0000",
	text = "#F5F5F5",
	muted = "#A9A9A9",
	sel = "#2F4F4F",
	magenta = "#DA70D6",
	panel = "#16141f",
	softviolet = "#B39DDB",
	softcyan = "#7FDBFF",
}
-- local C = {
--     base = '#191724',
--     surface = '#1f1d2e',
--     overlay = '#26233a',
--     muted = '#6e6a86',
--     subtle = '#908caa',
--     text = '#e0def4',
--     love = '#eb6f92',
--     gold = '#f6c177',
--     rose = '#ebbcba',
--     pine = '#31748f',
--     foam = '#9ccfd8',
--     iris = '#c4a7e7',
--     highlight_low = '#21202e',
--     highlight_med = '#403d52',
--     highlight_high = '#524f67',
-- }

local SOLID = "#0e1013"
-- local SOLID = C.base

function M.apply()
	require("rose-pine").setup({
		variant = "main",
		dark_variant = "main",
		disable_background = true,
		dim_inactive_windows = true,
		extend_background_behind_borders = true,

		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},

		styles = {
			bold = true,
			italic = true,
			transparency = true,
		},

		groups = {
			border = "muted",
			link = "iris",
			panel = "surface",
			error = "love",
			hint = "iris",
			info = "foam",
			note = "pine",
			todo = "rose",
			warn = "gold",

			git_add = "foam",
			git_change = "rose",
			git_delete = "love",
			git_dirty = "rose",
			git_ignore = "muted",
			git_merge = "iris",
			git_rename = "pine",
			git_stage = "iris",
			git_text = "rose",
			git_untracked = "subtle",

			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
	})

	vim.cmd.colorscheme("rose-pine-main")

	local hi = vim.api.nvim_set_hl

	-- 	-- Editor UI
	-- 	hi(0, "Normal", { fg = C.text, bg = "NONE" })
	-- 	hi(0, "NormalFloat", { fg = C.text, bg = "NONE" })
	-- 	hi(0, "FloatBorder", { fg = C.muted, bg = "NONE" })
	-- 	hi(0, "Comment", { fg = C.muted, italic = true })
	-- 	hi(0, "CursorLine", { bg = C.highlight_low })
	-- 	hi(0, "Visual", { bg = C.highlight_med, bold = true })
	-- 	hi(0, "LineNr", { fg = C.muted })
	-- 	hi(0, "CursorLineNr", { fg = C.gold, bold = true })
	-- 	hi(0, "Search", { fg = C.base, bg = C.gold, bold = true })
	-- 	hi(0, "IncSearch", { fg = C.base, bg = C.rose, bold = true })
	-- 	hi(0, "MatchParen", { fg = C.foam, bg = C.highlight_med, bold = true })
	-- 	hi(0, "Pmenu", { fg = C.text, bg = C.surface })
	-- 	hi(0, "PmenuSel", { fg = C.text, bg = C.highlight_med, bold = true })
	-- 	hi(0, "Whitespace", { fg = C.overlay })
	-- 	hi(0, "SignColumn", { fg = C.muted, bg = "NONE" })

	-- 	-- Syntax
	-- 	hi(0, "Keyword", { fg = C.iris, bold = true })
	-- 	hi(0, "Conditional", { fg = C.iris, bold = true })
	-- 	hi(0, "Repeat", { fg = C.iris })
	-- 	hi(0, "Operator", { fg = C.subtle })
	-- 	hi(0, "Function", { fg = C.foam })
	-- 	hi(0, "Identifier", { fg = C.text })
	-- 	hi(0, "Type", { fg = C.pine, bold = true })
	-- 	hi(0, "Constant", { fg = C.gold, bold = true })
	-- 	hi(0, "String", { fg = C.rose })
	-- 	hi(0, "Character", { fg = C.rose })
	-- 	hi(0, "Number", { fg = C.gold })
	-- 	hi(0, "Boolean", { fg = C.gold })
	-- 	hi(0, "Special", { fg = C.rose })

	-- 	-- Diagnostics
	-- 	hi(0, "DiagnosticError", { fg = C.love })
	-- 	hi(0, "DiagnosticWarn", { fg = C.gold })
	-- 	hi(0, "DiagnosticInfo", { fg = C.foam })
	-- 	hi(0, "DiagnosticHint", { fg = C.iris })
	-- 	hi(0, "DiagnosticUnderlineError", { sp = C.love, undercurl = true })
	-- 	hi(0, "DiagnosticUnderlineWarn", { sp = C.gold, undercurl = true })
	-- 	hi(0, "DiagnosticUnderlineInfo", { sp = C.foam, undercurl = true })
	-- 	hi(0, "DiagnosticUnderlineHint", { sp = C.iris, undercurl = true })

	-- 	local link = function(a, b)
	-- 		hi(0, a, { link = b })
	-- 	end

	-- 	link("@comment", "Comment")
	-- 	link("@keyword", "Keyword")
	-- 	link("@keyword.return", "Keyword")
	-- 	link("@keyword.function", "Keyword")
	-- 	link("@conditional", "Conditional")
	-- 	link("@repeat", "Repeat")
	-- 	link("@operator", "Operator")
	-- 	link("@string", "String")
	-- 	link("@character", "Character")
	-- 	link("@boolean", "Boolean")
	-- 	link("@number", "Number")
	-- 	link("@constant", "Constant")
	-- 	link("@constant.builtin", "Constant")
	-- 	link("@function", "Function")
	-- 	link("@function.call", "Function")
	-- 	link("@method", "Function")
	-- 	link("@method.call", "Function")

	-- 	-- Treesitter accents
	-- 	hi(0, "@type", { fg = C.pine, bold = true })
	-- 	hi(0, "@class", { fg = C.iris, bold = true })
	-- 	hi(0, "@interface", { fg = C.iris, italic = true })
	-- 	hi(0, "@namespace", { fg = C.subtle, italic = true })
	-- 	hi(0, "@parameter", { fg = C.rose, italic = true })
	-- 	hi(0, "@property", { fg = C.rose })
	-- 	hi(0, "@field", { fg = C.text })
	-- 	hi(0, "@variable.member", { fg = C.text })
	-- 	hi(0, "@punctuation", { fg = C.subtle })
	-- 	hi(0, "@tag", { fg = C.iris, bold = true })
	-- 	hi(0, "@attribute", { fg = C.rose })

	-- 	-- Diff
	-- 	hi(0, "DiffAdd", { fg = C.foam })
	-- 	hi(0, "DiffChange", { fg = C.gold })
	-- 	hi(0, "DiffDelete", { fg = C.love })
	-- 	hi(0, "DiffText", { fg = C.pine, bold = true })

	-- 	-- Telescope
	-- 	local bg_solid = SOLID
	-- 	hi(0, "TelescopeNormal", { fg = C.text, bg = bg_solid })
	-- 	hi(0, "TelescopeBorder", { fg = C.muted, bg = bg_solid })
	-- 	hi(0, "TelescopePromptNormal", { fg = C.text, bg = bg_solid })
	-- 	hi(0, "TelescopePromptBorder", { fg = C.iris, bg = bg_solid })
	-- 	hi(0, "TelescopePromptPrefix", { fg = C.rose, bg = bg_solid })
	-- 	hi(0, "TelescopeResultsNormal", { fg = C.text, bg = bg_solid })
	-- 	hi(0, "TelescopeResultsBorder", { fg = C.muted, bg = bg_solid })
	-- 	hi(0, "TelescopePreviewNormal", { fg = C.text, bg = bg_solid })
	-- 	hi(0, "TelescopePreviewBorder", { fg = C.muted, bg = bg_solid })
	-- 	hi(0, "TelescopeSelection", { fg = C.text, bg = C.highlight_med, bold = true })
	-- 	hi(0, "TelescopeSelectionCaret", { fg = C.rose, bg = C.highlight_med })
	-- 	hi(0, "TelescopeMatching", { fg = C.gold, bold = true })

	-- 	-- Status line
	-- 	hi(0, "StatusLine", { fg = C.text, bg = C.surface })
	-- 	hi(0, "StatusLineNC", { fg = C.muted, bg = C.surface })
	-- 	hi(0, "MiniStatuslineModeNormal", { fg = C.base, bg = C.iris, bold = true })
	-- 	hi(0, "MiniStatuslineModeInsert", { fg = C.base, bg = C.foam, bold = true })
	-- 	hi(0, "MiniStatuslineModeVisual", { fg = C.base, bg = C.rose, bold = true })
	-- 	hi(0, "MiniStatuslineModeReplace", { fg = C.base, bg = C.love, bold = true })
	-- 	hi(0, "MiniStatuslineModeCommand", { fg = C.base, bg = C.gold, bold = true })
	-- 	hi(0, "MiniStatuslineFileinfo", { fg = C.gold, bg = C.surface })
	-- 	hi(0, "MiniStatuslineDevinfo", { fg = C.pine, bg = C.surface })

	-- 	hi(0, "WinSeparator", { fg = C.highlight_med, bg = "NONE" })
	-- 	hi(0, "Todo", { fg = C.gold, bg = C.highlight_med, bold = true })
	-- end

	-- function M.focus_bg()
	-- 	-- if on == nil then
	-- 	--     on = true
	-- 	-- end
	-- 	-- if on then
	-- 	--     vim.api.nvim_set_hl(0, 'Normal', { fg = C.text, bg = C.base })
	-- 	--     vim.api.nvim_set_hl(0, 'NormalFloat', { fg = C.text, bg = C.surface })
	-- 	-- else
	-- 	vim.api.nvim_set_hl(0, "Normal", { fg = C.text, bg = "NONE" })
	-- 	vim.api.nvim_set_hl(0, "NormalFloat", { fg = C.text, bg = "NONE" })
	-- 	-- end
	-- end

	-- return M

	hi(0, "Normal", { fg = C.text })
	hi(0, "Comment", { fg = C.muted, italic = true })
	hi(0, "CursorLine", { bg = C.sel })
	hi(0, "Visual", { bg = C.sel, bold = true })
	hi(0, "LineNr", { fg = "#525a6a" })
	hi(0, "CursorLineNr", { fg = C.yellow, bold = true })
	hi(0, "Search", { fg = SOLID, bg = C.yellow, bold = true })
	hi(0, "IncSearch", { fg = SOLID, bg = C.orange, bold = true })
	hi(0, "MatchParen", { fg = C.cyan, bold = true })
	hi(0, "Pmenu", { fg = C.text, bg = C.panel })
	hi(0, "PmenuSel", { fg = C.text, bg = C.sel, bold = true })
	hi(0, "Whitespace", { fg = "#3a4355" })

	hi(0, "Keyword", { fg = C.plum, bold = true })
	hi(0, "Conditional", { fg = C.plum, bold = true })
	hi(0, "Repeat", { fg = C.plum })
	hi(0, "Operator", { fg = C.royal })
	hi(0, "Function", { fg = C.cyan })
	hi(0, "Identifier", { fg = C.text })
	hi(0, "Type", { fg = C.blue, bold = true })
	hi(0, "Constant", { fg = C.orange, bold = true })
	hi(0, "String", { fg = C.magenta })
	hi(0, "Character", { fg = C.magenta })
	hi(0, "Number", { fg = C.yellow })
	hi(0, "Boolean", { fg = C.yellow })
	hi(0, "Special", { fg = C.orange })

	hi(0, "DiagnosticError", { fg = C.red })
	hi(0, "DiagnosticWarn", { fg = C.orange })
	hi(0, "DiagnosticInfo", { fg = C.cyan })
	hi(0, "DiagnosticHint", { fg = C.blue })
	hi(0, "DiagnosticUnderlineError", { sp = C.red, undercurl = true })
	hi(0, "DiagnosticUnderlineWarn", { sp = C.orange, undercurl = true })
	hi(0, "DiagnosticUnderlineInfo", { sp = C.cyan, undercurl = true })
	hi(0, "DiagnosticUnderlineHint", { sp = C.blue, undercurl = true })

	local link = function(a, b)
		hi(0, a, { link = b })
	end

	link("@comment", "Comment")
	link("@keyword", "Keyword")
	link("@keyword.return", "Keyword")
	link("@keyword.function", "Keyword")
	link("@conditional", "Conditional")
	link("@repeat", "Repeat")
	link("@operator", "Operator")
	link("@string", "String")
	link("@character", "Character")
	link("@boolean", "Boolean")
	link("@number", "Number")
	link("@constant", "Constant")
	link("@constant.builtin", "Constant")
	link("@function", "Function")
	link("@function.call", "Function")
	link("@method", "Function")
	link("@method.call", "Function")

	hi(0, "@type", { fg = C.blue, bold = true })
	hi(0, "@class", { fg = C.royal, bold = true })
	hi(0, "@interface", { fg = C.softviolet, italic = true })
	hi(0, "@namespace", { fg = C.text, italic = true })
	hi(0, "@parameter", { fg = C.softcyan, italic = true })
	hi(0, "@property", { fg = C.orange })
	hi(0, "@field", { fg = C.text })
	hi(0, "@variable.member", { fg = C.text })
	hi(0, "@punctuation", { fg = C.royal })
	hi(0, "@tag", { fg = C.yellow, bold = true })
	hi(0, "@attribute", { fg = C.orange })

	hi(0, "DiffAdd", { fg = C.cyan })
	hi(0, "DiffChange", { fg = C.yellow })
	hi(0, "DiffDelete", { fg = C.red })
	hi(0, "DIFfText", { fg = C.blue, bold = true })

	local bg_solid = SOLID
	hi(0, "TelescopeNormal", { fg = C.text, bg = bg_solid })
	hi(0, "TelescopeBorder", { fg = C.royal, bg = bg_solid })
	hi(0, "TelescopePromptNormal", { fg = C.text, bg = bg_solid })
	hi(0, "TelescopePromptBorder", { fg = C.blue, bg = bg_solid })
	hi(0, "TelescopePromptPrefix", { fg = C.orange, bg = bg_solid })
	hi(0, "TelescopeResultsNormal", { fg = C.text, bg = bg_solid })
	hi(0, "TelescopeResultsBorder", { fg = C.royal, bg = bg_solid })
	hi(0, "TelescopePreviewNormal", { fg = C.text, bg = bg_solid })
	hi(0, "TelescopePreviewBorder", { fg = C.royal, bg = bg_solid })
	hi(0, "TelescopeSelection", { fg = C.text, bg = C.sel, bold = true })
	hi(0, "TelescopeSelectionCaret", { fg = C.orange, bg = C.sel })
	hi(0, "TelescopeMatching", { fg = C.yellow, bold = true })

	hi(0, "StatusLine", { fg = C.text, bg = bg_solid })
	hi(0, "StatusLineNC", { fg = C.muted, bg = bg_solid })
	hi(0, "MiniStatuslineModeNormal", { fg = bg_solid, bg = C.royal, bold = true })
	hi(0, "MiniStatuslineModeInsert", { fg = bg_solid, bg = C.cyan, bold = true })
	hi(0, "MiniStatuslineModeVisual", { fg = bg_solid, bg = C.plum, bold = true })
	hi(0, "MiniStatuslineModeReplace", { fg = bg_solid, bg = C.red, bold = true })
	hi(0, "MiniStatuslineModeCommand", { fg = bg_solid, bg = C.orange, bold = true })
	hi(0, "MiniStatuslineFileinfo", { fg = C.yellow, bg = bg_solid })
	hi(0, "MiniStatuslineDevinfo", { fg = C.blue, bg = bg_solid })

	hi(0, "WinSeparator", { fg = "#1f2a3a", bg = "NONE" })
	hi(0, "Todo", { fg = C.yellow, bold = true })
end

function M.focus_bg()
	-- if on == nil then
	-- 	on = true
	-- end
	-- if on then
	-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "#0e1013" })
	-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0e1013" })
	-- else
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	-- end
end

return M
