require('lualine').setup {
    options = {
        theme = 'auto',
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_b = { { 'filename', path = 2 } },
        lualine_c = { 'branch', 'diff' },
        lualine_x = {
            'lsp_progress'
        },
        lualine_y = {
            {
                'encoding',
                color = 'DiffChange',
                separator = { left = '', right = '' },
            },
            {
                'fileformat',
                color = 'DiffAdd',
                separator = { left = '', right = '' },
            },
            {
                'filetype',
                color = 'DiffText',
                separator = { left = '', right = '' },
            },

        },
        lualine_z = {
            {
                'location',
                padding = { left = 0, right = 1 },
            }
        },
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
            },
        },
    }
}
