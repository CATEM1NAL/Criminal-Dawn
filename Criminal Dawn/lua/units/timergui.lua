TimerGui.upgrade_colors = {
  upgrade_color_0 = tweak_data.screen_colors.item_stage_3,
	upgrade_color_1 = Global.CrimDawn.archicolours.green_alt,
	upgrade_color_2 = Global.CrimDawn.archicolours.blue_alt,
	upgrade_color_3 = Global.CrimDawn.archicolours.pink_alt,
	upgrade_color_4 = Global.CrimDawn.archicolours.yellow_alt,
	upgrade_color_5 = Global.CrimDawn.archicolours.orange_alt,
	upgrade_color_6 = Global.CrimDawn.archicolours.red_alt
}

local DrillLevel = CrimDawn.DiffScale(true, 6)
local JamTimes = 3 - math.max(math.floor(DrillLevel / 2), 0)

Hooks:PreHook(TimerGui, "_set_jamming_values", "CrimDawn_JammingTimerGUI", function(self)
  if CrimDawn.OnFinalHeist() then return end
  if JamTimes == 0 then self._can_jam = false end
  self._jam_times = math.max(JamTimes, 1)
end)

Hooks:PreHook(TimerGui, "_start", "CrimDawn_StartTimerGUI", function(self)
  local CurrentLevel = managers.job:current_level_id()
  if (CrimDawn.OnFinalHeist() and CurrentLevel ~= "vit") or CurrentLevel == "tag" then return end

  local TimerMult = math.min(Global.CrimDawn.data.game.progression_items * 2, 99)
  if CrimDawn.OnFinalHeist() and CurrentLevel == "vit" then TimerMult = TimerMult * 0.5 end

  self:set_timer_multiplier(1 - (TimerMult / 100))
end)