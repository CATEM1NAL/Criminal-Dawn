local APD2FileIdent = "[APD2>safehouse] "

Hooks:PostHook(CustomSafehouseManager, "purchase_room_tier", "apd2_safehouse", function(self, room_id, tier)
  log(APD2FileIdent .. "Upgraded room: " .. room_id .. " to tier " .. tier)
  apd2_data.safehouse[room_id] = tier
  apd2_save(APD2FileIdent, "safehouse upgraded")

  -- Wait so client has time to read and write
  DelayedCalls:Add("apd2_safehouse_poll", 1.5, function()
    apd2_poll_client()
  end)
end)