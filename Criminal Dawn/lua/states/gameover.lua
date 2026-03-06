local APD2FileIdent = "[APD2>gameover] "

Hooks:PostHook(GameOverState, "at_enter", "apd2_run_failed", function(self)
  apd2_data.upgrades = {}

  apd2_random_upgrades(apd2_data.x.skills, "skills")
  apd2_random_upgrades(apd2_data.x.perks, "perks")
  apd2_random_upgrades(apd2_data.x.stats, "stats")
  
  local ExtraUpgrades = 0
  if apd2_data.unlocks.ecm_jammer then ExtraUpgrades = ExtraUpgrades + 1 end
  if apd2_data.unlocks.trip_mine then ExtraUpgrades = ExtraUpgrades + 1 end

  apd2_random_upgrades(apd2_data.x.deployables + ExtraUpgrades, "deployable")

  apd2_data.game.deathlink = os.time() + 3
  if NetworkHelper:IsHost() then
    apd2_data.game.run = apd2_data.game.run + 1
    apd2_data.game.ponr = nil
    apd2_data.game.heists = {}
  end

  apd2_save(APD2FileIdent, "run failed")
end)