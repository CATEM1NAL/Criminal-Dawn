local FileIdent = "safehouse"

Hooks:PostHook(CustomSafehouseManager, "purchase_room_tier", "CrimDawn_Safehouse", function(self, room_id, tier)
  CrimDawn.Log(FileIdent, "Upgraded room: " .. room_id .. " to tier " .. tier)
  Global.CrimDawn.data.safehouse[room_id] = tier
  CrimDawn:WriteSave(FileIdent, "safehouse upgraded")

  -- Wait so client has time to read and write
  DelayedCalls:Add("CrimDawn_SafehousePoll", 1.5, function() CrimDawnClient:PollItems() end)
end)