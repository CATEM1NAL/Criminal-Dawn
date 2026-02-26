apd2_heist_tables = {
  -- Basic "loot and leave" type heists
  tier1 = { "jewelry_store", "ukrainian_job_prof", "four_stores", "mallcrasher", "branchbank_prof", "nightclub",
            "hvh" },
  -- Jewelry Store, Ukrainian Job, Four Stores, Mallcrasher, Bank Heist, Nightclub
  -- ENDLESS: Cursed Kill Room

  -- Simple with a few extra steps
  tier2 = { "gallery", "family", "cage", "watchdogs_wrapper",
            "hvh", "cane", "help" },
  -- Art Gallery, Diamond Store, Car Shop, Watchdogs
  -- ENDLESS: Cursed Kill Room, Santa's Workshop, Prison Nightmare


  -- Basic heists with some moving parts
  tier3 = { "roberts", "brb", "sah", "jolly", "moon", "alex", "kosugi",
            "hvh", "cane", "help", "rat" },
  -- GO Bank, Brooklyn Bank, Shacklethorne, Aftershock, Stealing Xmas, Rats, Shadow Raid
  -- ENDLESS: Cursed Kill Room, Santa's Workshop, Prison Nightmare, Cook Off


  -- Heists with some level of complexity
  tier4 = { "run", "election_day", "dinner", "flat", "wwh",
            "hvh", "cane", "help", "rat", "pines" },
  -- Heat Street, Election Day, Slaughterhouse, Panic Room, Alaskan Deal
  -- ENDLESS: Cursed Kill Room, Santa's Workshop, Prison Nightmare, Cook Off, White Xmas


  -- Big heists
  tier5 = { "dah", "nmh", "firestarter", "red2", "glace", "hox_3", "shoutout_raid",
            "hvh", "cane", "help", "rat", "pines", "nail" },
  -- Diamond Heist, No Mercy, Firestarter, First World Bank, Green Bridge, Hoxton Revenge, Meltdown,
  -- ENDLESS: Cursed Kill Room, Santa's Workshop, Prison Nightmare, Cook Off, White Xmas, Lab Rats


  -- Finale heists
  tier6 = { "vit", "haunted", "28_stores", "tag", "des", "bph", "hox",
            "welcome_to_the_jungle", "framing_frame" }
  -- White House, Safe House Nightmare, 28 Stores, Breakin' Feds, Henry's Rock,
  -- Hell's Island, Hoxton Breakout, Big Oil, Framing Frame
}

local UnlockedUpgrade = apd2_data.upgrades
-- Add tutorials if conditions are met to not softlock
if apd2_data.x.bots > 1 and UnlockedUpgrade.cable_tie then
  table.insert(apd2_heist_t1, "short2")
end

if UnlockedUpgrade.player_corpse_dispose and UnlockedUpgrade.player_extra_corpse_dispose_amount then
  table.insert(apd2_heist_t1, "short1")
end