function CloseInventory()
    exports.ox_inventory:closeInventory()
end

function GetCurrentWeapon()
    return exports.ox_inventory:getCurrentWeapon()
end

---@param itemName string
---@param count? number
---@return boolean
function HasItem(itemName, count)
    local itemCount = exports.ox_inventory:GetItemCount(itemName, nil, false)
    return itemCount >= (count or 1)
end

function Search(search, item, metadata)
    local data = exports.ox_inventory:Search(search, item, metadata)
    return data
end