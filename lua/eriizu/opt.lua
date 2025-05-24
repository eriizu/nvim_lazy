vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.title = true
vim.opt.breakindent = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.cmd([[:set showtabline=1]])
vim.opt.listchars = "tab:→ ,nbsp:+,trail:·,extends:→,precedes:←"
vim.opt.wildignore:append(
	".git,.hg,.svn,*.pyc,*.o,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store,*/node_modules/*,*/bower_modules/*"
)
vim.opt.showmode = false
vim.g.mapleader = " "
vim.g.omni_sql_no_default_maps = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})
vim.opt.colorcolumn = "80"

vim.keymap.set("n", "<leader>fd", vim.cmd.Ex, { desc = "explore directories", silent = true })
vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')

vim.keymap.set("t", "<C-W>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>tc", ":tabnew<cr>", { desc = "tab create", silent = true })
vim.keymap.set("n", "<leader>tk", ":tabnext<cr>", { desc = "tab next", silent = true })
vim.keymap.set("n", "<leader>tk", ":tabprevious<cr>", { desc = "tab previous", silent = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<cr>", { desc = "tab close", silent = true })

vim.keymap.set("n", "<M-right>", ":tabnext<cr>", { desc = "tab next", silent = true })
vim.keymap.set("n", "<M-left>", ":tabprevious<cr>", { desc = "tab previous", silent = true })
vim.keymap.set("n", "<M-k>", ":tabnext<cr>", { desc = "tab next", silent = true })
vim.keymap.set("n", "<M-j>", ":tabprevious<cr>", { desc = "tab previous", silent = true })

vim.keymap.set("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "toggle inlay", silent = true })

-- INFO: I want C-c to execute autocmd InsertLeave, as I'm addicted to C-c on everything
-- and would love highlighters to still be able to do their job.
-- I'm still putting in an exit strategy if this causes problems,
-- you want still qq to get the original C-c behaviour.
vim.keymap.set("i", "jj", "<Esc>", { silent = true })
vim.keymap.set("i", "qq", "<C-c>", { silent = false })
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

vim.keymap.set(
	"n",
	"<leader>fR",
	":Lazy reload telescope.nvim<cr>",
	{ desc = "Sometimes telescope can't init, reload usually does the trick", silent = true }
)
vim.keymap.set(
	"n",
	"<leader>tt",
	":set showtabline=1<cr>",
	{ desc = "Sometimes tabline goes to always on and I don't want that, this is a workarround.", silent = true }
)

--:lua local bufs = vim.api.nvim_list_bufs() for _, buf in ipairs(bufs) do if vim.api.nvim_buf_is_loaded(buf) and vim.fn.bufwinnr(buf) == -1 then vim.api.nvim_buf_delete(buf, { force = true }) end end

vim.keymap.set("n", "<leader>bc", function()
	local bufs = vim.api.nvim_list_bufs()

	for _, buf in ipairs(bufs) do
		if
			vim.api.nvim_buf_is_loaded(buf)
			and vim.fn.bufwinnr(buf) == -1
			and not vim.api.nvim_get_option_value("modified", { buf = buf })
		then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end)

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = {buffer = event.buf}

		-- these will be buffer-local keybindings
		-- because they only work if you have an active language server

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		vim.keymap.set('n', '<leader>rf', '<cmd>lua vim.lsp.buf.format()<cr>', {silent = true})
		-- vim.keymap.set('n', '<leader>rf', function() vim.lsp.buf.format() end, opts);
	end
})
