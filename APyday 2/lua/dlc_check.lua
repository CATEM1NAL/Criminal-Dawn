local APD2FileIdent = "[APD2>dlc_check] "

-- don't want this mod to function as a DLC unlocker,
-- so we check for owned DLC to filter out content that
-- the player doesn't actually own.

local apd2_dlc_table = {}

function apd2_dlc_check()
  for dlc_id, dlc_data in pairs(tweak_data.dlc) do
    if dlc_data.app_id or dlc_data.content then
      if managers.dlc:is_dlc_unlocked(dlc_id) then
        apd2_dlc_table[dlc_id] = true
        --table.insert(apd2_dlc_table, dlc_id)
      end
    end
  end
  --log("Owned DLC:")
  --Utils.PrintTable(apd2_dlc_table, 2)
end