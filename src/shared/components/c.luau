const ReplicatedStorage = game:GetService("ReplicatedStorage")
const jecs = require(ReplicatedStorage.Packages.jecs)
const add_names = require(ReplicatedStorage.Shared.utils.ecs.add_names)
const add_shared = require(ReplicatedStorage.Shared.utils.ecs.add_shared)
const world = require(ReplicatedStorage.Shared.world)

local components = {
    unix = world:component() :: jecs.Component<number>,
}

add_names(components)
add_shared(components)

return components
