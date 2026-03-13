-- Move tickers down to not overlap PONR timer
Hooks:PostHook(HUDAssaultCorner, "init", "CrimDawn_HUDCorner", function(self)
  self._hud_panel:child("casing_panel"):set_y(38)
  self._hud_panel:child("assault_panel"):set_y(38)
  self._hud_panel:child("hostages_panel"):set_y(38)
end)

-- Replace PONR panel with a simpler version that doesn't hide other elements
Hooks:OverrideFunction(HUDAssaultCorner, "show_point_of_no_return_timer", function(self, id)
  self:_update_noreturn(id)

  local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")

  --point_of_no_return_panel:stop()
  point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), 0)
  self:_set_feedback_color(self._noreturn_data.color)
end)

-- Change hostage panel offset to go sideways instead
Hooks:OverrideFunction(HUDAssaultCorner, "_offset_hostage", function(self, is_offseted, hostage_panel)
  local TOTAL_T = 0.5
  local ORIGIN = self._hud_panel:w() - hostage_panel:w()
	local OFFSET = self._hud_panel:w() - 342
	local from_x = is_offseted and ORIGIN or OFFSET
	local target_x = is_offseted and OFFSET or ORIGIN
  local t = (1 - math.abs(hostage_panel:x() - target_x) / (ORIGIN - OFFSET)) * TOTAL_T

  while TOTAL_T > t do
    local dt = coroutine.yield()
    t = math.min(t + dt, TOTAL_T)
    local lerp = t / TOTAL_T
    hostage_panel:set_x(math.lerp(from_x, target_x, lerp))

    if self._start_assault_after_hostage_offset then
      self._start_assault_after_hostage_offset = nil
      self:start_assault_callback()
    end
  end

  if self._start_assault_after_hostage_offset then
    self._start_assault_after_hostage_offset = nil
    self:start_assault_callback()
  end
end)