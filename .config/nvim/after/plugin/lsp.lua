local nls = require('null-ls')
local lsp = require('lsp-zero')
local sig = require('lsp_signature')
local neo = require('neodev')
local utl = require('lspconfig.util')

lsp.preset('recommended')

lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = {
        completeopt = 'menuone,noinsert,noselect'
    },
})

-- Fix Undefined globals
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            completion = { callSnippet = 'Replace' },
            diagnostics = {
                globals = { 'vim', 'packer_plugins' }
            },
            telemetry = { enable = 'false' }
        }
    }
})

lsp.configure('docker_compose_language_service', {
    filetypes = { 'yaml.docker-compose' },
    root_dir = utl.root_pattern { 'compose.yaml', 'docker-compose.yaml' },
    telemetry = { enable = 'false' }
})

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

nls.setup({
    sources = {
        nls.builtins.code_actions.shellcheck,
        nls.builtins.formatting.phpcbf,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.markdownlint,
    }
})

sig.setup({
    hint_enable = false
})

neo.setup()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
