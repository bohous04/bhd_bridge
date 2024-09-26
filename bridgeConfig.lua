Bridge = {}
exports("getBridge", function()
    return Bridge
end)

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
local isServer = IsDuplicityVersion()
if isServer then
    Bridge = {
        -- FRAMEWORK SERVER
        SetMoney = SetMoney,
        SetBank = SetBank,
        GetMoney = GetMoney,
        GetBank = GetBank,
        RemoveMoney = RemoveMoney,
        RemoveBank = RemoveBank,
        AddMoney = AddMoney,
        AddBank = AddBank,
        GetJob = GetJob,
        SetJob = SetJob,
        GetGroup = GetGroup,
        GetIdentifier = GetIdentifier,
        GetName = GetName,
        -- INV SERVER
        HasItem = HasItem,
        GetItemCount = GetItemCount,
        AddItem = AddItem,
        RemoveItem = RemoveItem,
        ClearInventory = ClearInventory,
        -- BAN SERVER
        Ban = Ban,
        -- NOTIFY SERVER
        ServerNotify = ServerNotify,
        -- LOG SERVER
        Log = Log,
        -- DATABASE SERVER
        DB = {
            insert = DatabaseInsert,
            query = DatabaseQuery,
            update = DatabaseUpdate,
        },
    }
else
    Bridge = {
        -- FRAMEWORK CLIENT
        IsPlayerLoaded = IsPlayerLoaded,
        GetPlayerData = GetPlayerData,
        GetPlayerJob = GetPlayerJob,
        IsDead = IsDead,
        -- INV CLIENT
        HasItem = HasItem,
        GetCurrentWeapon = GetCurrentWeapon,
        CloseInventory = CloseInventory,
        -- NOTIFY CLIENT
        Notify = Notify,
        -- PEDS CLIENT
        CreateNPC = CreateNPC,
        DeleteNPC = DeleteNPC,
        -- BLIPS CLIENT

        -- CreateBlip = CreateBlip,
        -- DeleteBlip = DeleteBlip,

        -- VEHICLES CLIENT
        SetVehicleProperties = SetVehicleProperties,
        GetVehicleProperties = GetVehicleProperties,
        -- TARGET CLIENT

        --//TODO dodělat target
    }    
end