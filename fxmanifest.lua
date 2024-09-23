fx_version 'cerulean'

game 'gta5'

name 'bhd_garage'

version '1.1.0'

author '.bohous'

files {
    'locales/*.json'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config_garage.lua',
    'config_keys.lua',
}


client_scripts {
    'client/editable/*.lua',
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/editable/*.lua',
    'server/*.lua'
}

lua54 'yes'