local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/alriceeeee/Fuzki-UI-Library/refs/heads/main/FuzkiLibrary.lua"))()
-- runs on no limit lifting simulator
local Main = Library:Create("Muscle Simulator", "Training")

local Training = Main:CreateSection("Training")

Training:CreateButton("Gain Muscle", "Click to gain muscle instantly", function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"GainMuscle"})
end)

Training:CreateButton("Sell Muscle", "Click to sell your muscle instantly", function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"SellMuscle"})
end)

local config = {
    GainMuscle = false,
    SellMuscle = false
}

Training:CreateToggle("Auto Gain Muscle", function(state)
    if state then
        config.GainMuscle = true
        while config.GainMuscle and wait() do
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"GainMuscle"})
        end
    else
        config.GainMuscle = false
    end
end)

Training:CreateToggle("Auto Sell Muscle", function(state)
    if state then
        config.SellMuscle = true
        while config.SellMuscle and wait() do
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"SellMuscle"})
        end
    else
        config.SellMuscle = false
    end
end)
