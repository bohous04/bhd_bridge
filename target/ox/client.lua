function AddGlobalObject(options)
    exports.ox_target:addGlobalObject(options)
end

function RemoveGlobalObject(optionNames)
    exports.ox_target:removeGlobalObject(optionNames)
end

function AddGlobalPed(options)
    exports.ox_target:addGlobalPed(options)
end

function RemoveGlobalPed(optionNames)
    exports.ox_target:removeGlobalPed(optionNames)
end

function AddGlobalPlayer(options)
    exports.ox_target:addGlobalPlayer(options)
end

function RemoveGlobalPlayer(optionNames)
    exports.ox_target:removeGlobalPlayer(optionNames)
end

function AddGlobalVehicle(options)
    exports.ox_target:addGlobalVehicle(options)
end

function RemoveGlobalVehicle(optionNames)
    exports.ox_target:removeGlobalVehicle(optionNames)
end

function AddEntity(netIds, options)
    exports.ox_target:addEntity(netIds, options)
end

function RemoveEntity(netIds, optionNames)
    exports.ox_target:removeEntity(netIds, optionNames)
end

function AddLocalEntity(entities, options)
    exports.ox_target:addLocalEntity(entities, options)
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