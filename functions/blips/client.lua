function DeleteBlip(blip)
    RemoveBlip(blip)
end

function AddBlip(Position, Sprite, Display, Scale, Colour, ShortRange, Name)
    local blip = AddBlipForCoord(Position.x, Position.y, Position.z)
    SetBlipSprite(blip, Sprite)
    SetBlipDisplay(blip, Display)
    SetBlipScale(blip, Scale)
    SetBlipColour(blip, Colour)
    SetBlipAsShortRange(blip, ShortRange)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("<FONT FACE='Oswald'>" .. Name .. "</FONT>")
    EndTextCommandSetBlipName(blip)
    return blip
end