local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/alriceeeee/NEVERLOSE-UI-Nightly/main/source.lua"))()
-- only auto clicks and auto upgrades the first 3 things, not interesting in adding other things lol
NEVERLOSE:Theme("dark")

local Window = NEVERLOSE:AddWindow("Auto Clicker", "Clicker Game")
local Notification = NEVERLOSE:Notification()

Notification.MaxNotifications = 6

local MainTab = Window:AddTab('Auto Farm', 'mouse')
local FarmingSection = MainTab:AddSection('Farming Options', "left")

local config = {
    AutoClick = false,
    AutoUpgrade = false,
    AutoCurrency = false,
    AutoGPU = false
}

FarmingSection:AddToggle('Auto Click',false,function(val)
    config.AutoClick = val
    if val then
        Notification:Notify("info", "Auto Clicker", "Started Auto Clicking")
    else
        Notification:Notify("warning", "Auto Clicker", "Stopped Auto Clicking")
    end
end)

FarmingSection:AddToggle('Auto Upgrade',false,function(val)
    config.AutoUpgrade = val
    if val then
        Notification:Notify("info", "Auto Upgrade", "Started Auto Upgrading")
    else
        Notification:Notify("warning", "Auto Upgrade", "Stopped Auto Upgrading")
    end
end)

FarmingSection:AddToggle('Auto Currency Upgrade',false,function(val)
    config.AutoCurrency = val
    if val then
        Notification:Notify("info", "Auto Currency", "Started Auto Currency Upgrading")
    else
        Notification:Notify("warning", "Auto Currency", "Stopped Auto Currency Upgrading")
    end
end)

FarmingSection:AddToggle('Auto GPU Upgrade',false,function(val)
    config.AutoGPU = val
    if val then
        Notification:Notify("info", "Auto GPU", "Started Auto GPU Upgrading")
    else
        Notification:Notify("warning", "Auto GPU", "Stopped Auto GPU Upgrading")
    end
end)

spawn(function()
    while wait() do
        if config.AutoClick then
            game:GetService("ReplicatedStorage").Events.ClickMoney:FireServer()
        end
    end
end)

spawn(function()
    while wait() do
        if config.AutoUpgrade then
            game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(2,false)
        end
    end
end)

spawn(function()
    while wait() do
        if config.AutoCurrency then
            game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(1,false)
        end
    end
end)

spawn(function()
    while wait() do
        if config.AutoGPU then
            game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(3,false)
        end
    end
end)
