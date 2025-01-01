local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local isEnabled = true  -- Set this to true to enable infinite zoom by default
local currentMaxZoom = player.CameraMaxZoomDistance
local defaultMaxZoom = 100

local function onMouseWheel(input, gameProcessed)
    if not isEnabled or gameProcessed then return end
    
    if input.UserInputType == Enum.UserInputType.MouseWheel then
        local currentZoom = (camera.CFrame.Position - camera.Focus.Position).Magnitude
        
        if input.Position.Z < 0 then
            if currentZoom >= currentMaxZoom * 0.9 then
                currentMaxZoom = currentMaxZoom * 1.5
                player.CameraMaxZoomDistance = currentMaxZoom
            end
        end
    end
end

isEnabled = true
player.CameraMaxZoomDistance = currentMaxZoom

UserInputService.InputChanged:Connect(onMouseWheel)