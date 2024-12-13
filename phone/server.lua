function GetPhone(source, identifier)
    local phone = nil
    if BridgeConfig.Phone == "lb-phone" then
        phone = exports["lb-phone"]:GetEquippedPhoneNumber(source)
    elseif BridgeConfig.Phone == "okokPhone" then
        phone = exports['okokPhone']:getPhoneNumberFromSource(source)
    elseif BridgeConfig.Phone == "qs-smartphone-pro" then
        phone = exports['qs-smartphone-pro']:GetPhoneNumberFromIdentifier(identifier, true)
    elseif BridgeConfig.Phone == "qs-smartphone" then
        phone = exports['qs-base']:GetPlayerPhone(source)
    end
    return phone
end