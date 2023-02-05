local null_ls = require('null-ls')
local lsp     = require("lsp-zero")

require("neodev").setup()

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.formatting.phpcbf,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.formatting.markdownlint,
    }
})

lsp.preset("recommended")

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

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
