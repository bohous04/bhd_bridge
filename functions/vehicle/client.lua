function GetVehicleProperties(vehicle)
    if BridgeConfig.VehicleProperties == "esx" then
        local props = ESX.Game.GetVehicleProperties(vehicle)
        return props
    elseif BridgeConfig.VehicleProperties == "qb" then
        local props = QBCore.Functions.GetVehicleProperties(vehicle)
        return props
    elseif BridgeConfig.VehicleProperties == "ox_lib" then
        local props = lib.getVehicleProperties(vehicle)
        return props
    else
        print("^1[BHD_BRIDGE] Vehicle properties not configured, you need to add your vehicle properties, if you want me to add it, just send me docs site for your resource and I can add it into the bridge^7")
        return nil
    end
end

function SetVehicleProperties(vehicle, props)
    if BridgeConfig.VehicleProperties == "esx" then
        ESX.Game.SetVehicleProperties(vehicle, props)
    elseif BridgeConfig.VehicleProperties == "qb" then
        QBCore.Functions.SetVehicleProperties(vehicle, props)
    elseif BridgeConfig.VehicleProperties == "ox_lib" then
        lib.setVehicleProperties(vehicle, props)
    else
        print("^1[BHD_BRIDGE] Vehicle properties not configured, you need to add your vehicle properties, if you want me to add it, just send me docs site for your resource and I can add it into the bridge^7")
        return nil
    end
end