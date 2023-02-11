local luasnip = require("luasnip")
local cmp = require("cmp")

local config = cmp.get_config()

cmp.setup({
    formatting = {
        fields = { "menu", "abbr", "kind" },
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = vim.list_extend(config.sources, {
        { name = 'nerdfont' },
    }, 1, #config.sources),
    window = {
        documentation = cmp.config.window.bordered(),
    }
})
