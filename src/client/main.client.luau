const ReplicatedStorage = game:GetService("ReplicatedStorage")
const lync = require(ReplicatedStorage.Packages.lync)
const replicator = require(ReplicatedStorage.Shared.client.replicator)
const network = require(ReplicatedStorage.Shared.network)
const scheduler = require(ReplicatedStorage.Shared.utils.ecs.scheduler)
const replecs_client = require(ReplicatedStorage.Shared.client.systems.replecs_client)
const unix_watcher = require(ReplicatedStorage.Shared.client.systems.unix_watcher)
const start_jabby = require(ReplicatedStorage.Shared.utils.ecs.start_jabby)

lync.start()
replicator:init()
start_jabby()

local response = network.receive_full:request(nil)
if response then
    replicator:apply_full(response.buf, response.variants)
else
    warn("timeout")
end

scheduler.scheduler:addSystem(replecs_client, scheduler.phases.First)
scheduler.scheduler:addSystem(unix_watcher, scheduler.phases.Update)
