local FileIdent = "gameover"

Hooks:PostHook(GameOverState, "at_enter", "CrimDawn_RunFailed", function(self)
  Global.CrimDawn.data.upgrades = {}

  CrimDawn:PermaUpgrade(Global.CrimDawn.data.x.permaskills, "permaskills")
  CrimDawn:PermaUpgrade(Global.CrimDawn.data.x.permaperks, "permaperks")
  -- ^^ because we're deleting them lmao ^^

  -- generate a new set of randomised upgrades
  CrimDawn:RandomUpgrade(Global.CrimDawn.data.x.skills, "skills")
  CrimDawn:RandomUpgrade(Global.CrimDawn.data.x.perks, "perks")
  CrimDawn:RandomUpgrade(Global.CrimDawn.data.x.stats, "stats")
  
  local ExtraUpgrades = 0
  if Global.CrimDawn.data.unlocks.ecm_jammer then ExtraUpgrades = ExtraUpgrades + 1 end
  if Global.CrimDawn.data.unlocks.trip_mine then ExtraUpgrades = ExtraUpgrades + 1 end
  CrimDawn:RandomUpgrade(Global.CrimDawn.data.x.deployables + ExtraUpgrades, "deployable")

  -- Prevent deathlink loopback, setup next run
  Global.CrimDawn.data.game.deathlink = os.time() + 3
  if NetworkHelper:IsHost() then
    Global.CrimDawn.data.game.run = Global.CrimDawn.data.game.run + 1
    Global.CrimDawn.data.game.ponr = false
    Global.CrimDawn.data.game.heists = {}

    NetworkHelper:SendToPeers("CrimDawn_HeistCount", #Global.CrimDawn.data.game.heists)
    managers.mutators:reset_all_mutators()
  end

  CrimDawn:WriteSave(FileIdent, "run failed")
end)