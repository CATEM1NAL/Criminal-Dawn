Hooks:OverrideFunction(SkillTreeManager, "points", function()
  return 0
end)

Hooks:PostHook(SkillTreeManager, "_setup_specialization", "CrimDawn_NoPerks", function(self)
  self._global.specializations.max_points = self:digest_value(0, true)
end)