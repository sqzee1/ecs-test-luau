const ReplicatedStorage = game:GetService("ReplicatedStorage")
const ServerScriptService = game:GetService("ServerScriptService")

const unix_prefab = require(ServerScriptService.Server.prefab.unix_prefab)
const replecs_server = require(ServerScriptService.Server.systems.replecs_server)
const lync = require(ReplicatedStorage.Packages.lync)
const network = require(ReplicatedStorage.Shared.network)
const scheduler = require(ReplicatedStorage.Shared.utils.ecs.scheduler)
const start_jabby = require(ReplicatedStorage.Shared.utils.ecs.start_jabby)
const replicator = require(script.Parent.replicator)

replicator:init()
start_jabby()
scheduler.scheduler:addSystem(replecs_server, scheduler.phases.PostUpdate)

network.receive_full:handle(function(_, player)
    if not player then
        return
    end

    replicator:mark_player_ready(player)
    local buf, variants = replicator:get_full(player)

    unix_prefab()

    return { buf = buf, variants = variants }
end)

lync.start()
