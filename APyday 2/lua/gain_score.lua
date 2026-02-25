local APD2FileIdent = "[APD2>gain_score] "

-- Using floats for small score increments was causing rounding errors. For this reason, all scores
-- are x100 internally. Any time scores should be displayed to the player, they should be divided!!

local APD2ScorePerBag = #apd2_data.game.heists * (1 + apd2_data.x.mutators) * (1 + apd2_data.x.diff) * 100 * apd2_data.x.od
local APD2ScorePerPackage = #apd2_data.game.heists * (1 + apd2_data.x.mutators) * 100 * apd2_data.x.od
local APD2ScorePerCash = APD2ScorePerBag / 100
APD2NextPoint = 100 + (apd2_data.game.score - apd2_data.game.score % 100)
--log(APD2FileIdent .. "Initial NextPoint: " .. APD2NextPoint)

-- Loot gives points equal to heists * mutators * difficulty
Hooks:PostHook(LootManager, "secure", "apd2_bagsecured", function(self)
  if not tweak_data.carry.small_loot[self._global.secured[#self._global.secured].carry_id] then
    apd2_data.game.score = apd2_data.game.score + APD2ScorePerBag
    APD2NextPoint = 100 + (apd2_data.game.score - apd2_data.game.score % 100)
    io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
    log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
    apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100) .. " (+" .. APD2ScorePerBag / 100 .. " from loot).\n" .. apd2_score_needed() .. " more for next check.")

  else
    apd2_data.game.score = apd2_data.game.score + APD2ScorePerCash

    if APD2NextPoint <= apd2_data.game.score then
      APD2NextPoint = APD2NextPoint + 100
      io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
      log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
      apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100) .. " (+1 per " .. math.ceil(100 / APD2ScorePerCash) .. " loose cash).\n" .. apd2_score_needed() .. " more for next check.")
    end
  end
end)

-- Enemy kills grant hundredths of a point, like loose cash
Hooks:PostHook(CopDamage, "die", "apd2_enemy_killed", function(self, attack_data)
  if attack_data and attack_data.attacker_unit == managers.player:player_unit() then
    apd2_data.game.score = apd2_data.game.score + APD2ScorePerCash

    if APD2NextPoint <= apd2_data.game.score then
      APD2NextPoint = APD2NextPoint + 100
      io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
      log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
      apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100) .. " (+1 per " .. math.ceil(100 / APD2ScorePerCash) .. " enemies killed).\n" .. apd2_score_needed() .. " more for next check.")
    end
  end
end)

-- On package pickup, gain points equal to heists * mutators (more spawn on higher difficulties anyway)
Hooks:PostHook(GageAssignmentManager, "on_unit_interact", "apd2_package_pickup", function(self)
  apd2_data.game.score = apd2_data.game.score + APD2ScorePerPackage
  APD2NextPoint = 100 + (apd2_data.game.score - apd2_data.game.score % 100)
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
  apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100) .. " (+" .. APD2ScorePerPackage / 100 .. " from package).\n" .. apd2_score_needed() .. " more for next check.")
end)

-- On level up, gain points equal to new level
Hooks:PostHook(ExperienceManager, "_level_up", "apd2_level_up", function(self)
  apd2_data.game.score = apd2_data.game.score + (self:current_level() * 100)
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
  apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100) .. " (+" .. self:current_level() .. " from level up).\n" .. apd2_score_needed() .. " more for next check.")
end)