if not GetResourceState('es_extended'):find('start') then return end

ESX = nil

Citizen.CreateThreadNow(function()
    IsExport, ESX = pcall(function()
        return exports["es_extended"]:getSharedObject()
    end)

    if not IsExport then
        while not ESX do
            TriggerEvent("esx:getSharedObject", function(coreObj) ESX = coreObj end)
            Wait(500)
        end
    end
end)

local isDead = false
AddEventHandler(BridgeConfig.FrameworkEvents.PlayerDeath, function()
    isDead = true
end)

AddEventHandler(BridgeConfig.FrameworkEvents.PlayerSpawn, function()
    isDead = false
end)

local loaded = false
RegisterNetEvent(BridgeConfig.FrameworkEvents.PlayerLoaded, function(PlayerData)
    loaded = true
    TriggerEvent("bhd_bridge:playerLoaded")
    TriggerServerEvent("bhd_bridge:playerLoaded")
end)

RegisterNetEvent(BridgeConfig.FrameworkEvents.PlayerLogout, function()
    loaded = false
end)

function IsDead()
    return isDead
end

function IsPlayerLoaded()
    return ESX.IsPlayerLoaded()
end

function GetPlayerData()
    return ESX.GetPlayerData()
end

function GetPlayerJob()
    local job = ESX.GetPlayerData().job
    return job.name, job.grade, job.grade_name
end