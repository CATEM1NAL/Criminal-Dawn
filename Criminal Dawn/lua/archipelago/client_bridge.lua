if CrimDawnClient then return end
local FileIdent = "client_bridge"
CrimDawnClient = { DataPath = CrimDawn.SavePath .. "crimdawn_client.txt" }

function CrimDawnClient:LoadData()
  self.data = io.load_as_json(self.DataPath) or {}

  -- Set default values if they don't exist
  self.data["Time Bonus"] = self.data["Time Bonus"] or 0
  self.data["Drill Sawgeant"] = self.data["Drill Sawgeant"] or 0
  self.data["Nine Lives"] = self.data["Nine Lives"] or 0
  self.data["Perma-Skill"] = self.data["Perma-Skill"] or 0
  self.data["Perma-Perk"] = self.data["Perma-Perk"] or 0
  self.data["Extra Bot"] = self.data["Extra Bot"] or 0
  self.data["Primary Weapon"] = self.data["Primary Weapon"] or 0
  self.data["Akimbo"] = self.data["Akimbo"] or 0
  self.data["Secondary Weapon"] = self.data["Secondary Weapon"] or 0
  self.data["Melee Weapon"] = self.data["Melee Weapon"] or 0
  self.data["Throwable"] = self.data["Throwable"] or 0
  self.data["Armor"] = self.data["Armor"] or 0
  self.data["Deployable"] = self.data["Deployable"] or 0
  self.data["Skill"] = self.data["Skill"] or 0
  self.data["Perk"] = self.data["Perk"] or 0
  self.data["Stat Boost"] = self.data["Stat Boost"] or 0
  self.data["24 Coins"] = self.data["24 Coins"] or 0
  self.data["6 Coins"] = self.data["6 Coins"] or 0
end

-- Timer upgrades need to be checked between heists and when score cap is reached
function CrimDawnClient:PollTimeUpgrades()
  if not Global.CrimDawn.data.game.timer_strength then return end

  if not Global.CrimDawn.data.game.ponr then Global.CrimDawn.data.game.ponr =
    Global.CrimDawn.data.game.timer_strength * (1 + Global.CrimDawn.data.x.time_upgrades)
  end

  CrimDawnClient:LoadData()
  if Global.CrimDawn.data.game.seed ~= self.data.seed then return end

  if self.data["Time Bonus"] > Global.CrimDawn.data.x.time_upgrades then -- Get time upgrades
    local ExtraTime = Global.CrimDawn.data.game.timer_strength * (self.data["Time Bonus"] - Global.CrimDawn.data.x.time_upgrades)
    Global.CrimDawn.data.game.ponr = Global.CrimDawn.data.game.ponr + ExtraTime
    Global.CrimDawn.data.x.time_upgrades = self.data["Time Bonus"]
    Global.CrimDawn.data.game.score_cap = self.data.score_cap
    CrimDawn:WriteSave(FileIdent, "Time Bonus received from multiworld")
    NetworkHelper:SendToPeers("CrimDawn_TimeUpdate", math.floor(Global.CrimDawn.data.game.timer_strength))

    if CrimDawn.state.ponr then -- Mid-game timer update (increase score cap)
      CrimDawn.state.cap_reached = false
      CrimDawn.ChatNotify("Next heist will start with " .. Global.CrimDawn.data.game.timer_strength / 60 .. " more minutes."
                       .. "\nScore cap increased to " .. Global.CrimDawn.data.game.score_cap .. "!")
    return end

    if NetworkHelper:IsHost() then -- Send timer update to peers
      DelayedCalls:Add("CrimDawn_ChatPONR", 1, function()
        CrimDawn.ChatNotify(math.floor(Global.CrimDawn.data.game.ponr) .. " (+" .. ExtraTime .. " from Time Bonus) seconds remaining.")
        NetworkHelper:SendToPeers("CrimDawn_TimeUpdate", math.floor(Global.CrimDawn.data.game.ponr))
      end)
    end

  else if CrimDawn.state.ponr then return end
    if NetworkHelper:IsHost() then -- No time upgrades received, send current time to peers
      DelayedCalls:Add("CrimDawn_ChatPONR", 1, function()
        if Global.CrimDawn.data.game.ponr < 0 then
          CrimDawn.ChatNotify("Remaining time is less than 0!")
          NetworkHelper:SendToPeers("CrimDawn_TimeUpdate", "0")
        else
          CrimDawn.ChatNotify(math.floor(Global.CrimDawn.data.game.ponr) .. " seconds remaining.")
          NetworkHelper:SendToPeers("CrimDawn_TimeUpdate", math.floor(Global.CrimDawn.data.game.ponr))
        end
      end)
    end
  end
end

-- Check if anything other than timer was updated (main menu only)
function CrimDawnClient:PollData()
  if not managers.blackmarket then return end -- Can't save if blackmarket doesn't exist

  CrimDawnClient:LoadData()
  local DataChanged

  -- Pull game config from client if we don't have it
  if not Global.CrimDawn.data.game.seed and self.data.seed then
    CrimDawn.Log(FileIdent, "Writing game config")
    Global.CrimDawn.data.game.seed = self.data.seed
    Global.CrimDawn.data.game.timer_strength = 60 * self.data.timer_strength
    Global.CrimDawn.data.game.max_diff = self.data.max_diff
    Global.CrimDawn.data.game.score_cap = self.data.score_cap
    Global.CrimDawn.data.game.scaling_count = self.data.scaling_count
    Global.CrimDawn.data.game.run_length = self.data.run_length
    DataChanged = true

  elseif Global.CrimDawn.data.game.seed ~= self.data.seed then
    CrimDawn.Log(FileIdent, "Seed mismatch! Aborting!")
  return end

  -- Add drill speed upgrades
  if self.data["Drill Sawgeant"] ~= 0 then
    local FoundUpgrade
    for i, upgrade in ipairs(Global.CrimDawn.data.upgrades) do
      if upgrade == "player_drill_speed_multiplier" .. self.data["Drill Sawgeant"] then FoundUpgrade = true break
      elseif upgrade == "player_drill_speed_multiplier" .. (self.data["Drill Sawgeant"] - 1) then
        table.remove(Global.CrimDawn.data.upgrades, i)
      break end
    end

    if FoundUpgrade ~= true then
      table.insert(Global.CrimDawn.data.upgrades, "player_drill_speed_multiplier" .. self.data["Drill Sawgeant"])
      if self.data["Drill Sawgeant"] ~= Global.CrimDawn.data.x.drill then
        CrimDawn.Log(FileIdent, "Drill Sawgeant Lv" .. self.data["Drill Sawgeant"])
        Global.CrimDawn.data.x.drill = self.data["Drill Sawgeant"]
        CrimDawn.ChatNotify("Received Drill Sawgeant Lv" .. self.data["Drill Sawgeant"] .. "!")
        DataChanged = true
      end
    end
  end

  -- Add Nine Lives upgrades
  if self.data["Nine Lives"] ~= 0 then
    local FoundUpgrade
    for i, upgrade in ipairs(Global.CrimDawn.data.upgrades) do
      if upgrade == "player_additional_lives_" .. self.data["Nine Lives"] then FoundUpgrade = true break
      elseif upgrade == "player_additional_lives_" .. (self.data["Nine Lives"] - 1) then
        table.remove(Global.CrimDawn.data.upgrades, i)
      break end
    end

    if FoundUpgrade ~= true then
      table.insert(Global.CrimDawn.data.upgrades, "player_additional_lives_" .. self.data["Nine Lives"])
      if self.data["Nine Lives"] ~= Global.CrimDawn.data.x.lives then
        CrimDawn.Log(FileIdent, "Nine Lives Lv" .. self.data["Nine Lives"])
        Global.CrimDawn.data.x.lives = self.data["Nine Lives"]
        CrimDawn.ChatNotify("Received Nine Lives Lv" .. self.data["Nine Lives"] .. "!")
        DataChanged = true
      end
    end
  end

  -- Get Perma-Skills
  if self.data["Perma-Skill"] > Global.CrimDawn.data.x.permaskills then
    CrimDawn:PermaUpgrade(self.data["Perma-Skill"], "permaskills")

    Global.CrimDawn.data.x.permaskills = self.data["Perma-Skill"]
    CrimDawn.ChatNotify("Now have " .. self.data["Perma-Skill"] .. " Perma-Skills!")
    DataChanged = true
  end

  -- Get Perma-Perks
  if self.data["Perma-Perk"] > Global.CrimDawn.data.x.permaperks then
    CrimDawn:PermaUpgrade(self.data["Perma-Perk"], "permaperks")

    Global.CrimDawn.data.x.permaperks = self.data["Perma-Perk"]
    CrimDawn.ChatNotify("Now have " .. self.data["Perma-Perk"] .. " Perma-Perks!")
    DataChanged = true
  end

  -- Add extra bots
  if self.data["Extra Bot"] > Global.CrimDawn.data.x.bots then
    CrimDawn.Log(FileIdent, self.data["Extra Bot"] .. " bots")
    Global.CrimDawn.data.x.bots = self.data["Extra Bot"]
    CrimDawn.ChatNotify("Received extra bot (" .. self.data["Extra Bot"] .. " total)!")
    DataChanged = true
  end

  if managers.custom_safehouse then -- Give small number of coins
    if self.data["6 Coins"] > Global.CrimDawn.data.x.coins then
      CrimDawn.Log(FileIdent, "Giving " .. 6 * (self.data["6 Coins"] - Global.CrimDawn.data.x.coins) .. " coins")
      managers.custom_safehouse:add_coins(6 * (self.data["6 Coins"] - Global.CrimDawn.data.x.coins))
      CrimDawn.ChatNotify("Received " .. 6 * (self.data["6 Coins"] - Global.CrimDawn.data.x.coins) .. " coins!")
      Global.CrimDawn.data.x.coins = self.data["6 Coins"]
      DataChanged = true
    end
  end

  if managers.custom_safehouse then -- Give big number of coins (intended for safehouse)
    if self.data["24 Coins"] > Global.CrimDawn.data.x.big_coins then
      CrimDawn.Log(FileIdent, "Giving " .. 24 * (self.data["24 Coins"] - Global.CrimDawn.data.x.big_coins) .. " progression coins")
      managers.custom_safehouse:add_coins(24 * (self.data["24 Coins"] - Global.CrimDawn.data.x.big_coins))
      CrimDawn.ChatNotify("Received " .. 24 * (self.data["24 Coins"] - Global.CrimDawn.data.x.big_coins) .. " coins!")
      Global.CrimDawn.data.x.big_coins = self.data["24 Coins"]
      DataChanged = true
    end
  end

  -- Unlock saws
  if Global.CrimDawn.data.x.saws == 0 and self.data["OVE9000 Saw"] then
    CrimDawn.Log(FileIdent, "Unlocking first saw")
    local saws = { "saw", "saw_secondary" }
    Global.CrimDawn.data.unlocks[saws[math.random(2)]] = true
    Global.CrimDawn.data.x.saws = 1
    CrimDawn.ChatNotify("Unlocked an OVE9000 saw!")
    DataChanged = true
  end

  if Global.CrimDawn.data.x.saws == 1 and self.data["OVE9000 Saw"] == 2 then
    CrimDawn.Log(FileIdent, "Unlocking second saw")
    Global.CrimDawn.data.unlocks.saw = true
    Global.CrimDawn.data.unlocks.saw_secondary = true
    Global.CrimDawn.data.x.saws = 2
    CrimDawn.ChatNotify("Unlocked second OVE9000 saw!")
    DataChanged = true
  end

  -- Unlock ECM
  if not Global.CrimDawn.data.unlocks.ecm_jammer and self.data["ECM"] then
    CrimDawn.Log(FileIdent, "Unlocking ECM jammer")
    Global.CrimDawn.data.unlocks.ecm_jammer = true
    CrimDawn:RandomUpgrade(1, "deployable")
    CrimDawn.ChatNotify("Unlocked ECM jammer and gained an upgrade!")
    DataChanged = true
  end

  -- Unlock tripmines
  if not Global.CrimDawn.data.unlocks.trip_mine and self.data["Trip Mines"] then
    CrimDawn.Log(FileIdent, "Unlocking trip mine")
    Global.CrimDawn.data.unlocks.trip_mine = true
    CrimDawn:RandomUpgrade(1, "deployable")
    CrimDawn.ChatNotify("Unlocked trip mine and gained an upgrade!")
    DataChanged = true
  end

  -- Unlock random deployables
  if self.data["Deployable"] > Global.CrimDawn.data.x.deployables then
    local DeployablesNeeded = self.data["Deployable"] - Global.CrimDawn.data.x.deployables
    CrimDawn:RandomDeployable(DeployablesNeeded)
    CrimDawn:RandomUpgrade(DeployablesNeeded, "deployable")

    Global.CrimDawn.data.x.deployables = self.data["Deployable"]
    CrimDawn.ChatNotify("Unlocked new deployables and gained upgrades!")
    DataChanged = true
  end

  -- Unlock random armours
  if self.data["Armor"] > Global.CrimDawn.data.x.armour then
    local ArmourNeeded = self.data["Armor"] - Global.CrimDawn.data.x.armour
    CrimDawn:RandomArmour(ArmourNeeded)

    Global.CrimDawn.data.x.armour = self.data["Armor"]
    CrimDawn.ChatNotify("Unlocked new armor!")
    DataChanged = true
  end

  -- Unlock random primaries
  if self.data["Primary Weapon"] > Global.CrimDawn.data.x.primaries then
    local PrimariesNeeded = self.data["Primary Weapon"] - Global.CrimDawn.data.x.primaries
    CrimDawn:RandomWeapon(PrimariesNeeded, "primaries")

    Global.CrimDawn.data.x.primaries = self.data["Primary Weapon"]
    CrimDawn.ChatNotify("Unlocked new primary weapons!")
    DataChanged = true
  end
  
  -- Unlock random akimbos
  if self.data["Akimbo"] > Global.CrimDawn.data.x.akimbos then
    local AkimbosNeeded = self.data["Akimbo"] - Global.CrimDawn.data.x.akimbos
    CrimDawn:RandomWeapon(AkimbosNeeded, "akimbos")

    Global.CrimDawn.data.x.akimbos = self.data["Akimbo"]
    CrimDawn.ChatNotify("Unlocked new akimbos!")
    DataChanged = true
  end

  -- Unlock random secondaries
  if self.data["Secondary Weapon"] > Global.CrimDawn.data.x.secondaries then
    local SecondariesNeeded = self.data["Secondary Weapon"] - Global.CrimDawn.data.x.secondaries
    CrimDawn:RandomWeapon(SecondariesNeeded, "secondaries")

    Global.CrimDawn.data.x.secondaries = self.data["Secondary Weapon"]
    CrimDawn.ChatNotify("Unlocked new secondary weapons!")
    DataChanged = true
  end

  -- Unlock random melees
  if self.data["Melee Weapon"] > Global.CrimDawn.data.x.melee then
    local MeleeNeeded = self.data["Melee Weapon"] - Global.CrimDawn.data.x.melee
    CrimDawn:RandomWeapon(MeleeNeeded, "melee")

    Global.CrimDawn.data.x.melee = self.data["Melee Weapon"]
    CrimDawn.ChatNotify("Unlocked new melee weapons!")
    DataChanged = true
  end

  -- Unlock random throwables
  if self.data["Throwable"] > Global.CrimDawn.data.x.throwables then
    local ThrowablesNeeded = self.data["Throwable"] - Global.CrimDawn.data.x.throwables
    CrimDawn:RandomWeapon(ThrowablesNeeded, "throwables")

    Global.CrimDawn.data.x.throwables = self.data["Throwable"]
    CrimDawn.ChatNotify("Unlocked new throwables!")
    DataChanged = true
  end

  -- Unlock random skills
  if self.data["Skill"] > Global.CrimDawn.data.x.skills then
    local SkillsNeeded = self.data["Skill"] - Global.CrimDawn.data.x.skills
    CrimDawn:RandomUpgrade(SkillsNeeded, "skills")

    Global.CrimDawn.data.x.skills = self.data["Skill"]
    CrimDawn.ChatNotify("Received new skills!")
    DataChanged = true
  end

  -- Unlock random perks
  if self.data["Perk"] > Global.CrimDawn.data.x.perks then
    local PerksNeeded = self.data["Perk"] - Global.CrimDawn.data.x.perks
    CrimDawn:RandomUpgrade(PerksNeeded, "perks")

    Global.CrimDawn.data.x.perks = self.data["Perk"]
    CrimDawn.ChatNotify("Received new perks!")
    DataChanged = true
  end

  -- Unlock random stat boosts
  if self.data["Stat Boost"] > Global.CrimDawn.data.x.stats then
    local StatsNeeded = self.data["Stat Boost"] - Global.CrimDawn.data.x.stats
    CrimDawn:RandomUpgrade(StatsNeeded, "stats")

    Global.CrimDawn.data.x.stats = self.data["Stat Boost"]
    CrimDawn.ChatNotify("Received new stat boosts!")
    DataChanged = true
  end

  if DataChanged then -- Pull upgrades from save file and split them into a table/index pair
    for _, upgrade in pairs(Global.CrimDawn.data.upgrades) do
      local tableName, upgradeName = upgrade:match("([^%-]+)%-(.+)")
      if tonumber(upgradeName) then upgradeName = tonumber(upgradeName) end -- Permaupgrades

      if tableName == nil then -- If the table is nil it's an actual upgrade ID, we can just add it
        if not Global.upgrades_manager.aquired[upgrade] then managers.upgrades:aquire(upgrade) end

      else -- On a table/index pair, look it up and add all upgrades it encompasses
        for _, currentUpgrade in pairs(Global.CrimDawn.tables.upgrades[tableName][upgradeName]) do
          if not Global.upgrades_manager.aquired[currentUpgrade] then managers.upgrades:aquire(currentUpgrade) end
        end
      end
    end

    for key, _ in pairs(Global.CrimDawn.data.unlocks) do
      if not Global.upgrades_manager.aquired[key] then managers.upgrades:aquire(key) end
    end CrimDawn:WriteSave(FileIdent, "multiworld client update")
  end
end