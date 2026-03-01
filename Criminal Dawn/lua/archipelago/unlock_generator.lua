local APD2FileIdent = "[APD2>unlock_generator] "

-- Generate specific number of specific upgrade type
function apd2_random_upgrades(count, table_name)
  local BaseTable = {}

  -- Build initial table of keys and readable names
  for key, _ in pairs(apd2_upgrade_tables[table_name]) do
    local name = apd2_upgrade_tables[table_name][key]["name"]
    if name ~= "INVALID" then
      BaseTable[key] = name
    end
  end

  -- Get current upgrades
  for _, upgrade in pairs(apd2_data.upgrades) do
    local tableName, key = upgrade:match("([^%-]+)%-(.+)")
    if tableName == table_name then
      BaseTable[key] = nil
    end
  end

  -- Build working table from base table
  local WorkingTable = {}
  for i, _ in pairs(BaseTable) do
    table.insert(WorkingTable, i)
  end

  -- Update count to fit the new table length
  count = math.min(count, #WorkingTable)

  local UpgradeIndex
  -- Add the specified number of random upgrades
  for i = 1, count do
    UpgradeIndex = math.random(#WorkingTable)
    table.insert(apd2_data.upgrades, table_name .. "-" .. WorkingTable[UpgradeIndex])
    log(APD2FileIdent .. "Added " .. WorkingTable[UpgradeIndex] .. " to upgrade table")
    table.remove(WorkingTable, UpgradeIndex)
  end
end

-- Unlock a certain number of weapons
function apd2_random_weapons(count, table_name)
  local WorkingTable = apd2_weapon_tables[table_name]

  -- Remove upgrades that the player already has
  for i = #WorkingTable, 1, -1 do
    if apd2_data.unlocks[WorkingTable[i]] then
      table.remove(WorkingTable, i)
    end
  end
  
  count = math.min(count, #WorkingTable)

  local WeaponIndex
  -- Add the specified number of random upgrades
  for i = 1, count do
    WeaponIndex = math.random(#WorkingTable)
    apd2_data.unlocks[WorkingTable[WeaponIndex]] = true
    log(APD2FileIdent .. "Added " .. WorkingTable[WeaponIndex] .. " to weapon table")
    table.remove(WorkingTable, WeaponIndex)
  end
end

-- Unlock a certain number of armors
function apd2_random_armors(count)
  local ArmorTable = { "body_armor1", "body_armor2",
    "body_armor3", "body_armor4", "body_armor5", "body_armor6" }

  -- Remove upgrades that the player already has
  for i = #ArmorTable, 1, -1 do
    if apd2_data.unlocks[ArmorTable[i]] then
      table.remove(ArmorTable, i)
    end
  end
  
  count = math.min(count, #ArmorTable)

  local ArmorIndex
  -- Add the specified number of random upgrades
  for i = 1, count do
    ArmorIndex = math.random(#ArmorTable)
    apd2_data.unlocks[ArmorTable[ArmorIndex]] = true
    log(APD2FileIdent .. "Added " .. ArmorTable[ArmorIndex] .. " to weapon table")
    table.remove(ArmorTable, ArmorIndex)
  end
end

-- Unlock a certain number of deployables
function apd2_random_deployables(count)
  local DeployTable = { "doctor_bag", "ammo_bag", "sentry_gun",
    "sentry_gun_silent", "first_aid_kit", "bodybags_bag", "armor_kit" }

  -- Remove upgrades that the player already has
  for i = #DeployTable, 1, -1 do
    if apd2_data.unlocks[DeployTable[i]] then
      table.remove(DeployTable, i)
    end
  end
  
  count = math.min(count, #DeployTable)

  local DeployIndex
  -- Add the specified number of random upgrades
  for i = 1, count do
    DeployIndex = math.random(#DeployTable)
    apd2_data.unlocks[DeployTable[DeployIndex]] = true
    log(APD2FileIdent .. "Added " .. DeployTable[DeployIndex] .. " to weapon table")
    table.remove(DeployTable, DeployIndex)
  end
end