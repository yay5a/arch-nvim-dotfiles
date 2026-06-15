local km = vim.keymap.set

local opts = { noremap = true, silent = true }

-- copy file path to clipboard
km("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- open diagnostics
km("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list " })

-- join current line with next line keeping cursor position
km("n", "J", "mzJ`z")

-- move visual selection up/down
km("v", "J", ":m '>+1<CR>gv=gv")
km("v", "K", ":m '<-2<CR>gv=gv")

-- half-page down
km("n", "<C-d>", "<C-d>zz")
-- half-page up
km("n", "<C-u>", "<C-u>zz")

-- next search match, recenters & opens folds
km("n", "n", "nzzzv")
-- prev. search match, recenters & opens folds
km("n", "N", "Nzzzv")

-- indent selection without dropping
km("v", ">", ">gv", opts)
-- unindent selection without dropping
km("v", "<", "<gv", opts)

-- paste over selection without loosing yanked
km("x", "p", [["_dP]])

-- leader d delete wont remember as yanked/clipboard when delete pasting
km({ "n", "v" }, "<leader>d", [["_d]])

-- ctrl-c esc insert mode
km("i", "<C-c>", "<Esc>")

-- clear search highlighting in normal mode
km("n", "<C-c>", "<cmd>nohlsearch<CR>")

-- run built-in lsp formatter on current buffer
km("n", "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "Format buffer" })

-- Convert selected JSON key value pairs:
-- "key": "value",
-- into:
-- key = "value"
km("x", "<leader>jq", [[:s#^\(\s*\)"\([^"]\+\)":\s*\("[^"]\+"\),\?#\1\2 = \3#<CR>]], {
	desc = "Convert selected JSON keys to assignments",
})

-- Same conversion across the whole file
km("n", "<leader>jQ", [[:%s#^\(\s*\)"\([^"]\+\)":\s*\("[^"]\+"\),\?#\1\2 = \3#<CR>]], {
	desc = "Convert file JSON keys to assignments",
})

-- substitute all matches in visual selection
km("x", "<leader>sr", [[:s#]], {
	desc = "Substitute in visual selection",
})

-- substitute all matches per line in visual selection
km("x", "<leader>sR", [[:s##g<Left><Left>]], {
	desc = "Substitute all matches per line in visual selection",
})

-- substitute first match in whole file
km("n", "<leader>nr", [[:%s#]], {
	desc = "Substitute in whole file",
})

-- substitute all matches in file
km("n", "<leader>ra", [[:%s##g<Left><Left>]], {
	desc = "Substitute all matches per line in whole file",
})

-- makes the current file executable
km("n", "<leader>X", "<cmd>!chmod +x %<CR>", {
	silent = true,
	desc = "makes file executable",
})

-- source/reload file
km("n", "<leader>so", "<cmd>source %<CR>", {
	desc = "Source current file",
})

-- open new tab
km("n", "<leader>to", "<cmd>tabnew<CR>")

-- close current tab
km("n", "<leader>tx", "<cmd>tabclose<CR>")

-- next tab
km("n", "<leader>tn", "<cmd>tabn<CR>")

-- prev tab
km("n", "<leader>tp", "<cmd>tabp<CR>")

-- open current file in new tab
km("n", "<leader>tf", "<cmd>tabnew %<CR>")

-- split window vertically
km("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })

-- split window horizontally
km("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- equal split size
km("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- close current split
km("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- restart lsp
km("n", "<leader>lr", function()
	local ok, err = pcall(function()
		vim.cmd("lsp restart")
	end)
	if ok then
		vim.notify("LSP restart command sent", vim.log.levels.INFO)
	else
		vim.notify("LSP restart failed: " .. err, vim.log.levels.ERROR)
	end
end, { desc = "Restart LSP" })

-- restart neovim
km("n", "<leader>re", "<cmd>restart<cr>", {
	desc = "Restart Neovim (:restart)",
})
