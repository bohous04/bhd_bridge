function GetPhone(source, identifier)
    local phone = "Unknown"
    if BridgeConfig.Phone == "lb-phone" then
        if source then
            phone = exports["lb-phone"]:GetEquippedPhoneNumber(source)
        else
            phone = MySQL.scalar.await('SELECT phone_number FROM phone_phones WHERE id = ?', {identifier})
        end
    elseif BridgeConfig.Phone == "okokPhone" then
        phone = exports['okokPhone']:getPhoneNumberFromSource(source)
    elseif BridgeConfig.Phone == "qs-smartphone-pro" then
        phone = exports['qs-smartphone-pro']:GetPhoneNumberFromIdentifier(identifier, true)
    elseif BridgeConfig.Phone == "qs-smartphone" then
        phone = exports['qs-base']:GetPlayerPhone(source)
    end
    return phone
end