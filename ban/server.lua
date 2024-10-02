---@param source number
---@param reason string
function Ban(source, reason)
    exports['Cloudflare_Game_Caching']:BanPlayer(source, reason)
end