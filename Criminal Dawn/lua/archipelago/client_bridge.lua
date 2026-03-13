if CrimDawnClient then return end
local FileIdent = "client_bridge"
if not Global.CrimDawnClient then Global.CrimDawnClient = {} end
CrimDawnClient = { DataPath = CrimDawn.SavePath .. "crimdawn_client.txt" }

function CrimDawnClient:LoadData()
  Global.CrimDawnClient.data = io.load_as_json(self.DataPath) or {}

  -- Set default values if they don't exist
  Global.CrimDawnClient.data["Time Bonus"] = Global.CrimDawnClient.data["Time Bonus"] or 0
  Global.CrimDawnClient.data["Drill Sawgeant"] = Global.CrimDawnClient.data["Drill Sawgeant"] or 0
  Global.CrimDawnClient.data["Nine Lives"] = Global.CrimDawnClient.data["Nine Lives"] or 0
  Global.CrimDawnClient.data["Perma-Skill"] = Global.CrimDawnClient.data["Perma-Skill"] or 0
  Global.CrimDawnClient.data["Perma-Perk"] = Global.CrimDawnClient.data["Perma-Perk"] or 0
  Global.CrimDawnClient.data["Extra Bot"] = Global.CrimDawnClient.data["Extra Bot"] or 0
  Global.CrimDawnClient.data["Difficulty Increase"] = Global.CrimDawnClient.data["Difficulty Increase"] or 0
  Global.CrimDawnClient.data["Additional Mutator"] = Global.CrimDawnClient.data["Additional Mutator"] or 0
  Global.CrimDawnClient.data["Primary Weapon"] = Global.CrimDawnClient.data["Primary Weapon"] or 0
  Global.CrimDawnClient.data["Akimbo"] = Global.CrimDawnClient.data["Akimbo"] or 0
  Global.CrimDawnClient.data["Secondary Weapon"] = Global.CrimDawnClient.data["Secondary Weapon"] or 0
  Global.CrimDawnClient.data["Melee Weapon"] = Global.CrimDawnClient.data["Melee Weapon"] or 0
  Global.CrimDawnClient.data["Throwable"] = Global.CrimDawnClient.data["Throwable"] or 0
  Global.CrimDawnClient.data["Armor"] = Global.CrimDawnClient.data["Armor"] or 0
  Global.CrimDawnClient.data["Deployable"] = Global.CrimDawnClient.data["Deployable"] or 0
  Global.CrimDawnClient.data["Skill"] = Global.CrimDawnClient.data["Skill"] or 0
  Global.CrimDawnClient.data["Perk"] = Global.CrimDawnClient.data["Perk"] or 0
  Global.CrimDawnClient.data["Stat Boost"] = Global.CrimDawnClient.data["Stat Boost"] or 0
  Global.CrimDawnClient.data["24 Coins"] = Global.CrimDawnClient.data["24 Coins"] or 0
  Global.CrimDawnClient.data["6 Coins"] = Global.CrimDawnClient.data["6 Coins"] or 0
end

-- PONR upgrade needs to be updated between days of heists
function CrimDawnClient:PollTimeUpgrades()
  if not Global.CrimDawn.data.game.timer_strength then
    return
  end

  if not Global.CrimDawn.data.game.ponr then Global.CrimDawn.data.game.ponr =
    Global.CrimDawn.data.game.timer_strength * (1 + Global.CrimDawn.data.x.time_upgrades)
  end

  CrimDawnClient:LoadData()

  if Global.CrimDawnClient.data["Time Bonus"] > Global.CrimDawn.data.x.time_upgrades then
    local ExtraTime = Global.CrimDawn.data.game.timer_strength * (Global.CrimDawnClient.data["Time Bonus"] - Global.CrimDawn.data.x.time_upgrades)
    Global.CrimDawn.data.game.ponr = Global.CrimDawn.data.game.ponr + ExtraTime
    Global.CrimDawn.data.x.time_upgrades = self["Time Bonus"]
    CrimDawn:WriteSave(FileIdent, "Time Bonus received from multiworld")

    if NetworkHelper:IsHost() then
      DelayedCalls:Add("CrimDawn_ChatPONR", 1, function()
        CrimDawn.ChatNotify(math.floor(Global.CrimDawn.data.game.ponr) .. " (+" .. ExtraTime .. " from Time Bonus) seconds remaining.")
        NetworkHelper:SendToPeers("CrimDawn_TimeUpdate", math.floor(Global.CrimDawn.data.game.ponr))
      end)
    end

  else
    if NetworkHelper:IsHost() then
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

-- Check if anything other than PONR was updated (main menu only)
function CrimDawnClient:PollData()
  if not managers.blackmarket then return end -- Can't save if blackmarket doesn't exist

  CrimDawnClient:LoadData()
  local DataChanged

  -- Copy seed from client if we don't have one
  if not Global.CrimDawn.data.game.seed and Global.CrimDawnClient.data.seed then
    CrimDawn.Log(FileIdent, "Writing seed")
    Global.CrimDawn.data.game.seed = Global.CrimDawnClient.data.seed
    DataChanged = true

  elseif Global.CrimDawn.data.game.seed ~= Global.CrimDawnClient.data.seed then
    CrimDawn.Log(FileIdent, "Seed mismatch! Aborting!")
  return end

  -- Pull yaml settings
  if not Global.CrimDawn.data.game.timer_strength and Global.CrimDawnClient.data.timer_strength then
    CrimDawn.Log(FileIdent, "Setting timer strength")
    Global.CrimDawn.data.game.timer_strength = 60 * Global.CrimDawnClient.data.timer_strength
    DataChanged = true
  end

  if not Global.CrimDawn.data.game.max_diff and Global.CrimDawnClient.data.max_diff then
    CrimDawn.Log(FileIdent, "Setting max difficulty")
    Global.CrimDawn.data.game.max_diff = Global.CrimDawnClient.data.max_diff
    DataChanged = true
  end

  if not Global.CrimDawn.data.game.score_cap and Global.CrimDawnClient.data.score_cap then
    CrimDawn.Log(FileIdent, "Setting score cap")
    Global.CrimDawn.data.game.score_cap = Global.CrimDawnClient.data.score_cap
    DataChanged = true
  end

  -- Add drill speed upgrades
  if Global.CrimDawnClient.data["Drill Sawgeant"] ~= 0 then
    local FoundUpgrade
    for i, upgrade in ipairs(Global.CrimDawn.data.upgrades) do
      if upgrade == "player_drill_speed_multiplier" .. Global.CrimDawnClient.data["Drill Sawgeant"] then
        FoundUpgrade = true break
      elseif upgrade == "player_drill_speed_multiplier" .. (Global.CrimDawnClient.data["Drill Sawgeant"] - 1) then
        table.remove(Global.CrimDawn.data.upgrades, i)
      break end
    end

    if FoundUpgrade ~= true then
      table.insert(Global.CrimDawn.data.upgrades, "player_drill_speed_multiplier" .. Global.CrimDawnClient.data["Drill Sawgeant"])
      if Global.CrimDawnClient.data["Drill Sawgeant"] ~= Global.CrimDawn.data.x.drill then
        CrimDawn.Log(FileIdent, "Drill Sawgeant Lv" .. Global.CrimDawnClient.data["Drill Sawgeant"])
        Global.CrimDawn.data.x.drill = Global.CrimDawnClient.data["Drill Sawgeant"]
        CrimDawn.ChatNotify("Received Drill Sawgeant Lv" .. Global.CrimDawnClient.data["Drill Sawgeant"] .. "!")
        DataChanged = true
      end
    end
  end

  -- Add Nine Lives upgrades
  if Global.CrimDawnClient.data["Nine Lives"] ~= 0 then
    local FoundUpgrade
    for i, upgrade in ipairs(Global.CrimDawn.data.upgrades) do
      if upgrade == "player_additional_lives_" .. Global.CrimDawnClient.data["Nine Lives"] then
        FoundUpgrade = true break
      elseif upgrade == "player_additional_lives_" .. (Global.CrimDawnClient.data["Nine Lives"] - 1) then
        table.remove(Global.CrimDawn.data.upgrades, i)
      break end
    end

    if FoundUpgrade ~= true then
      table.insert(Global.CrimDawn.data.upgrades, "player_additional_lives_" .. Global.CrimDawnClient.data["Nine Lives"])
      if Global.CrimDawnClient.data["Nine Lives"] ~= Global.CrimDawn.data.x.lives then
        CrimDawn.Log(FileIdent, "Nine Lives Lv" .. Global.CrimDawnClient.data["Nine Lives"])
        Global.CrimDawn.data.x.lives = Global.CrimDawnClient.data["Nine Lives"]
        CrimDawn.ChatNotify("Received Nine Lives Lv" .. Global.CrimDawnClient.data["Nine Lives"] .. "!")
        DataChanged = true
      end
    end
  end

  -- Get Perma-Skills
  if Global.CrimDawnClient.data["Perma-Skill"] > Global.CrimDawn.data.x.permaskills then
    CrimDawn:PermaUpgrade(Global.CrimDawnClient.data["Perma-Skill"], "permaskills")

    Global.CrimDawn.data.x.permaskills = Global.CrimDawnClient.data["Perma-Skill"]
    CrimDawn.ChatNotify("Now have " .. Global.CrimDawnClient.data["Perma-Skill"] .. " Perma-Skills!")
    DataChanged = true
  end

  -- Get Perma-Perks
  if Global.CrimDawnClient.data["Perma-Perk"] > Global.CrimDawn.data.x.permaskills then
    CrimDawn:PermaUpgrade(Global.CrimDawnClient.data["Perma-Perk"], "permaperks")

    Global.CrimDawn.data.x.permaperks = Global.CrimDawnClient.data["Perma-Perk"]
    CrimDawn.ChatNotify("Now have " .. Global.CrimDawnClient.data["Perma-Perk"] .. " Perma-Perks!")
    DataChanged = true
  end

  -- Add extra bots
  if Global.CrimDawnClient.data["Extra Bot"] > Global.CrimDawn.data.x.bots then
    CrimDawn.Log(FileIdent, Global.CrimDawnClient.data["Extra Bot"] .. " bots")
    Global.CrimDawn.data.x.bots = Global.CrimDawnClient.data["Extra Bot"]
    CrimDawn.ChatNotify("Received extra bot (" .. Global.CrimDawnClient.data["Extra Bot"] .. " total)!")
    DataChanged = true
  end

  -- Increase difficulty
  if Global.CrimDawnClient.data["Difficulty Increase"] > Global.CrimDawn.data.x.diff then
    CrimDawn.Log(FileIdent, "Difficulty " .. Global.CrimDawnClient.data["Difficulty Increase"])
    Global.CrimDawn.data.x.diff = Global.CrimDawnClient.data["Difficulty Increase"]

    local DiffIndex = math.min(#Global.CrimDawn.data.game.heists + Global.CrimDawn.data.x.diff, Global.CrimDawn.data.game.max_diff)
    local Difficulty = managers.localization:text("menu_difficulty_" .. tweak_data.difficulties[DiffIndex])
    CrimDawn.ChatNotify("Received difficulty increase (new dawns start on " .. Difficulty .. ")!")
    DataChanged = true
  end

  -- Add mutators
  if Global.CrimDawnClient.data["Additional Mutator"] > Global.CrimDawn.data.x.mutators then
    CrimDawn.Log(FileIdent, Global.CrimDawnClient.data["Additional Mutator"] .. " mutators")
    Global.CrimDawn.data.x.mutators = Global.CrimDawnClient.data["Additional Mutator"]
    CrimDawn.ChatNotify("Received additional mutator (new dawns start with " .. Global.CrimDawnClient.data["Additional Mutator"] .. ")!")
    DataChanged = true
  end

  if managers.custom_safehouse then -- Give small number of coins
    if Global.CrimDawnClient.data["6 Coins"] > Global.CrimDawn.data.x.coins then
      CrimDawn.Log(FileIdent, "Giving " .. 6 * (Global.CrimDawnClient.data["6 Coins"] - Global.CrimDawn.data.x.coins) .. " coins")
      managers.custom_safehouse:add_coins(6 * (Global.CrimDawnClient.data["6 Coins"] - Global.CrimDawn.data.x.coins))
      CrimDawn.ChatNotify("Received " .. 6 * (Global.CrimDawnClient.data["6 Coins"] - Global.CrimDawn.data.x.coins) .. " coins!")
      Global.CrimDawn.data.x.coins = Global.CrimDawnClient.data["6 Coins"]
      DataChanged = true
    end
  end

  if managers.custom_safehouse then -- Give big number of coins (intended for safehouse)
    if Global.CrimDawnClient.data["24 Coins"] > Global.CrimDawn.data.x.big_coins then
      CrimDawn.Log(FileIdent, "Giving " .. 24 * (Global.CrimDawnClient.data["24 Coins"] - Global.CrimDawn.data.x.big_coins) .. " progression coins")
      managers.custom_safehouse:add_coins(24 * (Global.CrimDawnClient.data["24 Coins"] - Global.CrimDawn.data.x.big_coins))
      CrimDawn.ChatNotify("Received " .. 24 * (Global.CrimDawnClient.data["24 Coins"] - Global.CrimDawn.data.x.big_coins) .. " coins!")
      Global.CrimDawn.data.x.big_coins = Global.CrimDawnClient.data["24 Coins"]
      DataChanged = true
    end
  end

  -- Unlock saws
  if not Global.CrimDawn.data.x.saws and Global.CrimDawnClient.data["OVE9000 Saw"] then
    CrimDawn.Log(FileIdent, "Unlocking first saw")
    local saws = { "saw", "saw_secondary" }
    Global.CrimDawn.data.unlocks[saws[math.random(2)]] = true
    Global.CrimDawn.data.x.saws = 1
    CrimDawn.ChatNotify("Unlocked an OVE9000 saw!")
    DataChanged = true
  end

  if Global.CrimDawn.data.x.saws == 1 and Global.CrimDawnClient.data["OVE9000 Saw"] == 2 then
    CrimDawn.Log(FileIdent, "Unlocking second saw")
    Global.CrimDawn.data.unlocks.saw = true
    Global.CrimDawn.data.unlocks.saw_secondary = true
    Global.CrimDawn.data.x.saws = 2
    CrimDawn.ChatNotify("Unlocked second OVE9000 saw!")
    DataChanged = true
  end

  -- Unlock ECM
  if not Global.CrimDawn.data.unlocks.ecm_jammer and Global.CrimDawnClient.data["ECM"] then
    CrimDawn.Log(FileIdent, "Unlocking ECM jammer")
    Global.CrimDawn.data.unlocks.ecm_jammer = true
    CrimDawn:RandomUpgrade(1, "deployable")
    CrimDawn.ChatNotify("Unlocked ECM jammer and gained an upgrade!")
    DataChanged = true
  end

  -- Unlock tripmines
  if not Global.CrimDawn.data.unlocks.trip_mine and Global.CrimDawnClient.data["Trip Mines"] then
    CrimDawn.Log(FileIdent, "Unlocking trip mine")
    Global.CrimDawn.data.unlocks.trip_mine = true
    CrimDawn:RandomUpgrade(1, "deployable")
    CrimDawn.ChatNotify("Unlocked trip mine and gained an upgrade!")
    DataChanged = true
  end

  -- Unlock random deployables
  if Global.CrimDawnClient.data["Deployable"] > Global.CrimDawn.data.x.deployables then
    local DeployablesNeeded = Global.CrimDawnClient.data["Deployable"] - Global.CrimDawn.data.x.deployables
    CrimDawn:RandomDeployable(DeployablesNeeded)
    CrimDawn:RandomUpgrade(DeployablesNeeded, "deployable")

    Global.CrimDawn.data.x.deployables = Global.CrimDawnClient.data["Deployable"]
    CrimDawn.ChatNotify("Unlocked new deployables and gained upgrades!")
    DataChanged = true
  end

  -- Unlock random armours
  if Global.CrimDawnClient.data["Armor"] > Global.CrimDawn.data.x.armour then
    local ArmourNeeded = Global.CrimDawnClient.data["Armor"] - Global.CrimDawn.data.x.armour
    CrimDawn:RandomArmour(ArmourNeeded)

    Global.CrimDawn.data.x.armour = Global.CrimDawnClient.data["Armor"]
    CrimDawn.ChatNotify("Unlocked new armor!")
    DataChanged = true
  end

  -- Unlock random primaries
  if Global.CrimDawnClient.data["Primary Weapon"] > Global.CrimDawn.data.x.primaries then
    local PrimariesNeeded = Global.CrimDawnClient.data["Primary Weapon"] - Global.CrimDawn.data.x.primaries
    CrimDawn:RandomWeapon(PrimariesNeeded, "primaries")

    Global.CrimDawn.data.x.primaries = Global.CrimDawnClient.data["Primary Weapon"]
    CrimDawn.ChatNotify("Unlocked new primary weapons!")
    DataChanged = true
  end
  
  -- Unlock random akimbos
  if Global.CrimDawnClient.data["Akimbo"] > Global.CrimDawn.data.x.akimbos then
    local AkimbosNeeded = Global.CrimDawnClient.data["Akimbo"] - Global.CrimDawn.data.x.akimbos
    CrimDawn:RandomWeapon(AkimbosNeeded, "akimbos")

    Global.CrimDawn.data.x.akimbos = Global.CrimDawnClient.data["Akimbo"]
    CrimDawn.ChatNotify("Unlocked new akimbos!")
    DataChanged = true
  end

  -- Unlock random secondaries
  if Global.CrimDawnClient.data["Secondary Weapon"] > Global.CrimDawn.data.x.secondaries then
    local SecondariesNeeded = Global.CrimDawnClient.data["Secondary Weapon"] - Global.CrimDawn.data.x.secondaries
    CrimDawn:RandomWeapon(SecondariesNeeded, "secondaries")

    Global.CrimDawn.data.x.secondaries = Global.CrimDawnClient.data["Secondary Weapon"]
    CrimDawn.ChatNotify("Unlocked new secondary weapons!")
    DataChanged = true
  end

  -- Unlock random melees
  if Global.CrimDawnClient.data["Melee Weapon"] > Global.CrimDawn.data.x.melee then
    local MeleeNeeded = Global.CrimDawnClient.data["Melee Weapon"] - Global.CrimDawn.data.x.melee
    CrimDawn:RandomWeapon(MeleeNeeded, "melee")

    Global.CrimDawn.data.x.melee = Global.CrimDawnClient.data["Melee Weapon"]
    CrimDawn.ChatNotify("Unlocked new melee weapons!")
    DataChanged = true
  end

  -- Unlock random throwables
  if Global.CrimDawnClient.data["Throwable"] > Global.CrimDawn.data.x.throwables then
    local ThrowablesNeeded = Global.CrimDawnClient.data["Throwable"] - Global.CrimDawn.data.x.throwables
    CrimDawn:RandomWeapon(ThrowablesNeeded, "throwables")

    Global.CrimDawn.data.x.throwables = Global.CrimDawnClient.data["Throwable"]
    CrimDawn.ChatNotify("Unlocked new throwables!")
    DataChanged = true
  end

  -- Unlock random skills
  if Global.CrimDawnClient.data["Skill"] > Global.CrimDawn.data.x.skills then
    local SkillsNeeded = Global.CrimDawnClient.data["Skill"] - Global.CrimDawn.data.x.skills
    CrimDawn:RandomUpgrade(SkillsNeeded, "skills")

    Global.CrimDawn.data.x.skills = Global.CrimDawnClient.data["Skill"]
    CrimDawn.ChatNotify("Received new skills!")
    DataChanged = true
  end

  -- Unlock random perks
  if Global.CrimDawnClient.data["Perk"] > Global.CrimDawn.data.x.perks then
    local PerksNeeded = Global.CrimDawnClient.data["Perk"] - Global.CrimDawn.data.x.perks
    CrimDawn:RandomUpgrade(PerksNeeded, "perks")

    Global.CrimDawn.data.x.perks = Global.CrimDawnClient.data["Perk"]
    CrimDawn.ChatNotify("Received new perks!")
    DataChanged = true
  end

  -- Unlock random stat boosts
  if Global.CrimDawnClient.data["Stat Boost"] > Global.CrimDawn.data.x.stats then
    local StatsNeeded = Global.CrimDawnClient.data["Stat Boost"] - Global.CrimDawn.data.x.stats
    CrimDawn:RandomUpgrade(StatsNeeded, "stats")

    Global.CrimDawn.data.x.stats = Global.CrimDawnClient.data["Stat Boost"]
    CrimDawn.ChatNotify("Received new stat boosts!")
    DataChanged = true
  end

  if DataChanged then -- Write to apyday2.txt if any values were updated

    -- Pull upgrades from save file and split them into a table/index pair
    for _, upgrade in pairs(Global.CrimDawn.data.upgrades) do
      local tableName, upgradeName = upgrade:match("([^%-]+)%-(.+)")
      if tonumber(upgradeName) then upgradeName = tonumber(upgradeName) end

      -- If the table is nil it's an actual upgrade ID, we can just add it
      if tableName == nil then
        if not Global.upgrades_manager.aquired[upgrade] then
          --CrimDawn.Log(FileIdent, "Adding upgrade: " .. upgrade)
          managers.upgrades:aquire(upgrade)
        end

      else -- On a table/index pair, look it up and add all upgrades it encompasses
        for _, currentUpgrade in pairs(Global.CrimDawn.tables.upgrades[tableName][upgradeName]) do
           if not Global.upgrades_manager.aquired[currentUpgrade] then
             --CrimDawn.Log(FileIdent, "Adding upgrade: " .. currentUpgrade)
             managers.upgrades:aquire(currentUpgrade)
           end
        end
      end
    end

    for key, _ in pairs(Global.CrimDawn.data.unlocks) do
      if not Global.upgrades_manager.aquired[key] then
        --CrimDawn.Log(FileIdent, "Unlocking " .. currentUpgrade)
        managers.upgrades:aquire(key)
      end
    end

    CrimDawn:WriteSave(FileIdent, "multiworld client update")
  end
end