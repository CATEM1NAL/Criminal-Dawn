local APD2FileIdent = "[APD2>victory] "

local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty) - 1

local activeMutators = {}
if Global.mutators and Global.mutators.active_on_load and not next(activeMutators) then
  for key, _ in pairs(Global.mutators.active_on_load) do
    table.insert(activeMutators, key)
  end
end

local heistCount = #apd2_data.game.heists or 0

if not NetworkHelper:IsHost() then
  heistCount = apd2_data.game.host_heists or 0
end

local APD2VictoryScore = (heistCount + difficulty_index) * (1 + #activeMutators) * 100

Hooks:PostHook(VictoryState, "at_enter", "apd2_heistwin", function(self)  
  -- calculates time remaining for next PONR
  if NetworkHelper:IsHost() then
    if level_id ~= "hvh" then
      apd2_data.game.ponr = apd2_data.game.ponr - (TimerManager:game():time() - apd2_maskup_time)
    else
      apd2_data.game.ponr = managers.groupai:state():get_point_of_no_return_timer()
    end
    apd2_get_ponr_upgrades()
  end

  if managers.job:on_last_stage() then
    apd2_data.game.score = apd2_data.game.score + (APD2VictoryScore * 2)
    apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100)
                    .. " (+" .. APD2VictoryScore / 50 .. " from heist completion).\n"
                    .. apd2_score_needed() .. " more for next check.")

    dofile(APD2Path .. "lua/archipelago/heist_selector.lua")
    apd2_next_heist(#apd2_data.game.heists)

    NetworkHelper:SendToPeers("APD2SyncNextHeist", apd2_data.game.heists[#apd2_data.game.heists])
    NetworkHelper:SendToPeers("APD2SyncNextPONR", apd2_data.game.ponr)

  else
    apd2_data.game.score = apd2_data.game.score + (APD2VictoryScore)
    apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100)
                    .. " (+" .. APD2VictoryScore / 100 .. " from day completion).\n"
                    .. apd2_score_needed() .. " more for next check.")

    io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
    log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
  end
end)

NetworkHelper:AddReceiveHook("APD2SyncNextHeist", "apd2_sync_nextheist", function(data, sender)
  log(APD2FileIdent .. "Received next heist from host (" .. data .. ")")
  table.insert(apd2_data.game.heists, data)
end)

NetworkHelper:AddReceiveHook("APD2SyncNextPONR", "apd2_sync_nextPONR", function(data, sender)
  log(APD2FileIdent .. "Received next PONR time from host (" .. data .. ")")
  apd2_data.game.ponr = tonumber(data)
end)