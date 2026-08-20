const ReplicatedStorage = game:GetService("ReplicatedStorage")
const ServerScriptService = game:GetService("ServerScriptService")

const network = require(ReplicatedStorage.Shared.network)
const replicator = require(ServerScriptService.Server.replicator)
const interval = require(ReplicatedStorage.Shared.utils.interval)

local updates_interval = interval(1 / 20)
local unreliables_interval = interval(1 / 30)

function replecs_server()
    if updates_interval() then
        for player, buf, variants in replicator:collect_updates() do
            print("TEST", buf, variants)
            network.send_updates:send({ buf = buf, variants = variants }, player)
        end
    end

    if unreliables_interval() then
        for player, buf, variants in replicator:collect_unreliable() do
            network.send_unreliables:send({ buf = buf, variants = variants }, player)
        end
    end
end

return replecs_server
