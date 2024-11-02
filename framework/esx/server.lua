if not GetResourceState('es_extended'):find('start') then return end

IsExport, ESX = pcall(function()
    return exports["es_extended"]:getSharedObject()
end)

if not IsExport then
    TriggerEvent("esx:getSharedObject", function(coreObj) ESX = coreObj end)
end


---@param source number
---@return number
function GetMoney(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getMoney()
end

---@param source number
---@return number
function GetBank(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getAccount('bank').money
end

---@param source number
---@param amount number
function RemoveMoney(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(amount)
end

---@param source number
---@param amount number
function RemoveBank(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney('bank', amount)
end

---@param source number
---@param amount number
function AddMoney(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(amount)
end

---@param source number
---@param amount number
function AddBank(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('bank', amount)
end

---@param source number
---@param amount number
function SetMoney(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setAccountMoney('money', amount)
end

---@param source number
---@param amount number
function SetBank(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setAccountMoney('bank', amount)
end

---@param source number
---@return1 string
---@return2 number
function GetJob(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.job.name, xPlayer.job.grade, xPlayer.job.grade_name
end

---@param source number
---@param job string
---@param grade number
function SetJob(source, job, grade)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob(job, grade)
end

---@param source number
---@return string
function GetGroup(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getGroup()
end

---@param source number
---@return string
function GetIdentifier(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getIdentifier()
end

---@param source number
---@return string
function GetName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getName()
end