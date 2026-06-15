local M = {}
local shared = require("yaysa.themes.shared")

M.colorscheme = "tokyodark"
-- Use this palette for custom highlights
local palette = {
	bg = "#11121d",
	panel = "#151621",
	sel = "#1b1c2b",
	text = "#a0a8cd",
	muted = "#565f89",
	yellow = "#f0c674",
	orange = "#ff9e64",
	cyan = "#7dcfff",
	blue = "#7aa2f7",
	royal = "#3d59a1",
	plum = "#bb9af7",
	magenta = "#ff007c",
	red = "#f7768e",
	burgundy = "#db4b4b",
	softviolet = "#9d7cd8",
	softcyan = "#89ddff",
	gutter = "#3b4261",
	separator = "#1f2335",
	whitespace = "#292e42",
}

M.opts = {
	gamma = 1.0,
	terminal_colors = true,
	transparent_background = true,
	styles = {
		comments = { italic = true },
		functions = {},
		identifiers = {},
		keywords = { italic = true },
		variables = {},
	},
	custom_highlights = shared.highlights(palette),
}

function M.apply()
	require("tokyodark").setup(M.opts)
	vim.cmd.colorscheme(M.colorscheme)
end

return M
