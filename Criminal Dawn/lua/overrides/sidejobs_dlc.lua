-- Automatically unlock side job rewards so they are available for use
Hooks:OverrideFunction(SideJobGenericDLCManager, "has_completed_and_claimed_rewards", function()
  return true
end)