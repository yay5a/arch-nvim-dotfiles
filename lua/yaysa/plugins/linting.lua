---@module "lazy"
---@type LazySpec
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		lint.linters_by_ft = {
			-- JavaScript / TypeScript
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },

			-- JSON / JSONC
			json = { "jsonlint" },
			jsonc = { "jsonlint" },

			-- LUA
			lua = { "luacheck" },

			-- YAML
			yaml = { "yamllint" },

			-- Shell
			sh = { "shellcheck" },
			bash = { "shellcheck" },

			-- Python
			python = { "ruff" },

			-- Markdown
			markdown = { "markdownlint" },

			-- TOML
			toml = { "tombi" },

			-- Vimscript
			vim = { "vint" },

			-- systemd unit files
			systemd = { "systemdlint" },

			-- .env files, only if Neovim reports filetype=dotenv
			dotenv = { "dotenv_linter" },

			-- CMake / C/C++
			cmake = { "cmakelint" },
			c = { "cpplint" },
			cpp = { "cpplint" },
		}
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
