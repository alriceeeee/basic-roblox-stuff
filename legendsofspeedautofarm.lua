-- just saying this only does orbs in city lol
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/alriceeeee/Fuzki-UI-Library/refs/heads/main/FuzkiLibrary.lua"))()
local Main = Library:Create("Legends of Speed", "Auto Farm")

local Farming = Main:CreateSection("Auto Farm")


local collectYellowOrbs = false
local collectBlueOrbs = false
local collectGems = false
local collectRedOrbs = false


Farming:CreateToggle("Auto Collect Yellow Orbs", function(state)
    collectYellowOrbs = state
    if state then
        spawn(function()
            while collectYellowOrbs and wait() do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb","Yellow Orb","City")
            end
        end)
    end
end)

Farming:CreateToggle("Auto Collect Blue Orbs", function(state)
    collectBlueOrbs = state
    if state then
        spawn(function()
            while collectBlueOrbs and wait() do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb","Blue Orb","City")
            end
        end)
    end
end)

Farming:CreateToggle("Auto Collect Gems", function(state)
    collectGems = state
    if state then
        spawn(function()
            while collectGems and wait() do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb","Gem","City")
            end
        end)
    end
end)

Farming:CreateToggle("Auto Collect Red Orbs", function(state)
    collectRedOrbs = state
    if state then
        spawn(function()
            while collectRedOrbs and wait() do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb","Red Orb","City")
            end
        end)
    end
end)
