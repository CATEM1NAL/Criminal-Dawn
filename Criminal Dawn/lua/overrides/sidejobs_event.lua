-- Automatically unlock side job rewards so they are available for use
Hooks:OverrideFunction(SideJobEventManager, "has_completed_and_claimed_rewards", function()
  return true
end)