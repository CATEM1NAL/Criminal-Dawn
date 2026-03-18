local FileIdent = "upgrade_handler"

Hooks:PreHook(PlayerManager, "aquire_default_upgrades", "CrimDawn_UpgradeHandler", function(self)
  tweak_data.skilltree.default_upgrades = {
    "player_hostage_trade", "player_special_enemy_highlight", "player_sec_camera_highlight", "cable_tie",
    "temporary_first_aid_damage_reduction", "temporary_passive_revive_damage_reduction_2",
    "passive_player_xp_multiplier", "player_flashbang_multiplier_2"
  }

  -- Nuke current upgrades
  for key, _ in pairs(Global.upgrades_manager.aquired) do
    if key ~= "amcar" and key ~= "glock_17" and key ~= "weapon" then
      if not Global.CrimDawn.data.unlocks[key] then managers.upgrades:unaquire(key) end
    end
  end

  Global.player_manager.upgrades = {}
  Global.player_manager.team_upgrades = {}
  Global.player_manager.cooldown_upgrades = { cooldown = {} }

  -- Pull upgrades from save file and split them into a table/index pair
  for _, upgrade in ipairs(Global.CrimDawn.data.upgrades) do
    local tableName, upgradeName = upgrade:match("([^%-]+)%-(.+)")
    if tonumber(upgradeName) then upgradeName = tonumber(upgradeName) end
    
    -- If the table is nil it's an actual upgrade ID, we can just add it
    if tableName == nil then managers.upgrades:aquire(upgrade)

    else -- On a table/index pair, look it up and add all upgrades it encompasses
      for _, currentUpgrade in ipairs(Global.CrimDawn.tables.upgrades[tableName][upgradeName]) do
         managers.upgrades:aquire(currentUpgrade)
      end
    end
  end

  for key, _ in pairs(Global.CrimDawn.data.unlocks) do
    if not Global.upgrades_manager.aquired[key] then
      CrimDawn.Log(FileIdent, "Unlocking " .. key)
      managers.upgrades:aquire(key)
    end
  end
end)

Hooks:PostHook(UpgradesTweakData, "init", "CrimDawn_LevelTree", function(self)
  -- local no_level_lock = { "s552","scar","spas12","rpk","usp","ppk","p226","m45","mp7" }
  -- I thought adding the weapons with no level lock to the level table would work, it doesn't

  local all_levels = { upgrades = {} }

  -- move all level unlocks to 193 (PDTH my beloved)
  for _, level in pairs(self.level_tree) do
    if level.upgrades then
      for _, upgrade in ipairs(level.upgrades) do table.insert(all_levels.upgrades, upgrade) end
    end
  end

  self.level_tree = { [193] = all_levels }
end)