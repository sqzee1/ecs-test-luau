const ReplicatedStorage = game:GetService("ReplicatedStorage")
const lync = require(ReplicatedStorage.Packages.lync)

const replicated_state = lync.struct({
    buf = lync.buff,
    variants = lync.unknown,
})

local function validate_state(data)
    return typeof(data.variants) == "table", "it should be a table"
end

return table.freeze({
    receive_full = lync.query("receive_full", lync.nothing, replicated_state, {
        validate = validate_state,
    }),

    send_updates = lync.packet("send_updates", replicated_state, {
        validate = validate_state,
    }),

    send_unreliables = lync.packet("send_unreliables", replicated_state, {
        validate = validate_state,
    }),
})
