local APD2FileIdent = "[APD2>upgrades] "

Hooks:PreHook(PlayerManager, "aquire_default_upgrades", "apd2_upgradehandler", function(self)
  tweak_data.skilltree.default_upgrades = { "player_hostage_trade", "player_special_enemy_highlight" }

  for key, _ in pairs(Global.upgrades_manager.aquired) do
    if key ~= "amcar" and key ~= "glock_17" and key ~= "weapon" then
      if not apd2_data.upgrades[key] and not apd2_data.unlocks[key] then
        --log(APD2FileIdent .. "Removing upgrade " .. key )
        managers.upgrades:unaquire(key)
      end
    end
  end

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
      log(APD2FileIdent .. "Adding upgrade: " .. key)
      managers.upgrades:aquire(key)
    end
  end
  --Utils.PrintTable(Global.upgrades_manager.aquired, 3)
end)

Hooks:PostHook(UpgradesTweakData, "init", "apd2_nolevelunlocks", function(self)
  -- local no_level_lock = { "s552","scar","spas12","rpk","usp","ppk","p226","m45","mp7" }
  -- I thought adding the weapons with no level lock to the level table would work, it doesn't

  -- move all level unlocks to the same level (255)
  local all_levels = { upgrades = {} }
  for _, level in pairs(self.level_tree) do
    if level.upgrades then
      for _, upgrade in ipairs(level.upgrades) do
        table.insert(all_levels.upgrades, upgrade)
      end
    end
  end
  self.level_tree = { [255] = all_levels }
end)