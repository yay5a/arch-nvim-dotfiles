local undodir = vim.fs.joinpath(vim.fn.stdpath("state"), "undo")

vim.opt.timeoutlen = 300
vim.opt.updatetime = 200

if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

if vim.fn.has("wsl") == 1 then
	--	local win32yank = vim.fn.expand("$HOME/.local/bin/win32yank-nvim")

	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = { "win32yank.exe", "-i", "--crlf" },
			["*"] = { "win32yank.exe", "-i", "--crlf" },
		},
		paste = {
			["+"] = { "win32yank.exe", "-o", "--lf" },
			["*"] = { "win32yank.exe", "-o", "--lf" },
		},
		cache_enabled = 0,
	}
end

vim.g.netrw_banner = 0

vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = undodir
vim.opt.undofile = true
vim.opt.confirm = true

vim.opt.inccommand = "split"
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldcolumn = "0"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.guicursor = ""
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "0"
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})
