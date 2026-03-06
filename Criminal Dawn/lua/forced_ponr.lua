local APD2FileIdent = "[APD2>forced_ponr] "

-- this hook can probably be improved, both in terms of code quality and where we actually hook into,
-- but it works for now.

APD2PONRActive = false

-- Setup PONR timer
function apd2_createPONR()
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
    "Mr Beast dominates in", "New DLC released in", "Starbreeze bankrupt in", "Kknowley twerks in",
    "Wolf escapes in", "Den of Wolves in", "Houston drinks in", "Jimmy does fentanyl in", "Jacket jacks it in",
    "Clover abandoned in", "Greta misses in", "Tony gets shot in", "Ethan's career ends in", "Touchdown defends in"
  }

  if math.random() > 0.1 then
    -- Default: "Safe house found in"
    managers.localization:add_localized_strings({ ["hud_apd2_no_return"] = "Safe house found in" })

  else
    -- Testing whether a DLC unlocker is installed, just to fuck with people
    assert(not WinSteamDLCManager:_check_dlc_data("Fake DLC Test"), "nil returned true")
    assert(not WinEpicDLCManager:_check_dlc_data("Fake DLC Test"), "nil returned true")
    assert(not WINDLCManager:_check_dlc_data("Fake DLC Test"), "nil returned true")
    managers.localization:add_localized_strings({ ["hud_apd2_no_return"] = RarePONRMessages[math.random(#RarePONRMessages)] })
  end

  tweak_data.point_of_no_returns.apd2_ponr = deep_clone(tweak_data.point_of_no_returns.noreturn)
  tweak_data.point_of_no_returns.apd2_ponr.text_id = "hud_apd2_no_return"
end

-- On mask up
Hooks:PostHook(IngameStandardState, "at_enter", "apd2_force_ponr", function(self)
  
  if APD2PONRActive then
    return
  end
  
  apd2_createPONR()
  NetworkHelper:SendToPeers("APD2StartPONR", true)

  --if NetworkHelper:IsHost() then
    log(APD2FileIdent .. apd2_data.game.ponr)
    managers.groupai:state():set_point_of_no_return_timer(apd2_data.game.ponr, "forced_ponr", "apd2_ponr")
    apd2_maskup_time = TimerManager:game():time()
  --end
  
  APD2PONRActive = true
end)