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
                 maskup_time = 0 }

  function self.Log(FileIdent, LogMessage)
    log("[DAWN>" .. FileIdent .. "] " .. LogMessage)
  end -- Yes, this WILL crash without a FileIdent. This is intentional, otherwise I'd get lazy

  function self.ScoreNeeded()
    local n = math.ceil((math.sqrt(1 + 8 * ((Global.CrimDawn.data.game.score + 100) / 100)) - 1) / 2)
    return (n * (n + 1) / 2) - math.floor(Global.CrimDawn.data.game.score / 100)
  end

  function self.ChatNotify(message)
    managers.chat:_receive_message(ChatManager.GAME, "CRIMINAL DAWN", message, Color(255, 217, 160, 125) / 255)
  end

  function self:Reset()
    Global.CrimDawn.data = {
      upgrades = {},
      unlocks = {},
      x = {
        bots = 0, mutators = 0, diff = 0, time_upgrades = 0,
        skills = 0, permaskills = 0, perks = 0, permaperks = 0, stats = 0,
        drill = 0, lives = 0,
        saws = false, primaries = 0, akimbos = 0, secondaries = 0, melee = 0,
        throwables = 0, deployables = 0, armour = 0,
        big_coins = 0, coins = 0
      },
      game = {
        seed = false, max_diff = false, run = 1, score = 0, score_cap = false,
        heists = {}, ponr = false, timer_strength = false, deathlink = 0
      },
      chat = { message = "", timestamp = 0 },
      safehouse = {}
    }
  end

  function self:WriteSave(FileIdent, SaveReason)
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