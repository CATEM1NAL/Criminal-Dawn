local APD2FileIdent = "[APD2>heist_selector] "

function apd2_next_heist(HeistsWon)
  local TierIndex = (HeistsWon or 0) + 1
  local CurrentTier

  if apd2_heist_tables["tier" .. TierIndex] then
    CurrentTier = apd2_heist_tables["tier" .. TierIndex]
  else
    if not apd2_data.game.victory then apd2_data.game.victory = true end
    CurrentTier = apd2_heist_tables["tier" .. math.random(#apd2_heist_tables)]
  end

  local NextHeist = CurrentTier[math.random(#CurrentTier)]
  table.insert(apd2_data.game.heists, NextHeist)
  NextHeist = apd2_data.game.heists[#apd2_data.game.heists]

  --Utils.PrintTable(apd2_data.game.heists, 1)
  log(APD2FileIdent .. NextHeist)
  io.save_as_json(apd2_data, SavePath .. "apyday2.txt")
  log(APD2FileIdent .. "Saved " .. SavePath .. "apyday2.txt")
end