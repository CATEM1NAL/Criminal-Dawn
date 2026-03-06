local APD2FileIdent = "[APD2>deathlink] "

Hooks:PreHook(PlayerDamage, "damage_bullet", "apd2_deathlink_checker", function(self)
  local APD2Client = io.load_as_json(SavePath .. "apyday2-client.txt") or {}
  
  APD2Client.deathlink = APD2Client.deathlink or 0
  if APD2Client.deathlink > apd2_data.game.deathlink then
    self._revives = Application:digest_value(math.max(Application:digest_value(self._revives, false) - 1, 1), true)
    managers.environment_controller:set_last_life(Application:digest_value(self._revives, false) <= 1)
    -- reduces downs remaining by 1. sidenote: this fucking sucks ass
    self:_send_set_revives()

    apd2_chat_send("Deathlink received.")

    apd2_data.game.deathlink = APD2Client.deathlink
    apd2_save(APD2FileIdent, "deathlink received")
  end
end)