function ChoosePlayer(title)
    local nearbyPlayers = lib.getNearbyPlayers(cache.coords, 3.0)
    local nearbyCount = #nearbyPlayers
    local chosenPlayer, currentlyHoveredPlayer = false, 0
    if nearbyCount == 0 then return end

    if nearbyCount == 1 then
        return GetPlayerServerId(nearbyPlayers[1].id)
    end

    local giveList, n = {}, 0

    for i = 1, #nearbyPlayers do
        local option = nearbyPlayers[i]
        option.id = GetPlayerServerId(option.id)
        option.label = ('#%s'):format(n)
        n += 1
        giveList[n] = option
    end

    if n == 0 then return end

    lib.registerMenu({
        id = 'bhd_bridge:choosePlayer',
        title = title,
        options = giveList,
        onSideScroll = function(selected)
            currentlyHoveredPlayer = giveList[selected].id
        end,
        onSelected = function(selected)
            currentlyHoveredPlayer = giveList[selected].id
        end,
        onClose = function()
            chosenPlayer = nil
        end,
    }, function(selected)
        chosenPlayer = giveList[selected].id
    end)
    lib.showMenu('bhd_bridge:choosePlayer')

    CreateThread(function ()
        while chosenPlayer == false do
            Wait(0)
            local playerIdx = GetPlayerFromServerId(currentlyHoveredPlayer)
            local ped = GetPlayerPed(playerIdx)
            local coords = GetEntityCoords(ped)
            DrawMarker(2, coords.x, coords.y, coords.z + 1.0, 0.0, 0.0, 0.0, 180.0, 0.0, 75.0, 0.3, 0.3, 0.1, 219, 126, 58, 250, false, false, 0, true, nil, nil, false)
        end
    end)
    while chosenPlayer == false do
        Wait(500)
    end
    return currentlyHoveredPlayer
end