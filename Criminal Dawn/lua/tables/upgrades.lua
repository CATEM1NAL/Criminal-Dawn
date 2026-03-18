Global.CrimDawn.tables.upgrades = {

  permaperks = {

    { -- Blending In: +1 Concealment
      "player_passive_suspicion_bonus"
    },
    { -- Second Skin: 15% reduced armor speed penalty
      "player_passive_armor_movement_penalty_multiplier"
    },
    { -- Whole Bullet: 5% damage bonus
      "weapon_passive_damage_multiplier"
    },
    { -- Walk-in Closet Lv1: Ammo pickup increased by 35%
      "player_pick_up_ammo_multiplier"
    },
    { -- Helmet Popping: 25% headshot damage bonus
      "weapon_passive_headshot_damage_multiplier"
    },
    { -- Triage: 20% faster doctor bag interactions
      "passive_doctor_bag_interaction_speed_multiplier"
    },
    { -- Walk-in Closet Lv2: Ammo pickup increased by 75%
      "player_pick_up_ammo_multiplier_2"
    },
  },

  permaskills = {

    { -- Cat Burglar: Falls inflict armor damage
      "player_fall_health_damage_multiplier"
    },
    { -- Cleaner: Can bag bodies
      "player_corpse_dispose", "player_extra_corpse_dispose_amount"
    },
    { -- Dominator: Can intimidate non-special enemies
      "player_intimidate_enemies"
    },
    { -- Drop Cloth: Enemy death alert range reduced by 95%
      "player_silent_kill"
    },
    { -- Toolkit: Repair drills and saws 25% faster
      "player_drill_fix_interaction_speed_multiplier"
    },
    { -- Die Hard: 50% damage reduction while interacting
      "player_interacting_damage_multiplier"
    },
    { -- Jack of all Trades: 100% faster deployable interactions
      "deploy_interact_faster_1", "second_deployable_1"
    },
  },

  skills = {

    -- Default Upgrades
    harmless_melee = { name = "Love Tap", desc = "First melee hit doesn't kill civs.",
                       upg_type = "general",
      "player_civ_harmless_melee"
    },
    downed_primary = { name = "Action Hero", desc = "Can use primary weapons and ADS while down.",
                       upg_type = "loud",
      "player_primary_weapon_when_downed", "player_steelsight_when_downed"
    },

    -- Mastermind Skills
    revive_damage_reduction = { name = "Combat Medic", desc = "30% damage reduction while reviving and for 5s after.",
                                upg_type = "loud",
      "player_revive_damage_reduction_1", "temporary_revive_damage_reduction_1"
    },
    inspire_shout = { name = "Inspire", desc = "Shout at downed teammates to revive (once per 20s).\nShout at living teammates to give a 20% reload/movement speed bonus for 10s.",
                      upg_type = "loud",
      "cooldown_long_dis_revive", "player_morale_boost"
    },
    hostage_absorption = { name = "Forced Friendship", desc = "+0.5 absorption per hostage (up to 8 hostages).",
                           upg_type = "loud", upg_req = "perma-skill_4",
      "team_damage_hostage_absorption"
    },
    intimidate_sounds = { name = "Control Freak", desc = "Alert sounds intimidate civs.\nIntimidated civs within 10m stay intimidated.",
                          upg_type = "general",
      "player_civ_calming_alerts", "player_intimidate_aura"
    },
    stockholm_syndrome = { name = "Stockholm Syndrome", desc = "Press jump while in custody to instantly trade a hostage (once per heist).",
                           upg_type = "loud",
      "player_super_syndrome_1"
    },
    hostage_taker = { name = "Hostage Taker", desc = "Heal 4.5% every 5 seconds if you have a hostage.",
                      upg_type = "loud", upg_req = "perma-skill_4",
      "player_hostage_health_regen_addend_2"
    },
    headshot_faster_reload = { name = "Aggressive Reload", desc = "Headshot kills give 100% reload speed for 4s (single shot SMGs/ARs/snipers).",
                               upg_type = "weapon",
      "temporary_single_shot_fast_reload_1"
    },
    headshot_ammo_return = { name = "Ammo Efficiency", desc = "2 headshots < 6 seconds returns a bullet (single shot SMGs/ARs/snipers).",
                             upg_type = "weapon",
      "head_shot_ammo_return_2"
    },
    graze = { name = "Graze", desc = "Snipers deal 20% damage (100% on headshot kill) to all enemies within 1m of bullet path.",
              upg_type = "weapon",
      "snp_graze_damage_2"
    },
    joker_1 = { name = "Joker", desc = "Can convert dominated cops.",
                upg_type = "loud", upg_req = "perma-skill_4",
      "player_convert_enemies",
      "player_convert_enemies_max_minions_1",
      "player_convert_enemies_damage_multiplier_1",
      "player_passive_convert_enemies_health_multiplier_1"
    },
    joker_2 = { name = "Cult of Personality", desc = "Converts deal 35% more damage and take 54% less.\nCan have two converts at once.",
                upg_type = "loud", upg_req = "skills-joker_1",
      "player_convert_enemies_max_minions_2",
      "player_convert_enemies_damage_multiplier_2",
      "player_passive_convert_enemies_health_multiplier_2"
    },
    joker_stats = { name = "Partners in Crime", desc = "Having a convert increases your health by 30% and movement speed by 10%.",
                    upg_type = "loud", upg_req = "skills-joker_1",
      "player_minion_master_speed_multiplier", "player_minion_master_health_multiplier"
    },

    -- Enforcer Skills
    underdog = { name = "Underdog", desc = "Deal 15% more damage and take 15% less when 3+ enemies within 18m.",
                 upg_type = "loud",
      "player_damage_multiplier_outnumbered", "player_damage_dampener_outnumbered"
    },
    shotgun_sprint_shoot = { name = "Close By", desc = "Hipfire while sprinting (shotguns).",
                             upg_type = "weapon",
      "shotgun_hip_run_and_shoot_1"
    },
    overkill = { name = "Overkill", desc = "On shotgun/saw kill gain a 75% damage bonus for 20s.",
                   upg_type = "weapon",
      "player_overkill_all_weapons", "player_overkill_damage_multiplier"
    },
    bag_penalty_armour_reduction = { name = "Pack Mule", desc = "Bag speed penalty reduced by 1% per 10 armor points.",
                                     upg_type = "general",
      "player_armor_carry_bonus_1"
    },
    shield_knock = { name = "Shock and Awe", desc = "Hitting shields can stagger them.",
                     upg_type = "loud",
      "player_shield_knock"
    },
    bullseye = { name = "Bullseye", desc = "+25 armor on headshot (2s cooldown).",
                 upg_type = "loud",
      "player_headshot_regen_armor_bonus_2"
    },
    saw_ap = { name = "Saw Destruction", desc = "Saw penetrates shields and enemy armor.",
               upg_type = "loud", count_req = "saws:1",
      "saw_ignore_shields_1", "saw_armor_piercing_chance"
    },
    saw_panic = { name = "Saw Panic", desc = "Saw kills have 50% chance to cause panic in 10m.",
                  upg_type = "loud", count_req = "saws:1",
      "saw_panic_when_kill_1"
    },
    throwable_pickup = { name = "Scrounger", desc = "+1% chance to get a throwable when picking up ammo. Resets when you find a throwable.\nEvery 6th kill drops an extra ammo box.",
                         upg_type = "loud",
      "player_regain_throwable_from_ammo_1", "player_double_drop_1"
    },

    -- Technician Skills
    silent_drill = { name = "Silent Drilling", desc = "Drills are silent.",
                     upg_type = "stealth",
      "player_drill_alert", "player_silent_drill"
    },
    drill_autorepair = { name = "Repair System", desc = "30% chance for drills to be autorestarters.",
                         upg_type = "general",
      "player_drill_autorepair_1", "player_drill_autorepair_2"
    },
    drill_melee_repair = { name = "Kickstarter", desc = "50% chance to repair drill on melee.",
                           upg_type = "general",
      "player_drill_melee_hit_restart_chance_1"
    },
    weapon_knock_down = { name = "Heavy Impact", desc = "20% chance to stagger enemies on hit.",
                          upg_type = "loud",
      "weapon_knock_down_2"
    },
    sprint_shoot = { name = "From the Hip", desc = "Hipfire while sprinting.",
                     upg_type = "weapon",
      "player_run_and_shoot_1"
    },
    lock_n_load = { name = "Lock n' Load", desc = "40% to 100% faster reload after 2 kills with automatic weapons (reduced by 1% for each bullet above 20 in mag).",
                    upg_type = "weapon",
      "player_automatic_faster_reload_1"
    },
    ap_bullets_full = { name = "Spear", desc = "Weapons pierce enemy armor.",
                        upg_type = "weapon",
      "player_ap_bullets_1"
    },
    body_expertise_1 = { name = "Body Expertise Lv1", desc = "30% headshot damage bonus on body shots.",
                         upg_type = "weapon", disable = "body_expertise_2",
      "weapon_automatic_head_shot_add_1"
    },
    body_expertise_2 = { name = "Body Expertise Lv2", desc = "90% headshot damage bonus on body shots.",
                         upg_type = "weapon", disable = "body_expertise_1",
      "weapon_automatic_head_shot_add_2"
    },

    -- Ghost Skills
    mark_unmasked = { name = "Spotter", desc = "Can mark in casing mode.",
                      upg_type = "stealth",
      "player_sec_camera_highlight_mask_off", "player_special_enemy_highlight_mask_off"
    },
    unmasked_pickup = { name = "Sleight of Hand", desc = "Can pickup small items in casing mode.",
                        upg_type = "stealth",
      "player_mask_off_pickup"
    },
    sixth_sense = { name = "Sixth Sense", desc = "Stand still for 3.5s to mark everyone in 10m.",
                    upg_type = "stealth",
      "player_standstill_omniscience"
    },
    additional_assets = { name = "Inside Man", desc = "Can buy additional assets.",
                          upg_type = "general",
      "player_additional_assets", "player_buy_bodybags_asset", "player_buy_spotter_asset"
    },
    cam_loop = { name = "Camera Loop", desc = "Can loop a camera for 25 seconds.",
                 upg_type = "stealth",
      "player_tape_loop_duration_1", "player_tape_loop_duration_2"
    },
    pick_safes = { name = "Unsafe", desc = "Can lockpick safes.",
                   upg_type = "general",
      "player_pick_lock_hard"
    },
    strafe_sprint = { name = "Moving Target Lv1", desc = "Can sprint sideways.",
                      upg_type = "general",
      "player_can_strafe_run"
    },
    free_sprint = { name = "Moving Target Lv2", desc = "Can sprint in any direction.",
                    upg_type = "general",
      "player_can_free_run"
    },
    sprint_reload = { name = "Sprint Loaded", desc = "Can sprint and reload.",
                      upg_type = "loud",
      "player_run_and_reload"
    },
    armor_broken_stagger = { name = "Dire Need", desc = "All damage dealt inflicts stagger while armor is broken (and up to 6s after it recovers).",
                             upg_type = "loud",
      "player_armor_depleted_stagger_shot_2"
    },
    shockproof_1 = { name = "Shockproof", desc = "30% chance to break taser stun every second.\nGetting tased doesn't force you to shoot.",
                     upg_type = "loud",
      "player_taser_malfunction", "player_resist_firing_tased"
    },
    shockproof_2 = { name = "Reverse Card", desc = "Interact with taser while stunned to break free.",
                     upg_type = "loud",
      "player_taser_self_shock", "player_escape_taser_1" 
    },
    sneaky_bastard = { name = "Sneaky Bastard", desc = "+1% dodge chance every point of det. risk below 35 (up to 10%).",
                       upg_type = "loud",
      "player_detection_risk_add_dodge_chance_2"
    },
    second_wind = { name = "Second Wind", desc = "Move 30% faster for 5s after armor breaks.",
                    upg_type = "general",
      "temporary_damage_speed_multiplier"
    },
    low_blow = { name = "Low Blow", desc = "+3% crit chance every point of det. risk below 35 (up to 30%).",
                 upg_type = "loud",
      "player_detection_risk_add_crit_chance_2"
    },
    hvt_1 = { name = "High Value Target", desc = "ADSing marks enemies. Marked enemies take 15% more damage.",
              upg_type = "loud",
      "weapon_steelsight_highlight_specials", "player_marked_enemy_extra_damage"
    },
    hvt_2 = { name = "Long Distance Target", desc = "Marked enemies further than 10m away take 50% more damage.",
              upg_type = "loud",
      "player_marked_inc_dmg_distance_1"
    },
    unseen_strike = { name = "Unseen Strike", desc = "Gain 35% crit chance for 18s after not taking damage for 4s.",
                      upg_type = "loud",
      "player_unseen_increased_crit_chance_2", "player_unseen_temp_increased_crit_chance_2",
    },

    -- Fugitive Skills
    pistol_acc_stack = { name = "Desperado", desc = "+10% accuracy bonus on pistol hit (up to 40%) for 10s.",
                         upg_type = "loud",
      "pistol_stacked_accuracy_bonus_1"
    },
    pistol_damage_on_hit = { name = "Trigger Happy", desc = "120% damage bonus on pistol hit for 4s.",
                             upg_type = "loud",
      "pistol_stacking_hit_damage_multiplier_1", "pistol_stacking_hit_damage_multiplier_2"
    },
    revive_swap_reload_speed = { name = "On The Brink", desc = "Reload/switch weapons 100% faster for 10s after being revived.",
                                 upg_type = "loud",
      "player_temp_swap_weapon_faster_1", "player_temp_reload_weapon_faster_1"
    },
    revive_dr_movement = { name = "Running From Death", desc = "30% damage reduction/movement speed bonus for 10s after being revived.",
                           upg_type = "loud",
      "player_temp_increased_movement_speed_1", "player_revived_damage_resist_1"
    },
    swan_song = { name = "Swan Song", desc = "Keep standing for 6s after going down.",
                  upg_type = "loud",
      "temporary_berserker_damage_multiplier_2"
    },
    swan_song_inf = { name = "Vengeful Swan", desc = "Infinite ammo while 'Swan Song' is active.",
                      upg_type = "loud", upg_req = "skills-swan_song",
      "player_berserker_no_ammo_cost"
    },
    messiah = { name = "Messiah", desc = "Can revive self on kill once per doctor bag use.",
                upg_type = "loud",
      "player_messiah_revive_from_bleed_out_1", "player_recharge_messiah_1"
    },
    feign_death = { name = "Feign Death", desc = "45% chance to revive self.",
                    upg_type = "loud",
      "player_cheat_death_chance_2"
    },
    melee_dmg_stack = { name = "Bloodthirst", desc = "+100% melee damage on weapon kill (up to 1600%). Reset on melee kill.",
                        upg_type = "weapon",
      "player_melee_damage_stacking_1"
    },
    melee_reload_speed = { name = "Mag Steal", desc = "50% faster reload for 10s on melee kill.",
                           upg_type = "weapon",
      "player_temp_melee_kill_increase_reload_speed_1"
    },
    drop_soap = { name = "Counterstrike", desc = "Charging melee blocks enemy melee attacks.",
                  upg_type = "weapon",
      "player_counter_strike_melee", "player_counter_strike_spooc"
    },
    berserker_1 = { name = "Berserker", desc = "Melee/saw damage scales with health lost.",
                    upg_type = "weapon",
      "player_melee_damage_health_ratio_multiplier"
    },
    berserker_2 = { name = "Gunserker", desc = "Weapon damage scales with health lost.",
                    upg_type = "weapon",
      "player_damage_health_ratio_multiplier"
    },
    frenzy = { name = "Frenzy", desc = "25% damage reduction but health caps at 30%.",
               upg_type = "loud",
      "player_max_health_reduction_1", "player_healing_reduction_2", "player_health_damage_reduction_2"
    },

    -- Removed
    old_stockholm = { name = "Oldholm Syndrome", desc = "Civilians can revive you.",
                      upg_type = "loud",
      "player_civilian_reviver", "player_civilian_gives_ammo"
    },

    -- Unused
    harmless_bullets = { name = "Blanks", desc = "First bullet doesn't kill civilians.",
                         upg_type = "general",
      "player_civ_harmless_bullets"
    },
    loud_and_proud = { name = "Loud and Proud", desc = "+5% damage bonus every 7 points of det. risk above 40 (up to 25%).",
                       upg_type = "loud",
      "player_detection_risk_damage_multiplier"
    },
    pager_snatch = { name = "Pager Snatch", desc = "25% chance for no pager on melee kill.",
                     upg_type = "stealth",
      "player_melee_kill_snatch_pager_chance"
    },
    hostage_boost = { name = "Hostage Boost", desc = "Hostage stat bonuses are increased by 25% when within 10m of a hostage.",
                      upg_type = "loud", upg_req = "skills-hostage_taker,perks-chief_hostage_1,perks-chief_hostage_2,",
      "player_close_to_hostage_boost"
    },
    shotgun_no_consume = { name = "Shell Dimension", desc = "3% chance to not consume ammo (shotguns).",
                           upg_type = "weapon",
      "shotgun_consume_no_ammo_chance_2"
    },
    no_bag_penalty = { name = "Beast of Burden", desc = "No bag movement penalty.",
                       upg_type = "general",
      "carry_movement_penalty_nullifier"
    },
  },

  perks = {

    -- Crew Chief
    chief_dr = { name = "Inner Strength", desc = "8% damage reduction (crew). You gain an extra 8% below 50% health.",
                 upg_type = "stat",
      "team_damage_reduction_1", "player_passive_damage_reduction_1"
    },
    chief_stamina = { name = "Marathon Man", desc = "50% stamina bonus (crew).",
                      upg_type = "stat",
      "team_passive_stamina_multiplier_1"
    },
    chief_shout_distance = { name = "Deep Throat", desc = "Shout distance increased by 25%.",
                             upg_type = "stat",
      "player_passive_intimidate_range_mul"
    },
    chief_health = { name = "Wolf Pack", desc = "10% health bonus (crew).",
                     upg_type = "stat",
      "team_passive_health_multiplier"
    },
    chief_armour = { name = "Testudo", desc = "5% armor bonus (crew).",
                     upg_type = "stat",
      "team_passive_armor_multiplier"
    },
    chief_hostage_1 = { name = "Hostage Situation", desc = "6% crew health bonus/12% crew stamina bonus per hostage (up to 4 hostages).",
                        upg_type = "ability", upg_req = "perma-skill_4",
      "team_hostage_health_multiplier", "team_hostage_stamina_multiplier"
    },
    chief_hostage_2 = { name = "Human Shield", desc = "8% damage reduction while you have a hostage.",
                        upg_type = "ability", upg_req = "perma-skill_4",
      "team_hostage_damage_dampener_multiplier"
    },

    -- Muscle
    muscle_health_1 = { name = "Brute Strength Lv1", desc = "10% health bonus.",
                        upg_type = "stat", disable = "muscle_health_2,muscle_health_3,muscle_health_4,muscle_health_5",
      "player_passive_health_multiplier_1"
    },
    muscle_health_2 = { name = "Brute Strength Lv2", desc = "20% health bonus.",
                        upg_type = "stat", disable = "muscle_health_1,muscle_health_3,muscle_health_4,muscle_health_5",
      "player_passive_health_multiplier_2"
    },
    muscle_health_3 = { name = "Brute Strength Lv3", desc = "40% health bonus.",
                        upg_type = "stat", disable = "muscle_health_1,muscle_health_2,muscle_health_4,muscle_health_5",
      "player_passive_health_multiplier_3"
    },
    muscle_health_4 = { name = "Brute Strength Lv4", desc = "80% health bonus.",
                        upg_type = "stat", disable = "muscle_health_1,muscle_health_2,muscle_health_3,muscle_health_5",
      "player_passive_health_multiplier_4"
    },
    muscle_health_5 = { name = "Brute Strength Lv5", desc = "100% health bonus.",
                        upg_type = "stat", disable = "muscle_health_1,muscle_health_2,muscle_health_3,muscle_health_4",
      "player_passive_health_multiplier_5"
    },
    muscle_prio = { name = "Meat Shield", desc = "Target priority increased by 15%.",
                    upg_type = "stat",
      "player_uncover_multiplier"
    },
    muscle_panic = { name = "Disturbing the Peace", desc = "Suppressed enemies can panic.",
                     upg_type = "ability",
      "player_panic_suppression"
    },
    muscle_regen = { name = "800-pound Gorilla", desc = "Heal 3% every 5s.",
                     upg_type = "ability",
      "player_passive_health_regen"
    },

    -- Armorer
    armorer_1 = { name = "Impact Plate Lv1", desc = "5% armor bonus.",
                  upg_type = "stat", disable = "armorer_2,armorer_3,armorer_4,armorer_6",
      "player_tier_armor_multiplier_1"
    },
    armorer_2 = { name = "Impact Plate Lv2", desc = "10% armor bonus.",
                  upg_type = "stat", disable = "armorer_1,armorer_3,armorer_4,armorer_6",
      "player_tier_armor_multiplier_2"
    },
    armorer_3 = { name = "Impact Plate Lv3", desc = "20% armor bonus.",
                  upg_type = "stat", disable = "armorer_1,armorer_2,armorer_4,armorer_6",
      "player_tier_armor_multiplier_3"
    },
    armorer_4 = { name = "Impact Plate Lv4", desc = "30% armor bonus.",
                  upg_type = "stat", disable = "armorer_1,armorer_2,armorer_3,armorer_6",
      "player_tier_armor_multiplier_4"
    },
    armorer_6 = { name = "Impact Plate Lv5", desc = "35% armor bonus.",
                  upg_type = "stat", disable = "armorer_1,armorer_2,armorer_3,armorer_4",
      "player_tier_armor_multiplier_6"
    },
    armorer_recovery = { name = "Tank", desc = "10% faster armor recovery.",
                         upg_type = "stat", disable = "anarch_recovery,stoic_armor_convert",
      "player_armor_regen_timer_multiplier_passive"
    },
    armorer_immunity = { name = "Hardy", desc = "Immunity for 2s on armor break.",
                         upg_type = "ability",
      "temporary_armor_break_invulnerable_1"
    },
    armorer_team_recovery = { name = "Liquid Armor", desc = "10% faster armor recovery (crew).",
                              upg_type = "stat",
      "team_passive_armor_regen_time_multiplier"
    },

    -- Rogue
    rogue_dodge_1 = { name = "Evasive Lv1", desc = "+15% dodge chance.",
                      upg_type = "stat", disable = "rogue_dodge_2,rogue_dodge_3",
      "player_passive_dodge_chance_1"
    },
    rogue_dodge_2 = { name = "Evasive Lv2", desc = "+30% dodge chance.",
                      upg_type = "stat", disable = "rogue_dodge_1,rogue_dodge_3",
      "player_passive_dodge_chance_2"
    },
    rogue_dodge_3 = { name = "Evasive Lv3", desc = "+45% dodge chance.",
                      upg_type = "stat", disable = "rogue_dodge_1,rogue_dodge_2",
      "player_passive_dodge_chance_3"
    },
    rogue_prio = { name = "Elusive", desc = "Target priority reduced by 15%.",
                   upg_type = "stat",
      "player_camouflage_multiplier"
    },
    rogue_ap = { name = "Killer Instinct", desc = "25% chance to pierce enemy armor.",
                 upg_type = "stat",
      "weapon_passive_armor_piercing_chance"
    },
    rogue_swap_speed = { name = "Holster", desc = "80% faster weapon switch speed.",
                         upg_type = "stat",
      "weapon_passive_swap_speed_multiplier_1"
    },

    -- Hitman
    hitman_recovery_1 = { name = "Recovery Lv1", desc = "5% faster armor recovery.",
                          upg_type = "stat",
                          disable = "hitman_recovery_2,hitman_recovery_3,hitman_recovery_4,hitman_recovery_5,anarch_recovery,stoic_armor_convert",
      "player_perk_armor_regen_timer_multiplier_1"
    },
    hitman_recovery_2 = { name = "Recovery Lv2", desc = "15% faster armor recovery.",
                          upg_type = "stat",
                          disable = "hitman_recovery_1,hitman_recovery_3,hitman_recovery_4,hitman_recovery_5,anarch_recovery,stoic_armor_convert",
      "player_perk_armor_regen_timer_multiplier_2"
    },
    hitman_recovery_3 = { name = "Recovery Lv3", desc = "25% faster armor recovery.",
                          upg_type = "stat",
                          disable = "hitman_recovery_1,hitman_recovery_2,hitman_recovery_4,hitman_recovery_5,anarch_recovery,stoic_armor_convert",
      "player_perk_armor_regen_timer_multiplier_3"
    },
    hitman_recovery_4 = { name = "Recovery Lv4", desc = "35% faster armor recovery.",
                          upg_type = "stat",
                          disable = "hitman_recovery_1,hitman_recovery_2,hitman_recovery_3,hitman_recovery_5,anarch_recovery,stoic_armor_convert",
      "player_perk_armor_regen_timer_multiplier_4"
    },
    hitman_recovery_5 = { name = "Recovery Lv5", desc = "45% faster armor recovery.",
                          upg_type = "stat",
                          disable = "hitman_recovery_1,hitman_recovery_2,hitman_recovery_3,hitman_recovery_4,anarch_recovery,stoic_armor_convert",
      "player_perk_armor_regen_timer_multiplier_5"
    },
    hitman_recovery_6 = { name = "Tooth and Claw", desc = "Armor recovery cannot be delayed.",
                          upg_type = "ability", disable = "anarch_recovery,stoic_armor_convert",
      "player_passive_always_regen_armor_1"
    },

    -- Crook
    crook_lbv_dodge_1 = { name = "LBV Composure Lv1", desc = "+5% dodge chance (lightweight ballistic vest).",
                          upg_type = "stat", item_req = "body_armor1", disable = "crook_lbv_dodge_2,crook_lbv_dodge_3",
      "player_level_2_dodge_addend_1"
    },
    crook_lbv_dodge_2 = { name = "LBV Composure Lv2", desc = "+15% dodge chance (lightweight ballistic vest).",
                          upg_type = "stat", item_req = "body_armor1", disable = "crook_lbv_dodge_1,crook_lbv_dodge_3",
      "player_level_2_dodge_addend_1", "player_level_2_dodge_addend_2"
    },
    crook_lbv_dodge_3 = { name = "LBV Composure Lv3", desc = "+25% dodge chance (lightweight ballistic vest).",
                          upg_type = "stat", item_req = "body_armor1", disable = "crook_lbv_dodge_1,crook_lbv_dodge_2",
      "player_level_2_dodge_addend_1", "player_level_2_dodge_addend_2", "player_level_2_dodge_addend_3"
    },
    crook_lbv_armour_1 = { name = "LBV Impact Lv1", desc = "20% armor bonus (lightweight ballistic vest).",
                           upg_type = "stat", item_req = "body_armor1", disable = "crook_lbv_armour_2,crook_lbv_armour_3",
      "player_level_2_armor_multiplier_1"
    },
    crook_lbv_armour_2 = { name = "LBV Impact Lv2", desc = "40% armor bonus (lightweight ballistic vest).",
                           upg_type = "stat", item_req = "body_armor1", disable = "crook_lbv_armour_1,crook_lbv_armour_3",
      "player_level_2_armor_multiplier_2"
    },
    crook_lbv_armour_3 = { name = "LBV Impact Lv3", desc = "65% armor bonus (lightweight ballistic vest).",
                           upg_type = "stat", item_req = "body_armor1", disable = "crook_lbv_armour_1,crook_lbv_armour_2",
      "player_level_2_armor_multiplier_3"
    },
    crook_vest_dodge_1 = { name = "Vest Composure Lv1", desc = "+5% dodge chance (ballistic vest).",
                           upg_type = "stat", item_req = "body_armor2", disable = "crook_vest_dodge_2,crook_vest_dodge_3",
      "player_level_3_dodge_addend_1"
    },
    crook_vest_dodge_2 = { name = "Vest Composure Lv2", desc = "+15% dodge chance (ballistic vest).",
                           upg_type = "stat", item_req = "body_armor2", disable = "crook_vest_dodge_1,crook_vest_dodge_3",
      "player_level_3_dodge_addend_1", "player_level_3_dodge_addend_2"
    },
    crook_vest_dodge_3 = { name = "Vest Composure Lv3", desc = "+25% dodge chance (ballistic vest).",
                           upg_type = "stat", item_req = "body_armor2", disable = "crook_vest_dodge_1,crook_vest_dodge_2",
      "player_level_3_dodge_addend_1", "player_level_3_dodge_addend_2", "player_level_3_dodge_addend_3"
    },
    crook_vest_armour_1 = { name = "Vest Impact Lv1", desc = "20% armor bonus (ballistic vest).",
                            upg_type = "stat", item_req = "body_armor2", disable = "crook_vest_armour_2,crook_vest_armour_2",
      "player_level_3_armor_multiplier_1"
    },
    crook_vest_armour_2 = { name = "Vest Impact Lv2", desc = "40% armor bonus (ballistic vest).",
                            upg_type = "stat", item_req = "body_armor2", disable = "crook_vest_armour_1,crook_vest_armour_3",
      "player_level_3_armor_multiplier_2"
    },
    crook_vest_armour_3 = { name = "Vest Impact Lv3", desc = "65% armor bonus (ballistic vest).",
                            upg_type = "stat", item_req = "body_armor2", disable = "crook_vest_armour_1,crook_vest_armour_2",
      "player_level_3_armor_multiplier_3"
    },
    crook_hbv_dodge_1 = { name = "HBV Composure Lv1", desc = "+5% dodge chance (heavy ballistic vest).",
                          upg_type = "stat", item_req = "body_armor3", disable = "crook_hbv_dodge_2,crook_hbv_dodge_3",
      "player_level_4_dodge_addend_1"
    },
    crook_hbv_dodge_2 = { name = "HBV Composure Lv2", desc = "+15% dodge chance (heavy ballistic vest).",
                          upg_type = "stat", item_req = "body_armor3", disable = "crook_hbv_dodge_1,crook_hbv_dodge_3",
      "player_level_4_dodge_addend_1", "player_level_4_dodge_addend_2"
    },
    crook_hbv_dodge_3 = { name = "HBV Composure Lv3", desc = "+25% dodge chance (heavy ballistic vest).",
                          upg_type = "stat", item_req = "body_armor3", disable = "crook_hbv_dodge_1,crook_hbv_dodge_2",
      "player_level_4_dodge_addend_1", "player_level_4_dodge_addend_2", "player_level_4_dodge_addend_3"
    },
    crook_hbv_armour_1 = { name = "HBV Composure Lv1", desc = "+5% dodge chance (heavy ballistic vest).",
                          upg_type = "stat", item_req = "body_armor3", disable = "crook_hbv_armour_2,crook_hbv_armour_3",
      "player_level_4_armor_multiplier_1"
    },
    crook_hbv_armour_2 = { name = "HBV Composure Lv2", desc = "+15% dodge chance (heavy ballistic vest).",
                          upg_type = "stat", item_req = "body_armor3", disable = "crook_hbv_armour_1,crook_hbv_armour_3",
      "player_level_4_armor_multiplier_2"
    },
    crook_hbv_armour_3 = { name = "HBV Composure Lv3", desc = "+25% dodge chance (heavy ballistic vest).",
                          upg_type = "stat", item_req = "body_armor3", disable = "crook_hbv_armour_1,crook_hbv_armour_2",
      "player_level_4_armor_multiplier_3"
    },
    crook_recovery = { name = "Composure", desc = "10% faster armor recovery.",
                       upg_type = "stat", disable = "anarch_recovery,stoic_armor_convert",
      "player_armor_regen_timer_multiplier_tier"
    },

    -- Burglar
    burglar_dodge_1 = { name = "INVALID", desc = "+20% dodge chance.",
                        upg_type = "stat", disable = "burglar_dodge_2,burglar_dodge_3",
      "player_tier_dodge_chance_1"
    },
    burglar_dodge_2 = { name = "INVALID", desc = "+25% dodge chance.",
                        upg_type = "stat", disable = "burglar_dodge_1,burglar_dodge_3",
      "player_tier_dodge_chance_2"
    },
    burglar_dodge_3 = { name = "INVALID", desc = "+30% dodge chance.",
                        upg_type = "stat", disable = "burglar_dodge_1,burglar_dodge_2",
      "player_tier_dodge_chance_3"
    },
    burglar_prio_1 = { name = "INVALID", desc = "Target priority reduced by 10% while crouching and stationary.",
                       upg_type = "stat", disable = "burglar_prio_2,burglar_prio_3",
      "player_stand_still_crouch_camouflage_bonus_1"
    },
    burglar_prio_2 = { name = "INVALID", desc = "Target priority reduced by 15% while crouching and stationary.",
                       upg_type = "stat", disable = "burglar_prio_1,burglar_prio_3",
      "player_stand_still_crouch_camouflage_bonus_2"
    },
    burglar_prio_3 = { name = "INVALID", desc = "Target priority reduced by 20% while crouching and stationary.",
                       upg_type = "stat", disable = "burglar_prio_1,burglar_prio_2",
      "player_stand_still_crouch_camouflage_bonus_3"
    },
    burglar_bag_speed = { name = "INVALID", desc = "20% faster body bag speed.",
                          upg_type = "ability",
      "player_corpse_dispose_speed_multiplier"
    },
    burglar_lockpick_speed = { name = "INVALID", desc = "20% faster lockpick speed.",
                               upg_type = "ability",
      "player_pick_lock_speed_multiplier"
    },
    burglar_pager_speed = { name = "INVALID", desc = "10% faster pager answering speed.",
                            upg_type = "ability",
      "player_alarm_pager_speed_multiplier"
    },
    burglar_recovery = { name = "INVALID", desc = "20% faster armor recovery while crouching and stationary.",
                         upg_type = "stat", disable = "anarch_recovery,stoic_armor_convert",
      "player_armor_regen_timer_stand_still_multiplier"
    },

    -- Infiltrator
    infil_overdog = { name = "INVALID", desc = "12% damage reduction when 3+ enemies within 18m.",
                      upg_type = "ability",
      "player_damage_dampener_outnumbered_strong"
    },
    infil_single_dog_1 = { name = "INVALID", desc = "8% damage reduction when an enemy is within 18m.",
                           upg_type = "ability", disable = "infil_single_dog_2,infil_single_dog_3",
      "player_damage_dampener_close_contact_1"
    },
    infil_single_dog_2 = { name = "INVALID", desc = "16% damage reduction when an enemy is within 18m.",
                           upg_type = "ability", disable = "infil_single_dog_1,infil_single_dog_3",
      "player_damage_dampener_close_contact_2"
    },
    infil_single_dog_3 = { name = "INVALID", desc = "24% damage reduction when an enemy is within 18m.",
                           upg_type = "ability", disable = "infil_single_dog_1,infil_single_dog_2",
      "player_damage_dampener_close_contact_3"
    },
    infil_melee_boost = { name = "INVALID", desc = "10x damage on melee hits performed within 1 second.",
                          upg_type = "ability",
      "melee_stacking_hit_damage_multiplier_1"
    },
    infil_melee_timer = { name = "INVALID", desc = "Psychopath timer increased to 7 seconds.",
                          upg_type = "stat", upg_req = "perks-infil_melee_boost",
      "melee_stacking_hit_expire_t"
    },
    infil_melee_heal = { name = "INVALID", desc = "Heal 20% on melee hit (10s cooldown).",
                         upg_type = "ability",
      "player_melee_life_leech"
    },

    -- Sociopath
    socio_armor_1 = { name = "INVALID", desc = "+30 armor on kill.",
                      upg_type = "ability", disable = "stoic_armor_convert",
      "player_killshot_regen_armor_bonus"
    },
    socio_heal = { name = "INVALID", desc = "Heal 10% on melee kill.",
                   upg_type = "ability",
      "player_melee_kill_life_leech"
    },
    socio_armor_2 = { name = "INVALID", desc = "+30 armor on kills within 18m (1s cooldown).",
                      upg_type = "ability", disable = "stoic_armor_convert",
      "player_killshot_close_regen_armor_bonus"
    },
    socio_panic = { name = "INVALID", desc = "75% chance to cause panic on kills within 18m (1s cooldown).",
                    upg_type = "ability",
      "player_killshot_close_panic_chance"
    },

    -- Gambler
    gambler_heal_1 = { name = "Medical Supplies Lv1", desc = "Heal 16-24 health on ammo pickup (once per 3s).",
                       upg_type = "ability", disable = "gambler_heal_2,gambler_heal_3", 
      "temporary_loose_ammo_restore_health_1"
    },
    gambler_heal_2 = { name = "Medical Supplies Lv2", desc = "Heal 24-32 health on ammo pickup (once per 3s).",
                       upg_type = "ability", disable = "gambler_heal_1,gambler_heal_3", 
      "temporary_loose_ammo_restore_health_2"
    },
    gambler_heal_3 = { name = "Medical Supplies Lv3", desc = "Heal 32-40 health on ammo pickup (once per 3s).",
                       upg_type = "ability", disable = "gambler_heal_1,gambler_heal_2", 
      "temporary_loose_ammo_restore_health_3"
    },
    gambler_mag_throw = { name = "Mag Throw", desc = "Picking up ammo triggers half an ammo pickup for the crew (once per 5s).",
                          upg_type = "ability", upg_req = "perks-gambler_heal_1,perks-gambler_heal_2,perks-gambler_heal_3",
      "temporary_loose_ammo_give_team"
    },
    gambler_heal_team = { name = "Sharing is Caring", desc = "50% of healing from 'Medical Supplies' is given to the crew.",
                          upg_type = "stat", upg_req = "perks-gambler_heal_1,perks-gambler_heal_2,perks-gambler_heal_3",
      "player_loose_ammo_restore_health_give_team"
    },

    -- Grinder
    grind_hot_1 = { name = "INVALID", desc = "+1 health every 0.3s for 3s on damage dealt (1.5s cooldown, req. suit/lightweight ballistic vest).",
                    upg_type = "ability", disable = "grind_hot_2,grind_hot_3,grind_hot_4",
      "player_damage_to_hot_1"
    },
    grind_hot_2 = { name = "INVALID", desc = "+2 health every 0.3s for 3s on damage dealt (1.5s cooldown, req. suit/lightweight ballistic vest).",
                    upg_type = "ability", disable = "grind_hot_1,grind_hot_3,grind_hot_4",
      "player_damage_to_hot_2"
    },
    grind_hot_3 = { name = "INVALID", desc = "+3 health every 0.3s for 3s on damage dealt (1.5s cooldown, req. suit/lightweight ballistic vest).",
                    upg_type = "ability", disable = "grind_hot_1,grind_hot_2,grind_hot_4",
      "player_damage_to_hot_3"
    },
    grind_hot_4 = { name = "INVALID", desc = "+4 health every 0.3s for 3s on damage dealt (1.5s cooldown, req. suit/lightweight ballistic vest).",
                    upg_type = "ability", disable = "grind_hot_1,grind_hot_2,grind_hot_3",
      "player_damage_to_hot_4"
    },
    grind_ap = { name = "INVALID", desc = "30% chance to pierce enemy armor.",
                 upg_type = "stat",
      "player_armor_piercing_chance_2"
    },
    grind_hot_duration = { name = "INVALID", desc = "'Dopamine' lasts 40% longer.",
                           upg_type = "stat", upg_req = "perks-grind_hot_1,perks-grind_hot_2,perks-grind_hot_3,perks-grind_hot_4",
      "player_damage_to_hot_extra_ticks"
    },

    -- Yakuza
    yakuza_recovery_1 = { name = "INVALID", desc = "Armor recovery scales with health lost (up to 20% faster).",
                          upg_type = "ability", disable = "yakuza_recovery_2,yakuza_recovery_3,anarch_recovery,stoic_armor_convert",
      "player_armor_regen_damage_health_ratio_multiplier_1"
    },
    yakuza_recovery_2 = { name = "INVALID", desc = "Armor recovery scales with health lost (up to 40% faster).",
                          upg_type = "ability", disable = "yakuza_recovery_1,yakuza_recovery_3,anarch_recovery,stoic_armor_convert",
      "player_armor_regen_damage_health_ratio_multiplier_2"
    },
    yakuza_recovery_3 = { name = "INVALID", desc = "Armor recovery scales with health lost (up to 60% faster).",
                          upg_type = "ability", disable = "yakuza_recovery_1,yakuza_recovery_2,anarch_recovery,stoic_armor_convert",
      "player_armor_regen_damage_health_ratio_multiplier_3"
    },
    yakuza_speed = { name = "INVALID", desc = "Movement speed scales with health lost (up to 20% faster).",
                     upg_type = "ability",
      "player_movement_speed_damage_health_ratio_multiplier"
    },
    yakuza_threshold = { name = "INVALID", desc = "'Irezumi' effects start from 50% health instead of 25%.",
                         upg_type = "stat", upg_req = "perks-yakuza_recovery_1,perks-yakuza_recovery_2,perks-yakuza_recovery_3,perks-yakuza_speed",
      "player_armor_regen_damage_health_ratio_threshold_multiplier", "player_movement_speed_damage_health_ratio_threshold_multiplier"
    },

    -- Ex-Pres
    expres_1 = { name = "Break Lv1", desc = "Store 4 health per kill that is consumed on armor recovery.",
                 upg_type = "ability", disable = "expres_2,expres_3,stoic_armor_convert",
      "player_armor_health_store_amount_1"
    },
    expres_2 = { name = "Break Lv2", desc = "Store 8 health per kill that is consumed on armor recovery.",
                 upg_type = "ability", disable = "expres_1,expres_3,stoic_armor_convert",
      "player_armor_health_store_amount_2"
    },
    expres_3 = { name = "Break Lv3", desc = "Store 12 health per kill that is consumed on armor recovery.",
                 upg_type = "ability", disable = "expres_1,expres_2,stoic_armor_convert",
      "player_armor_health_store_amount_3"
    },
    expres_cap = { name = "Life of Ice", desc = "'Break' can store 50% more health.",
                   upg_type = "stat", upg_req = "perks-expres_1,perks-expres_2,perks-expres_3",
      "player_armor_max_health_store_multiplier"
    },
    expres_recovery = { name = "Perfect Line", desc = "Kills increase speed of next armor recovery. Weaker armors give more speed.",
                        upg_type = "ability", disable = "anarch_recovery,stoic_armor_convert",
      "player_kill_change_regenerate_speed"
    },

    -- Maniac
    maniac_base = { name = "Excitement", desc = "Every 4 seconds gain 1 damage absorption (up to 20) for every 30 damage dealt, decaying after 8 seconds.",
                    upg_type = "ability",
      "player_cocaine_stacking_1", "player_sync_cocaine_stacks"
    },
    maniac_decay = { name = "Fervor", desc = "Decay from 'Excitement' is reduced.",
                     upg_type = "stat", upg_req = "perks-maniac_base",
      "player_cocaine_stacks_decay_multiplier_1"
    },
    maniac_cap = { name = "Recklessness", desc = "Damage needed for 'Excitement' is reduced to 25 (max 24 absorption).",
                   upg_type = "stat", upg_req = "perks-maniac_base",
      "player_sync_cocaine_upgrade_level_1"
    },
    maniac_boost = { name = "Insanity", desc = "Damage absorption from 'Excitement' is doubled.",
                     upg_type = "stat", upg_req = "perks-maniac_base",
      "player_cocaine_stack_absorption_multiplier_1"
    },
    
    -- Anarchist
    anarch_recovery = { name = "INVALID", desc = "Armor continuously recovers. Weaker armors recover faster.",
                        upg_type = "ability", disable = "stoic_armor_convert,armorer_recovery,expres_recovery,yakuza_recovery_1,yakuza_recovery_2,yakuza_recovery_3," ..
                        "burglar_recovery,crook_recovery,hitman_recovery_1,hitman_recovery_2,hitman_recovery_3,hitman_recovery_4,hitman_recovery_5," ..
                        "hitman_recovery_6,armorer_recovery",
      "player_armor_grinding_1"
    },
    anarch_armour_1 = { name = "INVALID", desc = "Health reduced by 50%, armor increased by 100% of max health.",
                        upg_type = "stat", disable = "anarch_armour_2,anarch_armour_3",
      "player_armor_increase_1", "player_health_decrease_1"
    },
    anarch_armour_2 = { name = "INVALID", desc = "Health reduced by 50%, armor increased by 110% of max health.",
                        upg_type = "stat", disable = "anarch_armour_1,anarch_armour_3",
      "player_armor_increase_2", "player_health_decrease_1"
    },
    anarch_armour_3 = { name = "INVALID", desc = "Health reduced by 50%, armor increased by 120% of max health.",
                        upg_type = "stat", disable = "anarch_armour_1,anarch_armour_2",
      "player_armor_increase_3", "player_health_decrease_1"
    },
    anarch_bullseye = { name = "INVALID", desc = "+10 armor on damage dealt (1.5s cooldown).",
                        upg_type = "ability", disable = "stoic_armor_convert",
      "player_damage_to_armor_1"
    },

    -- Biker
    biker_base = { name = "INVALID", desc = "+5 health/armor on kill (up to 4 times in 4 seconds).",
                   upg_type = "ability",
      "player_wild_health_amount_1", "player_wild_armor_amount_1"
    },
    biker_armour_plus = { name = "INVALID", desc = "+1 armor on kill per 10% health lost.",
                          upg_type = "stat", disable = "stoic_armor_convert",
      "player_less_health_wild_armor_1"
    },
    biker_health_cd = { name = "INVALID", desc = "'Prospect' cooldown reduced by 0.1s per 10% health lost.",
                        upg_type = "stat", upg_req = "perks-biker_base",
      "player_less_health_wild_cooldown_1"
    },
    biker_health_plus = { name = "INVALID", desc = "+1 health on kill per 10% armor lost.",
                          upg_type = "stat",
      "player_less_armor_wild_health_1"
    },
    biker_armour_cd = { name = "INVALID", desc = "'Prospect' cooldown reduced by 0.1s per 10% armor lost.",
                        upg_type = "stat", upg_req = "perks-biker_base",
      "player_less_armor_wild_cooldown_1"
    },

    -- Kingpin
    kingpin_base = { name = "INVALID", desc = "Can equip injector.",
                     upg_type = "ability",
      "chico_injector", "temporary_chico_injector_1"
    },
    kingpin_prio = { name = "INVALID", desc = "Target priority increased while injector is active.",
                     upg_type = "stat", upg_req = "perks-kingpin_base",
      "player_chico_preferred_target"
    },
    kingpin_immunity = { name = "INVALID", desc = "Injector heals additional 25% of all damage taken below 50% health while active.",
                         upg_type = "stat", upg_req = "perks-kingpin_base",
      "player_chico_injector_low_health_multiplier"
    },
    kingpin_cd = { name = "INVALID", desc = "Injector cooldown reduced by 1s for every 5 health gained at max health while active.",
                   upg_type = "stat", upg_req = "perks-kingpin_base",
      "player_chico_injector_health_to_speed"
    },

    -- Sicario
    sicario_base = { name = "Smoker", desc = "Can equip smoke bomb.",
                     upg_type = "ability",
      "smoke_screen_grenade"
    },
    sicario_dodge_stack = { name = "Twitch", desc = "+20% dodge chance when shot. Resets on dodge (4s cooldown).",
                            upg_type = "ability",
      "player_dodge_shot_gain"
    },
    sicario_recovery = { name = "Agility Shield", desc = "Dodging recovers armor.",
                         upg_type = "ability", disable = "stoic_armor_convert",
      "player_dodge_replenish_armor"
    },
    sicario_boost = { name = "Unseen Shadow", desc = "Smoke bomb effects are doubled.",
                      upg_type = "stat", upg_req = "perks-sicario_base",
      "player_sicario_multiplier"
    },

    -- Stoic
    stoic_base = { name = "Virtue", desc = "75% damage reduction. Damage is applied over 12 seconds.",
                   upg_type = "ability",
      "damage_control", "player_damage_control_passive", "player_damage_control_cooldown_drain_1"
    },
    stoic_cd = { name = "Imperturbable", desc = "Hip flask cooldown reduced by 2s on kill when below 35% health.",
                 upg_type = "stat", upg_req = "perks-stoic_base",
      "player_damage_control_cooldown_drain_2"
    },
    stoic_armor_convert = { name = "Unmoved", desc = "Armor is converted into health.",
                            upg_type = "stat", count = "armor:1",

                            disable = "anarch_recovery,armorer_recovery,expres_recovery,yakuza_recovery_1,yakuza_recovery_2,yakuza_recovery_3," ..
                            "burglar_recovery,crook_recovery,hitman_recovery_1,hitman_recovery_2,hitman_recovery_3,hitman_recovery_4,hitman_recovery_5," ..
                            "hitman_recovery_6,armorer_recovery,anarch_bullseye,biker_armour_plus,sicario_recovery,expres_1,expres_2,expres_3," ..
                            "socio_armor_1,socio_armor_2",
                            -- perks involving armour regen make no sense to be combined with this

                            upg_req = "perks-stoic_base,perks-grind_hot_1,perks-grind_hot_2,perks-grind_hot_3,perks-grind_hot_4,perks-gambler_heal_1," ..
                            "perks-gambler_heal_2,perks-gambler_heal_3,perks-muscle_regen,perks-biker_base,perks-h3h3_base,perks-socio_heal," ..
                            "perks-infil_melee_heal,perks-kingpin_immunity,perks-hacker_heal,perks-leech_base,perks-copycat_bullseye,skills-hostage_taker",
                            -- basically any source of healing is required for this, otherwise it's guaranteed death

      "player_armor_to_health_conversion"
    },
    stoic_negate = { name = "Calm", desc = "Lingering damage from 'Virtue' is negated after not taking damage for 4s.",
                     upg_type = "stat", upg_req = "perks-stoic_base",
      "player_damage_control_auto_shrug"
    },
    stoic_heal = { name = "Enduring", desc = "50% of lingering damage from 'Virtue' is healed when damage is negated.",
                   upg_type = "stat", upg_req = "perks-stoic_base",
      "player_damage_control_healing"
    },

    -- Tag Team
    h3h3_base = { name = "INVALID", desc = "Can equip gas dispenser.",
                  upg_type = "ability",
      "tag_team", "player_tag_team_base", "player_tag_team_cooldown_drain_1"
    },
    h3h3_cd = { name = "INVALID", desc = "Gas dispenser tag kills reduce cooldown by 2s on kill.",
                upg_type = "stat", upg_req = "perks-h3h3_base",
      "player_tag_team_cooldown_drain_2"
    },
    h3h3_absorption = { name = "INVALID", desc = "+2 damage absorption on kill (up to 20) while gas dispenser is active.",
                        upg_type = "stat", upg_req = "perks-h3h3_base",
      "player_tag_team_damage_absorption"
    },

    -- Hacker
    hacker_base = { name = "Code Glitch", desc = "Unlock the pocket ECM.",
                    upg_type = "ability",
      "pocket_ecm_jammer", "player_pocket_ecm_jammer_base"
    },
    hacker_heal = { name = "Bit Decay", desc = "+20 health on kill while pocket ECM is active.",
                    upg_type = "stat", upg_req = "perks-hacker_base",
      "player_pocket_ecm_heal_on_kill_1"
    },
    hacker_dodge = { name = "Kluge", desc = "+20% dodge chance on kill for 30s while pocket ECM is active.",
                     upg_type = "stat", upg_req = "perks-hacker_base",
      "player_pocket_ecm_kill_dodge_1"
    },
    hacker_team_heal = { name = "Botnet", desc = "Crew gains 10 health on kill while pocket ECM is active.",
                         upg_type = "stat", upg_req = "perks-hacker_base",
      "team_pocket_ecm_heal_on_kill_1"
    },

    -- Leech
    leech_base = { name = "Momentum", desc = "Unlocks the leech ampule.",
                   upg_type = "ability",
      "copr_ability", "temporary_copr_ability_1", "player_copr_static_damage_ratio_1", "player_copr_kill_life_leech_1",
      "player_copr_activate_bonus_health_ratio_1", "player_copr_teammate_heal_1"
    },
    leech_duration = { name = "Stalwart", desc = "Leech ampule lasts 10 seconds.",
                       upg_type = "stat", upg_req = "perks-leech_base",
      "temporary_copr_ability_2"
    },
    leech_segments = { name = "", desc = "Leech ampule splits health into segments of 10%.",
                       upg_type = "stat", upg_req = "perks-leech_base",
      "player_copr_static_damage_ratio_2", "player_copr_kill_life_leech_2"
    },
    leech_swan_song = { name = "Indomitable", desc = "Going down reduces movement speed by 80% while leech ampule is active.",
                        upg_type = "stat", upg_req = "perks-leech_base",
      "player_copr_out_of_health_move_slow_1"
    },
    leech_cd = { name = "", desc = "Kills reduce leech ampule cooldown by 1s.",
                 upg_type = "stat", upg_req = "perks-leech_base",
      "player_copr_speed_up_on_kill_1"
    },
    leech_revive = { name = "Symbiosis", desc = "Leech ampule can be used while down, but you will go back down unless you revive a teammate or use a doctor bag.",
                     upg_type = "stat", upg_req = "perks-leech_base",
      "player_activate_ability_downed"
    },

    -- Copycat
    copycat_health = { name = "Thriving", desc = "80% health bonus",
                       upg_type = "stat",
      "mrwi_health_multiplier_1", "mrwi_health_multiplier_2", "mrwi_health_multiplier_3", "mrwi_health_multiplier_4"
    },
    copycat_armour = { name = "Toughen Up", desc = "20% armor bonus.",
                       upg_type = "stat",
      "mrwi_armor_multiplier_1", "mrwi_armor_multiplier_2", "mrwi_armor_multiplier_3", "mrwi_armor_multiplier_4"
    },
    copycat_dodge = { name = "Cat-Like Reflex", desc = "+20% dodge chance.",
                      upg_type = "stat",
      "mrwi_dodge_chance_1", "mrwi_dodge_chance_2", "mrwi_dodge_chance_3", "mrwi_dodge_chance_4"
    },
    copycat_crouch = { name = "Fleet Footed", desc = "Crouch speed increased by 40%.",
                       upg_type = "stat",
      "mrwi_crouch_speed_multiplier_1", "mrwi_crouch_speed_multiplier_2", "mrwi_crouch_speed_multiplier_3", "mrwi_crouch_speed_multiplier_4"
    },
    copycat_bag = { name = "Haul Ass", desc = "Move 40% faster while carrying a bag.",
                    upg_type = "stat",
      "mrwi_carry_speed_multiplier_1", "mrwi_carry_speed_multiplier_2", "mrwi_carry_speed_multiplier_3", "mrwi_carry_speed_multiplier_4"
    },
    copycat_tactical_reload = { name = "Tactical Reload", desc = "Unequipped weapon automatically reloads after 10 kills.",
                                upg_type = "ability",
      "player_primary_reload_secondary_1", "player_secondary_reload_primary_1"
    },
    copycat_reload_switch = { name = "Tactical Switch", desc = "160% faster weapon switch speed for 3s after 'Tactical Reload' is triggered.",
                              upg_type = "stat", upg_req = "perks-copycat_tactical_reload",
      "weapon_mrwi_swap_speed_multiplier_1"
    },
    copycat_bullseye = { name = "Head Game", desc = "+10 health on headshot (2s cooldown).",
                         upg_type = "ability",
      "player_headshot_regen_health_bonus_1"
    },
    copycat_ricochet = { name = "Ricochet", desc = "Dodged bullets damage the enemy that fired them.",
                         upg_type = "ability",
      "player_dodge_ricochet_bullets"
    },
    copycat_immunity = { name = "Grace Period", desc = "Immunity for 2s when health goes below 50% (15s cooldown).",
                         upg_type = "ability",
      "temporary_mrwi_health_invulnerable_1"
    }
  },

  stats = {

    -- Default Upgrades
    shinobi_speed = { name = "Shinobi", desc = "Walk speed increased by 25%. Crouch speed increased by 10%.",
                      upg_type = "player",
      "player_walk_speed_multiplier", "player_crouch_speed_multiplier"
    },
    fast_hands_1 = { name = "Fast Hands Lv1", desc = "Interact with baggable loot 25% faster.",
                     upg_type = "player", disable = "fast_hands_2",
      "carry_interact_speed_multiplier_1"
    },
    fast_hands_2 = { name = "Fast Hands Lv2", desc = "Interact with baggable loot 75% faster.",
                     upg_type = "player", disable = "fast_hands_1",
      "carry_interact_speed_multiplier_2"
    },
    bag_penalty_reduction = { name = "Transporter", desc = "Move 50% faster while carrying a bag.",
                              upg_type = "player",
      "carry_movement_speed_multiplier"
    },
    fall_damage_reduction = { name = "Featherfall", desc = "Take 75% less damage from falls.",
                              upg_type = "player",
      "player_fall_damage_multiplier"
    },
    body_bag_capacity = { name = "Winston Wolfe", desc = "Can hold up to 2 body bags.",
                          upg_type = "player",
      "player_corpse_dispose_amount_1"
    },
    striker_reload_speed = { name = "Lighter Cylinder", desc = "Street Sweeper reloads 15% faster.",
                             upg_type = "weapon",
      "striker_reload_speed_default"
    },
    akimbo_recoil_1 = { name = "Ambidexterity Lv1", desc = "+8 stability (akimbo).",
                        upg_type = "weapon", disable = "akimbo_recoil_2,akimbo_recoil_3,akimbo_recoil_4",
      "akimbo_recoil_index_addend_1"
    },
    akimbo_recoil_2 = { name = "Ambidexterity Lv2", desc = "+16 stability (akimbo).",
                        upg_type = "weapon", disable = "akimbo_recoil_1,akimbo_recoil_3,akimbo_recoil_4",
      "akimbo_recoil_index_addend_2"
    },
    akimbo_recoil_3 = { name = "Ambidexterity Lv3", desc = "+24 stability (akimbo).",
                        upg_type = "weapon", disable = "akimbo_recoil_1,akimbo_recoil_2,akimbo_recoil_4",
      "akimbo_recoil_index_addend_3"
    },
    akimbo_recoil_4 = { name = "Ambidexterity Lv4", desc = "+32 stability (akimbo).",
                        upg_type = "weapon", disable = "akimbo_recoil_1,akimbo_recoil_2,akimbo_recoil_3",
      "akimbo_recoil_index_addend_4"
    },

    -- Mastermind Skills
    revive_speed = { name = "Code Blue", desc = "100% faster revive speed.",
                     upg_type = "player",
      "player_revive_interaction_speed_multiplier"
    },
    start_cable_ties_1 = { name = "Cable Ties", desc = "+4.",
                           upg_type = "player",
      "cable_tie_quantity"
    },
    cable_tie_speed = { name = "Manipulator", desc = "75% faster cable tie speed.",
                        upg_type = "player",
      "cable_tie_interact_speed_multiplier"
    },
    shout_distance = { name = "Confident", desc = "Shout distance increased by 50%.",
                       upg_type = "player",
      "player_intimidate_range_mul"
    },
    civ_intimidation_time = { name = "", desc = "Civs remain intimidated for 50% longer.",
                              upg_type = "player",
      "player_civ_intimidation_mul"
    },
    stability_bonus_1 = { name = "Stability", desc = "+8.",
                          upg_type = "weapon",
      "player_stability_increase_bonus_1"
    },
    static_accuracy_bonus = { name = "Accuracy", desc = "+16 while stationary.",
                              upg_type = "weapon",
      "player_not_moving_accuracy_increase_bonus_1"
    },
    ads_speed = { name = "Target Acquisition", desc = "Faster ADS speed.",
                  upg_type = "weapon",
      "weapon_enter_steelsight_speed_multiplier", "shotgun_enter_steelsight_speed_multiplier"
    },
    ads_movement_speed = { name = "Movement Speed", desc = "Unaffected by ADS.",
                           upg_type = "weapon",
      "player_steelsight_normal_movement_speed"
    },
    ads_zoom = { name = "ADS Zoom", desc = "Increased by 25% (SMGs/LMGs/ARs/snipers/pistols).",
                 upg_type = "weapon",
      "lmg_zoom_increase", "assault_rifle_zoom_increase", "snp_zoom_increase", "smg_zoom_increase", "pistol_zoom_increase"
    },
    moving_accuracy_bonus = { name = "Accuracy", desc = "+16 while moving (SMGs/ARs/snipers).",
                              upg_type = "weapon",
      "assault_rifle_move_spread_index_addend", "snp_move_spread_index_addend", "smg_move_spread_index_addend"
    },
    single_shot_flat_accuracy = { name = "Accuracy", desc = "+8 while ADS (single shot SMGs/ARs/snipers).",
                                  upg_type = "weapon",
      "weapon_single_spread_index_addend"
    },
    single_shot_percent_accuracy = { name = "Accuracy", desc = "20% bonus while ADS (single shot SMGs/ARs/snipers).",
                                     upg_type = "weapon",
      "single_shot_accuracy_inc_1"
    },
    kilmer = { name = "Kilmer", desc = "Reload SMGs/ARs/snipers 15% faster.",
               upg_type = "weapon",
      "assault_rifle_reload_speed_multiplier", "smg_reload_speed_multiplier", "snp_reload_speed_multiplier"
    },

    -- Enforcer Skills
    shotgun_reload_1 = { name = "Shotgun CQB Lv1", desc = "Reload shotguns 15% faster.",
                         upg_type = "weapon", disable = "shotgun_reload_2",
      "shotgun_reload_speed_multiplier_1"
    },
    shotgun_reload_2 = { name = "Shotgun CQB Lv2", desc = "Reload shotguns 50% faster.",
                         upg_type = "weapon", disable = "shotgun_reload_1",
      "shotgun_reload_speed_multiplier_2"
    },
    shotgun_stability = { name = "Stability", desc = "+8 (shotguns).",
                          upg_type = "weapon",
      "shotgun_recoil_index_addend"
    },
    shotgun_dmg = { name = "Shotgun Impact", desc = "10% damage bonus (shotguns).",
                    upg_type = "weapon",
      "shotgun_damage_multiplier_2"
    },
    shotgun_ads_accuracy = { name = "Accuracy", desc = "40% bonus while ADS (shotguns)",
                             upg_type = "weapon",
      "shotgun_steelsight_accuracy_inc_1"
    },
    shotgun_range_bonus = { name = "Far Away", desc = "50% increased effective range while ADS (shotguns).",
                            upg_type = "weapon",
      "shotgun_steelsight_range_inc_1"
    },
    shotgun_hip_rof = { name = "Slamfire", desc = "35% fire rate bonus (single shot shotguns).",
                        upg_type = "weapon",
      "shotgun_hip_rate_of_fire_1"
    },
    shotgun_mag_capacity = { name = "", desc = "+15 mag size (mag-fed shotguns).",
                             upg_type = "weapon",
      "shotgun_magazine_capacity_inc_1"
    },
    weapon_switch_speed = { name = "", desc = "80% faster weapon switch speed.",
                            upg_type = "weapon",
      "weapon_swap_speed_multiplier"
    },
    recovery_1 = { name = "", desc = "15% faster armor recovery.",
                   upg_type = "player",
      "player_armor_regen_time_mul_1"
    },
    team_recovery = { name = "", desc = "25% faster armor recovery for crew.",
                      upg_type = "player",
      "team_armor_regen_time_multiplier"
    },
    lbv_boost = { name = "", desc = "+20 armor (lightweight ballistic vest).",
                  upg_type = "player", item_req = "body_armor1",
      "player_level_2_armor_addend"
    },
    vest_boost = { name = "", desc = "+20 armor (ballistic vest).",
                   upg_type = "player", item_req = "body_armor2",
      "player_level_3_armor_addend"
    },
    hbv_boost = { name = "", desc = "+20 armor (heavy ballistic vest).",
                  upg_type = "player", item_req = "body_armor3",
      "player_level_4_armor_addend"
    },
    bag_throw_distance = { name = "Catapult", desc = "+50% bag throw distance.",
                           upg_type = "player",
      "carry_throw_distance_multiplier"
    },
    bulletproof = { name = "Bulletproof", desc = "30% armor bonus.",
                    upg_type = "player",
      "player_armor_multiplier"
    },
    ammo_range = { name = "Mag Catch", desc = "Ammo pickup range increased by 50%.",
                   upg_type = "player",
      "player_increased_pickup_area_1"
    },
    saw_capacity = { name = "", desc = "+1 saw blade.",
                     upg_type = "weapon", count_req = "saws:1",
      "saw_extra_ammo_multiplier"
    },
    saw_speed = { name = "Faster Motor", desc = "35% fire rate bonus (saw).",
                  upg_type = "weapon", count_req = "saws:1",
      "player_saw_speed_multiplier_2"
    },
    saw_lock_dmg = { name = "Carbon Blade", desc = "Saw deals 40% more damage against locks.",
                     upg_type = "weapon", count_req = "saws:1",
      "saw_lock_damage_multiplier_2"
    },
    saw_efficiency = { name = "Saw Massacre", desc = "Saw is twice as efficient against enemies.",
                       upg_type = "weapon", count_req = "saws:1",
      "saw_enemy_slicer"
    },
    ammo_capacity = { name = "Fully Loaded", desc = "Ammo capacity increased by 25%.",
                      upg_type = "player",
      "extra_ammo_multiplier1"
    },

    -- Technician Skills
    accuracy_bonus = { name = "Accuracy", desc = "+8.",
                       upg_type = "weapon",
      "player_weapon_accuracy_increase_1"
    },
    stability_bonus_2 = { name = "Stability", desc = "+16",
                          upg_type = "weapon",
      "player_stability_increase_bonus_2"
    },
    accuracy_hip_bonus = { name = "Accuracy", desc = "+12 (hipfire).",
                           upg_type = "weapon",
      "player_hip_fire_accuracy_inc_1"
    },
    stability_movement_penalty = { name = "Stability", desc = "Movement penalty reduced by 20%.",
                                   upg_type = "weapon",
      "player_weapon_movement_stability_1"
    },
    mag_capacity = { name = "Surefire", desc = "+15 mag size (SMGs/LMGs/ARs).",
                     upg_type = "weapon",
      "player_automatic_mag_increase_1"
    },

    -- Ghost Skills
    not_sus = { name = "Chameleon", desc = "25% reduced detection in casing mode.",
                upg_type = "player",
      "player_suspicion_bonus"
    },
    lockpick_speed = { name = "Dextrous", desc = "100% faster lockpick speed.",
                       upg_type = "player",
      "player_pick_lock_easy_speed_multiplier"
    },
    sprinter = { name = "Sprinter", desc = "+10% dodge chance while sprinting and 25% faster sprint speed/stamina recovery.",
                 upg_type = "player",
      "player_run_speed_multiplier", "player_run_dodge_chance", "player_stamina_regen_timer_multiplier", "player_stamina_regen_multiplier"
    },
    move_speed = { name = "Nimble", desc = "10% faster movement speed.",
                   upg_type = "player",
      "player_movement_speed_multiplier"
    },
    climb_speed = { name = "What A Thrill", desc = "75% faster climbing speed.",
                    upg_type = "player",
      "player_climb_speed_multiplier_2"
    },
    melee_conceal = { name = "Hidden Blade", desc = "+2 concealment (melee).",
                      upg_type = "player",
      "player_melee_concealment_modifier"
    },
    vest_conceal = { name = "Concealment", desc = "+4 (ballistic vests).",
                     upg_type = "player", item_req = "body_armor1,body_armor2,body_armor3",
      "player_ballistic_vest_concealment_1"
    },
    reduced_prio = { name = "Inconspicuous", desc = "Target priority reduced by 35%.",
                     upg_type = "player",
      "player_camouflage_bonus_1", "player_camouflage_bonus_2"
    },
    silencer_conceal = { name = "Concealment", desc = "+1 (silencers), -2 silencer penalty.",
                         upg_type = "player",
      "player_silencer_concealment_penalty_decrease_1", "player_silencer_concealment_increase_1"
    },
    silencer_stability = { name = "Stability", desc = "+8 stability (silencers).",
                           upg_type = "weapon",
      "weapon_silencer_recoil_index_addend"
    },
    silencer_ads_speed = { name = "Professional", desc = "100% faster ADS speed (silencers).",
                           upg_type = "weapon",
      "weapon_silencer_enter_steelsight_speed_multiplier"
    },
    silencer_accuracy = { name = "Hitman", desc = "+12 accuracy (silencers).",
                          upg_type = "weapon",
      "weapon_silencer_spread_index_addend"
    },
    mark_duration = { name = "Strategist", desc = "Mark duration increased by 100%.",
                      upg_type = "player",
      "player_mark_enemy_time_multiplier"
    },

    -- Fugitive Skills
    pistol_swap_speed = { name = "Quick Draw", desc = "33% faster weapon switch speed (pistols).",
                          upg_type = "weapon",
      "pistol_swap_speed_multiplier"
    },
    pistol_accuracy = { name = "Equilibrium", desc = "+8 accuracy (pistols).",
                        upg_type = "weapon",
      "pistol_spread_index_addend"
    },
    pistol_capacity = { name = "Gun Nut", desc = "+5 mag size (pistols).",
                        upg_type = "weapon",
      "pistol_magazine_capacity_inc_1"
    },
    pistol_rof = { name = "Cowboy", desc = "50% fire rate bonus (pistols).",
                   upg_type = "weapon",
      "pistol_fire_rate_multiplier"
    },
    akimbo_capacity_1 = { name = "Akimbo Lv1", desc = "Ammo capacity increased by 50%.",
                          upg_type = "weapon", disable = "akimbo_capacity_2",
      "akimbo_extra_ammo_multiplier_1"
    },
    akimbo_capacity_2 = { name = "Akimbo Lv2", desc = "Ammo capacity increased by 100%.",
                          upg_type = "weapon", disable = "akimbo_capacity_1",
      "akimbo_extra_ammo_multiplier_2"
    },
    pistol_dmg = { name = "One Handed Talent", desc = "+15 pistol damage.",
                   upg_type = "weapon",
      "pistol_damage_addend_2"
    },
    pistol_reload_speed = { name = "Gunslinger", desc = "Reload pistols 50% faster.",
                            upg_type = "weapon",
      "pistol_reload_speed_multiplier"
    },
    bleedout_health = { name = "More Blood to Bleed", desc = "50% more bleedout health.",
                        upg_type = "player",
      "player_bleed_out_health_multiplier"
    },
    incoming_melee_reduction = { name = "Because of Training", desc = "Take 50% less melee damage.",
                                 upg_type = "player",
      "player_melee_damage_dampener"
    },
    melee_knockdown = { name = "Martial Arts", desc = "50% knockdown bonus (melee).",
                        upg_type = "weapon",
      "player_melee_knockdown_mul"
    },
    melee_dmg = { name = "Pumping Iron", desc = "100% bonus damage (melee).",
                  upg_type = "weapon",
      "player_non_special_melee_multiplier", "player_melee_damage_multiplier"
    },

    -- Removed Skills
    cam_shake = { name = "Tough Guy", desc = "50% less camera shake from damage.",
                  upg_type = "player",
      "player_damage_shake_multiplier"
    },
    shotgun_hip_accuracy = { name = "Accuracy", desc = "20% hipfire bonus (shotguns).",
                             upg_type = "weapon",
      "shotgun_hip_fire_spread_index_addend"
    },
    hip_accuracy = { name = "Accuracy", desc = "20% hipfire bonus.",
                     upg_type = "weapon",
      "weapon_hip_fire_spread_index_addend"
    },
    mag_plus = { name = "Mag Plus", desc = "+15 mag size (weapons with box magazines except snipers).",
                 upg_type = "weapon",
      "weapon_clip_ammo_increase_2"
    },
    smg_rof = { name = "SMG Specialist", desc = "20% fire rate bonus (SMGs).",
                upg_type = "weapon",
      "smg_fire_rate_multiplier"
    },
    custody_time = { name = "Master Trader", desc = "Custody timer is halved.",
                     upg_type = "player",
      "player_respawn_time_multiplier"
    },
    zipline_dodge = { name = "Daredevil", desc = "+15% dodge chance while ziplining.",
                      upg_type = "player",
      "player_on_zipline_dodge_chance"
    },
    crouch_dodge = { name = "Duck and Cover", desc = "+15% dodge chance while crouched.",
                     upg_type = "player",
      "player_crouch_dodge_chance_2"
    },
    stamina = { name = "Endurance", desc = "100% stamina bonus.",
                upg_type = "player",
      "player_stamina_multiplier"
    },
    silencer_ap = { name = "Silent Killer", desc = "40% chance to pierce enemy armor (silencers).",
                    upg_type = "weapon",
      "weapon_silencer_armor_piercing_chance_2"
    },

    -- Unused Skills
    crit_chance = { name = "Hypocritical", desc = "+25% crit chance.",
                    upg_type = "weapon",
      "player_critical_hit_chance_1"
    },
    health_bonus = { name = "Vitality", desc = "10% health bonus.",
                     upg_type = "player",
      "player_health_multiplier"
    },
    armour_bonus = { name = "Grit", desc = "25% armor bonus.",
                     upg_type = "player",
      "player_passive_armor_multiplier_2"
    },
    recovery_2 = { name = "Adaptable", desc = "15% faster armor recovery.",
                   upg_type = "player",
      "player_armor_regen_timer_multiplier"
    },
    concealment = { name = "Concealment", desc = "+5.",
                    upg_type = "player",
      "player_concealment_bonus_1"
    },
    sharp_melee_dmg = { name = "Taste My Steel", desc = "200% damage bonus (sharp melee).",
                        upg_type = "weapon",
      "player_melee_sharp_damage_multiplier"
    },
    threat_big = { name = "Oppressor", desc = "95% threat bonus.",
                   upg_type = "weapon",
      "player_suppression_bonus", "player_passive_suppression_bonus_2"
    },
    damage_reduction = { name = "Couple of Three Things", desc = "5% damage reduction.",
                         upg_type = "player",
      "player_damage_dampener"
    },
    nebula_plus = { name = "Nebula Plus", desc = "Assets cost 87.5% less.",
                    upg_type = "player",
      "player_assets_cost_multiplier", "player_assets_cost_multiplier_b", "passive_player_assets_cost_multiplier"
    },
    cam_loop_distance = { name = "Remote Loop", desc = "Can loop cameras from 40% further away.",
                          upg_type = "player", upg_req = "skills-cam_loop",
      "player_tape_loop_interact_distance_mul_1"
    },
    start_cable_ties_2 = { name = "Cable Ties", desc = "+4.",
                           upg_type = "player",
      "cable_tie_quantity_2"
    },
    saw_rof = { name = "Saw Overdrive", desc = "50% fire rate bonus (saw).",
                upg_type = "weapon", count_req = "saws:1",
      "saw_fire_rate_multiplier_2"
    },
    saw_swap_speed = { name = "Saw Bag", desc = "80% faster saw switch speed.",
                       upg_type = "weapon", count_req = "saws:1",
      "saw_swap_speed_multiplier"
    },
    saw_reload_speed = { name = "Blade Pouch", desc = "Reload saws 50% faster.",
                         upg_type = "weapon", count_req = "saws:1",
      "saw_reload_speed_multiplier"
    },
    ar_stability = { name = "Stability", desc = "+8 (ARs).",
                     upg_type = "weapon",
      "assault_rifle_recoil_index_addend"
    },
    lmg_stability = { name = "Stability", desc = "+4 (LMGs).",
                      upg_type = "weapon",
      "lmg_recoil_index_addend"
    },
    snp_stability = { name = "Stability", desc = "+8 (snipers).",
                      upg_type = "weapon",
      "snp_recoil_index_addend"
    },
    modded_bonus = { name = "Refurbished Parts", desc = "10% damage/accuracy/stability bonus if weapon has any mods.",
                     upg_type = "weapon",
      "weapon_modded_damage_multiplier", "weapon_modded_spread_multiplier", "weapon_modded_recoil_multiplier"
    },
    single_shot_accuracy = { name = "Accuracy", desc = "20% bonus (single shot).",
                             upg_type = "weapon",
      "weapon_single_spread_multiplier"
    }, 
    silencer_accuracy_percent = { name = "Accuracy", desc = "50% bonus (silencers).",
                                  upg_type = "weapon",
      "weapon_silencer_spread_multiplier"
    },
    silencer_stability_percent = { name = "Stability", desc = "50% bonus (silencers).",
                                   upg_type = "weapon",
      "weapon_silencer_recoil_multiplier"
    },
    reload_speed = { name = "Ex-Military", desc = "Reload 10% faster.",
                     upg_type = "weapon",
      "weapon_passive_reload_speed_multiplier"
    },
    stability_bonus_percent = { name = "Stability", desc = "10% bonus.",
                                upg_type = "weapon",
      "weapon_passive_recoil_multiplier_2"
    },
    accuracy_bonus_percent = { name = "Accuracy", desc = "10% bonus.",
                               upg_type = "weapon",
      "weapon_spread_multiplier"
    },
    rof_bonus = { name = "Illegal Parts", desc = "100% fire rate bonus.",
                  upg_type = "weapon",
      "weapon_fire_rate_multiplier"
    },
    pistol_damage = { name = "Damage", desc = "50% bonus (pistols).",
                      upg_type = "weapon",
      "pistol_damage_multiplier"
    },
    pistol_accuracy_percent = { name = "Accuracy", desc = "10% bonus (pistols).",
                                upg_type = "weapon",
      "pistol_spread_multiplier"
    },
    pistol_sprint_end = { name = "Readiness", desc = "Stop sprinting 25% faster (pistols).",
                          upg_type = "weapon",
      "pistol_exit_run_speed_multiplier"
    },
    pistol_hip_accuracy = { name = "Accuracy", desc = "20% hipfire bonus (pistols).",
                            upg_type = "weapon",
      "pistol_hip_fire_spread_multiplier"
    },
    ar_stability_percent = { name = "Stability", desc = "25% bonus (ARs).",
                             upg_type = "weapon",
      "assault_rifle_recoil_multiplier"
    },
    ar_accuracy_moving = { name = "Accuracy", desc = "50% bonus while moving (ARs).",
                           upg_type = "weapon",
      "assault_rifle_move_spread_multiplier"
    },
    ar_hip_accuracy = { name = "Accuracy", desc = "20% hipfire bonus (ARs).",
                        upg_type = "weapon",
      "assault_rifle_hip_fire_spread_multiplier"
    },
    lmg_stability_percent = { name = "Stability", desc = "25% bonus (LMGs).",
                              upg_type = "weapon",
      "lmg_recoil_multiplier"
    },
    lmg_reload = { name = "Lighter Belts", desc = "Reload LMGs 25% faster.",
                   upg_type = "weapon",
      "lmg_reload_speed_multiplier"
    },
    lmg_accuracy_moving = { name = "Accuracy", desc = "50% bonus while moving (LMGs).",
                            upg_type = "weapon",
      "lmg_move_spread_multiplier"
    },
    lmg_hip_accuracy = { name = "Accuracy", desc = "20% hipfire bonus (LMGs).",
                         upg_type = "weapon",
      "lmg_hip_fire_spread_multiplier"
    },
    snp_accuracy_moving = { name = "Accuracy", desc = "50% bonus while moving (snipers).",
                            upg_type = "weapon",
      "snp_move_spread_multiplier"
    },
    snp_hip_accuracy = { name = "Accuracy", desc = "20% hipfire bonus (snipers).",
                         upg_type = "weapon",
      "snp_hip_fire_spread_multiplier"
    },
    smg_hip_accuracy = { name = "Accuracy", desc = "20% hipfire bonus (SMGs).",
                         upg_type = "weapon",
      "smg_hip_fire_spread_multiplier"
    },
    shotgun_stability_percent = { name = "Stability", desc = "25% bonus (shotguns).",
                                  upg_type = "weapon",
      "shotgun_recoil_multiplier"
    },
    shotgun_hip_accuracy_percent = { name = "Accuracy", desc = "20% hipfire bonus (shotguns).",
                                     upg_type = "weapon",
      "shotgun_hip_fire_spread_multiplier"
    },
    akimbo_dmg = { name = "Damage", desc = "50% bonus (akimbo).",
                   upg_type = "weapon",
      "akimbo_damage_multiplier_1" 
    }
  },

  deployable = {

    doctor_bag_capacity = { name = "Deep Pockets", desc = "+1 doctor bag.",
                            item_req = "doctor_bag",
      "doctor_bag_quantity"
    },
    doctor_bag_charges = { name = "Stockpile", desc = "Doctor bags get 2 additional charges.",
                           item_req = "doctor_bag",
      "doctor_bag_amount_increase1"
    },
    health_deployable_buff = { name = "Quick Fix", desc = "Your FAKs and doctor bags give 10% damage reduction for 2 mins on use and are deployed 50% faster.",
                               item_req = "doctor_bag,first_aid_kit",
      "first_aid_kit_damage_reduction_upgrade", "first_aid_kit_deploy_time_multiplier"
    },
    fak_capacity = { name = "Walking Pharmacy", desc = "14 FAKs.",
                     item_req = "first_aid_kit",
      "first_aid_kit_quantity_increase_1", "first_aid_kit_quantity_increase_2"
    },
    fak_autoheal = { name = "Uppers", desc = "FAKs in 5m are consumed when going down (20s cooldown).",
                     item_req = "first_aid_kit",
      "first_aid_kit_auto_recovery_1"
    },
    ammo_bag_capacity = { name = "Deep Pockets", desc = "+1 ammo bag.",
                          item_req = "ammo_bag",
      "ammo_bag_quantity"
    },
    ammo_bag_charges = { name = "Stockpile", desc = "Ammo bags hold 50% more ammo.",
                         item_req = "ammo_bag",
      "ammo_bag_ammo_increase1"
    },
    ammo_bag_inf = { name = "Bulletstorm", desc = "Infinite ammo after using ammo bag (min 15s).",
                     item_req = "ammo_bag",
      "temporary_no_ammo_cost_2"
    },
    sentry_capacity_1 = { name = "Tower Defense Lv1", desc = "2 sentries.",
                          item_req = "sentry_gun,sentry_gun_silent", disable = "sentry_capacity_2",
      "sentry_gun_quantity_1"
    },
    sentry_capacity_2 = { name = "Tower Defense Lv2", desc = "4 sentries.",
                          item_req = "sentry_gun,sentry_gun_silent", disable = "sentry_capacity_1",
      "sentry_gun_quantity_2"
    },
    sentry_cost = { name = "Eco Sentry", desc = "Sentry ammo cost reduced by 10%. Place sentries 50% faster.",
                      item_req = "sentry_gun,sentry_gun_silent",
      "sentry_gun_cost_reduction_1", "sentry_gun_cost_reduction_2", "player_sentry_gun_deploy_time_multiplier"
    },
    sentry_accuracy = { name = "Targeting Package", desc = "Sentry gains a 100% accuracy bonus, rotates 150% faster, and holds 50% more ammo.",
                       item_req = "sentry_gun,sentry_gun_silent",
      "sentry_gun_spread_multiplier", "sentry_gun_rot_speed_multiplier", "sentry_gun_extra_ammo_multiplier_1"
    },
    sentry_health = { name = "Armor Plating", desc = "Sentry gains a shield and 150% health bonus.",
                      item_req = "sentry_gun,sentry_gun_silent",
      "sentry_gun_shield", "sentry_gun_armor_multiplier"
    },
    sentry_ap = { name = "AP Sentry", desc = "Sentry gains 150% damage bonus and toggleable AP rounds, decreasing fire rate by 75% but increasing damage by another 250%.",
                  item_req = "sentry_gun,sentry_gun_silent",
      "sentry_gun_ap_bullets", "sentry_gun_fire_rate_reduction_1", "sentry_gun_damage_multiplier"
    },
    charge_capacity = { name = "Shaped Charge", desc = "6 shaped charges.",
                        item_req = "trip_mine",
      "shape_charge_quantity_increase_1", "shape_charge_quantity_increase_2"
    },
    trip_capacity_1 = { name = "More Firepower Lv1", desc = "7 trip mines.",
                        item_req = "trip_mine", disable = "trip_capacity_2",
      "trip_mine_quantity_increase_1"
    },
    trip_capacity_2 = { name = "More Firepower Lv2", desc = "14 trip mines.",
                        item_req = "trip_mine", disable = "trip_capacity_1",
      "trip_mine_quantity_increase_2"
    },
    trip_radius_1 = { name = "Demolition Man", desc = "Trip mine explosions are 30% bigger. Deploy trip mines 20% faster.",
                      item_req = "trip_mine",
      "trip_mine_explosion_size_multiplier_1", "player_trip_mine_deploy_time_multiplier_2"
    },
    trip_radius_2 = { name = "Tactical Mines", desc = "Trip mine explosions are 70% bigger and deal 50% more damage.",
                      item_req = "trip_mine",
      "trip_mine_explosion_size_multiplier_2", "trip_mine_damage_multiplier_1"
    },
    trip_fire = { name = "Fire Trap", desc = "Trip mines create fire on detonation.",
                  item_req = "trip_mine",
      "trip_mine_fire_trap_1", "trip_mine_fire_trap_2"
    },
    trip_sensor = { name = "Motion Sensor", desc = "Trip mines can activate sensor mode.",
                    item_req = "trip_mine",
      "trip_mine_sensor_toggle", "trip_mine_sensor_highlight", "trip_mine_can_switch_on_off"
    },
    ecm_capacity_1 = { name = "ECM Lv1", desc = "2 ECM jammers.",
                      item_req = "ecm_jammer", disable = "ecm_capacity_2",
      "ecm_jammer_quantity_increase_1"
    },
    ecm_capacity_2 = { name = "ECM Lv2", desc = "4 ECM jammers.",
                       item_req = "ecm_jammer", disable = "ecm_capacity_1",
      "ecm_jammer_quantity_increase_2"
    },
    ecm_jam_duration_1 = { name = "ECM Specialist Lv1", desc = "ECM jamming duration increased by 25%.",
                           item_req = "ecm_jammer", disable = "ecm_jam_duration_2",
      "ecm_jammer_duration_multiplier"
    },
    ecm_jam_duration_2 = { name = "ECM Specialist Lv2", desc = "ECM jamming duration increased by 50%.",
                           item_req = "ecm_jammer", disable = "ecm_jam_duration_1",
      "ecm_jammer_duration_multiplier_2", "ecm_jammer_duration_multiplier"
    },
    ecm_feedback_duration_1 = { name = "ECM Overdrive Lv1", desc = "ECM feedback duration increased by 25%.",
                                item_req = "ecm_jammer", upg_req = "deployable-ecm_feedback", disable = "ecm_feedback_duration_2",
      "ecm_jammer_feedback_duration_boost"
    },
    ecm_feedback_duration_2 = { name = "ECM Overdrive Lv2", desc = "ECM feedback duration increased by 50%.",
                                item_req = "ecm_jammer", upg_req = "deployable-ecm_feedback", disable = "ecm_feedback_duration_1",
      "ecm_jammer_feedback_duration_boost_2", "ecm_jammer_feedback_duration_boost"
    },
    ecm_doors = { name = "Open Sesame", desc = "ECMs can open doors.",
                  item_req = "ecm_jammer",
      "ecm_jammer_can_open_sec_doors"
    },
    ecm_pagers = { name = "Radio Jammer", desc = "ECMs block pagers and cameras.",
                   item_req = "ecm_jammer",
      "ecm_jammer_affects_pagers", "ecm_jammer_affects_cameras"
    },
    ecm_feedback = { name = "ECM Feedback", desc = "ECMs can activate feedback.",
                     item_req = "ecm_jammer",
      "ecm_jammer_can_activate_feedback", "ecm_jammer_can_retrigger", "ecm_jammer_interaction_speed_multiplier"
    },
    bodybag_capacity = { name = "Deep Pockets", desc = "+1 body bag case.",
                         item_req = "bodybags_bag",
      "bodybags_bag_quantity"
    }
  }
}

-- UNTESTED:
-- team_pistol_recoil_index_addend team_pistol_suppression_recoil_index_addend team_weapon_recoil_index_addend
-- team_weapon_suppression_recoil_index_addend player_damage_shake_addend player_suppressed_bonus
-- player_uncover_progress_mul player_uncover_progress_decay_mul 

-- MULTIPLAYER:
-- player_revive_health_boost player_revive_damage_reduction_level_1 player_revive_damage_reduction_level_2