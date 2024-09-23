if not GetResourceState('ox_inventory'):find('start') then return end

---@param source number
---@param itemName string
---@param count? number
---@return boolean
function HasItem(source, itemName, count, metadata)
    local itemCount = exports.ox_inventory:GetItem(itemName, metadata, true)
    return itemCount >= (count or 1)
end

function AddItem(source, item, count, metadata)
    if exports.ox_inventory:CanCarryItem(source, item, count) then
        exports.ox_inventory:AddItem(source, item, count, metadata)
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