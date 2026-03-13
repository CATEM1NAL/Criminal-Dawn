local FileIdent = "chatroom"

Hooks:PostHook(ChatManager, "send_message", "CrimDawn_SendChatMessage", function(self, _, _, message)
  Global.CrimDawn.data.chat.message = message
  Global.CrimDawn.data.chat.timestamp = os.time()
  CrimDawn:WriteSave(FileIdent, "sent chat message")
end)