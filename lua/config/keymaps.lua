--
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
 vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
-- remaps from ThePrimagen
vim.keymap.set("n", "<leader>ls", vim.cmd.Ex, {desc = "[L]i[s]t files"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--keep the cursor where it is when using J
vim.keymap.set("n", "J", "mzJ`z")

--keep cursor in the middle when jumping up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- set system or vim register
--vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])
local wk = require("which-key")
wk.register({
	["y"] = { '"+y', "copy to clipboard", mode = "v"},
	["Y"] = { [["+Y]], "copy entire row to clipboard"}
},
{ prefix = "<leader>"})


-- git keymaps
vim.keymap.set("n","<leader>ga", ":G add %<ESC>", {desc = '[G]it [A]dd'})
vim.keymap.set("n","<leader>gc", ":G commit<ESC>", {desc = '[G]it [C]ommit'})
vim.keymap.set("n","<leader>gp", ":G push<ESC>", {desc = '[G]it [P]ush'})
vim.keymap.set("n","<leader>gs", ":G status<ESC>",{desc = '[G]it [S]tatus'})



vim.keymap.set('n', '<leader>tg', require('telescope.builtin').git_files, { desc = '[T]elescope [G]it'})
vim.keymap.set('n', '<leader>tf', require('telescope.builtin').find_files, { desc = '[T]elescope [F]iles'})
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = '[T]elescope [H]elp' })
vim.keymap.set('n', '<leader>tw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>ts', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>tr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
