return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'typescript' },
    root_markers = { { 'package-lock.json' }, '.git' },
    on_attach = function(client, bufnr)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local deno_root = vim.fs.root(fname, { 'deno.json', 'deno.jsonc' })
        if deno_root then
            client.stop()
        end
    end,
}
