if BridgeConfig.Inventory ~= "qs-inventory" then return end

function CloseInventory()
    ExecuteCommand("closeinv")
end

function GetCurrentWeapon()
    return exports['qs-inventory']:GetCurrentWeapon()
end

---@param itemName string
---@param count? number
---@return boolean
function HasItem(itemName, count) --//TODO kontorla
    local result = exports['qs-inventory']:Search(itemName) 
    if result then
        return result.count >= (count or 1)
    end
    return false
end

function Search(search, item, metadata) --//TODO kontorla
    local result = exports['qs-inventory']:Search(item)
    if search == "search" then
        return result 
    elseif search == "count" then
        return result.count
    end
end