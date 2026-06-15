local M = {}
local shared = require("yaysa.themes.shared")

M.colorscheme = "onedark"

-- Use this palette for custom highlights
local palette = {
	bg = "#1e2127",
	panel = "#252932",
	sel = "#333842",
	text = "#abb2bf",
	muted = "#5c6370",
	yellow = "#e5c07b",
	orange = "#d19a66",
	cyan = "#56b6c2",
	blue = "#61afef",
	royal = "#528bff",
	plum = "#c678dd",
	magenta = "#c678dd",
	red = "#e06c75",
	burgundy = "#be5046",
	softviolet = "#b57edc",
	softcyan = "#7fdbca",
	gutter = "#4b5263",
	separator = "#2c313a",
	whitespace = "#3b4048",
}

M.opts = {
	highlights = shared.highlights(palette),
	options = {
		cursorline = false,
		highlight_inactive_windows = true,
		lualine_transparency = false,
		terminal_colors = true,
		transparency = true,
	},
	styles = {
		comments = "italic",
		conditionals = "bold",
		constants = "bold",
		functions = "NONE",
		keywords = "bold",
		methods = "NONE",
		numbers = "NONE",
		operators = "NONE",
		parameters = "italic",
		strings = "NONE",
		types = "bold",
		variables = "NONE",
		virtual_text = "italic",
	},
	plugins = {
		blink_cmp = true,
		gitsigns = true,
		mason = true,
		mini_diff = true,
		mini_icons = true,
		nvim_dap = true,
		nvim_dap_ui = true,
		nvim_lsp = true,
		nvim_tree = true,
		telescope = true,
		treesitter = true,
		which_key = true,
	},
}

function M.apply()
	require("lazy").load({ plugins = { "onedarkpro" }, wait = true })

	local plugin = require("lazy.core.config").plugins["onedarkpro"]
	if not plugin or not plugin.dir then
		vim.notify("onedarkpro plugin dir not found", vim.log.levels.ERROR)
		return
	end

	vim.opt.runtimepath:prepend(plugin.dir)

	require("onedarkpro").setup(M.opts)
	vim.cmd.colorscheme(M.colorscheme)
end

return M
