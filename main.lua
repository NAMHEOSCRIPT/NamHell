

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ido1212/Esp/main/ESPPP.lua"))()

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "Namhell |@NamDuong",
    LoadingTitle = "Namhell",
    LoadingSubtitle = "by NamDuong",
    ConfigurationSaving = {
        Enabled = true,
        FolderName =NamHell, -- Create a custom folder for your hub/game
        FileName = "Namhell Hub"
    },
        Discord = {
            Enabled = false,
            Invite = "sirius", -- The Discord invite code, do not include discord.gg/
            RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
        Title = "Namhell |@NamDuong",
        Subtitle = "Key System",
        Note = "hi ",
        FileName = "NamhellKey",
        SaveKey = true,
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = "Namhell"
    }
})
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Main")


local esp = Tab:CreateToggle({
	Name = "Esp",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        loadstring(game:HttpGet("https://pastehub.net/raw.php?p=f51adc3eb0c", true))()
    		-- The variable (Value) is a boolean on whether the toggle is true or false
	end,
})
local Silent = Tab:CreateButton({
	Name = "Silentaim",
	Callback = function()
        getgenv().fov = 180 -- Any angle between 0-180 degrees
        getgenv().visibleCheck = true -- true, false
        getgenv().targetedPart = "Random" -- "Head", "Torso" or "Random"
        -- phantom forces silent aim
-- by mickey#3373, working 11/25/2022
-- https://v3rmillion.net/showthread.php?tid=1193218

-- variables
local players = game:GetService("Players");
local localplayer = players.LocalPlayer;
local camera = workspace.CurrentCamera;
local shared = getrenv().shared;

-- modules
local physics = shared.require("physics");
local particle = shared.require("particle");
local replication = shared.require("ReplicationInterface");
local solve = debug.getupvalue(physics.timehit, 2);

-- functions
local function isVisible(position, ignore)
    return #camera:GetPartsObscuringTarget({ position }, ignore) == 0;
end

local function getClosest(dir, origin, ignore)
    local _angle = fov or 100;
    local _position, _entry;
   
    replication.operateOnAllEntries(function(player, entry)
        local tpObject = entry and entry._thirdPersonObject;
        local character = tpObject and tpObject._character;
        if character and player.Team ~= localplayer.Team then
            local position = character[targetedPart == "Random" and
                (math.random() < (headChance or 0.5) and "Head" or "Torso") or
                (targetedPart or "Head")].Position;

            if not (visibleCheck and not isVisible(position, ignore)) then
                local dot = dir.Unit:Dot((position - origin).Unit);
                local angle = 180 - (dot + 1) * 90;
                if angle < _angle then
                    _angle = angle;
                    _position = position;
                    _entry = entry;
                end
            end
        end
    end);

    return _position, _entry;
end

local function trajectory(dir, velocity, accel, speed)
    local t1, t2, t3, t4 = solve(
        accel:Dot(accel) * 0.25,
        accel:Dot(velocity),
        accel:Dot(dir) + velocity:Dot(velocity) - speed^2,
        dir:Dot(velocity) * 2,
        dir:Dot(dir));

    local time = (t1>0 and t1) or (t2>0 and t2) or (t3>0 and t3) or t4;
    local bullet = 0.5*accel*time + dir/time + velocity;
    return bullet, time;
end

-- hooks
local old;
old = hookfunction(particle.new, function(args)
    if debug.info(2, "n") == "fireRound" then
        local position, entry = getClosest(args.velocity, args.visualorigin, args.physicsignore);
        if position and entry then
            local index = table.find(debug.getstack(2), args.velocity);

            args.velocity = trajectory(
                position - args.visualorigin,
                entry._velspring._p0,
                -args.acceleration,
                args.velocity.Magnitude);

            debug.setstack(2, index, args.velocity);
        end
    end
    return old(args);
end);
	end,
})
