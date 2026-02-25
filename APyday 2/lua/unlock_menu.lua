local upgrades = {}

if next(apd2_data.upgrades) ~= nil then
  for _, upgrade in pairs(apd2_data.upgrades) do
    local tableName, upgradeId = upgrade:match("^(.-)(%d+)$")
    local upgradeStr
    
    if tableName == "player_drill_speed_multiplier" then
      upgLevel = upgrade:sub(-1)
      upgradeStr = "Drill Sawgeant Lv" .. upgLevel .. ": Drills and saws are " .. 15 * upgLevel .. "% faster."
    else
      upgradeId = tonumber(upgradeId)
      local currentUpgrade = apd2_upgrade_tables[tableName][upgradeId]
      --Utils.PrintTable(currentUpgrade, 1)
      --log(currentUpgrade.desc)
      upgradeStr = currentUpgrade.name .. ": " .. currentUpgrade.desc
    end
    log(upgradeStr)
    table.insert(upgrades, upgradeStr)
  end
else
  table.insert(upgrades, "None")
end

local menu = QuickMenu:new("Current Upgrades", table.concat(upgrades, "\n"), {})
menu:Show()