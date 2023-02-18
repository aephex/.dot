require('filetype').setup({
    overrides = {
        complex = {
            ['compose%..*ya?ml$'] = 'yaml.docker-compose',
            ['docker-compose%..*ya?ml$'] = 'yaml.docker-compose'
        }
    }
})
