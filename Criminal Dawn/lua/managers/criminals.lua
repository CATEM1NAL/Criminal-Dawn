local APD2FileIdent = "[APD2>criminals] "

local MaxBots = 3

if BigLobbyGlobals then
  log(APD2FileIdent .. "BigLobby3 found!")
  MaxBots = 21
  Global.BigLobbyPersist.num_players = 22
end

log(APD2FileIdent .. "Bot count: " .. math.min(apd2_data.x.bots, MaxBots))

CriminalsManager.MAX_NR_TEAM_AI = MaxBots
if NetworkHelper:IsHost() then
  CriminalsManager.MAX_NR_TEAM_AI = math.min(apd2_data.x.bots, MaxBots)  
end