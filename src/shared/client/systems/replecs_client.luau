const ReplicatedStorage = game:GetService("ReplicatedStorage")
const replicator = require(ReplicatedStorage.Shared.client.replicator)
const network = require(ReplicatedStorage.Shared.network)
const collect = require(ReplicatedStorage.Shared.utils.collect)

local updates = collect(network.send_updates) :: Collect
local unreliables = collect(network.send_unreliables) :: Collect

local function replecs_client()
    for _, data in updates do
        replicator:apply_updates(data.buf, data.variants)
    end
    for _, data in unreliables do
        replicator:apply_unreliable(data.buf, data.variants)
    end
end

return replecs_client
