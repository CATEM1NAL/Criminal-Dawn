local APD2FileIdent = "[APD2>chat] "
dofile(APD2Path .. "lua/unlock_handler.lua")

local unlock_shorthands =
  { h = "heists",
    w = "weapons",
    u = "upgrades" }

-- this is purely a debug function to handle adding
-- unlocks to apd2_data. it's not supposed to be user
-- facing and crashes horrifically if you enter commands
-- incorrectly. don't use this unless you know what you're doing
Hooks:PostHook(ChatManager, "send_message", "apd2_chatdebug", function(self, channel_id, sender, message)
  log(APD2FileIdent .. message)
  if message:match("^!") then
    log(APD2FileIdent .. "RUNNING COMMAND")
    local unlock_type, id = message:match("^!(%S+)%s+(%S+)$")
    unlock_type = unlock_shorthands[unlock_type] or unlock_type
    log(APD2FileIdent .. unlock_type)
    apd2_unlock_handler(unlock_type, id)
  end
end)