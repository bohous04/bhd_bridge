function GetVehicleProperties(vehicle)
    if GetResourceState("es_extended") == "started" then
        local props = ESX.Game.GetVehicleProperties(vehicle)
        return props
    elseif GetResourceState("qb_core") == "started" then
        --//TODO dodělat
        return props
    else
        return nil
    end
end

function SetVehicleProperties(vehicle, props)
    if GetResourceState("es_extended") == "started" then
        ESX.Game.SetVehicleProperties(vehicle, props)
    elseif GetResourceState("qb_core") == "started" then
        --//TODO dodělat
    else
    end
end