local APD2FileIdent = "[APD2>chatroom] "

Hooks:PostHook(ChatManager, "send_message", "apd2_chat_send", function(self, _, _, message)
  apd2_data.chat.message = message
  apd2_data.chat.timestamp = os.time()
  apd2_save(APD2FileIdent, "player sent chat message")
end)