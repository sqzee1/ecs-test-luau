local ReplicatedStorage = game:GetService("ReplicatedStorage")
const jecs = require(ReplicatedStorage.Packages.jecs)
const world = require(ReplicatedStorage.Shared.world)

function add_names<T>(entities: T): T
    for name, entity in entities :: any do
        world:set(entity, jecs.Name, name)
    end
    return entities
end

return add_names
