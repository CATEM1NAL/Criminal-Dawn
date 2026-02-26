-- Automatically unlock side job weapons so they are available for use

Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_arbiter", function()
  return true
end)

Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_breech", function()
  return true
end)

Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_ching", function()
  return true
end)

Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_erma", function()
  return true
end)

Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_shock", function()
  return true
end)

Hooks:OverrideFunction(BlackMarketManager, "has_unlocked_victor", function()
  return true
end)