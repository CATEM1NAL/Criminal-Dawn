local FileIdent = "unlock_generator"

-- Check if any of the requirements are met
local function AnyObtained(reqs, req_type)
  for _, item in ipairs(reqs) do
    if Global.CrimDawn.data[req_type][item] then return true end
  end
return false end

local function UpgradeMatched(upg_name)
  for _, upgrade in ipairs(Global.CrimDawn.data.upgrades) do
    if upgrade == upg_name then return true end
  end
return false end

-- Permaskills/perks should be given in order
function CrimDawn:PermaUpgrade(count, table_name)
  self.Log(FileIdent, "Giving " .. count .. " " .. table_name)
  for i, _ in pairs(Global.CrimDawn.tables.upgrades[table_name]) do
    if tonumber(i) > count then return end
    UpgName = table_name .. "-" .. i
    if not UpgradeMatched(UpgName) then table.insert(Global.CrimDawn.data.upgrades, UpgName) end
  end
end

-- Generate specific number of specific upgrade type
function CrimDawn:RandomUpgrade(count, table_name)
  self.Log(FileIdent, "Generating " .. count .. " random " .. table_name)
  local DisabledUpgrades = {}
  local AcquiredUpgrades = {}

  -- Setup the above tables
  for _, upgrade in ipairs(Global.CrimDawn.data.upgrades) do
    local TableName, key = upgrade:match("([^%-]+)%-(.+)")
    if TableName == table_name then
      AcquiredUpgrades[key] = true
      if Global.CrimDawn.tables.upgrades[table_name][key].disable then
        for item in Global.CrimDawn.tables.upgrades[table_name][key].disable:gmatch("([^,]+)") do
          DisabledUpgrades[item] = true
        end
      end
    end
  end

  for i = 1, count do
    local BaseTable = {}
    local UpgType

    if table_name == "skills" then
      local TypeCount = (Global.CrimDawn.data.x.skills + i) % 7
      local TypePattern = { "general",
                            "loud",
                            "stealth",
                            "weapon",
                            "loud",
                            "weapon",
                            "loud" }
      UpgType = TypePattern[TypeCount + 1]

    elseif table_name == "perks" then
      local TypeCount = (Global.CrimDawn.data.x.perks + i) % 3
      local TypePattern = { "stat",
                            "ability",
                            "stat" }
      UpgType = TypePattern[TypeCount + 1]

    elseif table_name == "stats" then
      local TypeCount = (Global.CrimDawn.data.x.stats + i) % 2
      local TypePattern = { "player",
                            "weapon" }
      UpgType = TypePattern[TypeCount + 1]
    end

    self.Log(FileIdent, "Next upgrade type: " .. UpgType)

    for key, data in pairs(Global.CrimDawn.tables.upgrades[table_name]) do
      --self.Log(FileIdent, "checking if " .. data.name .. " is valid")

      -- Check if data value is met
      local CountMet
      if data.count_req then
        local CountKey, CountValue = data.count_req:match("([^:]+):(.*)")
        if data.count_req and (Global.CrimDawn.data.x[CountKey] >= tonumber(CountValue)) then
          CountMet = true
        end
      end

      -- Create table of item requirements
      local ItemReq = {}
      if data.item_req then
        for item in data.item_req:gmatch("([^,]+)") do table.insert(ItemReq, item) end
      end

      -- Create table of upgrade requirements
      local UpgReq = {}
      if data.upg_req then
        for item in data.upg_req:gmatch("([^,]+)") do table.insert(UpgReq, item) end
      end

      if data.name ~= "INVALID" and data.upg_type == UpgType and -- If upgrade is valid, matches the type we want,
      not DisabledUpgrades[key] and not AcquiredUpgrades[key] and -- isn't disabled, isn't owned,
      (not data.upg_req or AnyObtained(UpgReq, "upgrades")) and -- any upgrade req. is obtained,
      (not data.item_req or AnyObtained(ItemReq, "unlocks")) and -- any item req. is unlocked,
      (not data.count_req or CountMet) then -- and the variable count is met...
        --self.Log(FileIdent, data.name .. " added as candidate")
        BaseTable[key] = data.name -- ...then add it to the base table
      end
    end

    -- Build working table from base table
    local WorkingTable = {}
    for key in pairs(BaseTable) do table.insert(WorkingTable, key) end
    --Utils.PrintTable(WorkingTable)

    -- Abort if no upgrades
    if not next(WorkingTable) then
      self.Log(FileIdent, "No upgrades in WorkingTable - something may have gone wrong!!")
    return end

    -- Give player random upgrade
    local UpgradeIndex = math.random(#WorkingTable)
    table.insert(Global.CrimDawn.data.upgrades, table_name .. "-" .. WorkingTable[UpgradeIndex])
    self.Log(FileIdent, "Added " .. WorkingTable[UpgradeIndex] .. " to upgrade table")

    -- Set up for next pass
    if i < count then
      AcquiredUpgrades[WorkingTable[UpgradeIndex]] = true

      if Global.CrimDawn.tables.upgrades[table_name][WorkingTable[UpgradeIndex]].disable then
        for item in Global.CrimDawn.tables.upgrades[table_name][WorkingTable[UpgradeIndex]].disable:gmatch("([^,]+)") do
          DisabledUpgrades[item] = true
        end
      end

      table.remove(WorkingTable, UpgradeIndex)
    end
  end
end

-- Unlock a certain number of weapons
function CrimDawn:RandomWeapon(count, table_name)
  local WorkingTable = Global.CrimDawn.tables.weapons[table_name]

  -- Remove upgrades that the player already has
  for i = #WorkingTable, 1, -1 do
    if Global.CrimDawn.data.unlocks[WorkingTable[i]] then table.remove(WorkingTable, i) end
  end
  
  count = math.min(count, #WorkingTable)

  local WeaponIndex
  -- Add the specified number of random upgrades
  for i = 1, count do
    WeaponIndex = math.random(#WorkingTable)
    Global.CrimDawn.data.unlocks[WorkingTable[WeaponIndex]] = true
    self.Log(FileIdent, "Added " .. WorkingTable[WeaponIndex] .. " to unlock table")
    table.remove(WorkingTable, WeaponIndex)
  end
end

-- Unlock a certain number of armors
function CrimDawn:RandomArmour(count)
  local ArmorTable = { "body_armor1", "body_armor2",
    "body_armor3", "body_armor4", "body_armor5", "body_armor6" }

  -- Remove upgrades that the player already has
  for i = #ArmorTable, 1, -1 do
    if Global.CrimDawn.data.unlocks[ArmorTable[i]] then table.remove(ArmorTable, i) end
  end

  count = math.min(count, #ArmorTable)

  local ArmorIndex
  -- Add the specified number of random upgrades
  for i = 1, count do
    ArmorIndex = math.random(#ArmorTable)
    Global.CrimDawn.data.unlocks[ArmorTable[ArmorIndex]] = true
    self.Log(FileIdent, "Added " .. ArmorTable[ArmorIndex] .. " to unlock table")
    table.remove(ArmorTable, ArmorIndex)
  end
end

-- Unlock a certain number of deployables
function CrimDawn:RandomDeployable(count)
  local DeployTable = { "doctor_bag", "ammo_bag", "sentry_gun",
    "sentry_gun_silent", "first_aid_kit", "bodybags_bag", "armor_kit" }

  -- Remove upgrades that the player already has
  for i = #DeployTable, 1, -1 do
    if Global.CrimDawn.data.unlocks[DeployTable[i]] then table.remove(DeployTable, i) end
  end

  count = math.min(count, #DeployTable)

  local DeployIndex
  -- Add the specified number of random upgrades
  for i = 1, count do
    DeployIndex = math.random(#DeployTable)
    Global.CrimDawn.data.unlocks[DeployTable[DeployIndex]] = true
    self.Log(FileIdent, "Added " .. DeployTable[DeployIndex] .. " to unlock table")
    table.remove(DeployTable, DeployIndex)
  end
end