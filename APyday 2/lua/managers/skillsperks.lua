-- Forces skills to be 0 and the game never converts XP to perk points properly.
-- Workaround for not being able to remove the third inventory column right now.
-- Benefit of this solution is you can still access Team AI and buy bot boosts.

Hooks:PostHook(SkillTreeManager, "points", "apd2_noskills", function(self)
  return 0
end)

Hooks:PreHook(SkillTreeManager, "give_specialization_points", "apd2_noperks", function(self, xp)
  xp = 0
end)