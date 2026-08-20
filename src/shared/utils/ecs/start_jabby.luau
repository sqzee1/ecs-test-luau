local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local jabby = require(ReplicatedStorage.Packages.jabby)
local world = require(ReplicatedStorage.Shared.world)

local function start_jabby()
    local prefix = RunService:IsServer() and "Server" or "Client"

    jabby.register({
        applet = jabby.applets.world,
        name = `World - {prefix}`,
        configuration = {
            world = world,
        },
    } :: any)

    jabby.set_check_function(function()
        return true
    end)

    if RunService:IsClient() then
        local mounted = false
        local client = jabby.obtain_client()

        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode ~= Enum.KeyCode.F4 then
                return
            end

            if mounted then
                client.unmount_all()
                mounted = false
            else
                client.spawn_app(client.apps.home :: any)
                mounted = true
            end
        end)
    end
end

return start_jabby
