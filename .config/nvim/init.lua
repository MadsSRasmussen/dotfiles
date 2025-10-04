-- Setup globals
vim.g.mapleader = " "

-- Setup options
vim.opt.number = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.cursorline = true
vim.opt.cursorlineopt = { 'number' }

vim.opt.winborder = 'single'

vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }

-- Setup keymaps
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left pane' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right pane' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to pane below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to pane above' })

vim.keymap.set('n', '<leader>w', ':write<CR>', { desc = 'Writes file' })

vim.keymap.set('n', '<leader>e', ':Explore<CR>', { desc = 'Open explorer' })
vim.keymap.set('n', '<leader>so', ':source $MYVIMRC<CR>', { desc = 'Source vimrc' })

vim.keymap.set('i', '<C-f>', '<C-y>', { noremap = true, desc = 'Accept autocomplete suggestion' })

vim.keymap.set('i', '<C-space>', function()
    vim.lsp.completion.get()
end, { desc = 'Get lsp completions' })

-- Setup colorscheme
vim.cmd.colorscheme('default')

-- Setup language servers
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

-- Enable language servers
vim.lsp.enable('lua_ls')
