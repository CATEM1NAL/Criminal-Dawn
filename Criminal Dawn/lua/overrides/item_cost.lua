Hooks:PostHook(MoneyTweakData, "init", "apd2_free_weapons", function(self, tweak_data)
  self.weapon_cost = 0
  self.modify_weapon_cost = 0
end)