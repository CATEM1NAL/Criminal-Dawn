if CrimDawn then return end
local FileIdent = "setup"
CrimDawn = {}

function CrimDawn:Init()
  self.ModPath = ModPath
  self.SavePath = SavePath

  self.SaveFile = self.SavePath .. "crimdawn_save.txt"
  self.Settings = self.SavePath .. "crimdawn_settings.txt"

  self.state = { ponr = false,
                 heist_started = false,
                 maskup_time = 0,
                 cap_reached = false }

  function self.Log(FileIdent, LogMessage)
    log("[DAWN>" .. FileIdent .. "] " .. LogMessage)
  end -- Yes, this WILL crash without a FileIdent. This is intentional, otherwise I'd get lazy

  function self.ScoreNeeded()
    local n = math.ceil((math.sqrt(1 + 8 * (Global.CrimDawn.data.game.score) - 1) / 2))
    return (n * (n + 1) / 2) - math.floor(Global.CrimDawn.data.game.score)
  end

  function self.ScoreCap(points)
    if not Global.CrimDawn.data.game.score_cap then return true end

    local NewScore = Global.CrimDawn.data.game.score + points
    if NewScore >= Global.CrimDawn.data.game.score_cap then CrimDawnClient:PollTimeUpgrades() end
    -- Might seem redundant, but we only want to check if upgrades were received IF we are over the score cap before
    -- we continue. Otherwise we'd be polling the client EVERY SINGLE TIME we get a point, which feels very wasteful
    if NewScore >= Global.CrimDawn.data.game.score_cap then
      Global.CrimDawn.data.game.score = Global.CrimDawn.data.game.score_cap
      CrimDawn.state.cap_reached = true

      if Utils:IsInGameState() then
        CrimDawn.ChatNotify("Score cap reached: " .. Global.CrimDawn.data.game.score_cap
                         .. "\nTime Bonus required to increase cap!") end return true
    else Global.CrimDawn.data.game.score = NewScore return false end
  end

  function self.ChatNotify(message)
    managers.chat:_receive_message(ChatManager.GAME, "CRIMINAL DAWN", message, Color(255, 217, 160, 125) / 255)
  end

  function self:Reset()
    Global.CrimDawn.data = {
      upgrades = {},
      unlocks = {},
      x = {
        bots = 0, time_upgrades = 0,
        skills = 0, permaskills = 0, perks = 0, permaperks = 0, stats = 0,
        drill = 0, lives = 0,
        saws = 0, primaries = 0, akimbos = 0, secondaries = 0, melee = 0,
        throwables = 0, deployables = 0, armour = 0,
        big_coins = 0, coins = 0
      },
      game = {
        seed = false, max_diff = false, run = 1, score = 0, f_score = 0, score_cap = false, scaling_count = false,
        heists_won = 0, host_heists = 0, heists = {}, ponr = false, timer_strength = false, deathlink = os.time(),
        run_length = 0
      },
      chat = { message = "", timestamp = 0 },
      safehouse = {}
    }
  end

  function self:WriteSave(FileIdent, SaveReason)
    if Global.CrimDawn.data.game.seed ~= CrimDawnClient.data.seed then return end
    io.save_as_json(Global.CrimDawn.data, self.SaveFile)
    self.Log(FileIdent, "Saved " .. self.SaveFile .. " (" .. SaveReason .. ")")
  end -- Yes, this WILL crash without a FileIdent or SaveReason. This is intentional, otherwise I'd get lazy

  dofile(self.ModPath .. "lua/archipelago/heist_selector.lua")
  dofile(self.ModPath .. "lua/archipelago/unlock_generator.lua")
  dofile(self.ModPath .. "lua/archipelago/client_bridge.lua")
end

CrimDawn:Init()

-- Add save data to global table
if Global.CrimDawn then return end
Global.CrimDawn = { tables = {} }

function Global.CrimDawn:Init()
  CrimDawn.Log(FileIdent, "Attempting to load save file...")
  self.data = io.load_as_json(CrimDawn.SaveFile)
  if not self.data then CrimDawn:Reset() end

  self.next_point = 100 + (self.data.game.score - self.data.game.score % 100)

  dofile(CrimDawn.ModPath .. "lua/tables/heists.lua")
  dofile(CrimDawn.ModPath .. "lua/tables/upgrades.lua")
  dofile(CrimDawn.ModPath .. "lua/tables/weapons.lua")
  dofile(CrimDawn.ModPath .. "lua/tables/dlc.lua")
end

Global.CrimDawn:Init()