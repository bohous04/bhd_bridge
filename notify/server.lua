function ServerNotify(source, message, time, type, title)
    if GetResourceState("okokNotify") == "started" then
        TriggerClientEvent('okokNotify:Alert', source, title, message, time, type)
    elseif GetResourceState("rcore_notify") == "started" then

    else
        print("^1[BHD_BRIDGE] Notify not configured, you need to add your notify, if you want me to add it, just send me docs site for your resource and I can add it into the bridge^7")
    end
end