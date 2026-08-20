const ReplicatedStorage = game:GetService("ReplicatedStorage")
const c = require(ReplicatedStorage.Shared.components.c)
const world = require(ReplicatedStorage.Shared.world)

local function unix_watcher()
    for entity, unix in world:query(c.unix):iter() do
        print("[unix]", entity, unix)
    end
end

return unix_watcher
