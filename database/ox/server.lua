function DatabaseInsert(command, args)
    local id = MySQL.insert.await(command, args)
    return id
end

function DatabaseQuery(command, args)
    local response = MySQL.query.await(command, args)
    return response
end

function DatabaseUpdate(command, args)
    local affectedRows = MySQL.update.await(command, args)
    return affectedRows
end