---@module "lazy"
---@type LazySpec
return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			local MiniFiles = require("mini.files")

			MiniFiles.setup({
				mappings = {
					go_in = "<CR>",
					go_in_plus = "L",
					go_out = "_",
					go_out_plus = "H",
				},
			})

			vim.keymap.set("n", "<leader>ee", function()
				MiniFiles.open()
			end, { desc = "Toggle mini file explorer" })

			vim.keymap.set("n", "<leader>ef", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end, { desc = "Toggle into currently opened file" })

			require("mini.surround").setup({
				custom_surroundings = nil,
				mappings = {
					add = "sa",
					delete = "ds",
					find = "sf",
					find_left = "sF",
					highlight = "sh",
					replace = "ca",
					update_n_lines = "sn",
					suffix_last = "l",
					suffix_next = "n",
				},
			})

			local MiniTrailspace = require("mini.trailspace")

			MiniTrailspace.setup({
				only_in_normal_buffers = true,
			})

			vim.keymap.set("n", "<leader>cw", function()
				MiniTrailspace.trim()
			end, { desc = "Erase whitespace" })

			vim.api.nvim_create_autocmd("CursorMoved", {
				pattern = "*",
				callback = function()
					MiniTrailspace.unhighlight()
				end,
			})

			local MiniSplitJoin = require("mini.splitjoin")

			MiniSplitJoin.setup({
				mappings = { toggle = "" },
			})

			vim.keymap.set({ "n", "x" }, "sj", function()
				MiniSplitJoin.join()
			end, { desc = "Join arguments" })

			vim.keymap.set({ "n", "x" }, "sk", function()
				MiniSplitJoin.split()
			end, { desc = "Split arguments" })

			require("mini.notify").setup({
				content = {
					format = function(notif)
						return notif.msg
					end,
				},
				window = {
					config = function()
						return {
							title = "",
							anchor = "SE",
							row = vim.o.lines - 2,
							col = vim.o.columns,
							border = "none",
						}
					end,
				},
			})
		end,
	},
}
