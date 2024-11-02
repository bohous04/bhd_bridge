if not GetResourceState('qb-core'):find('start') then return end

IsExport, QBCore = pcall(function()
    return exports['qb-core']:GetCoreObject()
end)

if not IsExport then
    TriggerEvent("QBCore:GetObject", function(coreObj) QBCore = coreObj end)
end

RegisterNetEvent('QBCore:Client:UpdateObject', function()
    QBCore = exports['qb-core']:GetCoreObject()
end)

local loaded = false
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function(PlayerData)
    loaded = true
    TriggerEvent("bhd_bridge:playerLoaded")
    TriggerServerEvent("bhd_bridge:playerLoaded")
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    loaded = false
end)

function IsDead()
    local PlayerData = QBCore.Functions.GetPlayerData()
    return (PlayerData.metadata['isdead'] or PlayerData.metadata['inlaststand'])
end

function IsPlayerLoaded()
    return loaded
end

function GetPlayerData()
    return QBCore.Functions.GetPlayerData()
end

function GetPlayerJob()
    local job = QBCore.Functions.GetPlayerData().job
    return job.name, job.grade, job.grade.name
end