function Notify(title, message, time, type)
    if GetResourceState("okokNotify") == "started" then
        exports.okokNotify:Alert(title, message, time, type)
    elseif GetResourceState("wasabi_notify") == "started" then
        exports.wasabi_notify:notify(title, message, time, type)
    elseif GetResourceState("ox_lib") == "started" then
        lib.notify({
            title = title,
            description = message,
            type = type,
            duration = time
        })
    else
        print("^1[BHD_BRIDGE] Notify not configured, you need to add your notifications, if you want me to add it, just send me docs site for your resource and I can add it into the bridge^7")
    end
end