local APD2FileIdent = "[APD2>victory] "

local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty) - 1

local activeMutators = {}
if Global.mutators and Global.mutators.active_on_load and not next(activeMutators) then
  for key, _ in pairs(Global.mutators.active_on_load) do
    table.insert(activeMutators, key)
  end
end

local mutatorCount = #activeMutators
local heistCount = #apd2_data.game.heists or 1

if not NetworkHelper:IsHost() then
  heistCount = apd2_data.game.host_heists or 1
end

local APD2VictoryScore = (heistCount + difficulty_index) * (1 + mutatorCount) * 100

Hooks:PostHook(VictoryState, "at_enter", "apd2_heist_won", function(self)  
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

    if NetworkHelper:IsHost() then
      dofile(APD2Path .. "lua/archipelago/heist_selector.lua")

      apd2_next_heist(#apd2_data.game.heists)
      NetworkHelper:SendToPeers("APD2SendHeistCount", #apd2_data.game.heists)
    end

  else
    apd2_data.game.score = apd2_data.game.score + (APD2VictoryScore)
    apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100)
                    .. " (+" .. APD2VictoryScore / 100 .. " from day completion).\n"
                    .. apd2_score_needed() .. " more for next check.")

    apd2_save(APD2FileIdent, "day completed")
  end
end)