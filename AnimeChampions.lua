local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local player = game.Players.LocalPlayer
local QUEST = player.PlayerGui.MainGui.Quest
local LEVEL = player.leaderstats.Level
local w = library:CreateWindow("Anime Champions⭐") 
local b = w:CreateFolder("AutoFarm")
local LEVELS = {}
local autofarm
b:Toggle("AutoFarm ON/OFF",function(af)
    autofarm = af
end)
local STAGE = nil
if LEVEL.Value >= 1 and LEVEL.Value <= 2 then
    STAGE = "Island1"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 3 and LEVEL.Value <= 4 then
    STAGE = "Island2"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 5 and LEVEL.Value <= 6 then
    STAGE = "Island3"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 7 and LEVEL.Value <= 9 then
    STAGE = "Island4"
    print("Stage attuale: "..STAGE)
    end
if LEVEL.Value >= 10 and LEVEL.Value <= 13 then
    STAGE = "Island5"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 14 and LEVEL.Value <= 19 then
    STAGE = "Island6"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 20 and LEVEL.Value <= 24 then
    STAGE = "Island7"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 25 and LEVEL.Value <= 29 then
    STAGE = "Island8"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 30 and LEVEL.Value <= 34 then
    STAGE = "Island9"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 35 and LEVEL.Value <= 44 then
    STAGE = "Island10"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 45 and LEVEL.Value <= 54 then
    STAGE = "Island11"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 55 and LEVEL.Value <= 59 then
    STAGE = "Island12"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 60 and LEVEL.Value <= 69 then
    STAGE = "Island13"
    print("Stage attuale: "..STAGE)
end
if LEVEL.Value >= 70 and LEVEL.Value <= 999 then
    STAGE = "Island13"
    print("Stage attuale: "..STAGE)
end

LEVEL.Changed:Connect(function()
    if LEVEL.Value >= 1 and LEVEL.Value <= 2 then
        STAGE = "Island1"
    end
    if LEVEL.Value >= 3 and LEVEL.Value <= 4 then
        STAGE = "Island2"
    end
    if LEVEL.Value >= 5 and LEVEL.Value <= 6 then
        STAGE = "Island3"
    end
    if LEVEL.Value >= 7 and LEVEL.Value <= 9 then
        STAGE = "Island4"
    end
    if LEVEL.Value >= 10 and LEVEL.Value <= 13 then
        STAGE = "Island5"
    end
    if LEVEL.Value >= 14 and LEVEL.Value <= 19 then
        STAGE = "Island6"
    end
    if LEVEL.Value >= 20 and LEVEL.Value <= 24 then
        STAGE = "Island7"
    end
    if LEVEL.Value >= 25 and LEVEL.Value <= 29 then
        STAGE = "Island8"
    end
    if LEVEL.Value >= 30 and LEVEL.Value <= 34 then
        STAGE = "Island9"
    end
    if LEVEL.Value >= 35 and LEVEL.Value <= 44 then
        STAGE = "Island10"
    end
    if LEVEL.Value >= 45 and LEVEL.Value <= 54 then
        STAGE = "Island11"
    end
    if LEVEL.Value >= 55 and LEVEL.Value <= 59 then
        STAGE = "Island12"
    end
    if LEVEL.Value >= 60 and LEVEL.Value <= 69 then
        STAGE = "Island13"
    end
    if LEVEL.Value >= 70 and LEVEL.Value <= 999 then
        STAGE = "Island13"
    end
    print("Stage attuale: "..STAGE)
end)
local function FARM()
    for i,v in pairs(workspace.Enemies:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Enemy").Health > 1 then
            repeat wait()
                player.Character.HumanoidRootPart.CFrame=v.HumanoidRootPart.CFrame-v.HumanoidRootPart.CFrame.lookVector*3.5
                game:GetService("ReplicatedStorage").Remotes.Attack:FireServer(player.Character)
                game:GetService("ReplicatedStorage").Remotes.ClaimQuest:FireServer("ChichaQuest")
            until v.Enemy.Health == 1 or not autofarm or not QUEST.Visible
        end
    end
end

spawn(function()
    while wait() do
        if autofarm then
            if QUEST.Visible then
                game:GetService("ReplicatedStorage").Remotes.Teleport:FireServer(STAGE)
                FARM()
            else
                game:GetService("ReplicatedStorage").Remotes.Teleport:FireServer("MainIsland")
                game:GetService("ReplicatedStorage").Remotes.GetQuest:FireServer("ChichaQuest")
                repeat wait() until QUEST.Visible
            end
        end
    end
end)
local c = w:CreateFolder("Open Crates")
c:Label("U must be in MainIsland to buy",{
    TextSize = 16;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(55,55,55);
    
}) 
c:Button("TP MainIsland",function()
    game:GetService("ReplicatedStorage").Remotes.Teleport:FireServer("MainIsland")
end)
c:Label("BLADES",{
    TextSize = 20;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(55,55,55);
    
}) 
local dropdown
local BLADES = {}
for i,v in pairs(workspace.Islands.MainIsland.BladeOpeners:GetChildren()) do
    if string.find(v.Name, "Shiny") and not table.find(BLADES, v.Name) then
        table.insert(BLADES, v.Name)
    end
end
c:Dropdown("Select Tier:",BLADES,true,function(dropblade)
    dropdown = dropblade
end)
local openblades
c:Toggle("Buy Blades",function(ob)
    openblades = ob
end)
spawn(function()
    while wait(.5) do
        if openblades then
            game:GetService("ReplicatedStorage").Remotes.RollBlade:FireServer(dropdown, "Yen")
        end
    end
end)
c:Label("CHAMPIONS",{
    TextSize = 20;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(55,55,55);
    
}) 
local HEROES = {}
for i,v in pairs(workspace.Islands.MainIsland.HeroOpeners:GetChildren()) do
    if string.find(v.Name, "Shiny") and not table.find(HEROES, v.Name) then
        table.insert(HEROES, v.Name)
    end
end
local champdrop
c:Dropdown("Select Tier:",HEROES,true,function(dropchamp)
    champdrop = dropchamp
end)
local openchamp
c:Toggle("Buy Champions",function(ob)
    openchamp = ob
end)
spawn(function()
    while wait(.25) do
        if openchamp then
            game:GetService("ReplicatedStorage").Remotes.RollHero:FireServer(champdrop, "Yen")
        end
    end
end)

