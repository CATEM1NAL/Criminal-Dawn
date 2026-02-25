local APD2FileIdent = "[APD2>safehouse] "

Hooks:PostHook(CustomSafehouseManager, "purchase_room_tier", "apd2_safehouse", function(self, room_id, tier)
  log(APD2FileIdent .. "Upgraded room: " .. room_id .. " to tier " .. tier)
  apd2_data.safehouse[room_id] = tier
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")

  -- Wait so client has time to read and write
  DelayedCalls:Add("apd2_safehouse_poll", 2, function()
    apd2_get_ponr_upgrades()
    apd2_poll_client()
  end)
end)