local APD2FileIdent = "[APD2>criminals] "

local MaxBots = 3
if BigLobbyGlobals then
  log(APD2FileIdent .. "BigLobby3 found!")
  MaxBots = 21
  Global.BigLobbyPersist.num_players = apd2_data.x.bots + 1
else
  CriminalsManager.MAX_NR_CRIMINALS = math.min(apd2_data.x.bots + 1, MaxBots + 1)
end

log(APD2FileIdent .. "Bot count: " .. math.min(apd2_data.x.bots, MaxBots))
CriminalsManager.MAX_NR_TEAM_AI = math.min(apd2_data.x.bots, MaxBots)