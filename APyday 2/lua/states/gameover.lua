local APD2FileIdent = "[APD2>gameover] "

Hooks:PostHook(GameOverState, "at_enter", "apd2_heistfail", function(self)
  apd2_data.upgrades = {}

  apd2_random_upgrades(apd2_data.x.skills, "skills")
  apd2_random_upgrades(apd2_data.x.perks, "perks")
  apd2_random_upgrades(apd2_data.x.stats, "stats")

  apd2_data.game.ponr = nil
  apd2_data.game.heists = {}
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log(APD2FileIdent .. SavePath .. "apyday2.txt")
end)