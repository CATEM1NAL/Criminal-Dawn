if not Global.CrimDawn then return end
local FileIdent = "score_handler"

-- To calculate multipliers properly in multiplayer session
local Difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local DifficultyIndex = tweak_data:difficulty_to_index(Difficulty) - 2

local ActiveMutators = {}
if Global.mutators and Global.mutators.active_on_load and not next(ActiveMutators) then
  for key, _ in pairs(Global.mutators.active_on_load) do table.insert(ActiveMutators, key) end
end

local HeistCount = #Global.CrimDawn.data.game.heists or 1
if not NetworkHelper:IsHost() then HeistCount = Global.CrimDawn.data.game.host_heists or 1 end

-- Using floats for small score increments was causing rounding errors. For this reason, all scores
-- are x100 internally. Any time scores should be displayed to the player, they should be divided!!

local ScorePerBag = (HeistCount + DifficultyIndex) * (1 + #ActiveMutators) * 100
local ScorePerPackage = HeistCount * (1 + #ActiveMutators) * 100 
local ScorePerCash = ScorePerBag / 100

-- Loot gives points equal to heists + difficulty * mutators
Hooks:PostHook(LootManager, "secure", "CrimDawn_LootSecured", function(self)
  if not tweak_data.carry.small_loot[self._global.secured[#self._global.secured].carry_id] then
    Global.CrimDawn.data.game.score = Global.CrimDawn.data.game.score + ScorePerBag
    Global.CrimDawn.next_point = 100 + (Global.CrimDawn.data.game.score - Global.CrimDawn.data.game.score % 100)
    NetworkHelper:SendToPeers("CrimDawn_SendPoints", ScorePerBag .. "," .. -1 .. "," .. "lootbag")
    
    CrimDawn:WriteSave(FileIdent, "bag secured")
    CrimDawn.ChatNotify("Score: " .. math.floor(Global.CrimDawn.data.game.score / 100)
                     .. " (+" .. ScorePerBag / 100 .. " from loot).\n"
                     .. CrimDawn.ScoreNeeded() .. " more for next check.")

  else -- Loose cash
    Global.CrimDawn.data.game.score = Global.CrimDawn.data.game.score + ScorePerCash

    if Global.CrimDawn.next_point <= Global.CrimDawn.data.game.score then
      Global.CrimDawn.next_point = Global.CrimDawn.next_point + 100
      NetworkHelper:SendToPeers("CrimDawn_SendPoints", 100 .. "," .. math.ceil(100 / ScorePerCash) .. "," .. "loose cash")

      CrimDawn:WriteSave(FileIdent, "loose cash milestone")
      CrimDawn.ChatNotify("Score: " .. math.floor(Global.CrimDawn.data.game.score / 100)
                       .. " (+1 per " .. math.ceil(100 / ScorePerCash) .. " loose cash).\n"
                       .. CrimDawn.ScoreNeeded() .. " more for next check.")
    end
  end
end)

-- Enemy kills grant hundredths of a point, like loose cash
local function IsPlayerKill(unit)
  if not alive(unit) or not unit:base() then return false end
  local base = unit:base()

  if base.is_local_player or base.is_husk_player then return true end

  if base.is_sentry_gun and base._owner_id then
    CrimDawn.Log(FileIdent, "sentry got a kill")
    return true
  end

  if base.thrower_unit and alive(base:thrower_unit()) then
    CrimDawn.Log(FileIdent, "kill from other source")
    return IsPlayerKill(base:thrower_unit())
  end
return false end

Hooks:PostHook(CopDamage, "die", "CrimDawn_EnemyKilled", function(self, attack_data)
  local unit = attack_data and attack_data.attacker_unit
  if IsPlayerKill(unit) then
    Global.CrimDawn.data.game.score = Global.CrimDawn.data.game.score + ScorePerCash

    if Global.CrimDawn.next_point <= Global.CrimDawn.data.game.score then
      Global.CrimDawn.next_point = Global.CrimDawn.next_point + 100
      NetworkHelper:SendToPeers("CrimDawn_SendPoints", 100 .. "," .. math.ceil(100 / ScorePerCash) .. "," .. "enemies killed")

      CrimDawn:WriteSave(FileIdent, "kill milestone")
      CrimDawn.ChatNotify("Score: " .. math.floor(Global.CrimDawn.data.game.score / 100)
                       .. " (+1 per " .. math.ceil(100 / ScorePerCash) .. " enemies killed).\n"
                       .. CrimDawn.ScoreNeeded() .. " more for next check.")
    end
  end
end)

-- On package pickup, gain points equal to heists * mutators (more spawn on higher difficulties anyway)
Hooks:PostHook(GageAssignmentManager, "on_unit_interact", "CrimDawn_PackagePickup", function(self)
  Global.CrimDawn.data.game.score = Global.CrimDawn.data.game.score + ScorePerPackage
  Global.CrimDawn.next_point = 100 + (Global.CrimDawn.data.game.score - Global.CrimDawn.data.game.score % 100)
  CrimDawn:WriteSave(FileIdent, "package secured")
  CrimDawn.ChatNotify("Score: " .. math.floor(Global.CrimDawn.data.game.score / 100)
                   .. " (+" .. ScorePerPackage / 100 .. " from package).\n"
                   .. CrimDawn.ScoreNeeded() .. " more for next check.")
end)