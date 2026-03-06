local APD2FileIdent = "[APD2>client_bridge] "

dofile(APD2Path .. "lua/tables/heists.lua")
dofile(APD2Path .. "lua/tables/upgrades.lua")
dofile(APD2Path .. "lua/tables/weapons.lua")
dofile(APD2Path .. "lua/tables/dlc.lua")

dofile(APD2Path .. "lua/archipelago/unlock_generator.lua")

-- PONR upgrade needs to be called between heists
function apd2_get_ponr_upgrades()
  if not apd2_data.game.start_time then
    return
  end

  if not apd2_data.game.ponr then
    local initialTimeBonus = apd2_data.game.time_bonus * (apd2_data.x.ponr_upgrade or 0)
    apd2_data.game.ponr = apd2_data.game.start_time + initialTimeBonus
  end

  local APD2Client = io.load_as_json(SavePath .. "apyday2-client.txt") or {}
  APD2Client["Time Bonus"] = APD2Client["Time Bonus"] or 0
  apd2_data.x.ponr_upgrade = apd2_data.x.ponr_upgrade or 0

  if APD2Client["Time Bonus"] > apd2_data.x.ponr_upgrade then
    local ExtraTime = apd2_data.game.time_bonus * (APD2Client["Time Bonus"] - apd2_data.x.ponr_upgrade)
    apd2_data.game.ponr = apd2_data.game.ponr + ExtraTime
    apd2_data.x.ponr_upgrade = APD2Client["Time Bonus"]
    apd2_save(APD2FileIdent, "Time Bonus received from multiworld")

    if NetworkHelper:IsHost() then
      DelayedCalls:Add("apd2_remaining_time", 1, function()
        apd2_chat_send(math.floor(apd2_data.game.ponr) .. " (+" .. ExtraTime .. " from Time Bonus) seconds remaining.")
        NetworkHelper:SendToPeers("APD2TimeUpdate", math.floor(apd2_data.game.ponr))
      end)
    end

  else
    if NetworkHelper:IsHost() then
      DelayedCalls:Add("apd2_remaining_time", 1, function()
        if apd2_data.game.ponr < 0 then
          apd2_chat_send("Remaining time is less than 0!")
          NetworkHelper:SendToPeers("APD2TimeUpdate", "0")
        else
          apd2_chat_send(math.floor(apd2_data.game.ponr) .. " seconds remaining.")
          NetworkHelper:SendToPeers("APD2TimeUpdate", math.floor(apd2_data.game.ponr))
        end
      end)
    end
  end
end

-- Check everything else between heists
function apd2_poll_client()
  -- We can't save if blackmarket doesn't exist
  if not managers.blackmarket then
    return
  end

  local APD2Client = io.load_as_json(SavePath .. "apyday2-client.txt") or {}
  local DataChanged

  -- Copy seed from client if we don't have one
  if not apd2_data.game.seed and APD2Client.seed then
    log(APD2FileIdent .. "Writing seed")
    apd2_data.game.seed = APD2Client.seed
    DataChanged = true
  elseif apd2_data.game.seed ~= APD2Client.seed then
    log(APD2FileIdent .. "Seed mismatch! Aborting!")
    return
  end

  -- Pull yaml settings
  if not apd2_data.game.start_time and APD2Client.start_time then
    log(APD2FileIdent .. "Setting starting time")
    apd2_data.game.start_time = 60 * APD2Client.start_time
    DataChanged = true
  end

  if not apd2_data.game.time_bonus and APD2Client.time_bonus then
    log(APD2FileIdent .. "Setting time bonus value")
    apd2_data.game.time_bonus = 60 * APD2Client.time_bonus
    DataChanged = true
  end

  if not apd2_data.game.max_diff and APD2Client.max_diff then
    log(APD2FileIdent .. "Setting max difficulty")
    apd2_data.game.max_diff = APD2Client.max_diff
    DataChanged = true
  end

  -- Set default client values if they don't exist
  APD2Client.seed = APD2Client.seed or nil
  APD2Client["Drill Sawgeant"] = APD2Client["Drill Sawgeant"] or 0
  APD2Client["Nine Lives"] = APD2Client["Nine Lives"] or 0
  APD2Client["Extra Bot"] = APD2Client["Extra Bot"] or 0
  APD2Client["Difficulty Increase"] = APD2Client["Difficulty Increase"] or 0
  APD2Client["Additional Mutator"] = APD2Client["Additional Mutator"] or 0
  APD2Client["Primary Weapon"] = APD2Client["Primary Weapon"] or 0
  APD2Client["Akimbo"] = APD2Client["Akimbo"] or 0
  APD2Client["Secondary Weapon"] = APD2Client["Secondary Weapon"] or 0
  APD2Client["Melee Weapon"] = APD2Client["Melee Weapon"] or 0
  APD2Client["Throwable"] = APD2Client["Throwable"] or 0
  APD2Client["Armor"] = APD2Client["Armor"] or 0
  APD2Client["Deployable"] = APD2Client["Deployable"] or 0
  APD2Client["Skill"] = APD2Client["Skill"] or 0
  APD2Client["Perk"] = APD2Client["Perk"] or 0
  APD2Client["Stat Boost"] = APD2Client["Stat Boost"] or 0
  APD2Client["24 Coins"] = APD2Client["24 Coins"] or 0
  APD2Client["6 Coins"] = APD2Client["6 Coins"] or 0

  -- Add drill speed upgrades
  if APD2Client["Drill Sawgeant"] ~= 0 then
    local FoundUpgrade
    for i, upgrade in ipairs(apd2_data.upgrades) do
      if upgrade == "player_drill_speed_multiplier" .. APD2Client["Drill Sawgeant"] then
        FoundUpgrade = true
        break
      elseif upgrade == "player_drill_speed_multiplier" .. (APD2Client["Drill Sawgeant"] - 1) then
        table.remove(apd2_data.upgrades, i)
        break
      end
    end

    if FoundUpgrade ~= true then
      log(APD2FileIdent .. "Drill Sawgeant Lv" .. APD2Client["Drill Sawgeant"])
      table.insert(apd2_data.upgrades, "player_drill_speed_multiplier" .. APD2Client["Drill Sawgeant"])
      apd2_chat_send("Received Drill Sawgeant Lv" .. APD2Client["Drill Sawgeant"] .. "!")
      DataChanged = true
    end
  end

  -- Add Nine Lives upgrades
  if APD2Client["Nine Lives"] ~= 0 then
    local FoundUpgrade
    for i, upgrade in ipairs(apd2_data.upgrades) do
      if upgrade == "player_additional_lives_" .. APD2Client["Nine Lives"] then
        FoundUpgrade = true
        break
      elseif upgrade == "player_additional_lives_" .. (APD2Client["Nine Lives"] - 1) then
        table.remove(apd2_data.upgrades, i)
        break
      end
    end

    if FoundUpgrade ~= true then
      log(APD2FileIdent .. "Nine Lives Lv" .. APD2Client["Nine Lives"])
      table.insert(apd2_data.upgrades, "player_additional_lives_" .. APD2Client["Nine Lives"])
      apd2_chat_send("Received Nine Lives Lv" .. APD2Client["Nine Lives"] .. "!")
      DataChanged = true
    end
  end

  -- Add extra bots
  apd2_data.x.bots = apd2_data.x.bots or 0
  if APD2Client["Extra Bot"] > apd2_data.x.bots then
    log(APD2FileIdent .. APD2Client["Extra Bot"] .. " bots")
    apd2_data.x.bots = APD2Client["Extra Bot"]
    apd2_chat_send("Received extra bot (" .. APD2Client["Nine Lives"] .. " total)!")
    DataChanged = true
  end

  -- Increase difficulty
  apd2_data.x.diff = apd2_data.x.diff or 0
  if APD2Client["Difficulty Increase"] > apd2_data.x.diff then
    log(APD2FileIdent .. "Difficulty " .. APD2Client["Difficulty Increase"])
    apd2_data.x.diff = APD2Client["Difficulty Increase"]

    local DiffIndex = math.min(#apd2_data.game.heists + apd2_data.x.diff, apd2_data.game.max_diff)
    local Difficulty = tweak_data.difficulties[DiffIndex + 1]
    apd2_chat_send("Received difficulty increase (new dawns start on " .. Difficulty .. ")!")
    DataChanged = true
  end

  -- Add mutators
  apd2_data.x.mutators = apd2_data.x.mutators or 0
  if APD2Client["Additional Mutator"] > apd2_data.x.mutators then
    log(APD2FileIdent .. APD2Client["Additional Mutator"] .. " mutators")
    apd2_data.x.mutators = APD2Client["Additional Mutator"]
    apd2_chat_send("Received additional mutator (new dawns start with " .. APD2Client["Additional Mutator"] .. ")!")
    DataChanged = true
  end

  -- Give small number of coins
  if managers.custom_safehouse then
    apd2_data.x.coins = apd2_data.x.coins or 0
    if APD2Client["6 Coins"] > apd2_data.x.coins then
      log(APD2FileIdent .. "Giving " .. 6 * (APD2Client["6 Coins"] - apd2_data.x.coins) .. " coins")
      managers.custom_safehouse:add_coins(6 * (APD2Client["6 Coins"] - apd2_data.x.coins))
      apd2_chat_send("Received " .. 6 * (APD2Client["6 Coins"] - apd2_data.x.coins) .. "coins!")
      apd2_data.x.coins = APD2Client["6 Coins"]
      DataChanged = true
    end
  end

  -- Give big number of coins (intended for safehouse)
  if managers.custom_safehouse then
    apd2_data.x.big_coins = apd2_data.x.big_coins or 0
    if APD2Client["24 Coins"] > apd2_data.x.big_coins then
      log(APD2FileIdent .. "Giving " .. 24 * (APD2Client["24 Coins"] - apd2_data.x.big_coins) .. " progression coins")
      managers.custom_safehouse:add_coins(24 * (APD2Client["24 Coins"] - apd2_data.x.big_coins))
      apd2_chat_send("Received " .. 24 * (APD2Client["24 Coins"] - apd2_data.x.big_coins) .. "coins!")
      apd2_data.x.big_coins = APD2Client["24 Coins"]
      DataChanged = true
    end
  end

  -- Unlock saws
  if not apd2_data.x.saws and APD2Client["OVE9000 Saw"] then
    log(APD2FileIdent .. "Unlocking first saw")
    local saws = { "saw", "saw_secondary" }
    apd2_data.unlocks[saws[math.random(2)]] = true
    apd2_data.x.saws = 1
    apd2_chat_send("Unlocked an OVE9000 saw!")
    DataChanged = true
  end

  if apd2_data.x.saws == 1 and APD2Client["OVE9000 Saw"] == 2 then
    log(APD2FileIdent .. "Unlocking second saw")
    apd2_data.unlocks.saw = true
    apd2_data.unlocks.saw_secondary = true
    apd2_data.x.saws = 2
    apd2_chat_send("Unlocked second OVE9000 saw!")
    DataChanged = true
  end

  -- Unlock ECM
  if not apd2_data.unlocks.ecm_jammer and APD2Client["ECM"] then
    log(APD2FileIdent .. "Unlocking ECM jammer")
    apd2_data.unlocks.ecm_jammer = true
    apd2_random_upgrades(1, "deployable")
    apd2_chat_send("Unlocked ECM jammer and gained an upgrade!")
    DataChanged = true
  end

  -- Unlock tripmines
  if not apd2_data.unlocks.trip_mine and APD2Client["Trip Mines"] then
    log(APD2FileIdent .. "Unlocking trip mine")
    apd2_data.unlocks.trip_mine = true
    apd2_random_upgrades(1, "deployable")
    apd2_chat_send("Unlocked trip mine and gained an upgrade!")
    DataChanged = true
  end

  -- Unlock random deployables
  apd2_data.x.deployables = apd2_data.x.deployables or 0
  if APD2Client["Deployable"] > apd2_data.x.deployables then
    local DeployablesNeeded = APD2Client["Deployable"] - apd2_data.x.deployables
    apd2_random_deployables(DeployablesNeeded)
    apd2_random_upgrades(DeployablesNeeded, "deployable")

    apd2_data.x.deployables = APD2Client["Deployable"]
    apd2_chat_send("Unlocked new deployables and gained upgrades!")
    DataChanged = true
  end

  -- Unlock random armours
  apd2_data.x.armour = apd2_data.x.armour or 0
  if APD2Client["Armor"] > apd2_data.x.armour then
    local ArmourNeeded = APD2Client["Armor"] - apd2_data.x.armour
    apd2_random_armors(ArmourNeeded)

    apd2_data.x.armour = APD2Client["Armor"]
    apd2_chat_send("Unlocked new armor!")
    DataChanged = true
  end

  -- Unlock random primaries
  apd2_data.x.primaries = apd2_data.x.primaries or 0
  if APD2Client["Primary Weapon"] > apd2_data.x.primaries then
    local PrimariesNeeded = APD2Client["Primary Weapon"] - apd2_data.x.primaries
    apd2_random_weapons(PrimariesNeeded, "primaries")

    apd2_data.x.primaries = APD2Client["Primary Weapon"]
    apd2_chat_send("Unlocked new primary weapons!")
    DataChanged = true
  end
  
  -- Unlock random akimbos
  apd2_data.x.akimbos = apd2_data.x.akimbos or 0
  if APD2Client["Akimbo"] > apd2_data.x.akimbos then
    local AkimbosNeeded = APD2Client["Akimbo"] - apd2_data.x.akimbos
    apd2_random_weapons(AkimbosNeeded, "akimbos")

    apd2_data.x.akimbos = APD2Client["Akimbo"]
    apd2_chat_send("Unlocked new akimbos!")
    DataChanged = true
  end

  -- Unlock random secondaries
  apd2_data.x.secondaries = apd2_data.x.secondaries or 0
  if APD2Client["Secondary Weapon"] > apd2_data.x.secondaries then
    local SecondariesNeeded = APD2Client["Secondary Weapon"] - apd2_data.x.secondaries
    apd2_random_weapons(SecondariesNeeded, "secondaries")

    apd2_data.x.secondaries = APD2Client["Secondary Weapon"]
    apd2_chat_send("Unlocked new secondary weapons!")
    DataChanged = true
  end

  -- Unlock random melees
  apd2_data.x.melee = apd2_data.x.melee or 0
  if APD2Client["Melee Weapon"] > apd2_data.x.melee then
    local MeleeNeeded = APD2Client["Melee Weapon"] - apd2_data.x.melee
    apd2_random_weapons(MeleeNeeded, "melee")

    apd2_data.x.melee = APD2Client["Melee Weapon"]
    apd2_chat_send("Unlocked new melee weapons!")
    DataChanged = true
  end

  -- Unlock random throwables
  apd2_data.x.throwables = apd2_data.x.throwables or 0
  if APD2Client["Throwable"] > apd2_data.x.throwables then
    local ThrowablesNeeded = APD2Client["Throwable"] - apd2_data.x.throwables
    apd2_random_weapons(ThrowablesNeeded, "throwables")

    apd2_data.x.throwables = APD2Client["Throwable"]
    apd2_chat_send("Unlocked new throwables!")
    DataChanged = true
  end

  -- Unlock random skills
  apd2_data.x.skills = apd2_data.x.skills or 0
  if APD2Client["Skill"] > apd2_data.x.skills then
    local SkillsNeeded = APD2Client["Skill"] - apd2_data.x.skills
    apd2_random_upgrades(SkillsNeeded, "skills")

    apd2_data.x.skills = APD2Client["Skill"]
    apd2_chat_send("Received new skills!")
    DataChanged = true
  end

  -- Unlock random perks
  apd2_data.x.perks = apd2_data.x.perks or 0
  if APD2Client["Perk"] > apd2_data.x.perks then
    local PerksNeeded = APD2Client["Perk"] - apd2_data.x.perks
    apd2_random_upgrades(PerksNeeded, "perks")

    apd2_data.x.perks = APD2Client["Perk"]
    apd2_chat_send("Received new perks!")
    DataChanged = true
  end

  -- Unlock random stat boosts
  apd2_data.x.stats = apd2_data.x.stats or 0
  if APD2Client["Stat Boost"] > apd2_data.x.stats then
    local StatsNeeded = APD2Client["Stat Boost"] - apd2_data.x.stats
    apd2_random_upgrades(StatsNeeded, "stats")

    apd2_data.x.stats = APD2Client["Stat Boost"]
    apd2_chat_send("Received new stat boosts!")
    DataChanged = true
  end

  -- Write to apyday2.txt if any values were updated
  if DataChanged then

    -- Pull upgrades from save file and split them into a table/index pair
    for _, upgrade in pairs(apd2_data.upgrades) do
      local tableName, upgradeName = upgrade:match("([^%-]+)%-(.+)")

      -- If the table is nil it's an actual upgrade ID, we can just add it
      if tableName == nil then
        if not Global.upgrades_manager.aquired[upgrade] then
          --log(APD2FileIdent .. "Adding upgrade: " .. upgrade)
          managers.upgrades:aquire(upgrade)
        end

      -- On a table/index pair, look it up and add all upgrades it encompasses
      else           
        for _, currentUpgrade in pairs(apd2_upgrade_tables[tableName][upgradeName]) do
           if not Global.upgrades_manager.aquired[currentUpgrade] then
             --log(APD2FileIdent .. "Adding upgrade: " .. currentUpgrade)
             managers.upgrades:aquire(currentUpgrade)
           end
        end
      end
    end

    for key, _ in pairs(apd2_data.unlocks) do
      if not Global.upgrades_manager.aquired[key] then
        --log(APD2FileIdent .. "Unlocking " .. currentUpgrade)
        managers.upgrades:aquire(key)
      end
    end

    apd2_save(APD2FileIdent, "unlock received from multiworld")
  end
end