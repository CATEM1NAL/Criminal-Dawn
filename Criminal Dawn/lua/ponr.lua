local FileIdent = "forced_ponr"
-- this hook can probably be improved, both in terms of code quality and where we hook, but it works for now

-- Setup PONR timer
function CrimDawn_CreatePONR()
  local loc = managers.localization
  local mission = managers.mission
  local data = {
    id = "forced_ponr",
    class = "ElementPointOfNoReturn",
    values = { elements = {} }
  }
  mission._scripts["default"]._elements["forced_ponr"] = ElementPointOfNoReturn:new(mission, data)

  if math.random() > 0.1 then -- 90% chance for default PONR message ("Safehouse found in")
    loc:add_localized_strings({ ["hud_crimdawn_no_return"] = loc:text("crimdawn_ponr_default") })

  else -- 10% chance for rare PONR message (or game will crash)
    assert(not Global.CrimDawn.DLC, "nil returned true")
    loc:add_localized_strings({ ["hud_crimdawn_no_return"] = loc:text("crimdawn_ponr_rare" .. math.random(1,58)) })
  end

  tweak_data.point_of_no_returns.crimdawn_ponr = deep_clone(tweak_data.point_of_no_returns.noreturn)
  tweak_data.point_of_no_returns.crimdawn_ponr.text_id = "hud_crimdawn_no_return"
end

-- On mask up
Hooks:PostHook(IngameStandardState, "at_enter", "CrimDawn_ForcePONR", function(self)
  if CrimDawn.state.ponr then return end

  CrimDawn_CreatePONR()
  NetworkHelper:SendToPeers("CrimDawn_StartPONR", true)

  CrimDawn.Log(FileIdent, "Time remaining: " .. Global.CrimDawn.data.game.ponr)
  managers.groupai:state():set_point_of_no_return_timer(Global.CrimDawn.data.game.ponr, "forced_ponr", "crimdawn_ponr")
  CrimDawn.state.maskup_time = TimerManager:game():time()

  CrimDawn.state.ponr = true
end)