local FileIdent = "forced_ponr"

-- this hook can probably be improved, both in terms of code quality and where we actually hook into,
-- but it works for now.

-- Setup PONR timer
function CrimDawn_CreatePONR()
  local mission = managers.mission
  local data = {
    id = "forced_ponr",
    class = "ElementPointOfNoReturn",
    values = { elements = {} }
  }
  mission._scripts["default"]._elements["forced_ponr"] = ElementPointOfNoReturn:new(mission, data)

  local RarePONRMessages = {
    "Bain goons and dies in", "Garrett wipes in", "Vlad wakes up in", "Christmas comes in", "Assets frozen in", 
    "Nuke detonates in", "The rapture occurs in", "Chronoblunt smoked in", "PAYDAY 3 is good in", "Him", "He",
    "Gage stands up in", "Allegations raised in", "Dallas farts in", "Ult popped in", "AlmirCorp rules in",
    "Ice-T arrives in", "Beckett is born in", "RPK releases in", "Game crashes in", "Everyone gets a gun in",
    "Dragan steals a car in", "Cthulhu fhtagn", "World War III in", "My mind state is", "Kids raised in",
    "Discord crashout in", "He becomes him in", "Jiro finds Kento in", "Chuck Norris is here in", "John Wick is back in",
    "Mr Beast dominates in", "New DLC released in", "Starbreeze bankrupt in", "Kknowley twerks in", "You win in",
    "Wolf escapes in", "Den of Wolves in", "Houston drinks in", "Jimmy does fentanyl in", "Jacket jacks it in",
    "Clover abandoned in", "Greta misses in", "Tony gets shot in", "Ethan's career ends in", "Touchdown defends in"
  }

  if math.random() > 0.1 then
    -- Default: "Safe house found in"
    managers.localization:add_localized_strings({ ["hud_crimdawn_no_return"] = "Safe house found in" })

  else
    -- Testing whether a DLC unlocker is installed, just to fuck with people
    assert(not WinSteamDLCManager:_check_dlc_data("Fake DLC Test"), "nil returned true")
    assert(not WinEpicDLCManager:_check_dlc_data("Fake DLC Test"), "nil returned true")
    assert(not WINDLCManager:_check_dlc_data("Fake DLC Test"), "nil returned true")
    managers.localization:add_localized_strings({ ["hud_crimdawn_no_return"] = RarePONRMessages[math.random(#RarePONRMessages)] })
  end

  tweak_data.point_of_no_returns.crimdawn_ponr = deep_clone(tweak_data.point_of_no_returns.noreturn)
  tweak_data.point_of_no_returns.crimdawn_ponr.text_id = "hud_crimdawn_no_return"
end

-- On mask up
Hooks:PostHook(IngameStandardState, "at_enter", "CrimDawn_ForcePONR", function(self)
  
  if CrimDawn.state.ponr then
    return
  end
  
  CrimDawn_CreatePONR()
  NetworkHelper:SendToPeers("CrimDawn_StartPONR", true)

  CrimDawn.Log(FileIdent, "Time remaining: " .. Global.CrimDawn.data.game.ponr)
  managers.groupai:state():set_point_of_no_return_timer(Global.CrimDawn.data.game.ponr, "forced_ponr", "crimdawn_ponr")
  CrimDawn.state.maskup_time = TimerManager:game():time()
  
  CrimDawn.state.ponr = true
end)