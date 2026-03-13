local upgrades = { skills = {}, perks = {}, stats = {}, deployable = {} }

for _, upgrade in pairs(Global.CrimDawn.data.upgrades) do
  local tableName, upgradeName = upgrade:match("([^%-]+)%-(.+)")
  if tonumber(upgradeName) then upgradeName = tonumber(upgradeName) end
  local upgradeStr

  -- Drill Sawgeant
  if upgrade:find("^player_drill_speed_multiplier") then
    local upgLevel = upgrade:sub(-1)
    upgradeStr = "- DRILL SAWGEANT LV" .. upgLevel .. ": Drills and saws are " .. 15 * upgLevel .. "% faster."
    table.insert(upgrades.skills, upgradeStr)

  -- Nine Lives
  elseif upgrade:find("^player_additional_lives_") then
    local upgLevel = math.floor(1.5 * tonumber(upgrade:sub(-1)))
    local suffix = (upgLevel == 1) and " more time." or " more times."
    upgradeStr = "- NINE LIVES LV" .. math.min(upgLevel, 2) .. ": Can go down " .. upgLevel .. suffix
    table.insert(upgrades.skills, upgradeStr)

  else -- Everything else
    local currentUpgrade = Global.CrimDawn.tables.upgrades[tableName][upgradeName]
    upgradeStr = "- " .. string.upper(currentUpgrade.name) .. ": " .. currentUpgrade.desc
    if tableName == "permaskills" then tableName = "skills"
    elseif tableName == "permaperks" then tableName = "perks" end
    table.insert(upgrades[tableName], upgradeStr)
  end
end

-- I was having so much trouble getting these menus to work correctly.
-- There's probably a better way of doing this, idk what it is though
function CrimDawn_BuildUpgradeMenus()
  local MenuTitle
  local MenuText

  local MenuButtons = {
    [1] = { text = "Skills",
            callback = CrimDawn_DisplaySkills },
    [2] = { text = "Perks",
            callback = CrimDawn_DisplayPerks },
    [3] = { text = "Stat Boosts",
            callback = CrimDawn_DisplayStats },
    [4] = { text = "Deployable",
            callback = CrimDawn_display_deploy },
    [5] = { text = managers.localization:text("menu_back"),
            is_cancel_button = true }
  }

  MenuTitle = "Current Skills"
  if next(upgrades.skills) then MenuText = table.concat(upgrades.skills, "\n")
  else MenuText = "None" end
  CrimDawn_SkillsMenu = QuickMenu:new(MenuTitle, MenuText, MenuButtons)

  MenuTitle = "Current Perks"
  if next(upgrades.perks) then MenuText = table.concat(upgrades.perks, "\n")
  else MenuText = "None" end
  CrimDawn_PerksMenu = QuickMenu:new(MenuTitle, MenuText, MenuButtons)

  MenuTitle = "Current Stat Boosts"
  if next(upgrades.stats) then MenuText = table.concat(upgrades.stats, "\n")
  else MenuText = "None" end
  CrimDawn_StatsMenu = QuickMenu:new(MenuTitle, MenuText, MenuButtons)

  MenuTitle = "Current Deployable Upgrades"
  if next(upgrades.deployable) then MenuText = table.concat(upgrades.deployable, "\n")
  else MenuText = "None" end
  CrimDawn_DeployMenu = QuickMenu:new(MenuTitle, MenuText, MenuButtons)
end

function CrimDawn_DisplaySkills()
  CrimDawn_BuildUpgradeMenus()
  CrimDawn_SkillsMenu:Show()
end

function CrimDawn_DisplayPerks()
  CrimDawn_BuildUpgradeMenus()
  CrimDawn_PerksMenu:Show()
end

function CrimDawn_DisplayStats()
  CrimDawn_BuildUpgradeMenus()
  CrimDawn_StatsMenu:Show()
end

function CrimDawn_display_deploy()
  CrimDawn_BuildUpgradeMenus()
  CrimDawn_DeployMenu:Show()
end

CrimDawn_DisplaySkills()