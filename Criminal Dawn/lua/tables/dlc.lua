local APD2FileIdent = "[APD2>dlc] "

local heist = apd2_heist_tables

local primary = apd2_weapon_tables.primaries
local akimbo = apd2_weapon_tables.akimbos
local secondary = apd2_weapon_tables.secondaries
local melee = apd2_weapon_tables.melee
local throwable = apd2_weapon_tables.throwables

-- Keys are DLC content, values are the target table.
local dlc_content = {

  -- Licensed content
  rvd = { rvd = heist.tier3, dark = heist.tier4, mad = heist.tier5,
          model70 = primary, x_sr2 = akimbo, corgi = primary,
          g26 = secondary, sr2 = secondary, pl14 = secondary,
          kabar_tanto = melee, boxcutter = melee, zeus = melee, clean = melee },

  -- Armored Transport
  armored_transport = { arm_und = heist.tier1, arm_fac = heist.tier2,
                        arm_hcm = heist.tier2, arm_cro = heist.tier3,
                        arm_par = heist.tier4, arm_for = heist.tier5 },

  -- Gage LMG Pack
  gage_pack_lmg = { hk21 = primary, m249 = primary, 
                    gerber = melee, kampfmesser = melee, rambo = melee },

  -- Gage Sniper Pack
  gage_pack_snp = { m95 = primary, msr = primary, r93 = primary },

  -- Big Bank
  big_bank = { big = heist.tier5,
               fal = primary },

  -- Gage Shotgun Pack
  gage_pack_shotgun = { benelli = primary, ksg = primary,
                        striker = secondary,
                        baton = melee, becker = melee, shovel = melee, tomahawk = melee },

  -- Gage Assault Pack
  gage_pack_assault = { famas = primary, galil = primary, g3 = primary, gre_m79 = primary,
                        bayonet = melee, bullseye = melee, dingdong = melee, x46 = melee },

  -- Hotline Miami
  hl_miami = { mia = heist.tier4,
               scorpion = secondary, tec9 = secondary, uzi = secondary,
               bat = melee, cleaver = melee, fireaxe = melee, machete = melee },

  -- Gage Historical Pack
  gage_pack_historical = { mosin = primary, mg42 = primary,
                           c96 = secondary, sterling = secondary,
                           fairbair = melee, freedom = melee, model24 = melee },

  -- Clover Character Pack
  character_pack_clover = { l85a2 = primary,
                            shillelagh = melee,
                            burglar_dodge_1 = "Sneaky Lv1", burglar_dodge_2 = "Sneaky Lv2",
                            burglar_dodge_3 = "Sneaky Lv3", burglar_prio_1 = "Tricksy Lv1",
                            burglar_prio_2 = "Tricksy Lv2", burglar_prio_3 = "Tricksy Lv3",
                            burglar_bag_speed = "Bagger", burglar_lockpick_speed = "Binding",
                            burglar_pager_speed = "Dutch Courage", burglar_recovery = "Fresh Air" },

  -- The Diamond
  hope_diamond = { mus = heist.tier5 },

  -- Dragan Character Pack
  character_pack_dragan = { vhs = primary,
                            meat_cleaver = melee,
                            infil_overdog = "Overdog", infil_single_dog_1 = "Close Combat Lv1",
                            infil_single_dog_2 = "Close Combat Lv2", infil_single_dog_3 = "Close Combat Lv3",
                            infil_melee_boost = "Psychopath", infil_melee_timer = "CBT", infil_melee_heal = "Life Drain" },

  -- Bomb Heists
  the_bomb = { crojob1 = heist.tier4, crojob_wrapper = heist.tier4,
               hs2000 = secondary },

  -- Jacket Character Pack
  hlm2_deluxe = { cobray = secondary, hammer = melee,
                  infil_overdog = "Overdog", infil_melee_boost = "Psychopath",
                  socio_armor_1 = "Tension", socio_heal = "Clean Hit",
                  socio_armor_2 = "Overdose", socio_panic = "Showdown" },

  -- Overkill Pack
  overkill_pack = { m134 = primary, rpg7 = secondary },

  -- Butcher BBQ Pack
  bbq = { flamethrower_mk2 = primary, m32 = primary, aa12 = primary,
          fork = melee, poker = melee, spatula = melee, tenderizer = melee },

  -- Western Pack
  west = { winchester1874 = primary, plainsrider = primary,
           peacemaker = secondary,
           bowie = melee, branding_iron = melee, mining_pick = melee, scalper = melee },

  -- Alesso Heist
  arena = { arena = heist.tier5,
            mateba = secondary,
            detector = melee, microphone = melee, micstand = melee, oldbaton = melee },

  -- Sokol Character Pack
  character_pack_sokol = { asval = primary,
                           hockey = melee,
                           grind_hot_1 = "Dopamine Lv1", grind_hot_2 = "Dopamine Lv2",
                           grind_hot_3 = "Dopamine Lv3", grind_hot_4 = "Dopamine Lv4",
                           grind_hot_duration = "Euphoria", grind_ap = "Endorphins" },

  -- Golden Grin Casino
  kenaz = { kenaz = heist.tier5,
            sub2000 = primary,
            croupier_rake = melee, slot_lever = melee, switchblade = melee, taser = melee },

  -- Gage Ninja Pack
  turtles = { wa2000 = primary,
              polymer = secondary, hunter = secondary,
              cqc = melee, fight = melee, tiger = melee, twins = melee,
              wpn_prj_four = throwable },

  -- Yakuza Character Pack
  dragon = { baka = secondary,
             sandsteel = melee,
             yakuza_recovery_1 = "Yoroi Irezumi Lv1", yakuza_recovery_2 = "Yoroi Irezumi Lv2",
             yakuza_recovery_3 = "Yoroi Irezumi Lv3", yakuza_speed = "Sokudo Irezumi",
             yakuza_threshold = "Ageru Irezumi" },

  -- Gage Chivalry Pack
  steel = { arblast = primary, frankish = primary, long = primary,
            beardy = melee, buck = melee, great = melee, morning = melee,
            wpn_prj_jav = throwable },

  -- Point Break Heists
  berry = { pbr = heist.tier3, pbr2 = heist.tier4,
            sparrow = secondary, iceaxe = melee, pugio = melee, selfie = melee, gator = melee },

  -- Goat Simulator
  peta = { peta = heist.tier4,
           m37 = secondary,
           pitchfork = melee, scoutknife = melee, shawn = melee, stick = melee },

  -- Wolf Pack
  pal = { pal = heist.tier2, man = heist.tier4,
          china = secondary,
          nin = melee },

  -- Sydney Character Pack
  opera = { tecci = primary,
            wing = melee,
            anarch_recovery = "Blitzkrieg Bop", anarch_armour_1 = "Rise Above Lv1",
            anarch_armour_2 = "Rise Above Lv2", anarch_armour_3 = "Rise Above Lv3",
            anarch_bullseye = "Lust for Life" },

  -- Biker Character Pack
  wild = { boot = primary,
           road = melee,
           biker_base = "Prospect", biker_armour_plus = "Tail Gunner",
           biker_health_cd = "Road Captain", biker_health_plus = "Sgt-at-Arms",
           biker_armour_cd = "Prez" },

  -- Biker Heist
  born = { born = heist.tier3,
           hajk = secondary,
           wpn_prj_hur = throwable },

  -- John Wick Weapon Pack
  pim = { desertfox = primary,
          packrat = secondary, schakal = secondary,
          wpn_prj_target = throwable },

  -- Gage Spec Ops Pack
  tango = { arbiter = secondary },

  -- Scarface Character Pack
  chico = { contraband = primary,
            cs = melee,
            kingpin_base = "Bad Guy", kingpin_prio = "Public Enemy",
            kingpin_immunity = "Balls vs Bullets", kingpin_cd = "Right to the Top" },

  -- Scarface Mansion
  friend = { friend = heist.tier5,
             ray = secondary,
             brick = melee },

  -- John Wick Heists Pack
  spa = { spa = heist.tier3, fish = heist.tier4,
          tti = primary,
          catch = melee },

  -- Gage Russian Weapon Pack
  grv = { flint = primary, siltstone = primary,
          coal = secondary,
          oxide = melee },

  -- Pencil Melee
  pn2 = { sword = melee },

  -- h3h3 Character Pack
  ecp = { ecp = primary,
          meter = melee,
          h3h3_base = "Soul Mates", h3h3_cd_1 = "Independence", h3h3_cd_2 = "Harmony",
          h3h3_absorption = "Synergy" },

  -- Border Crossing
  mex = { mex = heist.tier5, mex_cooking = heist.tier5 },

  -- San Martin Bank
  bex = { bex = heist.tier4 },

  -- Federales Weapon Pack
  afp = { x_beer = akimbo, x_czech = akimbo, x_stech = akimbo,
           beer = secondary, czech = secondary, stech = secondary },

  -- Breakfast in Tijuana
  pex = { pex = heist.tier2 },

  -- Fugitive Weapon Pack
  atw = { m60 = primary, r700 = primary, x_holt = akimbo,
          holt = secondary },

  -- Buluc's Mansion
  fex = { fex = heist.tier5 },

  -- Gunslinger Weapon Pack
  mxw = { sbl = primary, m1897 = primary, x_model3 = akimbo,
          model3 = secondary },

  -- Dragon Heist
  chas = { chas = heist.tier2 },

  -- Jiu Feng Smuggler Pack
  fawp = { m590 = primary, x_m1911 = akimbo, x_vityaz = akimbo,
           m1911 = secondary, vityaz = secondary },

  -- Jiu Feng Smuggler Pack 2
  sawp = { groza = primary, qbu88 = primary, x_pm9 = akimbo,
           pm9 = secondary },

  -- Black Cat
  chca = { chca = heist.tier4 },

  -- Jiu Feng Smuggler Pack 3
  tawp = { shak12 = primary, x_type54 = akimbo,
            rsh12 = secondary, type54 = secondary },

  -- Mountain Master
  pent = { pent = heist.tier5 },

  -- Jiu Feng Smuggler Pack 4
  lawp = { x_maxim9 = akimbo,
           fmg9 = secondary, ultima = secondary, maxim9 = secondary },

  -- Midland Ranch
  ranc = { ranc = heist.tier3 },

  -- McShay Weapon Pack
  pxp1 = { hk51b = primary,
           scout = secondary, ms3gl = secondary },

  -- McShay Weapon Pack 2
  pxp2 = { x_korth = akimbo, sko12 = primary, x_sko12 = akimbo, hailstorm = primary,
            korth = secondary  }, -- why is there an akimbo variant of a primary weapon.

  -- Hostile Takeover
  corp = { corp = heist.tier5 },

  -- McShay Weapon Pack 3
  pxp3 = { tkb = primary, hcar = primary,
           contender = secondary },

  -- Crude Awakening
  deep = { deep = heist.tier6 },

  -- McShay Weapon Pack 4
  pxp4 = { supernova = primary, kacchainsaw = primary, awp = primary }
}

local apd2_dlc

-- To avoid distributing unowned content, test for a DLC unlocker
if WinSteamDLCManager:_check_dlc_data("Fake DLC Test") or
   WinEpicDLCManager:_check_dlc_data("Fake DLC Test") or
   WINDLCManager:_check_dlc_data("Fake DLC Test") then
     log(APD2FileIdent .. "Found DLC unlocker")
     apd2_dlc = true
end

if not apd2_dlc then -- If we can't verify ownership don't give any DLC
  for dlc, _ in pairs(dlc_content) do
    if managers.dlc:is_dlc_unlocked(dlc) then
      log(APD2FileIdent .. "Found DLC " .. dlc)
      for dlc_item, dlc_target in pairs(dlc_content[dlc]) do
        if type(dlc_target) == "string" then
          apd2_upgrade_tables.perks[dlc_item]["name"] = dlc_target
        else 
          table.insert(dlc_target, dlc_item)
        end
      end
    end
  end
end

-- Remove played heists
if not apd2_data.game.victory then
  local playedHeists = {}
  
  for _, heist in ipairs(apd2_data.game.heists) do
    playedHeists[heist] = true
  end
  
  for tier, heistTable in pairs(apd2_heist_tables) do
    local newTable = {}
    for _, heist in ipairs(heistTable) do
      if not playedHeists[heist] then
        table.insert(newTable, heist)
      end
    end
    
    apd2_heist_tables[tier] = newTable
  end
end