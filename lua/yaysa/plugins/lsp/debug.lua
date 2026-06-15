---@module 'lazy'
---@type LazySpec
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"leoluz/nvim-dap-go",
	},

	keys = {

		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},

		{
			"<F1>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},

		{
			"<F2>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},

		{
			"<F3>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},

		{
			"<leader>b",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},

		{
			"<leader>B",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Breakpoint",
		},

		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: See last session result.",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				"delve",
			},
		})

		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
					disconnect = "",
				},
			},
		})

		dap.listeners.after.event_initialized.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local dap_utils = require("dap.utils")

		local data_path = vim.fn.stdpath("data")
		local mason_bin = data_path .. "/mason/bin"
		local mason_packages = data_path .. "/mason/packages"

		local function executable(path)
			return path and path ~= "" and vim.fn.executable(path) == 1
		end

		local function readable(path)
			return path and path ~= "" and vim.fn.filereadable(path) == 1
		end

		local function mason_bin_cmd(name)
			local candidates = {
				mason_bin .. "/" .. name,
				mason_bin .. "/" .. name .. ".cmd",
				vim.fn.exepath(name),
				vim.fn.exepath(name .. ".cmd"),
			}

			for _, candidate in ipairs(candidates) do
				if executable(candidate) then
					return candidate
				end
			end

			return nil
		end

		local function extend_config(filetype, configs)
			dap.configurations[filetype] = dap.configurations[filetype] or {}
			vim.list_extend(dap.configurations[filetype], vim.deepcopy(configs))
		end

		local function extend_configs(filetypes, configs)
			for _, filetype in ipairs(filetypes) do
				extend_config(filetype, configs)
			end
		end

		-- Python: debugpy
		do
			local debugpy_python = mason_packages .. "/debugpy/venv/bin/python"

			if executable(debugpy_python) then
				dap.adapters.python = {
					type = "executable",
					command = debugpy_python,
					args = { "-m", "debugpy.adapter" },
				}

				extend_config("python", {
					{
						type = "python",
						request = "launch",
						name = "Launch Python file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						pythonPath = function()
							local cwd = vim.fn.getcwd()
							local candidates = {
								cwd .. "/.venv/bin/python",
								cwd .. "/venv/bin/python",
								vim.fn.exepath("python3"),
								vim.fn.exepath("python"),
							}

							for _, candidate in ipairs(candidates) do
								if executable(candidate) then
									return candidate
								end
							end

							return "python3"
						end,
					},
				})
			end
		end

		-- JavaScript / TypeScript: js-debug-adapter
		do
			local js_debug_server = mason_packages .. "/js-debug-adapter/js-debug/src/dapDebugServer.js"

			if readable(js_debug_server) and executable(vim.fn.exepath("node")) then
				dap.adapters["pwa-node"] = {
					type = "server",
					host = "127.0.0.1",
					port = "${port}",
					executable = {
						command = "node",
						args = {
							js_debug_server,
							"${port}",
							"127.0.0.1",
						},
					},
				}

				local js_configs = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch current file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
						protocol = "inspector",
						console = "integratedTerminal",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach to Node process",
						processId = dap_utils.pick_process,
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
				}

				extend_configs({
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
				}, js_configs)
			end
		end

		-- C / C++ / Rust: codelldb
		do
			local codelldb = mason_bin_cmd("codelldb")

			if codelldb then
				dap.adapters.codelldb = {
					type = "server",
					port = "${port}",
					executable = {
						command = codelldb,
						args = { "--port", "${port}" },
						detached = vim.fn.has("win32") == 0,
					},
				}

				local native_configs = {
					{
						name = "Launch executable",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
						args = function()
							local args = vim.fn.input("Arguments: ")
							return vim.split(args, " +", { trimempty = true })
						end,
					},
				}

				extend_configs({ "c", "cpp", "rust" }, native_configs)
			end
		end

		-- Bash / sh: bash-debug-adapter
		do
			local bash_adapter = mason_packages .. "/bash-debug-adapter/bash-debug-adapter"
			local bashdb = mason_packages .. "/bash-debug-adapter/extension/bashdb_dir/bashdb"
			local bashdb_lib = mason_packages .. "/bash-debug-adapter/extension/bashdb_dir"

			if executable(bash_adapter) then
				dap.adapters.bashdb = {
					type = "executable",
					command = bash_adapter,
					name = "bashdb",
				}

				local bash_configs = {
					{
						type = "bashdb",
						request = "launch",
						name = "Launch Bash file",
						showDebugOutput = true,
						pathBashdb = bashdb,
						pathBashdbLib = bashdb_lib,
						trace = true,
						file = "${file}",
						program = "${file}",
						cwd = "${workspaceFolder}",
						pathBash = "/usr/bin/bash",
						pathCat = "cat",
						pathMkfifo = "mkfifo",
						pathPkill = "pkill",
						args = {},
						env = {},
						terminalKind = "integrated",
					},
				}

				extend_configs({ "sh", "bash" }, bash_configs)
			end
		end

		-- Perl: perl-debug-adapter
		do
			local perl_adapter = mason_bin_cmd("perl-debug-adapter")

			if perl_adapter then
				dap.adapters.perl = {
					type = "executable",
					command = perl_adapter,
					args = {},
				}

				extend_config("perl", {
					{
						type = "perl",
						request = "launch",
						name = "Launch Perl file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
				})
			end
		end

		-- Go: delve via nvim-dap-go
		do
			local ok, dap_go = pcall(require, "dap-go")

			if ok then
				dap_go.setup({
					delve = {
						detached = vim.fn.has("win32") == 0,
					},
				})
			end
		end
	end,
}
