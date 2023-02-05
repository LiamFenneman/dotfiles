require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'rust', 'toml', 'lua', 'java', 'typescript', 'help' },
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
