local APD2FileIdent = "[APD2>network] "

-- Assign matchmaking key
if apd2_data.game.seed then
  NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = apd2_data.game.seed
  NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = apd2_data.game.seed
else
  NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "NO ARCHIPELAGO SEED FOUND"
  NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = "NO ARCHIPELAGO SEED FOUND"
end

log (APD2FileIdent .. "Matchmaking key: " .. NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY)

-- SETTING UP NETWORK HOOKS
-- Sync run progress (managers/menu.lua)
NetworkHelper:AddReceiveHook("APD2SendHeistCount", "apd2_sync_heistlist", function(data, sender)
  apd2_data.game.host_heists = tonumber(data)

  if apd2_data.game.host_heists > 6 and
  not apd2_data.game.victory then
    apd2_data.game.victory = true
  end

  apd2_save(APD2FileIdent, "received heist number [" .. data .. "] from host")
end)

-- PONR time remaining chat message (archipelago/client_bridge)
NetworkHelper:AddReceiveHook("APD2TimeUpdate", "apd2_client_synctime", function(data, sender)
  apd2_chat_send(data .. " seconds remaining.")
end)

-- Sync PONR (force_ponr.lua)
NetworkHelper:AddReceiveHook("APD2StartPONR", "apd2_sync_ponr", function(data, sender)
  log(APD2FileIdent .. "Received PONR sync")
  if not APD2PONRActive then
    apd2_createPONR()

    managers.groupai:state():set_point_of_no_return_timer(apd2_data.game.ponr, "forced_ponr", "apd2_ponr")
    apd2_maskup_time = TimerManager:game():time()

    APD2PONRActive = true
  end
end)

-- Syncing score (score_handler.lua)
NetworkHelper:AddReceiveHook("APD2SendPoints", "apd2_receive_points", function(data, sender)
  log(APD2FileIdent .. "Received score from host")
  local points, xPerPoint, reason = data:match("([^,]+),([^,]+),([^,]+)")
  apd2_data.game.score = apd2_data.game.score + points

  if xPerPoint == -1 then -- Must be loot
    apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100)
                    .. " (+" .. data / 100 .. " from loot).\n"
                    .. apd2_score_needed() .. " more for next check.")
  else
    if reason == "loosecash" then
      apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100)
                      .. " (+1 per " .. xPerPoint .. " loose cash).\n"
                      .. apd2_score_needed() .. " more for next check.")

    elseif reason == "kills" then
      apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100)
                      .. " (+1 per " .. xPerPoint .. " enemies killed).\n"
                      .. apd2_score_needed() .. " more for next check.")
    end
  end
  apd2_save(APD2FileIdent, "received score [" .. points .. "] from host")
end)
-- FINISHED NETWORK HOOK SETUP

log(APD2FileIdent .. "Established network hooks")