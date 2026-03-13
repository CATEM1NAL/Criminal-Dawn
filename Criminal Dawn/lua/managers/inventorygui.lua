Hooks:PostHook(PlayerInventoryGui, "init", "CrimDawn_InventoryGUI", function(self)
  CrimDawnClient:PollData()
end)