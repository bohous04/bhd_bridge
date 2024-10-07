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
    },
    FontName = "oswald",
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

        AddBlip = AddBlip,
        DeleteBlip = DeleteBlip,

        -- VEHICLES CLIENT
        SetVehicleProperties = SetVehicleProperties,
        GetVehicleProperties = GetVehicleProperties,

        -- TARGET CLIENT
        AddGlobalObject = AddGlobalObject,
        RemoveGlobalObject = RemoveGlobalObject,
        AddGlobalPed = AddGlobalPed,
        RemoveGlobalPed = RemoveGlobalPed,
        AddGlobalPlayer = AddGlobalPlayer,
        RemoveGlobalPlayer = RemoveGlobalPlayer,
        AddGlobalVehicle = AddGlobalVehicle,
        RemoveGlobalVehicle = RemoveGlobalVehicle,
        AddEntity = AddEntity,
        RemoveEntity = RemoveEntity,
        AddLocalEntity = AddLocalEntity,
        RemoveLocalEntity = RemoveLocalEntity,
        AddSphereZone = AddSphereZone,
        AddBoxZone = AddBoxZone,
        AddPolyZone = AddPolyZone,
        RemoveZone = RemoveZone,

        -- DISPATCH CLIENT
        Dispatch = Dispatch,
        
        -- CHOOSE CLOSEST PLAYER CLIENT
        ChoosePlayer = ChoosePlayer,


        --//TODO dodělat target, dispatch
    }    
end