local function convert(options)
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

function AddEntity(netIds, options)
    exports.ox_target:addEntity(netIds, convert(options))
end

function RemoveEntity(netIds, optionNames)
    exports.ox_target:removeEntity(netIds, optionNames)
end

function AddLocalEntity(entities, options)
    exports.ox_target:addLocalEntity(entities, convert(options))
end

function RemoveLocalEntity(entities, optionNames)
    exports.ox_target:removeLocalEntity(entities, optionNames)
end

function AddSphereZone(parameters)
    exports.ox_target:addSphereZone(parameters)
end

function AddBoxZone(parameters)
    exports.ox_target:addBoxZone(parameters)
end

function AddPolyZone(parameters)
    exports.ox_target:addPolyZone(parameters)
end

function RemoveZone(id)
    exports.ox_target:removeZone(id)
end