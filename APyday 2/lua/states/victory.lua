local APD2FileIdent = "[APD2>victory] "

local APD2VictoryScore = #apd2_data.game.heists * (1 + apd2_data.x.mutators) * (1 + apd2_data.x.diff) * 100 * apd2_data.x.od

Hooks:PostHook(VictoryState, "at_enter", "apd2_heistwin", function(self)  
  -- calculates time remaining for next PONR
  if level_id ~= "hvh" then
    apd2_data.game.ponr = (apd2_data.game.ponr or (600 * (1 + (apd2_data.game.ponr_upgrade or 0)))) - (TimerManager:game():time() - apd2_maskup_time)
  else
    apd2_data.game.ponr = managers.groupai:state():get_point_of_no_return_timer()
  end

  dofile(APD2Path .. "lua/client_bridge.lua")
  apd2_get_ponr_upgrades()

  if not managers.job:on_last_stage() then
    apd2_data.game.score = apd2_data.game.score + (APD2VictoryScore)
    apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100) .. " (+" .. APD2VictoryScore / 100 .. " from day completion).\n" .. apd2_score_needed() .. " more for next check.")
    io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
    log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
  else
    apd2_data.game.score = apd2_data.game.score + (APD2VictoryScore * 2)
    apd2_chat_send("Score: " .. math.floor(apd2_data.game.score / 100) .. " (+" .. APD2VictoryScore / 50 .. " from heist completion).\n" .. apd2_score_needed() .. " more for next check.")
    dofile(APD2Path .. "lua/heist_selector.lua")
    apd2_next_heist(#apd2_data.game.heists)
  end
end)