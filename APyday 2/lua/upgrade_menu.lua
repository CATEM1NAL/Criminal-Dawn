local upgrades = {}

if next(apd2_data.upgrades) ~= nil then
  for _, upgrade in pairs(apd2_data.upgrades) do
    local tableName, upgradeName = upgrade:match("([^%-]+)%-(.+)")
    local upgradeStr
    
    if upgrade:match("^(.-)%d+$") == "player_drill_speed_multiplier" then
      local upgLevel = upgrade:sub(-1)
      upgradeStr = "Drill Sawgeant Lv" .. upgLevel .. ": Drills and saws are " .. 15 * upgLevel .. "% faster."
    else
      local currentUpgrade = apd2_upgrade_tables[tableName][upgradeName]
      upgradeStr = currentUpgrade.name .. ": " .. currentUpgrade.desc
    end
    
    table.insert(upgrades, upgradeStr)
  end
  
else
  table.insert(upgrades, "None")
end

local menu = QuickMenu:new("Current Upgrades", table.concat(upgrades, "\n"), {})
menu:Show()