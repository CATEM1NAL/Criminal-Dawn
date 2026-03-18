local upgrades = { skills = {}, perks = {}, stats = {}, deployable = {} }
local loc = managers.localization

for _, upgrade in pairs(Global.CrimDawn.data.upgrades) do
  local tableName, upgradeName = upgrade:match("([^%-]+)%-(.+)")
  if tonumber(upgradeName) then upgradeName = tonumber(upgradeName) end
  local upgradeStr

  -- Drill Sawgeant
  if upgrade:find("^player_drill_speed_multiplier") or upgrade:find("^player_additional_lives_") then
    local upgLevel = upgrade:sub(-1)
    upgradeStr = "- " .. string.upper(loc:text("cd_" .. upgrade .. "_name")) .. ": " .. loc:text("cd_" .. upgrade .. "_desc")
    table.insert(upgrades.skills, upgradeStr)

  else -- Everything else
    local currentUpgrade = Global.CrimDawn.tables.upgrades[tableName][upgradeName]
    if tableName == "permaskills" or tableName == "permaperks" then
      upgradeStr = "- " .. string.upper(loc:text("cd_" .. tableName .. upgradeName .. "_name")) .. ": "
                .. loc:text("cd_" .. tableName .. upgradeName .. "_desc")
      tableName = tableName:sub(6)
    else upgradeStr = "- " .. string.upper(loc:text("cd_" .. upgradeName .. "_name")) ..": "
                   .. loc:text("cd_" .. upgradeName .. "_desc") end
    table.insert(upgrades[tableName], upgradeStr)
  end
end

-- I was having so much trouble getting these menus to work correctly.
-- There's probably a better way of doing this, idk what it is though
function CrimDawn_BuildUpgradeMenus()
  local MenuTitle
  local MenuText

  local MenuButtons = {
    [1] = { text = loc:text("crimdawn_upgrades_button_skills"),
            callback = CrimDawn_DisplaySkills },
    [2] = { text = loc:text("crimdawn_upgrades_button_perks"),
            callback = CrimDawn_DisplayPerks },
    [3] = { text = loc:text("crimdawn_upgrades_button_stats"),
            callback = CrimDawn_DisplayStats },
    [4] = { text = loc:text("crimdawn_upgrades_button_deploy"),
            callback = CrimDawn_display_deploy },
    [5] = { text = loc:text("menu_back"),
            is_cancel_button = true }
  }

  MenuTitle = loc:text("crimdawn_upgrades_title_skills")
  if next(upgrades.skills) then MenuText = table.concat(upgrades.skills, "\n")
  else MenuText = loc:text("crimdawn_upgrades_none") end
  CrimDawn_SkillsMenu = QuickMenu:new(MenuTitle, MenuText, MenuButtons)

  MenuTitle = loc:text("crimdawn_upgrades_title_perks")
  if next(upgrades.perks) then MenuText = table.concat(upgrades.perks, "\n")
  else MenuText = loc:text("crimdawn_upgrades_none") end
  CrimDawn_PerksMenu = QuickMenu:new(MenuTitle, MenuText, MenuButtons)

  MenuTitle = loc:text("crimdawn_upgrades_title_stats")
  if next(upgrades.stats) then MenuText = table.concat(upgrades.stats, "\n")
  else MenuText = loc:text("crimdawn_upgrades_none") end
  CrimDawn_StatsMenu = QuickMenu:new(MenuTitle, MenuText, MenuButtons)

  MenuTitle = loc:text("crimdawn_upgrades_title_deploy")
  if next(upgrades.deployable) then MenuText = table.concat(upgrades.deployable, "\n")
  else MenuText = loc:text("crimdawn_upgrades_none") end
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