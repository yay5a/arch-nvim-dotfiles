---@module "lazy"
---@type LazySpec
return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		keys = {
            -- comment with motion in normal mode; comment selected in visual mode
			{ "gc", mode = { "n", "v" } },
            -- block-comment with a motion in normal mode; block-comment selected in visual
			{ "gb", mode = { "n", "v" } },
            -- toggle comment on current line
			{ "gcc", mode = "n" },
            -- toggle block-comment on current line
			{ "gbc", mode = "n" },
		},
		opts = function()
			return {
				padding = true,
				sticky = true,
				ignore = "^$",
				pre_hook = function(ctx)
					local ts_pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
					local commentstring = ts_pre_hook(ctx)

					if not commentstring then
						return vim.bo.commentstring or "# %s"
					end

					return commentstring
				end,
			}
		end,
	},
}
