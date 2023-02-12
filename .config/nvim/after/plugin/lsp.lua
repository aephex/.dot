local nls = require('null-ls')
local lsp = require('lsp-zero')
local sig = require('lsp_signature')
local neo = require('neodev')

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

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

vim.diagnostic.config({
    virtual_text = true,
})

nls.setup({
    sources = {
        nls.builtins.code_actions.shellcheck,
        nls.builtins.formatting.phpcbf,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.yamlfmt,
        nls.builtins.formatting.markdownlint,
    }
})

sig.setup({
    hint_enable = false
})

neo.setup()
lsp.setup()
