function Notify(title, message, time, type)
    if BridgeConfig.Notification == "okokNotify" then
        exports.okokNotify:Alert(title, message, time, type)
    elseif BridgeConfig.Notification == "wasabi_notify" then
        exports.wasabi_notify:notify(title, message, time, type)
    elseif BridgeConfig.Notification == "ox_lib" then
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