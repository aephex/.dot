local opt = vim.opt

-- Scrolling / Numbering
opt.relativenumber = true
opt.number = true
opt.scrolloff = 8

-- Indenting
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4

-- Stop commenting code from creating indents regardless of filetype
vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal indentkeys-=0#"
})

-- FS / History
opt.backup = false
opt.backupcopy = 'yes'
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

-- Search
opt.hlsearch = false
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true
opt.wrapscan = false

-- Timeouts
opt.timeout = true
opt.timeoutlen = 300

opt.completeopt = 'menuone,noinsert,noselect'
