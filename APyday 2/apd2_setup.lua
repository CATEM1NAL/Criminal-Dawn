local APD2FileIdent = "[APD2>apd2_setup] "

APD2Path = ModPath -- BeardLib can suck a fat nut

-- I have no fucking clue if there's a better place to
-- do this than in setups/setup. The issue is the game
-- needs to be able to access apd2_data before it does
-- pretty much anything else in its current state, so
-- the game will crash if apd2_data isn't initialized
-- immediately. Prehooking setups/setup was the first
-- solution I found that worked. If there's a better
-- way to do this, please let me know!

function apd2_load()
  log(APD2FileIdent .. "Attempting apd2_data load...")
  apd2_data = io.load_as_json(SavePath .. "apyday2.txt") or {}
  apd2_data.upgrades = apd2_data.upgrades or { player_special_enemy_highlight = true, player_hostage_trade = true }
  apd2_data.unlocks = apd2_data.unlocks or {}
  apd2_data.x = apd2_data.x or {}
  apd2_data.x.bots = apd2_data.x.bots or 0
  apd2_data.x.mutators = apd2_data.x.mutators or 0
  apd2_data.x.diff = apd2_data.x.diff or 0
  apd2_data.x.od = apd2_data.x.od or 1 -- for OD score mult to work
  apd2_data.game = apd2_data.game or {}
  apd2_data.game.heists = apd2_data.game.heists or {}
  apd2_data.game.ponr = apd2_data.game.ponr or (600 * (1 + (apd2_data.x.ponr_upgrade or 0)))
  apd2_data.game.score = apd2_data.game.score or 0
  apd2_data.safehouse = apd2_data.safehouse or {}
  --Utils.PrintTable(apd2_data, 4)
end

apd2_load()

function apd2_score_needed()
  local n = math.ceil((math.sqrt(1 + 8 * ((apd2_data.game.score + 100) / 100)) - 1) / 2)
  return (n * (n + 1) / 2) - math.floor(apd2_data.game.score / 100)
end

function apd2_chat_send(message)
  managers.chat:_receive_message(ChatManager.GAME, "APYDAY 2", message, Color(255, 118, 126, 189) / 255)
end