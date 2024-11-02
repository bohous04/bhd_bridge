if not GetResourceState('qb-core'):find('start') then return end

IsExport, QBCore = pcall(function()
    return exports["qb-core"]:getSharedObject()
end)

if not IsExport then
    TriggerEvent("QBCore:GetObject", function(coreObj) QBCore = coreObj end)
end

RegisterNetEvent(Bridge.FrameworkPrefix .. ':Server:UpdateObject', function()
    print(Bridge.FrameworkPrefix .. ':Server:UpdateObject event triggered')
    if source ~= '' then return end
    QBCore = exports["qb-core"]:GetCoreObject()
end)

---@param source number
---@return number
function GetMoney(source)
    print("GetMoney function called with args:", source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.Functions.GetMoney("cash")
end

---@param source number
---@return number
function GetBank(source)
    print("GetBank function called with args:", source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.Functions.GetMoney("bank")
end

---@param source number
---@param amount number
function RemoveMoney(source, amount)
    print("RemoveMoney function called with args:", source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveMoney("cash", amount)
end

---@param source number
---@param amount number
function RemoveBank(source, amount)
    print("RemoveBank function called with args:", source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveMoney("bank", amount)
end

---@param source number
---@param amount number
function AddMoney(source, amount)
    print("AddMoney function called with args:", source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddMoney("cash", amount)
end

---@param source number
---@param amount number
function AddBank(source, amount)
    print("AddBank function called with args:", source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddMoney("bank", amount)
end

---@param source number
---@param amount number
function SetMoney(source, amount)
    print("SetMoney function called with args:", source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.SetMoney("cash", amount)
end

---@param source number
---@param amount number

function SetBank(source, amount)
    print("SetBank function called with args:", source, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.SetMoney("bank", amount)
end

---@param source number
---@return1 string
---@return2 number
function GetJob(source)
    print("GetJob function called with args:", source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.PlayerData.job.name, Player.PlayerData.job.grade.level, Player.PlayerData.job.grade.name
end

---@param source number
---@param job string
---@param grade number
function SetJob(source, job, grade)
    print("SetJob function called with args:", source, job, grade)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.SetJob(job, grade)
end

---@param source number
---@return string
function GetGroup(source)
    print("GetGroup function called with args:", source)
    return QBCore.Functions.GetPermission(source)
end

---@param source number
---@return string
function GetIdentifier(source)
    print("GetIdentifier function called with args:", source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.PlayerData.citizenid
end

---@param source number
---@return string
function GetName(source)
    print("GetName function called with args:", source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
end