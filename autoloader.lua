local config = {
    scripts = {
        [9150032572] = "https://raw.githubusercontent.com/alriceeeee/basic-roblox-stuff/refs/heads/main/clickinggods.lua",
        [3101667897] = "https://raw.githubusercontent.com/alriceeeee/basic-roblox-stuff/refs/heads/main/legendsofspeedautofarm.lua",
        [18408132742] = "https://raw.githubusercontent.com/alriceeeee/basic-roblox-stuff/refs/heads/main/moneyclickerinc.lua",
        [4898652375] = "https://raw.githubusercontent.com/alriceeeee/basic-roblox-stuff/refs/heads/main/nolimitliftingsim.lua",
        [116295913939017] = "https://raw.githubusercontent.com/alriceeeee/basic-roblox-stuff/refs/heads/main/plinkoRNG.lua" 
    }
}

-- Wait for game to load
game:IsLoaded()

local function loadScript(url)
    print("Attempting to load script from:", url)
    local success, script = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        print("Successfully fetched script")
        local loadedScript, errorMsg = loadstring(script)
        if loadedScript then
            print("Attempting to execute script...")
            local execSuccess, execError = pcall(loadedScript)
            if execSuccess then
                print("Script executed successfully")
            else
                warn("Failed to execute script:", execError)
            end
        else
            warn("Failed to compile script:", errorMsg)
        end
    else
        warn("Failed to fetch script:", script)
    end
end

local gameId = game.PlaceId
print("Current Game ID:", gameId) 

if config.scripts[gameId] then
    print("Found script for game ID:", gameId)
    loadScript(config.scripts[gameId])
else
    print("No script found for game ID:", gameId)
end
