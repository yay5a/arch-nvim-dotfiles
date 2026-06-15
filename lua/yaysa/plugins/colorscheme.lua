---@module "lazy"
---@type LazySpec
return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		lazy = false,
	},
	{
		"olimorris/onedarkpro.nvim",
		name = "onedarkpro",
		priority = 1000,
		lazy = true,
		opts = require("yaysa.themes.onedarkpro").opts,
	},
	{
		"joshdick/onedark.vim",
		name = "onedark-vim",
		lazy = true,
		init = function()
			require("yaysa.themes.onedark").setup()
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		name = "tokyodark",
		priority = 1000,
		lazy = true,
		opts = require("yaysa.themes.tokyodark").opts,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		lazy = true,
		opts = require("yaysa.themes.kanagawa").opts,
	},
}
