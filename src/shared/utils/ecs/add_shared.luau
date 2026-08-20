local ReplicatedStorage = game:GetService("ReplicatedStorage")
const replecs = require(ReplicatedStorage.Packages.replecs)
const world = require(ReplicatedStorage.Shared.world)

function add_shared<T>(entities: T): T
    for _name, entity in entities :: any do
        world:add(entity, replecs.shared)
    end
    return entities
end

return add_shared
