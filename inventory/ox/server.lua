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

function GetItemCount(source, itemName, metadata)
    local itemCount = exports.ox_inventory:GetItem(itemName, metadata, true)
    return itemCount
end

function CanCarryItem(inv, item, count, metadata)
    local state = exports.ox_inventory:CanCarryItem(inv, item, count, metadata)
    return state
end

function GetInventory(inv, owner)
    local inventory = exports.ox_inventory:GetInventory(inv, owner)
    return inventory
end

function UpdateVehicle(oldPlate, newPlate)
    exports.ox_inventory:UpdateVehicle(oldPlate, newPlate)
end

function Search(inv, search, item, metadata)
    local data = exports.ox_inventory:Search(inv, search, item, metadata)
    return data
end

function SetDurability(inv, slot, durability)
    exports.ox_inventory:SetDurability(inv, slot, durability)
end