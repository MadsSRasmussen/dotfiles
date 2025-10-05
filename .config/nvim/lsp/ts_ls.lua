return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'typescript' },
    root_markers = { { 'package-lock.json' }, '.git' },
}
