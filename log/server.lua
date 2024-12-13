local webhook = ""
if BridgeConfig.LogTypes == "discordWebhook" and webhook == "" then
    print("[ERROR] You have to set webhook in bhd_bridge/log/server.lua")
end
function Log(source, message, title)
    if BridgeConfig.LogTypes == "ox_lib" then
        lib.logger(source, title, message)
    elseif BridgeConfig.LogTypes == "discordWebhook" then
        if webhook == "" then
            print("[ERROR] You have to set webhook in bhd_bridge/log/server.lua")
            print("[LOGS NOT CONFIGURED] "..source.." | "..title.." | "..message)
            return
        end
        PerformHttpRequest(webhook, function(err, text, headers)
        end, 'POST',
        json.encode({username = title, embeds = {
            {
                ["color"] = "3066993",
                ["title"] = title,
                ["description"] = message,
                    ["footer"] = {
                    ["text"] = os.date('%H:%M - %d. %m. %Y', os.time()),
                },
            }
        }}), { ['Content-Type'] ='application/json' })
    else
        print("[LOGS NOT CONFIGURED] "..source.." | "..title.." | "..message)
    end
end