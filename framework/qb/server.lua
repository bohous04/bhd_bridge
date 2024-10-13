if not GetResourceState('qb-core'):find('start') then return end

QBCore = nil

IsExport, QBCore = pcall(function()
    return exports["qb-core"]:GetCoreObject()
end)

if not IsExport then
    TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
end