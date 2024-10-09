function ServerNotify(source, message, time, type, title)
    if GetResourceState("okokNotify") == "started" then
        TriggerClientEvent('okokNotify:Alert', source, title, message, time, type)
    elseif GetResourceState("wasabi_notify") == "started" then
        TriggerClientEvent('wasabi_notify:notify', source, title, message, time, type)
    elseif GetResourceState("ox_lib") == "started" then
        TriggerClientEvent('ox_lib:notify', source,{
            title = title,
            description = message,
            type = type,
            duration = time
        })
    else
        print("^1[BHD_BRIDGE] Notify not configured, you need to add your notifications, if you want me to add it, just send me docs site for your resource and I can add it into the bridge^7")
    end
end