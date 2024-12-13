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
    return {name = Player.PlayerData.job.name, grade = Player.PlayerData.job.grade.level, grade_name = Player.PlayerData.job.grade.name, label = Player.PlayerData.job.label, grade_label = Player.PlayerData.job.grade.name},
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

function GetJobs()
    return QBCore.Shared.Jobs
end

function GetPlayerFromIdentifier(identifier)
    local data = QBCore.Functions.GetPlayerByCitizenId(identifier)?.PlayerData
    if data then
        data = {
            source = data.source,
            job = {name = data.job.name, grade = data.job.grade.level, grade_name = data.job.grade.name, label = data.job.label, grade_label = data.job.grade.name},
            name = data.charinfo.firstname.." "..data.charinfo.lastname,
            identifier = data.citizenid,
            birthDate = data.charinfo.birthdate,
        }
    end
    return data
end

function SavePlayer(source)
    QBCore.Player.Save(source)
end

AddEventHandler("QBCore:Server:OnJobUpdate", function(source, newJob)
    TriggerEvent("bhd_bridge:setJob", source, newJob, oldJob)
end)

function GetAllPlayers()
    local returnData = {}
    local xPlayers = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(xPlayers) do
        returnData[v.PlayerData.source] = {
            job = {name = v.PlayerData.job.name, grade = v.PlayerData.job.grade.level, grade_name = v.PlayerData.job.grade.name, label = v.PlayerData.job.label, grade_label = v.PlayerData.job.grade.name},
        }
    end
    
    return returnData
end