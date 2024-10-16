if BridgeConfig.TargetResource ~= "ox_target" then return end

local function convert(options)
    if v.job then v.groups = v.job end

    for id, v in pairs(options) do
        if v.canInteract then
            local canInteract = v.canInteract
            v.canInteract = function(entity, distance, coords, name, bone)
                print(json.encode(canInteract, { indent = true }))
                print(type(canInteract[1]))
                if type(canInteract) == "function" then return canInteract(entity, distance, coords, name, bone) end
                return true
            end
        end
    end
    return options
end

function AddGlobalObject(options)
    exports.ox_target:addGlobalObject(convert(options))
end

function RemoveGlobalObject(optionNames)
    exports.ox_target:removeGlobalObject(optionNames)
end

function AddGlobalPed(options)
    exports.ox_target:addGlobalPed(convert(options))
end

function RemoveGlobalPed(optionNames)
    exports.ox_target:removeGlobalPed(optionNames)
end

function AddGlobalPlayer(options)
    exports.ox_target:addGlobalPlayer(convert(options))
end

function RemoveGlobalPlayer(optionNames)
    exports.ox_target:removeGlobalPlayer(optionNames)
end

function AddGlobalVehicle(options)
    exports.ox_target:addGlobalVehicle(convert(options))
end

function RemoveGlobalVehicle(optionNames)
    exports.ox_target:removeGlobalVehicle(optionNames)
end

function AddEntity(entities, options)
    if type(entities) ~= "table" then entities = { entities } end
    for i = 1, #entities do
        local entity = entities[i]
        if NetworkGetEntityIsNetworked(entity) then
            exports.ox_target:addEntity(NetworkGetNetworkIdFromEntity(entity), convert(options))
        else
            exports.ox_target:addLocalEntity(entity, convert(options))
        end
    end
end

function RemoveEntity(entities, optionNames)
    if type(entities) ~= 'table' then entities = { entities } end
    for i = 1, #entities do
        local entity = entities[i]
        if NetworkGetEntityIsNetworked(entity) then
            exports.ox_target:removeEntity(NetworkGetNetworkIdFromEntity(entity), optionNames)
        else
            exports.ox_target:removeLocalEntity(entity, optionNames)
        end
    end
end

function AddSphereZone(data)
    return exports.ox_target:addSphereZone({
        debug = data.debug,
        name = data.name,
        coords = data.coords,
        radius = data.radius,
        options = convert(data.options)
    })
end

function AddBoxZone(data)
    return exports.ox_target:addBoxZone({
        debug = data.debug,
        name = data.name,
        coords = data.coords,
        size = data.size,
        rotation = data.rotation,
        options = convert(data.options)
    })
end

function AddPolyZone(data)
    return exports.ox_target:addPolyZone({
        debug = data.debug,
        name = data.name,
        points = data.points,
        thickness = data.height, 
        options = convert(data.options)
    })
end

function RemoveZone(id)
    exports.ox_target:removeZone(id)
end