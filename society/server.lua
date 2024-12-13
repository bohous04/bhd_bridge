function GetCompanyMoney(name)
    local companyBalance = nil
    if BridgeConfig.Society == "okokbanking" then
        companyBalance = MySQL.scalar.await("SELECT value FROM okokbanking_societies WHERE society_name = ?", { name })
    elseif BridgeConfig.Society == "esx_society" then
        TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
            companyBalance = account.money
        end)
        while companyBalance == nil do Wait(10) end
    elseif BridgeConfig.Society == "qb_society" then
        companyBalance = exports['qb-banking']:GetAccountBalance(name)
    end
    return companyBalance
end

function AddCompanyMoney(name, amount)
    if BridgeConfig.Society == "okokbanking" then
        MySQL.prepare.await("UPDATE okokbanking_societies SET value = value + ? WHERE society = ?", { amount, ("society_%s"):format(name) })
    elseif BridgeConfig.Society == "esx_society" then
        TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
            account.addMoney(amount)
        end)
    elseif BridgeConfig.Society == "qb_society" then
        exports['qb-banking']:AddMoney(name, amount, "")
    end
end

function RemoveCompanyMoney(name, amount)
    if BridgeConfig.Society == "okokbanking" then
        MySQL.update.await("UPDATE okokbanking_societies SET value = value - ? WHERE society = ?", { amount, ("society_%s"):format(name) })
    elseif BridgeConfig.Society == "esx_society" then
        TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
            account.removeMoney(amount)
        end)
    elseif BridgeConfig.Society == "qb_society" then
        exports['qb-banking']:RemoveMoney(name, amount, "")
    end
end

function SetCompanyMoney(name, amount)
    if BridgeConfig.Society == "okokbanking" then
        MySQL.update.await("UPDATE okokbanking_societies SET value = ? WHERE society = ?", { amount, ("society_%s"):format(name) })
    elseif BridgeConfig.Society == "esx_society" then
        TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
            account.setMoney(amount)
        end)
    elseif BridgeConfig.Society == "qb_society" then
        local balance = exports['qb-banking']:GetAccountBalance(name)
        exports['qb-banking']:RemoveMoney(name, balance, '')
        exports['qb-banking']:AddMoney(name, amount, '')
    end
end