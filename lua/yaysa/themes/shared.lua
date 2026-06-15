local M = {}

function M.highlights(palette)
	local bg_solid = palette.bg

	return {
		Normal = { fg = palette.text },
		NormalFloat = { fg = palette.text, bg = "NONE" },
		Comment = { fg = palette.muted, italic = true },
		CursorLine = { bg = palette.sel },
		Visual = { bg = palette.sel, bold = true },
		LineNr = { fg = palette.gutter },
		CursorLineNr = { fg = palette.yellow, bold = true },
		Search = { fg = palette.bg, bg = palette.yellow, bold = true },
		IncSearch = { fg = palette.bg, bg = palette.orange, bold = true },
		MatchParen = { fg = palette.cyan, bold = true },
		Pmenu = { fg = palette.text, bg = palette.panel },
		PmenuSel = { fg = palette.text, bg = palette.sel, bold = true },
		Whitespace = { fg = palette.whitespace },

		Keyword = { fg = palette.plum, bold = true },
		Conditional = { fg = palette.plum, bold = true },
		Repeat = { fg = palette.plum },
		Operator = { fg = palette.royal },
		Function = { fg = palette.cyan },
		Identifier = { fg = palette.text },
		Type = { fg = palette.blue, bold = true },
		Constant = { fg = palette.orange, bold = true },
		String = { fg = palette.magenta },
		Character = { fg = palette.magenta },
		Number = { fg = palette.yellow },
		Boolean = { fg = palette.yellow },
		Special = { fg = palette.orange },

		DiagnosticError = { fg = palette.red },
		DiagnosticWarn = { fg = palette.orange },
		DiagnosticInfo = { fg = palette.cyan },
		DiagnosticHint = { fg = palette.blue },
		DiagnosticUnderlineError = { sp = palette.red, undercurl = true },
		DiagnosticUnderlineWarn = { sp = palette.orange, undercurl = true },
		DiagnosticUnderlineInfo = { sp = palette.cyan, undercurl = true },
		DiagnosticUnderlineHint = { sp = palette.blue, undercurl = true },

		["@comment"] = { link = "Comment" },
		["@keyword"] = { link = "Keyword" },
		["@keyword.return"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@conditional"] = { link = "Conditional" },
		["@repeat"] = { link = "Repeat" },
		["@operator"] = { link = "Operator" },
		["@string"] = { link = "String" },
		["@character"] = { link = "Character" },
		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@function"] = { link = "Function" },
		["@function.call"] = { link = "Function" },
		["@method"] = { link = "Function" },
		["@method.call"] = { link = "Function" },

		["@type"] = { fg = palette.blue, bold = true },
		["@class"] = { fg = palette.royal, bold = true },
		["@interface"] = { fg = palette.softviolet, italic = true },
		["@namespace"] = { fg = palette.text, italic = true },
		["@parameter"] = { fg = palette.softcyan, italic = true },
		["@property"] = { fg = palette.orange },
		["@field"] = { fg = palette.text },
		["@variable.member"] = { fg = palette.text },
		["@punctuation"] = { fg = palette.royal },
		["@tag"] = { fg = palette.yellow, bold = true },
		["@attribute"] = { fg = palette.orange },

		DiffAdd = { fg = palette.cyan },
		DiffChange = { fg = palette.yellow },
		DiffDelete = { fg = palette.red },
		DiffText = { fg = palette.blue, bold = true },

		TelescopeNormal = { fg = palette.text, bg = bg_solid },
		TelescopeBorder = { fg = palette.royal, bg = bg_solid },
		TelescopePromptNormal = { fg = palette.text, bg = bg_solid },
		TelescopePromptBorder = { fg = palette.blue, bg = bg_solid },
		TelescopePromptPrefix = { fg = palette.orange, bg = bg_solid },
		TelescopeResultsNormal = { fg = palette.text, bg = bg_solid },
		TelescopeResultsBorder = { fg = palette.royal, bg = bg_solid },
		TelescopePreviewNormal = { fg = palette.text, bg = bg_solid },
		TelescopePreviewBorder = { fg = palette.royal, bg = bg_solid },
		TelescopeSelection = { fg = palette.text, bg = palette.sel, bold = true },
		TelescopeSelectionCaret = { fg = palette.orange, bg = palette.sel },
		TelescopeMatching = { fg = palette.yellow, bold = true },

		StatusLine = { fg = palette.text, bg = bg_solid },
		StatusLineNC = { fg = palette.muted, bg = bg_solid },
		MiniStatuslineModeNormal = { fg = bg_solid, bg = palette.royal, bold = true },
		MiniStatuslineModeInsert = { fg = bg_solid, bg = palette.cyan, bold = true },
		MiniStatuslineModeVisual = { fg = bg_solid, bg = palette.plum, bold = true },
		MiniStatuslineModeReplace = { fg = bg_solid, bg = palette.red, bold = true },
		MiniStatuslineModeCommand = { fg = bg_solid, bg = palette.orange, bold = true },
		MiniStatuslineFileinfo = { fg = palette.yellow, bg = bg_solid },
		MiniStatuslineDevinfo = { fg = palette.blue, bg = bg_solid },

		WinSeparator = { fg = palette.separator, bg = "NONE" },
		Todo = { fg = palette.yellow, bold = true },
	}
end

function M.apply_highlights(palette)
	local hi = vim.api.nvim_set_hl

	for group, opts in pairs(M.highlights(palette)) do
		hi(0, group, opts)
	end
end

function M.focus_bg()
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return M
