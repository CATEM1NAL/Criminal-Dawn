Hooks:OverrideFunction(MutatorsManager, "_get_reduction", function()
  return 0
end)

Hooks:OverrideFunction(MutatorsManager, "are_achievements_disabled", function()
  return true
end)

Hooks:OverrideFunction(MutatorsManager, "delay_lobby_time", function()
  return 0
end)