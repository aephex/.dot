local cmd = vim.cmd
local lsp = require("lsp-zero")
local map = vim.keymap.set
local ts  = require('telescope')
local tsb = require('telescope.builtin')

vim.g.mapleader = "\\"

-- Buffers
map("n", "<C-PageUp>", cmd.bprevious, { desc = 'Previous buffer' })
map("n", "<C-PageDown>", cmd.bnext, { desc = 'Next buffer' })

-- Clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = 'Yank selection to system' })
map("n", "<leader>Y", [["+Y]], { desc = 'Yank line to system' })
map("x", "<leader>p", [["_dP]], { desc = 'keep clipboard when pasting' })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = 'keep clipboard when deleting' })

-- Commands
map("n", "<leader>q", cmd.bdelete, { desc = 'Close current buffer' })
map("n", "<leader>Q", ":bdelete!<CR>", { desc = 'Force close current buffer' })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make current file executable' })
map("n", "<leader>f", vim.lsp.buf.format, { desc = 'Format buffer using LSP' })
map("n", "<F3>", cmd.E, { desc = 'Open Explorer (NetRW)' })

-- Quality of Life
map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>") -- disable shift+q

-- moving
map("n", "<C-d>", "<C-d>zz", { desc = 'Half page down, keep view centered' })
map("n", "<C-u>", "<C-u>zz", { desc = 'Half page up, keep view centered' })
map("n", "n", "nzzzv", { desc = 'Next result, keep view centered' })
map("n", "N", "Nzzzv", { desc = 'Previous result, keep view centered' })

-- Move Selections
map("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Search & Replace
map("n", "<C-h>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace occurences of word' })
map("v", "<C-h>", [[y<ESC>:%s@\V<C-r>0@@gI<Left><Left><Left>]], { desc = 'Replace occurences selection' })

-- Telescope
map('n', '<leader>so', tsb.buffers, { desc = '[s]earch [o]pen buffers' })
map('n', '<leader>sf', tsb.find_files, { desc = '[s]earch [f]iles' })
map('n', '<leader>sc', tsb.git_files, { desc = '[s]earch [c]ommitted files' })
map('n', '<leader>sw', tsb.grep_string, { desc = '[s]earch current [w]ord' })
map('n', '<leader>sg', tsb.live_grep, { desc = '[s]earch with [g]rep' })
map('n', '<leader>sp', ts.extensions.projects.projects, { desc = '[s]earch [p]rojects' })

map('n', '<leader>sh', tsb.help_tags, { desc = '[s]eek [h]elp' })
map("n", "<leader>th", tsb.highlights, { desc = '[t]elescope [h]ighlights' })

-- Only active when LSP client is attached
lsp.on_attach(function(_, bufnr)
    local default_options = { buffer = bufnr, remap = false }

    local function opts(options)
        if options == nil then return default_options end

        for option, default in pairs(default_options) do
            if options[option] == nil then
                options[option] = default
            end
        end

        return options
    end

    local function smart_definition()
        if tsb.lsp_definitions() then
            return
        end

        --        if vim.lsp.buf.definition() then
        --            return
        --        end

        if cmd(':tag ' .. vim.fn.expand('<cword>')) then
            return
        end
    end

    map("n", "<leader>vd", vim.diagnostic.open_float, opts({ desc = '[v]iew [d]iagnostics' }))
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts({ desc = '[c]ode [a]ction' })) -- also <F4>

    map("n", "K", vim.lsp.buf.hover, opts({ desc = 'displays symbol info in hover' }))
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts({ desc = 'Signature Help' }))
    map("i", "<C-k>", vim.lsp.buf.signature_help, opts({ desc = 'Signature Help', remap = 'true' }))

    map("n", "gd", function() pcall(smart_definition) end, opts({ desc = '[g]o to [d]efinition' }))
    map("n", "gD", vim.lsp.buf.declaration, opts({ desc = '[g]o to [D]eclaration' }))
    map("n", "gi", tsb.lsp_implementations, opts({ desc = '[g]o to [i]mplementation' }))
    map("n", "gt", tsb.lsp_type_definitions, opts({ desc = '[g]o to [t]ype definition' }))

    map("n", "<leader>sr", tsb.lsp_references, opts({ desc = '[s]earch [r]eferences' }))
    map("n", "<leader>ss", tsb.lsp_dynamic_workspace_symbols, opts({ desc = '[s]earch [s]ymbols' }))
    map("n", "<leader>sb", tsb.lsp_document_symbols, opts({ desc = '[s]earch [b]uffer symbols' }))
end)
