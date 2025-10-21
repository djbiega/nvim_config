-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>td", vim.diagnostic.open_float, { desc = "[T]oggle [d]iagnostic in floating window" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

-- Keybinds to make split navigation easier.
vim.keymap.set("n", ",h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", ",l", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", ",j", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", ",k", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Same thing for terminal mode
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", ",h", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", ",j", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", ",k", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", ",l", [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set("t", ",w", [[<C-\><C-n><C-w>]], opts)

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Expand the conentional commits snippit automatically
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	callback = function()
		vim.notify("Tip: type `cc<Tab>` to insert a Conventional Commit snippet")
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

-- vim: ts=2 sts=2 sw=2 et
