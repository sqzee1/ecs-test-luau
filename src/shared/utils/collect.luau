--!nonstrict

type Signal<T...> = { [any]: any }
type Cleanup = () -> ()

local function collect<T...>(event: (listener: (T...) -> ()) -> Cleanup | Signal<T...>)
    local storage = {}
    local mt = {}

    mt.__iter = function()
        local n = #storage
        return function()
            if n <= 0 then
                return nil
            end
            n -= 1
            return n + 1, unpack(table.remove(storage, 1) :: any)
        end
    end

    local function push(...)
        table.insert(storage, { ... })
    end

    local disconnect
    if type(event) == "function" then
        disconnect = event(push)
    else
        local ok, on_method = pcall(function()
            return (event :: any).on
        end)

        if ok and type(on_method) == "function" then
            local connection = event:on(function(data)
                push(data)
            end)
            disconnect = function()
                connection:disconnect()
            end
        else
            disconnect = event:Connect(push)
        end
    end

    setmetatable(storage, mt)
    return (storage :: any) :: () -> (number, T...), function()
        disconnect()
    end
end

return collect :: any
