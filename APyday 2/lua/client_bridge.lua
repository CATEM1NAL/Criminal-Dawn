local APD2FileIdent = "[APD2>client_bridge] "

dofile(APD2Path .. "lua/unlock_handler.lua")

-- PONR upgrade needs to be called in multiple places
function apd2_get_ponr_upgrades()
  local APD2Client = io.load_as_json(SavePath .. "apyday2-client.txt") or {}
  APD2Client["Extra Time"] = APD2Client["Extra Time"] or 0
  apd2_data.x.ponr_upgrade = apd2_data.x.ponr_upgrade or 0

  if APD2Client["Extra Time"] > apd2_data.x.ponr_upgrade then
    local ExtraTime = 600 * (APD2Client["Extra Time"] - apd2_data.x.ponr_upgrade)
    apd2_data.game.ponr = apd2_data.game.ponr + ExtraTime
    apd2_data.x.ponr_upgrade = APD2Client["Extra Time"]
    io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
    log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")

    DelayedCalls:Add("apd2_remaining_time", 1, function()
      apd2_chat_send("Time left: " .. math.floor(apd2_data.game.ponr) .. " (+" .. ExtraTime .. " from Extra Time)")
    end)

  else
    DelayedCalls:Add("apd2_remaining_time", 1, function()
      if apd2_data.game.ponr < 0 then
        apd2_chat_send("Remaining time is less than 0!")
      else
        apd2_chat_send("Time left: " .. math.floor(apd2_data.game.ponr))
      end
    end)
  end
end

function apd2_poll_client()  
  local APD2Client = io.load_as_json(SavePath .. "apyday2-client.txt") or {}
  
  if WinSteamDLCManager:_check_dlc_data("DLC Unlocker Check") or
  WinEpicDLCManager:_check_dlc_data("DLC Unlocker Check") or
  WINDLCManager:_check_dlc_data("DLC Unlocker Check") then
    log(APD2FileIdent .. "DLC unlocker detected!")
    apd2_no_dlc = true
  end
  
  local DataChanged = false

  -- Set default client values if they don't exist
  APD2Client.seed = APD2Client.seed or nil
  APD2Client["Drill Speed"] = APD2Client["Drill Speed"] or 0
  APD2Client["Extra Bot"] = APD2Client["Extra Bot"] or 0
  APD2Client["Difficulty Increase"] = APD2Client["Difficulty Increase"] or 0
  APD2Client["Additional Mutator"] = APD2Client["Additional Mutator"] or 0
  APD2Client["Primary Weapon"] = APD2Client["Primary Weapon"] or 0
  APD2Client["Secondary Weapon"] = APD2Client["Secondary Weapon"] or 0
  APD2Client["Melee Weapon"] = APD2Client["Melee Weapon"] or 0
  APD2Client["Throwable"] = APD2Client["Throwable"] or 0
  APD2Client["Armor"] = APD2Client["Armor"] or 0
  APD2Client["Deployable"] = APD2Client["Deployable"] or 0
  APD2Client["Random Skill"] = APD2Client["Random Skill"] or 0
  APD2Client["Perk Deck Effect"] = APD2Client["Perk Deck Effect"] or 0
  APD2Client["Stat Upgrade"] = APD2Client["Stat Upgrade"] or 0
  APD2Client["24 Coins"] = APD2Client["24 Coins"] or 0
  APD2Client["6 Coins"] = APD2Client["6 Coins"] or 0

  -- Copy seed from client if we don't have one
  if not apd2_data.game.seed and APD2Client.seed then
    log(APD2FileIdent .. "Writing seed")
    apd2_data.game.seed = APD2Client.seed
    DataChanged = true
  end

  -- Add drill speed upgrades
  if APD2Client["Drill Speed"] ~= 0 then
    if not apd2_data.upgrades["player_drill_speed_multiplier" .. APD2Client["Drill Speed"]] then
      log(APD2FileIdent .. "Drill speed " .. APD2Client["Drill Speed"])
      table.insert(apd2_data.upgrades, "player_drill_speed_multiplier" .. APD2Client["Drill Speed"])
      --apd2_data.upgrades["player_drill_speed_multiplier" .. APD2Client["Drill Speed"]] = true
      DataChanged = true
    end
  end

  -- Add extra bots
  apd2_data.x.bots = apd2_data.x.bots or 0
  if APD2Client["Extra Bot"] > apd2_data.x.bots then
    log(APD2FileIdent .. APD2Client["Extra Bot"] .. " bots")
    apd2_data.x.bots = APD2Client["Extra Bot"]
    DataChanged = true
  end

  -- Increase difficulty
  apd2_data.x.diff = apd2_data.x.diff or 0
  if APD2Client["Difficulty Increase"] > apd2_data.x.diff then
    log(APD2FileIdent .. "Difficulty " .. APD2Client["Difficulty Increase"])
    apd2_data.x.diff = APD2Client["Difficulty Increase"]
    DataChanged = true
  end

  -- Add mutators
  apd2_data.x.mutators = apd2_data.x.mutators or 0
  if APD2Client["Additional Mutator"] > apd2_data.x.mutators then
    log(APD2FileIdent .. APD2Client["Additional Mutator"] .. " mutators")
    apd2_data.x.mutators = APD2Client["Additional Mutator"]
    DataChanged = true
  end

  -- Enable One Down
  if not apd2_data.game.one_down and APD2Client["One Down"] then
    log(APD2FileIdent .. "Enabling One Down")
    apd2_data.game.one_down = true
    DataChanged = true
  end

  -- Give small number of coins
  if managers.custom_safehouse then
    apd2_data.x.coins = apd2_data.x.coins or 0
    if APD2Client["6 Coins"] > apd2_data.x.coins then
      log(APD2FileIdent .. "Giving " .. 6 * (APD2Client["6 Coins"] - apd2_data.x.coins) .. " coins")
      managers.custom_safehouse:add_coins(6 * (APD2Client["6 Coins"] - apd2_data.x.coins))
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
      apd2_data.x.big_coins = APD2Client["24 Coins"]
      DataChanged = true
    end
  end

  -- Unlock saws
  if not apd2_data.x.saw and (APD2Client["Saw"] or APD2Client["Second Saw"]) then
    log(APD2FileIdent .. "Giving first saw")
    local saws = { "saw", "saw_secondary" }
    apd2_data.unlocks[saws[math.random(2)]] = true
    apd2_data.x.saw = 1
    DataChanged = true
  end
  if apd2_data.x.saw == 1 and (APD2Client["Saw"] and APD2Client["Second Saw"]) then
    log(APD2FileIdent .. "Giving second saw")
    apd2_data.unlocks.saw = true
    apd2_data.unlocks.saw_secondary = true
    apd2_data.x.saw = 2
    DataChanged = true
  end

  -- Unlock ECM
  if not apd2_data.unlocks.ecm_jammer and APD2Client["ECM"] then
    log(APD2FileIdent .. "Giving ECM jammer")
    apd2_data.unlocks.ecm_jammer = true
    DataChanged = true
  end

  -- Unlock tripmines
  if not apd2_data.unlocks.trip_mine and APD2Client["Trip Mines"] then
    log(APD2FileIdent .. "Giving trip mine")
    apd2_data.unlocks.trip_mine = true
    DataChanged = true
  end

  -- Unlock random deployables
  apd2_data.x.deployables = apd2_data.x.deployables or 0
  if APD2Client["Deployable"] > apd2_data.x.deployables then
    local DeployablesNeeded = APD2Client["Deployable"] - apd2_data.x.deployables
    for i = 1, DeployablesNeeded do
      apd2_random_deployables(DeployablesNeeded)
    end
    
    apd2_data.x.deployables = APD2Client["Deployable"]
    DataChanged = true
  end

  -- Unlock random armours
  apd2_data.x.armour = apd2_data.x.armour or 0
  if APD2Client["Armor"] > apd2_data.x.armour then
    local ArmourNeeded = APD2Client["Armor"] - apd2_data.x.armour
    for i = 1, ArmourNeeded do
      apd2_random_armors(ArmourNeeded)
    end
    
    apd2_data.x.armour = APD2Client["Armor"]
    DataChanged = true
  end

  -- Unlock random primaries
  apd2_data.x.primaries = apd2_data.x.primaries or 0
  if APD2Client["Primary Weapon"] > apd2_data.x.primaries then
    local PrimariesNeeded = APD2Client["Primary Weapon"] - apd2_data.x.primaries
    for i = 1, PrimariesNeeded do
      apd2_random_weapons(PrimariesNeeded, "primaries")
    end
    
    apd2_data.x.primaries = APD2Client["Primary Weapon"]
    DataChanged = true
  end

  -- Unlock random secondaries
  apd2_data.x.secondaries = apd2_data.x.secondaries or 0
  if APD2Client["Secondary Weapon"] > apd2_data.x.secondaries then
    local SecondariesNeeded = APD2Client["Secondary Weapon"] - apd2_data.x.secondaries
    for i = 1, SecondariesNeeded do
      apd2_random_weapons(SecondariesNeeded, "secondaries")
    end
    
    apd2_data.x.secondaries = APD2Client["Secondary Weapon"]
    DataChanged = true
  end

  -- Unlock random melees
  apd2_data.x.melee = apd2_data.x.melee or 0
  if APD2Client["Melee Weapon"] > apd2_data.x.melee then
    local MeleeNeeded = APD2Client["Melee Weapon"] - apd2_data.x.melee
    for i = 1, MeleeNeeded do
      apd2_random_weapons(MeleeNeeded, "melee")
    end
    
    apd2_data.x.melee = APD2Client["Melee Weapon"]
    DataChanged = true
  end

  -- Unlock random throwables
  apd2_data.x.throwables = apd2_data.x.throwables or 0
  if APD2Client["Throwable"] > apd2_data.x.throwables then
    local ThrowablesNeeded = APD2Client["Throwable"] - apd2_data.x.throwables
    for i = 1, ThrowablesNeeded do
      apd2_random_weapons(ThrowablesNeeded, "throwables")
    end
    
    apd2_data.x.throwables = APD2Client["Throwable"]
    DataChanged = true
  end

  -- Unlock random skills
  apd2_data.x.skills = apd2_data.x.skills or 0
  if APD2Client["Random Skill"] > apd2_data.x.skills then
    local SkillsNeeded = APD2Client["Random Skill"] - apd2_data.x.skills
    for i = 1, SkillsNeeded do
    apd2_random_upgrades(SkillsNeeded, "skills")
    end
    
    apd2_data.x.skills = APD2Client["Random Skill"]
    DataChanged = true
  end

  -- Unlock random perks
  apd2_data.x.perks = apd2_data.x.perks or 0
  if APD2Client["Perk Deck Effect"] > apd2_data.x.perks then
    local PerksNeeded = APD2Client["Perk Deck Effect"] - apd2_data.x.perks
    apd2_random_upgrades(PerksNeeded, "perks")

    apd2_data.x.perks = APD2Client["Perk Deck Effect"]
    DataChanged = true
  end

  -- Unlock random stat boosts
  apd2_data.x.stats = apd2_data.x.stats or 0
  if APD2Client["Stat Upgrade"] > apd2_data.x.stats then
    local StatsNeeded = APD2Client["Stat Upgrade"] - apd2_data.x.stats
    apd2_random_upgrades(StatsNeeded, "stats")

    apd2_data.x.stats = APD2Client["Stat Upgrade"]
    DataChanged = true
  end

  -- Write to apyday2.txt if any values were updated
  if DataChanged == true then
    if managers.blackmarket then
      -- Pull upgrade ID from save file, loop through upgrade names within that ID, grant upgrades
      for _, upgrade in pairs(apd2_data.upgrades) do
        log(APD2FileIdent .. upgrade)
        local tableName, upgradeId = upgrade:match("^(%a+)(%d+)$")
        upgradeId = tonumber(upgradeId)
        log(APD2FileIdent .. tableName .. " " .. upgradeId)
        
        for i = 1, #apd2_upgrade_tables[tableName][upgradeId] do
          local currentUpgrade = apd2_upgrade_tables[tableName][upgradeId][i]
          if not Global.upgrades_manager.aquired[currentUpgrade] then
            managers.upgrades:aquire(currentUpgrade)
            log(APD2FileIdent .. "Adding upgrade: " .. currentUpgrade)
          end
        end
      end
    
      for key, _ in pairs(apd2_data.unlocks) do
        if not Global.upgrades_manager.aquired[key] then
          managers.upgrades:aquire(key)
        end
      end
    end
    
    io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
    log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
  end
end