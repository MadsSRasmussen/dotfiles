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

vim.opt.swapfile = false

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
vim.lsp.enable('ts_ls')

-- Add plugins
vim.pack.add({
    { src = 'https://github.com/mason-org/mason.nvim', name = 'mason' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master', name = 'nvim-treesitter' },
    { src = 'https://github.com/vague2k/vague.nvim' },
})

-- Setup plugins
require('mason').setup()
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'c', 'javascript', 'typescript' },
    auto_install = false,
    highlight = {
        enable = true,
    }
})
require('vague').setup()

-- Setup plugin hooks
vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Handle nvim-treesitter updates',
    group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
    callback = function(args)
        if args.data.kind == 'update' and args.data.spec.name == 'nvim-treesitter' then
            vim.notify('nvim-treesitter updated, running :TSUpdate', vim.log.levels.INFO)
            local ok = pcall(vim.cmd, 'TSUpdate')
            if ok then
                vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
            else
                vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
            end
        end
    end,
})

-- Setup colorscheme
vim.cmd.colorscheme('vague')
