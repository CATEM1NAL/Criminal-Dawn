local APD2FileIdent = "[APD2>menu] "

dofile(APD2Path .. "lua/archipelago/client_bridge.lua")

-- PLAY BUTTON
function MenuCallbackHandler:apd2_create_lobby()
  apd2_poll_client()
  if not apd2_data.game.seed then
    local needSeed = QuickMenu:new("Missing Multiworld Data", "You need to connect to a multiworld at least once before playing.", {}, true)
  else
    NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = apd2_data.game.seed
    NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = apd2_data.game.seed
    log(APD2FileIdent .. "Updated matchmaking key: " .. NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY)
    self:create_lobby()
  end
end

-- Safehouse button
function MenuCallbackHandler:apd2_safehouse()
  managers.menu:open_node("custom_safehouse")
end

-- Add custom buttons to menu
local function InjectAPD2Buttons(node)
  local data = {
    type = "CoreMenuItem.Item",
  }
  local params = {
    name = "apd2_play_next_btn",
    text_id = "apd2_enter_lobby_title",
    help_id = "apd2_enter_lobby_desc",
    callback = "apd2_create_lobby",
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
    name = "apd2_safehouse",
    text_id = "menu_cn_chill",
    help_id = "apd2_safehouse_desc",
    callback = "apd2_safehouse",
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
    if n % 10 == 1 and n % 100 ~= 11 then
        return tostring(n) .. "st"
    elseif n % 10 == 2 and n % 100 ~= 12 then
        return tostring(n) .. "nd"
    elseif n % 10 == 3 and n % 100 ~= 13 then
        return tostring(n) .. "rd"
    else
        return tostring(n) .. "th"
    end
end


-- MENU CHANGES START HERE --
-- Hook adapted from Create Empty Lobby by Snh20
Hooks:Add("MenuManagerBuildCustomMenus", "apd2_custommenus", function(menu_manager, nodes)
  local mainmenu = nodes.main
  local pausemenu = nodes.pause
  local lobbymenu = nodes.lobby
  
  -- Main Menu
  if mainmenu ~= nil then

    apd2_get_ponr_upgrades()
    apd2_poll_client()

    managers.localization:add_localized_strings({
      ["apd2_enter_lobby_title"] = "Create Lobby",
      ["apd2_enter_lobby_desc"] = "Begin playing Criminal Dawn.",
      ["apd2_start_run_title"] = "A New Criminal Dawn",
      ["apd2_start_run_desc"] = "Bring as much chaos to the streets of D.C. as you can within the time limit.",
      ["apd2_play_next_title"] = "Criminal Dawn [" .. #apd2_data.game.heists .. "/6]",
      ["apd2_play_next_desc"] = "Time remaining: " .. math.floor(apd2_data.game.ponr or -1) .. " seconds.",
      ["apd2_safehouse_desc"] = "Spend your coins on room upgrades! You never know what you might find..."
    })

    if apd2_data.game.run == 1 then
      managers.localization:add_localized_strings({ ["apd2_start_run_title"] = "A New Criminal Dawn" })
    else
      managers.localization:add_localized_strings({ ["apd2_start_run_title"] = "A " .. ordinal(apd2_data.game.run) .. " Criminal Dawn" })
    end

    InjectAPD2Buttons(mainmenu)

    -- Hides all the unnecessary menu buttons
    local HiddenButtons = { crimenet = true, crimenet_offline = true, story_missions = true,
                            fbi_files = true, gamehub = true, movie_theater = true,
                            achievements = true, apd2_safehouse = true }

    for i, item in pairs(mainmenu._items) do
      if HiddenButtons[item._parameters.name] then
        item:set_visible(false)
      end
    end

    if RestructuredMenus then
      if RestructuredMenus.settings.main_add_crimenet_broker then
        MenuHelper:HideMenuItem(mainmenu, 'contract_broker')
      end
    end
  end
  
  -- Lobby
  if lobbymenu ~= nil then
    InjectAPD2Buttons(lobbymenu)
    
    -- Make start game button always visible
    for i, item in pairs(lobbymenu._items) do
      if item._parameters.name == "start_the_game" then
        table.remove(item._visible_callback_list, 2)
        
        if next(apd2_data.game.heists) then
          item._parameters.text_id = "apd2_play_next_title"
          item._parameters.help_id = "apd2_play_next_desc"
        else
          item._parameters.text_id = "apd2_start_run_title"
          item._parameters.help_id = "apd2_start_run_desc"
        end break
      end
    end
    
    -- Hides all the unnecessary menu buttons
    local HiddenButtons = { story_missions = true, achievements = true, side_jobs = true,
                            apd2_play_next_btn = true, crimenet_nj = true, crimenet_j = true  }
    
    for i, item in pairs(lobbymenu._items) do
      if HiddenButtons[item._parameters.name] then
        item:set_visible(false)
      end
    end
  end
  
  -- Pause Menu
  if pausemenu ~= nil then
    for i, item in pairs(pausemenu._items) do
      local breakCounter = 0
      
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


Hooks:PreHook(MenuCallbackHandler, "start_the_game", "apd2_prestartheist", function(self)
  if not Utils:IsInGameState() and NetworkHelper:IsHost() then
    -- Pick starting heist if no active run
    if not next(apd2_data.game.heists) then
      dofile(APD2Path .. "lua/archipelago/heist_selector.lua")
      apd2_next_heist(0)
    end
    
    local APD2NextHeist = apd2_data.game.heists[#apd2_data.game.heists]
    NetworkHelper:SendToPeers("APD2SyncFirstHeist", #apd2_data.game.heists)

    -- Random mutators!
    managers.mutators:reset_all_mutators()
    dofile(APD2Path .. "lua/tables/mutators.lua")

    local CurrentMutator = nil
    for i = 1, #apd2_data.game.heists - 1 + apd2_data.x.mutators do
      CurrentMutator = math.random(#apd2_mutators) or nil
      if CurrentMutator then
        managers.mutators:set_enabled("Mutator" .. apd2_mutators[CurrentMutator])
        table.remove(apd2_mutators, CurrentMutator)
      end
    end

    -- Drop you straight into a heist
    local DiffIndex = math.min(#apd2_data.game.heists + apd2_data.x.diff, apd2_data.game.max_diff)
    
    self:start_job({
      difficulty = tweak_data.difficulties[DiffIndex + 1],
      one_down = true,
      job_id = APD2NextHeist
    })
    log(APD2FileIdent .. "Loading: " .. APD2NextHeist)
  end
end)

Hooks:PostHook(MenuCallbackHandler, "start_the_game", "apd2_startheist", function(self)
  if not Utils:IsInGameState() then
    managers.mutators._lobby_delay = -1

    -- double check for any last second items
    apd2_get_ponr_upgrades()
    apd2_poll_client()
    
    --if NetworkHelper:IsHost() then
    --  NetworkHelper:SendToPeers("APD2SyncLobbyPONR", apd2_data.game.ponr)
    --end
  end
end)

NetworkHelper:AddReceiveHook("APD2SyncFirstHeist", "apd2_sync_heistlist", function(data, sender)
  log(APD2FileIdent .. "Received heists from host ( " .. data .. " )")
  apd2_data.game.host_heists = tonumber(data)
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
end)

--NetworkHelper:AddReceiveHook("APD2SyncLobbyPONR", "apd2_sync_lobbyPONR", function(data, sender)
--  log(APD2FileIdent .. "Received PONR time from host (" .. data .. ")")
--  apd2_data.game.host_ponr = tonumber(data)
--  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
--  log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
--end)


-- Resetting save also resets mod
Hooks:PostHook(MenuManager, "do_clear_progress", "apd2_resetsave", function(self)
  log(APD2FileIdent .. "Wiping apd2_data.txt")
  
  apd2_data = {
    upgrades = {},
    unlocks = {},
    x = { bots = 0, mutators = 0, diff = 0, od = 1 },
    game = { heists = {}, score = 0 },
    safehouse = {}
  }
  
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
  os.remove(SavePath .. "apyday2-client.txt")
  setup:load_start_menu()
end)