local peds = {      --[[
    ["example"] = {
        pos = vec4(0.0, 0.0, 0.0, 0.0),
        hash = "s_m_y_dealer_01",
        anim = {
            clip = "wave",
            dict = "anim@mp_player_intcelebrationfemale@wave",
            scenario = "WORLD_HUMAN_AA_SMOKE",
        },
        target = {
            {
                name = "example",
                label = "Test NPC"
                icon = "fas fa-user",
                event = "example:target",
                serverEvent = nil,
                groups = {["police"] = 0, ["ambulance"] = 0},
                distance = 2,
                export = nil,
            },
        }
    },]]
}

function CreateNPC(data)
    if peds[data.name] then
        print("[ERROR] NPC with name " .. data.name .. " already exists, replacing PED.")
    end
    peds[data.name] = data
end

function DeleteNPC(name)
    if not peds[name] then
        print("[ERROR] NPC with name " .. name .. " does not exist.")
        return
    end
    DeleteEntity(peds[name].spawned)
    peds[name] = nil
end

Citizen.CreateThread(function()
    Wait(10000)
    while true do
        for k, v in pairs(peds) do
            local dist = #(vec3(v.pos) - GetEntityCoords(cache.ped))
            if dist < 200 and not v.spawned then
                local hash = GetHashKey(v.hash)
                lib.requestModel(hash)
                local npc = CreatePed(4, hash, v.pos.x, v.pos.y, v.pos.z, v.pos[4], false, true)

                while not DoesEntityExist(npc) do
                    Wait(150)
                end

                if v.anim?.scenario then
                    TaskStartScenarioInPlace(npc, v.anim.scenario, 0, true)
                elseif v?.anim?.clip and v?.anim?.dict then
                    lib.requestAnimDict(v.anim.dict)
                    TaskPlayAnim(npc, v.anim.dict, v.anim.clip, 8.0, 0.0, -1, 1, 0, false, false, false)
                    RemoveAnimDict(v.anim.dict)
                else
                    lib.requestAnimDict("anim@mp_player_intcelebrationfemale@wave")
                    TaskPlayAnim(npc, "anim@mp_player_intcelebrationfemale@wave", "wave", 8.0, 0.0, -1, 1, 0, false, false, false)
                    RemoveAnimDict("anim@mp_player_intcelebrationfemale@wave")
                end

                SetEntityHeading(npc, v.pos[4])
                FreezeEntityPosition(npc, true)
                SetEntityInvincible(npc, true)
                SetPedKeepTask(npc, true)
                SetPedDiesWhenInjured(npc, false)
                SetPedFleeAttributes(npc, 0, false)
                SetBlockingOfNonTemporaryEvents(npc, true)

                peds[k].spawned = npc
                if v.target then
                    Bridge.AddEntity(npc, v.target)
                end

                SetModelAsNoLongerNeeded(v.hash)
            elseif dist >= 200 and v.spawned then
                if v.target then
                    local optionNames = {}
                    for i = 1, #v.target do
                        optionNames[#optionNames+1] = v.target[i].name
                    end
                    Bridge.RemoveEntity(v.spawned, optionNames)
                end
                DeleteEntity(v.spawned)
                peds[k].spawned = nil
            end
        end
        Wait(5000)
    end
end)