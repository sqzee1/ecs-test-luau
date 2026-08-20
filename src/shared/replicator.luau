const ReplicatedStorage = game:GetService("ReplicatedStorage")
const replecs = require(ReplicatedStorage.Packages.replecs)
const world = require(script.Parent.world)

return replecs.create(world :: any)
