require('project_nvim').setup {
    exclude_dirs = {
        '~/',
        '~/projects',
        '~/.config/nvim/lua/*',
        '~/*/vendor/*',
    },
    patterns = {
        '.git',
        'init.lua',
        '.envrc',
        '.project_root'
    },
    detection_methods = { 'pattern', 'lsp' }
}
