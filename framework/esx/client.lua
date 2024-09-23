local isDead = false
AddEventHandler(Bridge.FrameworkPrefix .. ':onPlayerDeath', function()
    isDead = true
end)

AddEventHandler(Bridge.FrameworkPrefix .. ':onPlayerSpawn', function()
    isDead = false
end)

function isDead()
    return isDead
end

local loaded = false
RegisterNetEvent(Bridge.FrameworkPrefix .. ':playerLoaded', function(PlayerData)
    loaded = true
end)

RegisterNetEvent(Bridge.FrameworkPrefix .. ':onPlayerLogout', function()
    loaded = false
end)

function IsPlayerLoaded()
    return ESX.IsPlayerLoaded()
end

function GetPlayerData()
    return ESX.GetPlayerData()
end