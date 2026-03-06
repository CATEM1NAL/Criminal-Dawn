-- Forces skills to be 0 and the game never converts XP to perk points properly.
-- Workaround for not being able to remove the third inventory column.
-- Benefit of this solution is you can still access Team AI and get bot boosts.

Hooks:OverrideFunction(SkillTreeManager, "points", function()
  return 0
end)

Hooks:PostHook(SkillTreeManager, "_setup_specialization", "apd2_no_perks", function(self)
  self._global.specializations.max_points = self:digest_value(0, true)
end)