const ReplicatedStorage = game:GetService("ReplicatedStorage")
const ServerScriptService = game:GetService("ServerScriptService")
const c = require(ReplicatedStorage.Shared.components.c)
const replicator = require(ServerScriptService.Server.replicator)
const world = require(ReplicatedStorage.Shared.world)

local function unix_prefab()
    local new_unix = world:entity()

    world:set(new_unix, c.unix, os.clock())

    replicator:set_networked(new_unix)
    replicator:set_reliable(new_unix, c.unix)

    task.spawn(function()
        while task.wait(2) do
            world:set(new_unix, c.unix, os.clock())
        end
    end)
end

return unix_prefab
