local FileIdent = "criminals"

local MaxBots = 3

if BigLobbyGlobals then
  CrimDawn.Log(FileIdent, "BigLobby3 found!")
  MaxBots = 21
  Global.BigLobbyPersist.num_players = 22
end

CrimDawn.Log(FileIdent, "Bot count: " .. math.min(Global.CrimDawn.data.x.bots, MaxBots))

CriminalsManager.MAX_NR_TEAM_AI = MaxBots
if NetworkHelper:IsHost() then CriminalsManager.MAX_NR_TEAM_AI = math.min(Global.CrimDawn.data.x.bots, MaxBots) end