local FileIdent = "menu"

-- PLAY BUTTON
function MenuCallbackHandler:CrimDawn_CreateLobby()
  CrimDawnClient:PollData()

  if Global.CrimDawn.data.game.seed then
    if NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY ~= Global.CrimDawn.data.game.seed then
      NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = Global.CrimDawn.data.game.seed
      NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = Global.CrimDawn.data.game.seed
      CrimDawn.Log(FileIdent, "Updated matchmaking key: " .. NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY)
    end self:create_lobby()

  else local NeedSeed = QuickMenu:new("Missing Multiworld Data",
    "You need to connect to a multiworld at least once before playing.",
    {}, true)
  end
end

-- Safehouse button
function MenuCallbackHandler:CrimDawn_Safehouse()
  managers.menu:open_node("custom_safehouse")
end

-- Add custom buttons to menu
local function InjectCrimDawnButtons(node)
  local data = {
    type = "CoreMenuItem.Item",
  }
  local params = {
    name = "crimdawn_play_next_btn",
    text_id = "crimdawn_enter_lobby_title",
    help_id = "crimdawn_enter_lobby_desc",
    callback = "CrimDawn_CreateLobby",
    font_size = 35,
    font = tweak_data.menu.pd2_large_font
  }

  local new_item = node:create_item(data, params)

  new_item.dirty_callback = callback(node, node, "item_dirty")
  if node.callback_handler then
    new_item:set_callback_handler(node.callback_handler)
  end

  local position = 2
  table.insert(node._items, position, new_item)

  -- Add the safehouse button
  local data = {
    type = "CoreMenuItem.Item",
  }
  local params = {
    name = "crimdawn_safehouse",
    text_id = "menu_cn_chill",
    help_id = "crimdawn_safehouse_desc",
    callback = "CrimDawn_Safehouse",
    font_size = 35,
    font = tweak_data.menu.pd2_large_font
  }
  
  local new_item = node:create_item(data, params)

  new_item.dirty_callback = callback(node, node, "item_dirty")
  if node.callback_handler then
    new_item:set_callback_handler(node.callback_handler)
  end

  local position = 3
  table.insert(node._items, position, new_item)
end

local function ordinal(n)
  if n % 10 == 1 and n % 100 ~= 11 then return tostring(n) .. "st"
  elseif n % 10 == 2 and n % 100 ~= 12 then return tostring(n) .. "nd"
  elseif n % 10 == 3 and n % 100 ~= 13 then return tostring(n) .. "rd"
  else return tostring(n) .. "th" end
end


-- MENU CHANGES START HERE --
-- Hook adapted from Create Empty Lobby by Snh20
Hooks:Add("MenuManagerBuildCustomMenus", "CrimDawn_MenuTweaks", function(menu_manager, nodes)
  local mainmenu = nodes.main
  local pausemenu = nodes.pause
  local lobbymenu = nodes.lobby

  -- Main Menu
  if mainmenu ~= nil then

    CrimDawnClient:PollTimeUpgrades()
    CrimDawnClient:PollData()

    managers.localization:add_localized_strings({
    --  ["apd2_enter_lobby_title"] = "Create Lobby",
    --  ["apd2_enter_lobby_desc"] = "Begin playing Criminal Dawn.",
    --  ["apd2_start_run_title"] = "A New Criminal Dawn",
    --  ["apd2_start_run_desc"] = "Bring as much chaos to the streets of D.C. as you can within the time limit.",
      ["crimdawn_play_next_title"] = ordinal(Global.CrimDawn.data.game.run) .. " Criminal Dawn [" .. #Global.CrimDawn.data.game.heists .. "/6]",
      ["crimdawn_play_next_desc"] = "Time remaining: " .. math.floor(Global.CrimDawn.data.game.ponr or -1) .. " seconds.",
    --  ["apd2_safehouse_desc"] = "Spend your coins on room upgrades! You never know what you might find..."
    })

    if Global.CrimDawn.data.game.run == 1 then managers.localization:add_localized_strings({
      ["crimdawn_start_run_title"] = "A New Criminal Dawn" })
    else managers.localization:add_localized_strings({
      ["crimdawn_start_run_title"] = "A " .. ordinal(Global.CrimDawn.data.game.run) .. " Criminal Dawn" })
    end

    InjectCrimDawnButtons(mainmenu)

    -- Hides all the unnecessary menu buttons
    local HiddenButtons = { crimenet = true, crimenet_offline = true, story_missions = true,
                            fbi_files = true, gamehub = true, movie_theater = true,
                            achievements = true, crimdawn_safehouse = true }

    for i, item in pairs(mainmenu._items) do
      if HiddenButtons[item._parameters.name] then item:set_visible(false) end
    end

    if RestructuredMenus then
      if RestructuredMenus.settings.main_add_crimenet_broker then
        MenuHelper:HideMenuItem(mainmenu, 'contract_broker')
      end
    end
  end
  
  -- Lobby
  if lobbymenu ~= nil then
    InjectCrimDawnButtons(lobbymenu)
    
    -- Make start game button always visible
    for i, item in pairs(lobbymenu._items) do
      if item._parameters.name == "start_the_game" then
        table.remove(item._visible_callback_list, 2)
        
        if next(Global.CrimDawn.data.game.heists) then
          item._parameters.text_id = "crimdawn_play_next_title"
          item._parameters.help_id = "crimdawn_play_next_desc"
        else
          item._parameters.text_id = "crimdawn_start_run_title"
          item._parameters.help_id = "crimdawn_start_run_desc"
        end break
      end
    end
    
    -- Hides all the unnecessary menu buttons
    local HiddenButtons = { story_missions = true, achievements = true, side_jobs = true,
                            crimdawn_play_next_btn = true, crimenet_nj = true, crimenet_j = true  }
    
    for i, item in pairs(lobbymenu._items) do
      if HiddenButtons[item._parameters.name] then item:set_visible(false) end
    end

    if RestructuredMenus then
      if RestructuredMenus.settings.lobby_add_contract_broker then
        MenuHelper:HideMenuItem(lobbymenu, "contract_broker")
      end
    end
  end
  
  -- Pause Menu
  if pausemenu ~= nil then
    local breakCounter = 0
    for i, item in pairs(pausemenu._items) do
      
      if item._parameters.name == "abort_mission" then
        item:set_visible(false)
        breakCounter = breakCounter + 1
        
      elseif item._parameters.name == "end_game" then
        item._enabled = false
        breakCounter = breakCounter + 1
      end
      
      if breakCounter == 2 then break end
    end
  end
end)
-- MENU CHANGES END HERE


Hooks:PreHook(MenuCallbackHandler, "start_the_game", "CrimDawn_PreStartGame", function(self)
  if not CrimDawn.state.heist_started and not Utils:IsInGameState() and NetworkHelper:IsHost() then

    -- Pick starting heist if no active run
    if not next(Global.CrimDawn.data.game.heists) then
      CrimDawnClient:PollTimeUpgrades()
      CrimDawn:NextHeist(0)
    end

    NetworkHelper:SendToPeers("CrimDawn_HeistCount", #Global.CrimDawn.data.game.heists)

    -- Random mutators
    dofile(CrimDawn.ModPath .. "lua/tables/mutators.lua")

    -- Drop you straight into a heist
    local DiffIndex =
    math.min(#Global.CrimDawn.data.game.heists + Global.CrimDawn.data.x.diff, Global.CrimDawn.data.game.max_diff)
    local NextHeist = Global.CrimDawn.data.game.heists[#Global.CrimDawn.data.game.heists]

    self:start_job({
      difficulty = tweak_data.difficulties[DiffIndex + 1],
      one_down = true,
      job_id = NextHeist
    })
    CrimDawn.Log(FileIdent, "Loading: " .. NextHeist)
  end
end)

Hooks:PostHook(MenuCallbackHandler, "start_the_game", "CrimDawn_PostStartGame", function(self)
  if not CrimDawn.state.heist_started and not Utils:IsInGameState() then
    -- check for any last second items
    CrimDawnClient:PollTimeUpgrades()
    CrimDawnClient:PollData()
    CrimDawn.state.heist_started = true
  end
end)

-- Resetting save also resets mod
Hooks:PostHook(MenuManager, "do_clear_progress", "CrimDawn_ResetSave", function(self)
  CrimDawn.Log(FileIdent, "Wiping save data")
  CrimDawn:Reset()
  CrimDawn:WriteSave(FileIdent, "save reset")

  CrimDawn.Log(FileIdent, "Wiping client data")
  os.remove(CrimDawnClient.DataPath)
  CrimDawnClient:LoadData()

  setup:load_start_menu()
end)