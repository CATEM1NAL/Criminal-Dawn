local FileIdent = "network"

-- Assign matchmaking key
if Global.CrimDawn.data.game.seed then
  NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = Global.CrimDawn.data.game.seed
  NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = Global.CrimDawn.data.game.seed
else
  NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "NO ARCHIPELAGO SEED FOUND"
  NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = "NO ARCHIPELAGO SEED FOUND"
end

CrimDawn.Log(FileIdent, "Matchmaking key: " .. NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY)

-- SETTING UP NETWORK HOOKS
-- Sync run progress (managers/menu.lua)
NetworkHelper:AddReceiveHook("CrimDawn_HeistCount", "CrimDawn_SyncHeistCount", function(data, sender)
  Global.CrimDawn.data.game.host_heists = tonumber(data)

  if Global.CrimDawn.data.game.host_heists > 6 and
  not Global.CrimDawn.data.game.victory then
  Global.CrimDawn.data.game.victory = true end

  CrimDawn:WriteSave(FileIdent, "received heist number [" .. data .. "] from host")
end)

-- PONR time remaining chat message (archipelago/client_bridge)
NetworkHelper:AddReceiveHook("CrimDawn_TimeUpdate", "CrimDawn_SyncTimeUpdate", function(data, sender)
  CrimDawn.ChatNotify(data .. " seconds remaining.")
end)

-- Sync PONR (force_ponr.lua)
NetworkHelper:AddReceiveHook("CrimDawn_StartPONR", "CrimDawn_SyncPONR", function(data, sender)
  CrimDawn.Log(FileIdent, "Received PONR sync")
  if not CrimDawn.state.ponr then
    CrimDawn_CreatePONR()

    managers.groupai:state():set_point_of_no_return_timer(CrimDawn.data.game.ponr, "forced_ponr", "crimdawn_ponr")
    CrimDawn.state.maskup_time = TimerManager:game():time()

    CrimDawn.state.ponr = true
  end
end)

-- Syncing score (score_handler.lua)
NetworkHelper:AddReceiveHook("CrimDawn_SendPoints", "CrimDawn_ReceivePoints", function(data, sender)
  CrimDawn.Log(FileIdent, "Received score from host")
  local points, xPerPoint, reason = data:match("([^,]+),([^,]+),([^,]+)")

  Global.CrimDawn.data.game.score = Global.CrimDawn.data.game.score + points

  if reason == "lootbag" then
    CrimDawn.ChatNotify("Score: " .. math.floor(Global.CrimDawn.data.game.score / 100)
                     .. " (+" .. tonumber(points / 100) .. " from loot).\n"
                     .. CrimDawn.ScoreNeeded() .. " more for next check.")

  else CrimDawn.ChatNotify("Score: " .. math.floor(Global.CrimDawn.data.game.score / 100)
                        .. " (+1 per " .. xPerPoint .. " " .. reason .. ").\n"
                        .. CrimDawn.ScoreNeeded() .. " more for next check.")
  end

  CrimDawn:WriteSave(FileIdent, "received score [" .. points .. "] from host")
end)
-- FINISHED NETWORK HOOK SETUP

CrimDawn.Log(FileIdent, "Established network hooks")