if BridgeConfig.TargetResource ~= "qb-target" then return end

local function convert(options)
    local distance = 5
    options = options.options

    for _, v in pairs(options) do

        distance = v.distance

        if v.items then v.item = v.items end

        if v.export then
            v.action = function(entity)
                local resource, exportName = string.strsplit('.', v.export)
                exports[resource][exportName](nil, table.merge(v, { entity = entity }))
            end
        end

        if v.event then
            v.type = 'client'
        end

        if v.serverEvent then
            v.type = 'server'
            v.event = v.serverEvent
        end

        if v.command then
            v.type = 'command'
            v.event = v.command
        end
    end

    return distance, options
end

function AddGlobalObject(options)
    local distance, options = convert({ options = options })
    exports["qb-target"]:AddGlobalObject({
        options = options,
        distance = distance
    })
end

function RemoveGlobalObject(optionNames)
    exports["qb-target"]:RemoveGlobalObject(optionNames)
end

function AddGlobalPed(options)
    local distance, options = convert({ options = options })
    exports["qb-target"]:AddGlobalPed({
        options = options,
        distance = distance
    })
end

function RemoveGlobalPed(optionNames)
    exports["qb-target"]:RemoveGlobalPed(optionNames)
end

function AddGlobalPlayer(options)
    local distance, options = convert({ options = options })
    exports["qb-target"]:AddGlobalPlayer({
        options = options,
        distance = distance
    })
end

function RemoveGlobalPlayer(optionNames)
    exports["qb-target"]:RemoveGlobalPlayer(labels)
end

function AddGlobalVehicle(options)
    local distance, options = convert({ options = options })
    exports["qb-target"]:AddGlobalVehicle({
        options = options,
        distance = distance
    })
end

function RemoveGlobalVehicle(optionNames)
    exports["qb-target"]:RemoveGlobalVehicle(labels)
end

function AddEntity(entities, options)
    local distance, options = convert({ options = options })
    exports["qb-target"]:AddTargetEntity(entities, {
        options = options,
        distance = distance
    })
end

function RemoveEntity(entities, optionNames)
    exports["qb-target"]:RemoveTargetEntity(entities, optionNames)
end

function AddSphereZone(parameters)
    local distance, options = convert(data)

    if not data.radius then data.radius = 2 end

    exports["qb-target"]:AddCircleZone(data.name, data.coords, data.radius, {
        name = data.name,
        debugPoly = data.debug,
        useZ = true,
    }, {
        options = options,
        distance = distance
    })
    return data.name
end

function AddBoxZone(parameters)
    local distance, options = convert(data)

    if not data.size then data.size = vector3(4, 4, 4) end
    if not data.rotation then data.rotation = 0 end

    exports["qb-target"]:AddBoxZone(data.name, data.coords, data.size.y, data.size.x,{
        name = data.name,
        heading = data.rotation,
        debugPoly = data.debug,
        minZ = (data.coords.z - (data.size.z / 2)),
        maxZ = (data.coords.z + (data.size.z / 2)),
    }, {
        options = options,
        distance = distance
    })
    return data.name
end

function AddPolyZone(parameters)
    local distance, options = convert(data)

    local points = {}
    local z = 0
    for pos, coords in ipairs(data.points) do
        points[pos] = vec2(coords.x, coords.y)
        z = z + coords.z
    end

    exports["qb-target"]:AddPolyZone(data.name, points, {
        name = data.name,
        debugPoly = data.debug,
        minZ = (z / #points) - (data.height / 2),
        maxZ = (z / #points) + (data.height / 2),
    }, {
        options = options,
        distance = distance
    })
    return data.name
end

function RemoveZone(id)
    exports["qb-target"]:RemoveZone(id)
end