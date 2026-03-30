return {
    cmd = { 'vue-language-server', '--stdio' },
    filetypes = { 'vue' },
    root_markers = { 'nuxt.config.ts', 'nuxt.config.js', 'vite.config.ts' },
    init_options = {
        typescript = {
            tsdk = '/Users/mads/.npm-global/lib/node_modules/typescript/lib',
        },
    },
}
