---@module "lazy"
---@type LazySpec
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			default_format_opts = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
			notify_no_formatters = false,
			formatters = {
				["markdown-toc"] = {
					condition = function(_, ctx)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
							if line:find("<!%-%- toc %-%->") then
								return true
							end
						end
					end,
				},
				["markdownlint-cli2"] = {
					condition = function(_, ctx)
						local diag = vim.tbl_filter(function(d)
							return d.source == "markdownlint"
						end, vim.diagnostic.get(ctx.buf))
						return #diag > 0
					end,
				},
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },

				html = { "prettier" },
				svelte = { "prettier" },
				vue = { "prettier" },
				astro = { "prettier" },

				json = { "jq" },
				jsonc = { "prettier" },
				json5 = { "prettier" },
				yaml = { "yamlfmt" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				markdown = { "mdformat", "markdownlint-cli2", "markdown-toc" },
				python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },

				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },
				toml = { "taplo" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				cmake = { "cmake_format" },
				sql = { "sql_formatter" },

				["_"] = { "trim_whitespace", "trim_newlines" },
			},
			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			},
		})

		-- Configure individual formatters
		conform.formatters.prettier = {
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}
		conform.formatters.shfmt = {
			prepend_args = { "-i", "4" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format whole file or range in visual mode" })
	end,
}
