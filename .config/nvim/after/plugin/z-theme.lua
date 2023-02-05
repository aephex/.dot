local default_color = 'tokyonight-moon'
local api = vim.api

function ApplyTheme(color)
    color = color or default_color

    vim.opt.termguicolors = true
    if color == 'default' then
        vim.opt.termguicolors = false
    end
    vim.cmd.colorscheme(color)

    ApplyBorders()
    ApplyTransparency()
end

function ApplyTransparency()
    local groups = {
        'FloatBorder',
        'LineNr',
        'LineNrAbove',
        'LineNrBelow',
        'LspInfoBorder',
        'Normal',
        'NormalFloat',
        'NormalNC',
        'NormalSB',
        'Pmenu',
        'SignColumn',
        'StatusLine',
        'StatusLineNC',
        'TabLine',
        'TabLineFill',
        'TelescopeBorder',
        'TelescopeNormal',
        'TelescopePreviewLine',
        'TelescopePreviewMatch',
        'TelescopePromptNormal',
        'WhichKeyFloat',
    }

    for _, v in pairs(groups) do
        local result, hl = pcall(api.nvim_get_hl_by_name, v, true)

        if result then
            api.nvim_set_hl(0, v, { bg = "none", fg = hl.foreground })
        end
    end
end

function ApplyBorders()
    if packer_plugins["mason.nvim"] then
        require("mason").setup({ ui = { border = 'rounded' } })
    end

    if packer_plugins['null_ls.nvim'] then
        require('null_ls').setup({ border = 'rounded' })
    end

    if packer_plugins['nvim-lspconfig'] then
        require('lspconfig.ui.windows').default_options.border = 'rounded'
    end

    if packer_plugins['which-key.nvim'] then
        require('which-key').setup({ window = { border = 'rounded' } })
    end
end

-- run :lua HiC() to open a split that shows all current highlight groups
function HiC()
    vim.cmd(':so $VIMRUNTIME/syntax/hitest.vim')
end

ApplyTheme()
