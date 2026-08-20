const ReplicatedStorage = game:GetService("ReplicatedStorage")

const planck = require(ReplicatedStorage.Packages.planck)
const planck_runservice = require(ReplicatedStorage.Packages.planck_runservice)
const planck_jabby = require(ReplicatedStorage.Packages["planck_jabby"])
const world = require(ReplicatedStorage.Shared.world)

local planck_scheduler = planck.Scheduler
local jabby_plugin = planck_jabby.new()
local planck_runservice_plugin = planck_runservice.Plugin.new()

local scheduler = planck_scheduler
    .new(world)
    :addPlugin(jabby_plugin :: any)
    :addPlugin(planck_runservice_plugin :: any)

return {
    scheduler = scheduler,
    phases = planck_runservice.Phases,
}
