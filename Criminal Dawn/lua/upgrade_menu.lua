local upgrades = { skills = {}, perks = {}, stats = {}, deployable = {} }

--Utils.PrintTable(managers.mutators._mutators, 3)
--Utils.PrintTable(Global.mutators.active_on_load, 3)
--Utils.PrintTable(managers.network.matchmake._lobby_attributes, 1)
--Utils.PrintTable(managers.network.matchmake:get_lobby_data())

for _, upgrade in pairs(apd2_data.upgrades) do
  local tableName, upgradeName = upgrade:match("([^%-]+)%-(.+)")
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
    local currentUpgrade = apd2_upgrade_tables[tableName][upgradeName]
    upgradeStr = "- " .. string.upper(currentUpgrade.name) .. ": " .. currentUpgrade.desc
    table.insert(upgrades[tableName], upgradeStr)
  end
end

-- I was having so much trouble getting these menus to work correctly.
-- There's probably a better way of doing this, idk what it is though
function apd2_buildUpgradeMenus()
  local menu_title
  local menu_text

  local menu_buttons = {
    [1] = { text = "Skills",
            callback = apd2_display_skills },
    [2] = { text = "Perks",
            callback = apd2_display_perks },
    [3] = { text = "Stat Boosts",
            callback = apd2_display_stats },
    [4] = { text = "Deployable",
            callback = apd2_display_deploy },
    [5] = { text = managers.localization:text("menu_back"),
            is_cancel_button = true }
  }

  menu_title = "Current Skills"
  if next(upgrades.skills) then
    menu_text = table.concat(upgrades.skills, "\n")
  else
    menu_text = "None"
  end
  apd2_skills_menu = QuickMenu:new(menu_title, menu_text, menu_buttons)

  menu_title = "Current Perks"
  if next(upgrades.perks) then
    menu_text = table.concat(upgrades.perks, "\n")
  else
    menu_text = "None"
  end
  apd2_perks_menu = QuickMenu:new(menu_title, menu_text, menu_buttons)

  menu_title = "Current Stat Boosts"
  if next(upgrades.stats) then
    menu_text = table.concat(upgrades.stats, "\n")
  else
    menu_text = "None"
  end
  apd2_stats_menu = QuickMenu:new(menu_title, menu_text, menu_buttons)

  menu_title = "Current Deployable Upgrades"
  if next(upgrades.deployable) then
    menu_text = table.concat(upgrades.deployable, "\n")
  else
    menu_text = "None"
  end
  apd2_deploy_menu = QuickMenu:new(menu_title, menu_text, menu_buttons)
end

function apd2_display_skills()
  apd2_buildUpgradeMenus()
  apd2_skills_menu:Show()
end

function apd2_display_perks()
  apd2_buildUpgradeMenus()
  apd2_perks_menu:Show()
end

function apd2_display_stats()
  apd2_buildUpgradeMenus()
  apd2_stats_menu:Show()
end

function apd2_display_deploy()
  apd2_buildUpgradeMenus()
  apd2_deploy_menu:Show()
end

apd2_display_skills()