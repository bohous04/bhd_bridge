fx_version 'cerulean'

game 'gta5'

name 'bhd_garage'

version '1.1.0'

author '.bohous'

files {
    'locales/*.json'
}

shared_scripts {
    '@ox_lib/init.lua',
    'bridgeConfig.lua',
    'main.lua',
}

client_scripts {
    '**/client.lua',
    '**/**/client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '**/server.lua',
    '**/**/server.lua',
}

lua54 'yes'