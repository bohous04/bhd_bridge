BridgeConfig = {
    FrameworkPrefix = "esx",
    FrameworkEvents = {
        PlayerDeath = "esx:onPlayerDeath",
        PlayerSpawn = "esx:onPlayerSpawn",
        PlayerLoaded = "esx:playerLoaded",
        PlayerLogout = "esx:onPlayerLogout"
    }
}

Wait(1000)
Bridge = {
    -- FRAMEWORK CLIENT
    IsPlayerLoaded = IsPlayerLoaded(),
    GetPlayerData = GetPlayerData(),
    IsDead = IsDead(),
    -- FRAMEWORK SERVER
    SetMoney = SetMoney(source, amount),
    SetBank = SetBank(source, amount),
    GetMoney = GetMoney(source),
    GetBank = GetBank(source),
    RemoveMoney = RemoveMoney(source, amount),
    RemoveBank = RemoveBank(source, amount),
    AddMoney = AddMoney(source, amount),
    AddBank = AddBank(source, amount),
    GetJob = GetJob(source),
    SetJob = SetJob(source, job, grade),
    GetGroup = GetGroup(source),
    -- INV CLIENT
    HasItemC = HasItem(itemName, count),
    GetCurrentWeapon = GetCurrentWeapon(),
    CloseInventory = CloseInventory(),
    -- INV SERVER
    HasItem = HasItem(source, itemName, count),
    GetItemCount = GetItemCount(itemName, count),
    AddItem = AddItem(source, itemName, count),
    RemoveItem = RemoveItem(source, itemName, count),
    ClearInventory = ClearInventory(source),
    -- BAN SERVER
    Ban = Ban(source, reason),
    -- NOTIFY CLIENT
    Notify = Notify(message, time, type, title),
    -- NOTIFY SERVER
    ServerNotify = ServerNotify(source, message, time, type, title),
    -- LOG SERVER
    Log = Log(source, message),
    -- DATABASE SERVER
    DB = {
        insert = DatabaseInsert(command, args),
        query = DatabaseQuery(command, args),
        update = DatabaseUpdate(command, args),
        scalar = DatabaseScalar(command, args),
    },
    -- PEDS CLIENT
    CreateNPC = CreateNPC(data),
    DeleteNPC = DeleteNPC(name),
    -- BLIPS CLIENT
    CreateBlip = CreateBlip(data),
    DeleteBlip = DeleteBlip(name),
    -- VEHICLES CLIENT
    SetVehicleProperties = SetVehicleProperties(data),
    GetVehicleProperties = GetVehicleProperties(),


}


exports("getBridge", function()
    return Bridge
end)