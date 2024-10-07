function Dispatch(code, description, coords, jobs, blipName, blipSprite, blipScale, blipColor)
    if GetResourceState("cd_dispatch") == "started" then
        local data = exports['cd_dispatch']:GetPlayerInfo() --//TODO do bridge
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = jobs,
            coords = coords,
            title = code,
            message = description,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = blipSprite,
                scale = blipScale,
                colour = blipColor,
                flashes = false,
                text = "<FONT FACE='"..BridgeConfig.FontName.."'>"..blipName.."</FONT>",
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState("rcore_dispatch") == "starting" then
        local data = {
            code = code, -- string -> The alert code, can be for example '10-64' or a little bit longer sentence like '10-64 - Shop robbery'
            default_priority = 'low', -- 'low' | 'medium' | 'high' -> The alert priority
            coords = coords, -- vector3 -> The coords of the alert
            job = jobs, -- string | table -> The job, for example 'police' or a table {'police', 'ambulance'}
            text = description, -- string -> The alert text
            type = 'alerts', -- alerts | shop_robbery | car_robbery | bank_robbery -> The alert type to track stats
            blip_time = 5, -- number (optional) -> The time until the blip fades
            image = nil, -- string (optional) -> The url to show an image
            custom_sound = nil, -- string (optional) -> The url to the sound to play with the alert
            blip = { -- Blip table (optional)
                sprite = blipSprite, -- number -> The blip sprite: Find them here (https://docs.fivem.net/docs/game-references/blips/#blips)
                colour = blipColor, -- number -> The blip colour: Find them here (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
                scale = blipScale, -- number -> The blip scale
                text = blipName, -- number (optional) -> The blip text
                flashes = false, -- boolean (optional) -> Make the blip flash
                radius = 0, -- number (optional) -> Create a radius blip instead of a normal one
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState("qs-dispatch") == "starting" then
        TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = jobs,
            callLocation = coords,
            callCode = { code = 'CODE:', snippet = code },
            message = description,
            flashes = false, -- you can set to true if you need call flashing sirens...
            image = nil, -- Url for image to attach to the call 
            --you can use the getSSURL export to get this url
            blip = {
                sprite = blipSprite, --blip sprite
                scale = blipScale, -- blip scale
                colour = blipColor, -- blio colour
                flashes = true, -- blip flashes
                text = blipName, -- blip text
                time = (5 * 60000), --blip fadeout time (1 * 60000) = 1 minute
            },
        })
    elseif GetResourceState("ps-dispatch") == "started" then
        local dispatchData = {
            message = description, -- add this into your locale
            codeName = 'testalert', -- this should be the same as in config.lua
            code = code,
            icon = 'fas fa-car-burst',
            priority = 2,
            coords = coords,
            jobs = jobs,
        }
        TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
    else
        print("^1[BHD_BRIDGE] Dispatch not configured, you need to add your dispatch, if you want me to add it, just send me docs site for your resource and I can add it into the bridge^7")
    end
end