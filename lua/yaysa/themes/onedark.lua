local M = {}
local shared = require("yaysa.themes.shared")

M.colorscheme = "onedark"

-- Use this palette for custom highlights
local palette = {
	bg = "#282c34",
	panel = "#21252b",
	sel = "#3e4451",
	text = "#abb2bf",
	muted = "#7f848e",
	yellow = "#e5c07b",
	orange = "#d19a66",
	cyan = "#56b6c2",
	blue = "#61afef",
	royal = "#528bff",
	plum = "#c678dd",
	magenta = "#c678dd",
	red = "#e06c75",
	burgundy = "#be5046",
	softviolet = "#a991d4",
	softcyan = "#80cbc4",
	gutter = "#5c6370",
	separator = "#181a1f",
	whitespace = "#3b4048",
}

M.opts = {
	hide_endofbuffer = 1,
	termcolors = 256,
	terminal_italics = 1,
}

function M.setup()
	vim.g.onedark_hide_endofbuffer = M.opts.hide_endofbuffer
	vim.g.onedark_termcolors = M.opts.termcolors
	vim.g.onedark_terminal_italics = M.opts.terminal_italics
end

function M.apply()
	M.setup()

	require("lazy").load({ plugins = { "onedark-vim " }, wait = true })

	local plugin = require("lazy.core.config").plugins["onedark-vim"]
	if not plugin or not plugin.dir then
		vim.notify("onedark-vim plugin dir not found", vim.log.levels.ERROR)
		return
	end

	vim.opt.runtimepath:prepend(plugin.dir)

	vim.cmd.colorscheme(M.colorscheme)

	shared.apply_highlights(palette)
end

return M
