local FileIdent = "victory"

Hooks:PostHook(VictoryState, "at_enter", "CrimDawn_HeistWon", function(self)
  -- Determine points for victory
  local Difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
  local DifficultyIndex = tweak_data:difficulty_to_index(Difficulty) - 1

  local ActiveMutators = {}
  if Global.mutators and Global.mutators.active_on_load and not next(ActiveMutators) then
    for key, _ in pairs(Global.mutators.active_on_load) do table.insert(ActiveMutators, key) end
  end

  local HeistCount = #Global.CrimDawn.data.game.heists or 1
  if not NetworkHelper:IsHost() then HeistCount = Global.CrimDawn.data.game.host_heists or 1 end

  local VictoryScore = (HeistCount + DifficultyIndex) * #ActiveMutators

  -- calculates time remaining for next PONR
  if NetworkHelper:IsHost() then
    if level_id ~= "hvh" then -- Cursed Kill Room is special because the timer counts backwards
      Global.CrimDawn.data.game.ponr =
      Global.CrimDawn.data.game.ponr - (TimerManager:game():time() - CrimDawn.state.maskup_time)
    else Global.CrimDawn.data.game.ponr = managers.groupai:state():get_point_of_no_return_timer() end
  end

  CrimDawn.state.ponr = false
  CrimDawnClient:PollTimeUpgrades()

  if managers.job:on_last_stage() then -- Heist completed, give more points
    if not CrimDawn.ScoreCap(VictoryScore) then
      CrimDawn.ChatNotify("Score: " .. Global.CrimDawn.data.game.score
                       .. " (+" .. VictoryScore * 2 .. " from heist completion).\n"
                       .. CrimDawn.ScoreNeeded() .. " more for next check.") end

    if NetworkHelper:IsHost() then
      CrimDawn:NextHeist(#Global.CrimDawn.data.game.heists)
      if #Global.CrimDawn.data.game.heists - 1 > Global.CrimDawn.data.game.heists_won then
        Global.CrimDawn.data.game.heists_won = #Global.CrimDawn.data.game.heists - 1
      end
      NetworkHelper:SendToPeers("CrimDawn_HeistCount", #Global.CrimDawn.data.game.heists)
    end

  else -- Heist isn't finished (multiday or escape), give less points
    if not CrimDawn.ScoreCap(VictoryScore) then
      CrimDawn.ChatNotify("Score: " .. Global.CrimDawn.data.game.score
                       .. " (+" .. VictoryScore .. " from day completion).\n"
                       .. CrimDawn.ScoreNeeded() .. " more for next check.")
    end CrimDawn:WriteSave(FileIdent, "day completed")
  end
end)