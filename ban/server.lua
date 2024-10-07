---@param source number
---@param reason string
function Ban(source, reason)
    if BridgeConfig.AnticheatType == "fg" then
        exports[BridgeConfig.AnticheatName]:fg_BanPlayer(source, reason, true)
    elseif BridgeConfig.AnticheatType == "sqz" then
        exports[BridgeConfig.AnticheatName]:BanPlayer(source, reason)
    elseif BridgeConfig.AnticheatType == "wx" then
        exports[BridgeConfig.AnticheatName]:ban(source, reason)
    else
        print("^1[BHD_BRIDGE] Anticheat not configured, you need to add your anticheat, if you want me to add it, just send me docs site for your resource and I can add it into the bridge^7")
    end
end