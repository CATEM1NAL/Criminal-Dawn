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

  if Global.CrimDawn.data.game.host_heists - 1 > Global.CrimDawn.data.game.heists_won then
    Global.CrimDawn.data.game.heists_won = Global.CrimDawn.data.game.host_heists - 1
  end

  CrimDawn:WriteSave(FileIdent, "received heist number [" .. data .. "] from host")
end)

-- Sync active mutators (tables/mutators.lua)
NetworkHelper:AddReceiveHook("CrimDawn_ActiveMutators", "CrimDawn_SyncMutators", function(data, sender)
  CrimDawn.Log(FileIdent, "Active mutators: " .. data)
  for mutator in string.gmatch(data, "([^,]+)") do managers.mutators:set_enabled(mutator) end
end) -- The game SHOULD handle this but it shits itself and ends up one heist behind, idk why

-- PONR time remaining chat message (archipelago/client_bridge)
NetworkHelper:AddReceiveHook("CrimDawn_TimeUpdate", "CrimDawn_SyncTimeUpdate", function(data, sender)
  if not CrimDawn.state.ponr then CrimDawn.ChatNotify(data .. " seconds remaining.")
  else CrimDawn.ChatNotify("Next heist will start with " .. data / 60 .. " more minutes.") end
end)

-- Sync PONR (force_ponr.lua)
NetworkHelper:AddReceiveHook("CrimDawn_StartPONR", "CrimDawn_SyncPONR", function(data, sender)
  CrimDawn.Log(FileIdent, "Received PONR sync")
  if not CrimDawn.state.ponr then
    CrimDawn_CreatePONR()

    managers.groupai:state():set_point_of_no_return_timer(Global.CrimDawn.data.game.ponr, "crimdawn_ponr", "crimdawn_ponr")
    CrimDawn.state.maskup_time = TimerManager:game():time()

    CrimDawn.state.ponr = true
  end
end)

-- Syncing score (score_handler.lua)
NetworkHelper:AddReceiveHook("CrimDawn_SendPoints", "CrimDawn_ReceivePoints", function(data, sender)
  if CrimDawn.state.cap_reached then CrimDawnClient:PollTimeUpgrades()
    if Global.CrimDawn.data.game.score < Global.CrimDawn.data.game.score_cap then CrimDawn.state.cap_reached = false
    else return end
  end

  CrimDawn.Log(FileIdent, "Received score from host")
  local points, xPerPoint, reason = data:match("([^,]+),([^,]+),([^,]+)")

  -- Give points
  if reason == "loot" and not CrimDawn.ScoreCap(tonumber(points)) then
    CrimDawn.ChatNotify("Score: " .. Global.CrimDawn.data.game.score
                     .. " (+" .. tonumber(points) .. " from " .. reason .. ").\n"
                     .. CrimDawn.ScoreNeeded() .. " more for next check.")

  elseif not CrimDawn.ScoreCap(tonumber(points)) then
    CrimDawn.ChatNotify("Score: " .. Global.CrimDawn.data.game.score
                     .. " (+1 per " .. xPerPoint .. " " .. reason .. ").\n"
                     .. CrimDawn.ScoreNeeded() .. " more for next check.") end

  CrimDawn:WriteSave(FileIdent, "received score [" .. points .. "] from host")
end)
-- FINISHED NETWORK HOOK SETUP

CrimDawn.Log(FileIdent, "Established network hooks")