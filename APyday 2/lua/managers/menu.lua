local APD2FileIdent = "[APD2>menu] "

dofile(APD2Path .. "lua/client_bridge.lua")

-- PLAY BUTTON
function MenuCallbackHandler:apd2_play_next()
  log(APD2FileIdent .. "Play button clicked")

  -- Check for any last second items sent
  apd2_get_ponr_upgrades()
  apd2_poll_client()

  -- Pick starting heist if no active run
  if not next(apd2_data.game.heists) then
    dofile(APD2Path .. "lua/heist_selector.lua")
    apd2_next_heist(0)
  end
  local APD2NextHeist = apd2_data.game.heists[#apd2_data.game.heists]

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

  -- Drops you straight into a heist
  self:play_single_player()
  local DiffIndex = math.min(#apd2_data.game.heists + apd2_data.x.diff, 6)
  self:start_single_player_job({
    difficulty = tweak_data.difficulties[DiffIndex + 1],
    one_down = apd2_data.game.one_down or false,
    job_id = APD2NextHeist
  })
  log(APD2FileIdent .. "Loading " .. APD2NextHeist)
end

-- SAFEHOUSE BUTTON
function MenuCallbackHandler:apd2_safehouse()
  self:play_single_player()
  managers.menu:open_node("custom_safehouse")
end

-- This hook was adapted from Create Empty Lobby, shoutout to Snh20
Hooks:Add("MenuManagerBuildCustomMenus", "apd2_mainmenu", function(menu_manager, nodes)
  local mainmenu = nodes.main
  if mainmenu == nil then
    return
  end

  apd2_get_ponr_upgrades()
  apd2_poll_client()

  managers.localization:add_localized_strings({
    ["apd2_start_run_title"] = "Start Run",
    ["apd2_start_run_desc"] = "Bring as much chaos to the streets of D.C. as you can within the time limit.",
    ["apd2_play_next_title"] = "Continue Run [" .. #apd2_data.game.heists .. "/6]",
    ["apd2_play_next_desc"] = "Time remaining: " .. math.floor(apd2_data.game.ponr) .. " seconds.",
    ["apd2_safehouse_desc"] = "Spend your coins on room upgrades! You never know what you might find..."
  })

  -- Add the play button
  local data = {
    type = "CoreMenuItem.Item",
  }
  local params = {
    name = "apd2_play_next_btn",
    text_id = "apd2_play_next_title",
    help_id = "apd2_play_next_desc",
    callback = "apd2_play_next",
    font_size = 35,
    font = tweak_data.menu.pd2_large_font
  }
  if not next(apd2_data.game.heists) then
    params.text_id = "apd2_start_run_title"
    params.help_id = "apd2_start_run_desc"
  end

  local new_item = mainmenu:create_item(data, params)

  new_item.dirty_callback = callback(mainmenu, mainmenu, "item_dirty")
  if mainmenu.callback_handler then
    new_item:set_callback_handler(mainmenu.callback_handler)
  end

  local position = 2
  table.insert(mainmenu._items, position, new_item)

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

  local new_item = mainmenu:create_item(data, params)

  new_item.dirty_callback = callback(mainmenu, mainmenu, "item_dirty")
  if mainmenu.callback_handler then
    new_item:set_callback_handler(mainmenu.callback_handler)
  end

  local position = 3
  table.insert(mainmenu._items, position, new_item)

  -- Hides all the unnecessary menu buttons
  local HiddenButtons = { crimenet = true, crimenet_offline = true,
  story_missions = true, social_hub = true, fbi_files = true, gamehub = true,
  movie_theater = true, achievements = true }

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
end)

Hooks:Add("MenuManagerBuildCustomMenus", "apd2_pausemenu", function(menu_manager, nodes)
  local pausemenu = nodes.pause
  if pausemenu == nil then
    return
  end

  for i, item in pairs(pausemenu._items) do
    if item._parameters.name == "end_game" then
      --item._enabled = false
      return
    end
  end

end)

-- Resetting save also resets the mod
Hooks:PostHook(MenuManager, "do_clear_progress", "apd2_reset", function(self)
  log(APD2FileIdent .. "Wiping apd2_data.txt")
  apd2_data = {
    upgrades = { player_special_enemy_highlight = true, player_hostage_trade = true },
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