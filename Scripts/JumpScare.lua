task.spawn(function()
    if not isfile("video.webm") then
        writefile("video.webm", game:HttpGet("https://api.swimhub.xyz/video.webm"))
    end
    if not getcustomasset then return end
    local hold = game.CoreGui.RobloxGui
    hold.IgnoreGuiInset = true
    local new = Instance.new("VideoFrame", hold)
    new.Visible = false
    new.Looped = true
    new.Video = getcustomasset("video.webm")
    new.Volume = math.huge
    new.Size = UDim2.new(1,0,1,0)
    new.ZIndex = math.huge
    repeat wait() until new.IsLoaded
    new.Visible = true
    new:Play()
end)