local APD2FileIdent = "[APD2>heist_selector] "
dofile(APD2Path .. "lua/tables/heists.lua")

local HeistTables = { apd2_heist_t1, apd2_heist_t2, apd2_heist_t3, apd2_heist_t4, apd2_heist_t5, apd2_heist_final }

function apd2_next_heist(HeistsWon)
  local TierIndex = (HeistsWon or 0) + 1
  local CurrentTier

  if HeistTables[TierIndex] then
    CurrentTier = HeistTables[TierIndex]
  else
    if not apd2_data.game.victory then apd2_data.game.victory = true end
    CurrentTier = math.random(#HeistTables)
  end

  local NextHeist = CurrentTier[math.random(#CurrentTier)]
  table.insert(apd2_data.game.heists, NextHeist)
  NextHeist = apd2_data.game.heists[#apd2_data.game.heists]

  --Utils.PrintTable(apd2_data.game.heists, 1)
  log(APD2FileIdent .. NextHeist)
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
end