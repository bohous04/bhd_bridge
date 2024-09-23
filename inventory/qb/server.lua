if not GetResourceState('ox_inventory'):find('start') then return end

local QBCore = exports['qb-core']:GetCoreObject()
---@param source number
---@param itemName string
---@param count? number
---@return boolean
function HasItem(source, itemName, count, metadata)
    local itemCount = exports.ox_inventory:GetItem(itemName, metadata, true)
    return itemCount >= (count or 1)
end

function AddItem(source, item, count, metadata)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.AddItem(item, count, false, metadata) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add', count)
        return true
    end
    return false
end

function RemoveItem(source, item, count, metadata)
    exports.ox_inventory:RemoveItem(source, item, count, metadata)
end

function ClearInventory(source)
    exports.ox_inventory:ClearInventory(source, false)
end