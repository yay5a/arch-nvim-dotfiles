local M = {}
local shared = require("yaysa.themes.shared")

M.colorscheme = "kanagawa"

-- Use this palette for custom highlights
local palette = {
	bg = "#1f1f28",
	panel = "#16161d",
	sel = "#2d4f67",
	text = "#dcd7ba",
	muted = "#727169",
	yellow = "#dca561",
	orange = "#ffa066",
	cyan = "#7aa89f",
	blue = "#7e9cd8",
	royal = "#957fb8",
	plum = "#938aa9",
	magenta = "#d27e99",
	red = "#c34043",
	burgundy = "#e46876",
	softviolet = "#b8a7d9",
	softcyan = "#98bb6c",
	gutter = "#54546d",
	separator = "#223249",
	whitespace = "#363646",
}

M.opts = {
	compile = false,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = true,
	dimInactive = true,
	terminalColors = true,
	colors = {
		palette = {},
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
			dragon = {},
			lotus = {},
			wave = {},
		},
	},
	overrides = function(colors)
		local theme = colors.theme

		return vim.tbl_deep_extend("force", {
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },
			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			NormalFloat = { bg = "none" },
		}, shared.highlights(palette))
	end,
	theme = "wave",
	background = {
		dark = "wave",
		light = "lotus",
	},
}

function M.apply()
	require("kanagawa").setup(M.opts)
	vim.cmd.colorscheme(M.colorscheme)
end

return M
