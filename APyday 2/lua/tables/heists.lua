dofile(APD2Path .. "lua/dlc_check.lua")

-- Basic "loot and leave" type heists
apd2_heist_t1 = { "jewelry_store", "ukrainian_job_prof", "four_stores",
  "mallcrasher", "branchbank_prof", "nightclub",
  
  "hvh" }
-- Jewelry Store, Ukrainian Job, Four Stores, Mallcrasher, Bank Heist, Nightclub

-- ENDLESS: Cursed Kill Room

local UnlockedUpgrade = apd2_data.upgrades

-- Add tutorials if conditions are met to not softlock
if apd2_data.x.bots > 1 and UnlockedUpgrade.cable_tie then
  table.insert(apd2_heist_t1, "short2")
end

if UnlockedUpgrade.player_corpse_dispose and UnlockedUpgrade.player_extra_corpse_dispose_amount then
  table.insert(apd2_heist_t1, "short1")
end

-- Simple with a few extra steps
apd2_heist_t2 = { "gallery", "family", "cage", "watchdogs_wrapper",
  "arm_fac", "arm_par", "arm_hcm", "arm_und", "arm_cro",
  
  "hvh", "cane", "help" }
-- Art Gallery, Diamond Store, Car Shop, Watchdogs, AT Trucks

-- ENDLESS: Cursed Kill Room, Santa's Workshop, Prison Nightmare

-- Basic heists with some moving parts
apd2_heist_t3 = { "roberts", "brb", "chas", "spa", "sah", "jolly",
  "moon", "alex", "kosugi",
  
  "hvh", "cane", "help", "rat" }
-- GO Bank, Brooklyn Bank, Dragon Heist, Brooklyn 10-10,
-- Shacklethorne, Aftershock, Stealing Xmas, Rats, Shadow Raid

-- ENDLESS: Cursed Kill Room, Santa's Workshop,
-- Prison Nightmare, Cook Off

-- Heists with some level of complexity
apd2_heist_t4 = { "run", "rvd", "crojob1", "crojob_wrapper",
  "election_day", "dinner", "flat", "pal", "corp", "ranc", "dark",
  "wwh", "pex", "fish", "born",
  
  "hvh", "cane", "help", "rat", "pines" }
-- Heat Street, Reservoir Dogs, Bomb Heists, Election Day,
-- Slaughterhouse, Panic Room, Counterfeit, Hostile Takeover,
-- Midland Ranch, Murky Station, Alaskan Deal, Tijuana,
-- Yacht Heist, Biker Heist

-- ENDLESS: Cursed Kill Room, Santa's Workshop,
-- Prison Nightmare, Cook Off, White Xmas

-- Big heists
apd2_heist_t5 = { "pent", "arena", "arm_for", "dah", "nmh",
  "firestarter", "red2", "glace", "man", "mad", "mex", "friend",
  "mia", "hox_3", "chca", "shoutout_raid", "bex",
  
  "hvh", "cane", "help", "rat", "pines", "mex_cooking", "nail" }
-- Mountain Master, Alesso, Train Heist, Diamond Heist,
-- No Mercy, Firestarter, First World Bank, Green Bridge,
-- Undercover, Boiling Point, Border Crossing, Scarface,
-- Hotline Miami, Hoxton Revenge, Black Cat, Meltdown,
-- San Martin

-- ENDLESS: Cursed Kill Room, Santa's Workshop,
-- Prison Nightmare, Cook Off, White Xmas,
-- Border Crystals, Lab Rats

-- Final heists, grand scale
apd2_heist_final = { "vit", "deep", "haunted", "kenaz",
  "28_stores", "peta", "tag", "des", "bph", "hox", "big",
  "mus", "welcome_to_the_jungle", "framing_frame", "fex" }
-- White House, Crude Awakening, Safe House Nightmare,
-- Golden Grin, 28 Stores, Goat Sim, Breakin' Feds,
-- Henry's Rock, Hell's Island, Hoxton Breakout, Big Bank
-- The Diamond, Big Oil, Framing Frame, Buluc's Mansion

local all_heists = { apd2_heist_t1, apd2_heist_t2, apd2_heist_t3, apd2_heist_t4, apd2_heist_t5, apd2_heist_final }