Drill.on_hit_autorepair_chance = 1
local RunLength, HeistsWon = Global.CrimDawn.data.game.run_length, Global.CrimDawn.data.game.heists_won

-- THE ORIGINAL FUNCTION SUCKED ASS AND PISSED ME OFF SO I COMPLETELY REWROTE IT.
Hooks:OverrideFunction(Drill, "set_skill_upgrades", function(self, upgrades)
  if self._disable_upgrades then return end

  -- Setup
  local BGIcons = {}

  local BGIconX = 30
  local BGIconTemplate = {
		texture = "guis/textures/pd2/skilltree/",
		alpha = 1,
		h = 128,
		y = 100,
		w = 128,
		layer = 2
	}

  local function AddBGIcon(texture_name, color)
	  local icon_data = deep_clone(BGIconTemplate)
	  icon_data.texture = icon_data.texture .. texture_name
	  icon_data.color = color
	  icon_data.x = BGIconX

	  table.insert(BGIcons, icon_data)
	  BGIconX = BGIconX + icon_data.w + 2
  end

  -- Speed upgrades
  local TimerGUI = self._unit:timer_gui()
  local SpeedUpgrade = math.max(upgrades.speed_upgrade_level or 0, self._skill_upgrades.speed_upgrade_level or 0)
  local TimerMult = 1
  local ProgressionBonus = 0

  if not CrimDawn.OnFinalHeist() then
    ProgressionBonus = math.min(Global.CrimDawn.data.game.progression_items * 2, 99)

  elseif managers.job:current_level_id() == "vit" then
    ProgressionBonus = math.min(Global.CrimDawn.data.game.progression_items * 2, 100) * 0.5
  end

  TimerMult = 1 - (ProgressionBonus / 100)

  if SpeedUpgrade > 0 then
	  AddBGIcon("drillgui_icon_faster", TimerGUI:get_upgrade_icon_color("upgrade_color_" .. SpeedUpgrade))
	  upgrades.speed_upgrade_level = SpeedUpgrade

	else AddBGIcon("drillgui_icon_faster", TimerGUI:get_upgrade_icon_color("upgrade_color_0")) end
  TimerGUI:set_timer_multiplier(TimerMult)

  -- Silent upgrade
  local SilentDrill = (upgrades.silent_drill or false) or (self._skill_upgrades.silent_drill or false)

  if SilentDrill then
    self:set_alert_radius(nil)
    TimerGUI:set_skill(BaseInteractionExt.SKILL_IDS.aced)

    upgrades.silent_drill = true
		upgrades.reduced_alert = true

    AddBGIcon("drillgui_icon_silent", TimerGUI:get_upgrade_icon_color("upgrade_color_6"))

  else self:set_alert_radius(tweak_data.upgrades.drill_alert_radius or 2500)
    TimerGUI:set_skill(BaseInteractionExt.SKILL_IDS.none)
    AddBGIcon("drillgui_icon_silent", TimerGUI:get_upgrade_icon_color("upgrade_color_0"))
  end

  -- Autorepair upgrade
  local AutoRepair = math.max(upgrades.auto_repair_level_1 or 0, self._skill_upgrades.auto_repair_level_1 or 0)
  if AutoRepair > 0 then
    upgrades.auto_repair_level_1 = AutoRepair
    AddBGIcon("drillgui_icon_restarter", TimerGUI:get_upgrade_icon_color("upgrade_color_6"))
    if Network:is_server() then self:set_autorepair(1) end
  else AddBGIcon("drillgui_icon_restarter", TimerGUI:get_upgrade_icon_color("upgrade_color_0")) end

  -- Finalisation
  self._skill_upgrades = deep_clone(upgrades)
  TimerGUI:set_background_icons(BGIcons)
  TimerGUI:update_sound_event()
end)

-- Simplified upgrade check
Hooks:OverrideFunction(Drill, "compare_skill_upgrades", function(self, upgrades)
  if self._disable_upgrades then return false end
  local AutoRepair = (upgrades.auto_repair_level_1 or 0) > (self._skill_upgrades.auto_repair_level_1 or 0)
  local SilentDrill = upgrades.silent_drill and not self._skill_upgrades.silent_drill
  return AutoRepair or SilentDrill
end)