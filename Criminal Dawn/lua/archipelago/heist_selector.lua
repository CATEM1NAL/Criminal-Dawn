local FileIdent = "heist_selector"

local function HasUpgrade(OwnedUpgrade)
  for _, upgrade in ipairs(Global.CrimDawn.data.upgrades) do
    if OwnedUpgrade == upgrade then return true end
  end
return false end

function CrimDawn:NextHeist(HeistsWon)
  local TierIndex = (6 - Global.CrimDawn.data.game.run_length) + (HeistsWon or 0) + 1
  local CurrentTier
  local CrimDawn_ValidHeists = deep_clone(Global.CrimDawn.tables.heists)

  -- Try to add conditional heists
  local PeerTable = managers.network and managers.network:session() and managers.network:session():peers()
  local PeerCount = Global.CrimDawn.data.x.bots + table.size(PeerTable or {})
  local StealthTutorial, LoudTutorial, TwentyEightStores

  for _, heist in ipairs(Global.CrimDawn.tables.heists.tier1) do
        if heist == "short1" then StealthTutorial = true
    elseif heist == "short2" then LoudTutorial = true
    end
  end

  -- Tutorials: only valid if softlock impossible (bodybags/player count)
  if not StealthTutorial and HasUpgrade("permaskill-3") then table.insert(Global.CrimDawn.tables.heists.tier1, "short1") end
  if not LoudTutorial and PeerCount > 1 then table.insert(Global.CrimDawn.tables.heists.tier1, "short2") end

  -- If we haven't won yet, prevent duplicate heists and pick from next tier
  if Global.CrimDawn.tables.heists["tier" .. TierIndex] then

    -- Remove already played heists from heist pool
    local PlayedHeists = {}

    for _, heist in ipairs(Global.CrimDawn.data.game.heists) do PlayedHeists[heist] = true end

    for tier, heistTable in pairs(Global.CrimDawn.tables.heists) do
      local NewTable = {}

      for _, heist in ipairs(heistTable) do
        if not PlayedHeists[heist] then table.insert(NewTable, heist) end
      end

      CrimDawn_ValidHeists[tier] = NewTable
    end

    -- 28 Stores replaces final heist if you have more than 30 minutes left
    if Global.CrimDawn.data.game.ponr >= 1800 then CrimDawn_ValidHeists.tier6 = {"cd_28stores"} end

    CurrentTier = Global.CrimDawn.tables.heists["tier" .. TierIndex]

  -- If we HAVE won then allow duplicate heists and ignore heist tiering
  else CurrentTier = Global.CrimDawn.tables.heists["tier" .. math.random(#Global.CrimDawn.tables.heists)] end

  local NextHeist = CurrentTier[math.random(#CurrentTier)]
  table.insert(Global.CrimDawn.data.game.heists, NextHeist)
  NextHeist = Global.CrimDawn.data.game.heists[#Global.CrimDawn.data.game.heists]

  --Utils.PrintTable(Global.CrimDawn.data.game.heists, 1)
  self.Log(FileIdent, NextHeist)
  self:WriteSave(FileIdent, "next heist selected")
end