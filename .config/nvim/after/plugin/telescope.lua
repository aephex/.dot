local ts = require('telescope')

local enabled_extensions = {
    'file_browser',
    'projects',
    'repo',
}

ts.setup {
    extensions = {
        file_browser = {
            hijack_netrw = true
        },
        repo = {
            list = {
                fd_opts = {
                    "--no-ignore-vcs",
                },
                search_dirs = {
                    "~/projects",
                    "~/nexus",
                    "~/.local"
                }
            }
        }
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
        }
    }
}

for _, extension in pairs(enabled_extensions) do
    ts.load_extension(extension)
end
