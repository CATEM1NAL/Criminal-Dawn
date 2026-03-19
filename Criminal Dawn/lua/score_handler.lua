if not CrimDawn then return end
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

local ScorePerThing = (HeistCount + DifficultyIndex) * #ActiveMutators
local ScorePerPackage = HeistCount * #ActiveMutators

local function GainPoints(points, reason)
  if CrimDawn.state.cap_reached then CrimDawnClient:PollTimeUpgrades() -- Cap reached; check for upgrades
    if CrimDawn.state.cap_reached then return end
  end

  if reason == "loot" or reason == "Gage package" then -- Full points
    if not CrimDawn.ScoreCap(points) then
      CrimDawn.ChatNotify("Score: " .. Global.CrimDawn.data.game.score
                       .. " (+" .. points .. " from " .. reason .. ").\n"
                       .. CrimDawn.ScoreNeeded() .. " more for next check.")
    end CrimDawn:WriteSave(FileIdent, reason .. " secured")

  else -- Fractional points
    if not CrimDawn.ScoreCap(1) then
      CrimDawn.ChatNotify("Score: " .. Global.CrimDawn.data.game.score
                       .. " (+1 per " .. math.ceil(points) .. " " .. reason .. ").\n"
                       .. CrimDawn.ScoreNeeded() .. " more for next check.")
    end CrimDawn:WriteSave(FileIdent, reason .. " milestone")
  end
end

-- Loot gives points equal to heists + difficulty * mutators
if LootManager then Hooks:PostHook(LootManager, "secure", "CrimDawn_LootSecured", function(self)
  if not tweak_data.carry.small_loot[self._global.secured[#self._global.secured].carry_id] then
    NetworkHelper:SendToPeers("CrimDawn_SendPoints", ScorePerThing .. "," .. -1 .. "," .. "loot")
    GainPoints(ScorePerThing, "loot")

  else -- Loose cash uses fractional points (100 needed for full point)
    Global.CrimDawn.data.game.f_score = Global.CrimDawn.data.game.f_score + ScorePerThing

    if Global.CrimDawn.data.game.f_score >= 100 then
      Global.CrimDawn.data.game.f_score = Global.CrimDawn.data.game.f_score - 100
      NetworkHelper:SendToPeers("CrimDawn_SendPoints", 1 .. "," .. math.ceil(100 / ScorePerThing) .. "," .. "loose cash")
      GainPoints(100 / ScorePerThing, "loose cash")
    end
  end
end) end

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

if CopDamage then Hooks:PostHook(CopDamage, "die", "CrimDawn_EnemyKilled", function(self, attack_data)
  local unit = attack_data and attack_data.attacker_unit
  if IsPlayerKill(unit) then
    Global.CrimDawn.data.game.f_score = Global.CrimDawn.data.game.f_score + ScorePerThing

    if Global.CrimDawn.data.game.f_score >= 100 then
      Global.CrimDawn.data.game.f_score = Global.CrimDawn.data.game.f_score - 100
      NetworkHelper:SendToPeers("CrimDawn_SendPoints", 1 .. "," .. math.ceil(100 / ScorePerThing) .. "," .. "enemies killed")
      GainPoints(100 / ScorePerThing, "enemies killed")
    end
  end
end) end

-- On package pickup, gain points equal to heists * mutators (more spawn on higher difficulties anyway)
if GageAssignmentManager then Hooks:PostHook(GageAssignmentManager, "on_unit_interact", "CrimDawn_PackagePickup", function(self)
  GainPoints(ScorePerPackage, "Gage package")
end) end