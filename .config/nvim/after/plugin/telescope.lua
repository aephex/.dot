local ts = require('telescope')

local enabled_extensions = {
    'projects',
    'repo',
}

ts.setup {
    extensions = {
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
