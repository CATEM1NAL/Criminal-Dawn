apd2_upgrade_tables = {
  skills = {

    -- Default Upgrades
    player_civ_harmless_melee = { name = "Harmless Melee", desc = "First melee hit doesn't kill civs.",
      "player_civ_harmless_melee"
    },
    player_intimidate_enemies = { name = "Menacing", desc = "Can intimidate non-special enemies.",
      "player_intimidate_enemies"
    },
    player_primary_weapon_when_downed = { name = "", desc = "Can use primary weapon while down.",
      "player_primary_weapon_when_downed"
    },
    player_steelsight_when_downed = { name = "", desc = "Can ADS while down.",
      "player_steelsight_when_downed"
    },
    player_silent_kill = { name = "Drop Cloth", desc = "Enemy death alert range reduced by 95%.",
      "player_silent_kill"
    },
    player_fall_health_damage_multiplier = { name = "Cat Burglar", desc = "Falls inflict armor damage.",
      "player_fall_health_damage_multiplier"
    },
    ecm_jammer_affects_cameras = { name = "Cam Distortion", desc = "ECMs disable cameras.",
      "ecm_jammer_affects_cameras"
    },
    ecm_jammer_can_activate_feedback = { name = "ECM Feedback", desc = "Can activate ECM feedback.",
      "ecm_jammer_can_activate_feedback"
    },
    ecm_jammer_can_retrigger = { name = "", desc = "ECM feedback recharges.",
      "ecm_jammer_can_retrigger"
    },
    ecm_jammer_interaction_speed_multiplier = { name = "", desc = "ECM feedback interaction is instant.",
      "ecm_jammer_interaction_speed_multiplier"
    },
    player_corpse_dispose = { name = "", desc = "Can bag bodies.",
      "player_corpse_dispose"
    },
    trip_mine_can_switch_on_off = { name = "", desc = "Can toggle trip mines.",
      "trip_mine_can_switch_on_off"
    },
    trip_mine_sensor_toggle = { name = "", desc = "Trip mines can activate sensor mode.",
      "trip_mine_sensor_toggle", "trip_mine_sensor_highlight", "trip_mine_can_switch_on_off"
    },
    cable_tie = { name = "", desc = "Can cable tie civs.",
      "cable_tie"
    },
    
    -- Mastermind Skills
    player_revive_damage_reduction_1 = { name = "Combat Medic", desc = "30% damage reduction while reviving and for 5s after.",
      "player_revive_damage_reduction_1", "temporary_revive_damage_reduction_1"
    },
    first_aid_kit_deploy_time_multiplier = { name = "Triage", desc = "Deploy FAKs and doctor bags 50% faster.",
      "first_aid_kit_deploy_time_multiplier"
    },
    first_aid_kit_damage_reduction_upgrade = { name = "Quick Fix", desc = "Your FAKs and doctor bags give 10% damage reduction for 2 mins on use.",
      "first_aid_kit_damage_reduction_upgrade"
    },
    first_aid_kit_auto_recovery_1 = { name = "Uppers", desc = "FAKs in 5m are consumed when going down (20s cooldown).",
      "first_aid_kit_auto_recovery_1"
    },
    cooldown_long_dis_revive = { name = "Inspire", desc = "Shout at teammates to give 20% movement/reload speed for 10s.",
      "cooldown_long_dis_revive"
    },
    team_damage_hostage_absorption = { name = "Forced Friendship", desc = "+0.5 absorption per hostage (up to 8 hostages).",
      "team_damage_hostage_absorption"
    },
    player_intimidate_aura = { name = "Threatening Aura", desc = "Intimidated civs within 10m stay intimidated.",
      "player_intimidate_aura"
    },
    player_civ_calming_alerts = { name = "Control Freak", desc = "Alert sounds intimidate civs.",
      "player_civ_calming_alerts"
    },
    player_super_syndrome_1 = { name = "Stockholm Syndrome", desc = "Press jump while in custody to instantly trade a hostage (once per heist).",
      "player_super_syndrome_1"
    },
    player_hostage_health_regen_addend_1 = { name = "Hostage Taker Lv1", desc = "Heal 1.5% every 5 seconds if you have a hostage.",
      "player_hostage_health_regen_addend_1"
    },
    player_hostage_health_regen_addend_2 = { name = "Hostage Taker Lv2", desc = "Heal 4.5% every 5 seconds if you have a hostage.",
      "player_hostage_health_regen_addend_2"
    }, 
    temporary_single_shot_fast_reload_1 = { name = "Aggressive Reload", desc = "Headshot kills give 100% reload speed for 4s (single shot SMGs/ARs/snipers).",
      "temporary_single_shot_fast_reload_1"
    },
    head_shot_ammo_return_1 = { name = "Ammo Efficiency Lv1", desc = "3 headshots < 6 seconds returns a bullet (single shot SMGs/ARs/snipers).",
      "head_shot_ammo_return_1"
    },
    head_shot_ammo_return_2 = { name = "Ammo Efficiency Lv2", desc = "2 headshots < 6 seconds returns a bullet (single shot SMGs/ARs/snipers).",
      "head_shot_ammo_return_2"
    },
    snp_graze_damage_1 = { name = "Graze Lv1", desc = "Snipers deal 20% damage to all enemies within 1m of bullet path.",
      "snp_graze_damage_1"
    },
    snp_graze_damage_2 = { name = "Graze Lv2", desc = "Snipers deal 20% damage (100% on headshot kill) to all enemies within 1m of bullet path.",
      "snp_graze_damage_2"
    },
    player_convert_enemies_max_minions_1 = { name = "Joker Lv1", desc = "Can convert a single enemy.",
      "player_convert_enemies_max_minions_1",
      "player_convert_enemies",
      "player_convert_enemies_damage_multiplier_1"
    },
    player_convert_enemies_max_minions_2 = { name = "Joker Lv2", desc = "Can convert two enemies.",
      "player_convert_enemies_max_minions_2",
      "player_convert_enemies",
      "player_convert_enemies_damage_multiplier_2"
    },
    
    -- Enforcer Skills
    player_damage_multiplier_outnumbered = { name = "Underdog", desc = "15% damage bonus when 3+ enemies within 18m.",
      "player_damage_multiplier_outnumbered"
    },
    player_damage_dampener_outnumbered = { name = "Underdog", desc = "15% damage reduction when 3+ enemies within 18m.",
      "player_damage_dampener_outnumbered"
    },
    shotgun_hip_run_and_shoot_1 = { name = "Close By", desc = "Hipfire while sprinting (shotguns).",
      "shotgun_hip_run_and_shoot_1"
    },
    player_overkill_damage_multiplier = { name = "Overkill Lv1", desc = "75% damage bonus on kill for 20s (shotguns/saws).",
      "player_overkill_damage_multiplier"
    },
    player_overkill_all_weapons = { name = "Overkill Lv2", desc = "Damage bonus applies to all weapons.",
      "player_overkill_all_weapons", "player_overkill_damage_multiplier"
    },
    player_interacting_damage_multiplier = { name = "Die Hard", desc = "50% damage reduction while interacting.",
      "player_interacting_damage_multiplier"
    },
    player_armor_carry_bonus_1 = { name = "Pack Mule", desc = "Bag speed penalty reduced by 1% per 10 armor points.",
      "player_armor_carry_bonus_1"
    },
    player_shield_knock = { name = "Shock and Awe", desc = "Hitting shields can stagger them.",
      "player_shield_knock"
    },
    player_headshot_regen_armor_bonus_1 = { name = "Bullseye Lv1", desc = "+5 armor on headshot (2s cooldown).",
      "player_headshot_regen_armor_bonus_1"
    },
    player_headshot_regen_armor_bonus_2 = { name = "Bullseye Lv2", desc = "+25 armor on headshot (2s cooldown).",
      "player_headshot_regen_armor_bonus_2"
    },
    temporary_no_ammo_cost_1 = { name = "Bulletstorm Lv1", desc = "Infinite ammo after using ammo bag (min 5s).",
      "temporary_no_ammo_cost_1"
    },
    temporary_no_ammo_cost_2 = { name = "Bulletstorm Lv2", desc = "Infinite ammo after using ammo bag (min 15s).",
      "temporary_no_ammo_cost_2"
    },
    saw_ignore_shields_1 = { name = "Saw Destruction", desc = "Saw penetrates shields and enemy armor.",
      "saw_ignore_shields_1", "saw_armor_piercing_chance"
    },
    saw_panic_when_kill_1 = { name = "Saw Panic", desc = "Saw kills have 50% chance to cause panic in 10m.",
      "saw_panic_when_kill_1"
    },
    player_regain_throwable_from_ammo_1 = { name = "Scrounger", desc = "+1% chance to get throwable from ammo per box. Resets when throwable gained.",
      "player_regain_throwable_from_ammo_1"
    },
    player_double_drop_1 = { name = "Scavenger", desc = "Every 6th kill drops extra ammo.",
      "player_double_drop_1"
    },
    
    -- Technician Skills
    sentry_gun_shield = { name = "Sentry Shield", desc = "Sentry has a shield.",
      "sentry_gun_shield"
    },
    sentry_gun_ap_bullets = { name = "AP Sentry", desc = "Can toggle AP rounds on sentry (25% fire rate, 250% damage bonus).",
      "sentry_gun_ap_bullets", "sentry_gun_fire_rate_reduction_1"
    },
    second_deployable_1 = { name = "Jack of all Trades", desc = "Can equip two deployables.",
      "second_deployable_1"
    },
    player_drill_alert = { name = "Silent Drilling", desc = "Drills are silent.",
      "player_drill_alert", "player_silent_drill"
    },
    player_drill_autorepair_1 = { name = "Auto Kickstarter", desc = "30% chance for drills to be autorestarters.",
      "player_drill_autorepair_1", "player_drill_autorepair_2"
    },
    player_drill_melee_hit_restart_chance_1 = { name = "Kickstarter", desc = "50% chance to repair drill on melee.",
      "player_drill_melee_hit_restart_chance_1"
    },
    trip_mine_fire_trap_1 = { name = "Fire Trap", desc = "Trip mines create fire on detonation.",
      "trip_mine_fire_trap_1", "trip_mine_fire_trap_2"
    },
    weapon_knock_down_1 = { name = "Heavy Impact Lv1", desc = "5% chance to stagger enemies on hit.",
      "weapon_knock_down_1"
    },
    weapon_knock_down_2 = { name = "Heavy Impact Lv2", desc = "20% chance to stagger enemies on hit.",
      "weapon_knock_down_2"
    },
    player_run_and_shoot_1 = { name = "From the Hip", desc = "Hipfire while sprinting.",
      "player_run_and_shoot_1"
    },
    player_automatic_faster_reload_1 = { name = "Lock n' Load", desc = "40% to 100% faster reload after 2 kills with automatic weapons (reduced by 1% for each bullet above 20 in mag).",
      "player_automatic_faster_reload_1"
    },
    player_ap_bullets_1 = { name = "Spear", desc = "Weapons pierce enemy armor.",
      "player_ap_bullets_1"
    },
    weapon_automatic_head_shot_add_1 = { name = "Body Expertise Lv1", desc = "30% headshot damage bonus on body shots.",
      "weapon_automatic_head_shot_add_1"
    },
    weapon_automatic_head_shot_add_2 = { name = "Body Expertise Lv2", desc = "90% headshot damage bonus on body shots.",
      "weapon_automatic_head_shot_add_2"
    },
    
    -- Ghost Skills
    player_sec_camera_highlight_mask_off = { name = "", desc = "Can mark cameras in casing mode.",
      "player_sec_camera_highlight_mask_off"
    },
    player_special_enemy_highlight_mask_off = { name = "", desc = "Can mark enemies in casing mode.",
      "player_special_enemy_highlight_mask_off"
    },
    player_mask_off_pickup = { name = "", desc = "Can pickup small items in casing mode.",
      "player_mask_off_pickup"
    },
    player_small_loot_multiplier_1 = { name = "Dead Presidents", desc = "Loose cash is worth 30% more.",
      "player_small_loot_multiplier_1"
    },
    player_extra_corpse_dispose_amount = { name = "Garbage Collector", desc = "Start heists with a body bag.",
      "player_extra_corpse_dispose_amount"
    },
    player_standstill_omniscience = { name = "Sixth Sense", desc = "Stand still for 3.5s to mark everyone in 10m.",
      "player_standstill_omniscience"
    },
    player_additional_assets = { name = "Inside Man", desc = "Can buy additional assets.",
      "player_additional_assets", "player_buy_bodybags_asset", "player_buy_spotter_asset"
    },
    player_tape_loop_duration_1 = { name = "Camera Loop", desc = "Can loop a camera for 25 seconds.",
      "player_tape_loop_duration_1", "player_tape_loop_duration_2"
    },
    player_pick_lock_hard = { name = "Safe Cracker", desc = "Can lockpick safes.",
      "player_pick_lock_hard"
    },
    ecm_jammer_can_open_sec_doors = { name = "Open Sesame", desc = "ECMs can open doors.",
    "ecm_jammer_can_open_sec_doors"
    },
    ecm_jammer_affects_pagers = { name = "Radio Jammer", desc = "ECMs block pagers.",
      "ecm_jammer_affects_pagers"
    },
    player_can_strafe_run = { name = "Moving Target Lv1", desc = "Can sprint sideways.",
      "player_can_strafe_run"
    },
    player_can_free_run = { name = "Moving Target Lv2", desc = "Can sprint in any direction.",
      "player_can_free_run"
    },
    player_run_and_reload = { name = "Sprint Loaded", desc = "Can sprint and reload.",
      "player_run_and_reload"
    },
    player_armor_depleted_stagger_shot_1 = { name = "Dire Need Lv1", desc = "While armor is broken, all damage inflicts stagger.",
      "player_armor_depleted_stagger_shot_1"
    },
    player_armor_depleted_stagger_shot_2 = { name = "Dire Need Lv2", desc = "After armor breaks and up to 6s after regen, all damage inflicts stagger.",
      "player_armor_depleted_stagger_shot_2"
    },
    player_taser_malfunction = { name = "Shockproof", desc = "30% chance to break taser stun every second.",
      "player_taser_malfunction"
    },
    player_taser_self_shock = { name = "Reverse Card", desc = "Can interact with taser to break free.",
      "player_taser_self_shock", "player_escape_taser_1" 
    },
    player_detection_risk_add_dodge_chance_1 = { name = "Sneaky Bastard Lv1", desc = "+1% dodge chance every 3 points of det. risk below 35 (up to 10%).",
      "player_detection_risk_add_dodge_chance_1"
    },
    player_detection_risk_add_dodge_chance_2 = { name = "Sneaky Bastard Lv2", desc = "+1% dodge chance every point of det. risk below 35 (up to 10%).",
      "player_detection_risk_add_dodge_chance_2"
    },
    temporary_damage_speed_multiplier = { name = "Second Wind", desc = "Move 30% faster for 5s after armor breaks.",
      "temporary_damage_speed_multiplier"
    },
    player_detection_risk_add_crit_chance_1 = { name = "Low Blow Lv1", desc = "+3% crit chance every 3 points of det. risk below 35 (up to 30%).",
      "player_detection_risk_add_crit_chance_1"
    },
    player_detection_risk_add_crit_chance_2 = { name = "Low Blow Lv2", desc = "+3% crit chance every point of det. risk below 35 (up to 30%).",
      "player_detection_risk_add_crit_chance_2"
    },
    player_marked_enemy_extra_damage = { name = "High Value Target", desc = "15% damage bonus (marked enemies).",
      "player_marked_enemy_extra_damage"
    },
    player_marked_inc_dmg_distance_1 = { name = "Long Distance Target", desc = "50% damage bonus (marked enemies > 10m).",
      "player_marked_inc_dmg_distance_1"
    },
    weapon_steelsight_highlight_specials = { name = "On My Mark", desc = "ADS marks enemies automatically.",
      "weapon_steelsight_highlight_specials"
    },
    player_unseen_increased_crit_chance_1 = { name = "Unseen Strike Lv1", desc = "Gain 35% crit chance for 6s after not taking damage for 4s.",
      "player_unseen_increased_crit_chance_1", "player_unseen_temp_increased_crit_chance_1",
    },
    player_unseen_increased_crit_chance_2 = { name = "Unseen Strike Lv2", desc = "Gain 35% crit chance for 18s after not taking damage for 4s.",
      "player_unseen_increased_crit_chance_2", "player_unseen_temp_increased_crit_chance_2",
    },
    
    -- Fugitive Skills
    pistol_stacked_accuracy_bonus_1 = { name = "Desperado", desc = "+10% accuracy bonus on pistol hit (up to 40%) for 10s.",
      "pistol_stacked_accuracy_bonus_1"
    },
    pistol_stacking_hit_damage_multiplier_1 = { name = "Trigger Happy", desc = "120% damage bonus on pistol hit for 4s.",
      "pistol_stacking_hit_damage_multiplier_1", "pistol_stacking_hit_damage_multiplier_2"
    },
    player_temp_swap_weapon_faster_1 = { name = "On The Brink", desc = "Reload/switch weapons 100% faster for 10s after being revived.",
      "player_temp_swap_weapon_faster_1", "player_temp_reload_weapon_faster_1"
    },
    player_temp_increased_movement_speed_1 = { name = "Running From Death", desc = "30% damage reduction/movement speed bonus for 10s after being revived.",
      "player_temp_increased_movement_speed_1", "player_revived_damage_resist_1"
    },
    temporary_berserker_damage_multiplier_1 = { name = "Swan Song Lv1", desc = "Keep standing after going down for 3s.",
      "temporary_berserker_damage_multiplier_1"
    },
    temporary_berserker_damage_multiplier_2 = { name = "Swan Song Lv2", desc = "Keep standing after going down for 6s.",
      "temporary_berserker_damage_multiplier_2"
    },
    player_berserker_no_ammo_cost = { name = "Vengeful Swan", desc = "Infinite ammo while Swan Song is active.",
      "player_berserker_no_ammo_cost"
    },
    player_messiah_revive_from_bleed_out_1 = { name = "Messiah", desc = "Revive self on kill (one charge).",
      "player_messiah_revive_from_bleed_out_1"
    },
    player_recharge_messiah_1 = { name = "Three Days", desc = "Recover 'Messiah' charge after using a doctor bag.",
      "player_recharge_messiah_1"
    },
    player_cheat_death_chance_1 = { name = "Feign Death Lv1", desc = "15% chance to revive self.",
      "player_cheat_death_chance_1"
    },
    player_cheat_death_chance_2 = { name = "Feign Death Lv2", desc = "45% chance to revive self.",
      "player_cheat_death_chance_2"
    },
    player_melee_damage_stacking_1 = { name = "Bloodthirst", desc = "+100% melee damage on weapon kill (up to 1600%). Reset on melee kill.",
      "player_melee_damage_stacking_1"
    },
    player_temp_melee_kill_increase_reload_speed_1 = { name = "Mag Steal", desc = "50% faster reload for 10s on melee kill.",
      "player_temp_melee_kill_increase_reload_speed_1"
    },
    player_counter_strike_melee = { name = "", desc = "",
      "player_counter_strike_melee"
    },
    player_counter_strike_spooc = { name = "Counterstrike", desc = "Charging melee blocks enemy melee attacks.",
      "player_counter_strike_spooc"
    },
    player_melee_damage_health_ratio_multiplier = { name = "Cloakerstrike", desc = "Charging melee blocks cloakers.",
      "player_melee_damage_health_ratio_multiplier"
    },
    player_melee_damage_health_ratio_multiplier = { name = "Berserker", desc = "Melee/saw damage scales with health lost.",
      "player_melee_damage_health_ratio_multiplier"
    },
    player_damage_health_ratio_multiplier = { name = "Gunserker", desc = "Weapon damage scales with health lost.",
      "player_damage_health_ratio_multiplier"
    },
    player_max_health_reduction_1 = { name = "Frenzy Lv1", desc = "10% damage reduction, but healing reduced by 75% and health caps at 30%.",
      "player_max_health_reduction_1", "player_healing_reduction_1", "player_health_damage_reduction_1"
    },
    player_max_health_reduction_1 = { name = "Frenzy Lv2", desc = "25% damage reduction but health caps at 30%.",
      "player_max_health_reduction_1", "player_healing_reduction_2", "player_health_damage_reduction_2"
    },
    
    -- Removed
    player_civilian_reviver = { name = "Oldholm Syndrome", desc = "Civilians can revive you.",
      "player_civilian_reviver"
    },
    player_civilian_gives_ammo = { name = "Ammo Syndrome", desc = "Gain ammo when using 'Oldholm Syndrome'.",
      "player_civilian_gives_ammo"
    },
    -- Unused
    player_civ_harmless_bullets = { name = "Blanks", desc = "First bullet doesn't kill civilians.",
      "player_civ_harmless_bullets"
    },
    player_detection_risk_damage_multiplier = { name = "Loud and Proud", desc = "+5% damage bonus every 7 points of det. risk above 40 (up to 25%).",
      "player_detection_risk_damage_multiplier"
    },
    player_melee_kill_snatch_pager_chance = { name = "Pager Snatch", desc = "25% chance to answer pager on melee kill.",
      "player_melee_kill_snatch_pager_chance"
    },
    player_close_to_hostage_boost = { name = "Hostage Boost", desc = "Being close to a hostage increases stat bonuses from hostages by 25%.",
      "player_close_to_hostage_boost"
    },
    sentry_gun_can_revive = { name = "Sentry Repair", desc = "Sentries can be picked up after breaking.",
      "sentry_gun_can_revive"
    },
    shotgun_consume_no_ammo_chance_2 = { name = "Shell Dimension", desc = "3% chance to not consume ammo (shotguns).",
      "shotgun_consume_no_ammo_chance_2"
    },
    carry_movement_penalty_nullifier = { name = "Beast of Burden", desc = "No bag movement penalty.",
      "carry_movement_penalty_nullifier"
    },
    carry_bag_count_1 = { name = "Power Lifter", desc = "Carry 1 additional bag.",
      "carry_bag_count_1"
    },
    player_resist_firing_tased = { name = "Shock Resistance", desc = "Being tased doesn't force you to shoot.",
      "player_resist_firing_tased"
    },
  },

  perks = {
  
    -- Universal
    weapon_passive_headshot_damage_multiplier = { name = "Helmet Popping", desc = "25% headshot damage bonus.",
      "weapon_passive_headshot_damage_multiplier"
    },
    player_passive_suspicion_bonus = { name = "Blending In", desc = "+1 concealment.",
      "player_passive_suspicion_bonus"
    },
    player_passive_armor_movement_penalty_multiplier = { name = "Second Skin", desc = "15% reduced armor speed penalty.",
      "player_passive_armor_movement_penalty_multiplier"
    },
    passive_player_xp_multiplier = { name = "Fast Learner", desc = "45% EXP bonus.",
      "passive_player_xp_multiplier"
    },
    player_pick_up_ammo_multiplier = { name = "Walk-in Closet Lv1", desc = "Ammo pickup increased by 35%.",
      "player_pick_up_ammo_multiplier"
    },
    player_pick_up_ammo_multiplier_2 = { name = "Walk-in Closet Lv2", desc = "Ammo pickup increased by 75%.",
      "player_pick_up_ammo_multiplier_2"
    },
    weapon_passive_damage_multiplier = { name = "Whole Bullet", desc = "5% damage bonus",
      "weapon_passive_damage_multiplier"
    },
    passive_doctor_bag_interaction_speed_multiplier = { name = "", desc = "20% faster doctor bag interactions.",
      "passive_doctor_bag_interaction_speed_multiplier"
    },
    player_passive_loot_drop_multiplier = { name = "Lucky Charm", desc = "+10% chance of rare card drop.",
      "player_passive_loot_drop_multiplier"
    },
    
    -- Crew Chief
    team_damage_reduction_1 = { name = "Inner Strength", desc = "8% damage reduction (crew). You gain an extra 8% when below 50% health.",
      "team_damage_reduction_1", "player_passive_damage_reduction_1"
    },
    team_passive_stamina_multiplier_1 = { name = "Marathon Man", desc = "50% stamina bonus (crew).",
      "team_passive_stamina_multiplier_1"
    },
    player_passive_intimidate_range_mul = { name = "Deep Throat", desc = "Shout distance increased by 25%.",
      "player_passive_intimidate_range_mul"
    },
    team_passive_health_multiplier = { name = "Wolf Pack", desc = "10% health bonus (crew).",
      "team_passive_health_multiplier"
    },
    team_passive_armor_multiplier = { name = "Testudo", desc = "5% armor bonus (crew).",
      "team_passive_armor_multiplier"
    },
    team_hostage_health_multiplier = { name = "Hostage Situation", desc = "6% crew health bonus/12% crew stamina bonus per hostage (up to 4 hostages).",
      "team_hostage_health_multiplier", "team_hostage_stamina_multiplier"
    },
    team_hostage_damage_dampener_multiplier = { name = "Human Shield", desc = "8% damage reduction while you have a hostage.",
      "team_hostage_damage_dampener_multiplier"
    },
    
    -- Muscle
    player_passive_health_multiplier_1 = { name = "Brute Strength Lv1", desc = "10% health bonus.",
      "player_passive_health_multiplier_1"
    },
    player_passive_health_multiplier_2 = { name = "Brute Strength Lv2", desc = "20% health bonus.",
      "player_passive_health_multiplier_2"
    },
    player_passive_health_multiplier_3 = { name = "Brute Strength Lv3", desc = "40% health bonus.",
      "player_passive_health_multiplier_3"
    },
    player_passive_health_multiplier_4 = { name = "Brute Strength Lv4", desc = "80% health bonus.",
      "player_passive_health_multiplier_4"
    },
    player_passive_health_multiplier_5 = { name = "Brute Strength Lv5", desc = "100% health bonus.",
      "player_passive_health_multiplier_5"
    },
    player_uncover_multiplier = { name = "Meat Shield", desc = "Target priority increased by 15%.",
      "player_uncover_multiplier"
    },
    player_panic_suppression = { name = "Disturbing the Peace", desc = "Suppressed enemies can panic.",
      "player_panic_suppression"
    },
    player_passive_health_regen = { name = "800-pound Gorilla", desc = "Heal 3% every 5s.",
      "player_passive_health_regen"
    },
    -- Armorer
    player_tier_armor_multiplier_1 = { name = "Impact Plate Lv1", desc = "5% armor bonus.",
      "player_tier_armor_multiplier_1"
    },
    player_tier_armor_multiplier_2 = { name = "Impact Plate Lv2", desc = "10% armor bonus.",
      "player_tier_armor_multiplier_2"
    },
    player_tier_armor_multiplier_3 = { name = "Impact Plate Lv3", desc = "20% armor bonus.",
      "player_tier_armor_multiplier_3"
    },
    player_tier_armor_multiplier_4 = { name = "Impact Plate Lv4", desc = "30% armor bonus.",
      "player_tier_armor_multiplier_4"
    },
    player_tier_armor_multiplier_5 = { name = "Impact Plate Lv5", desc = "15% armor bonus.",
      "player_tier_armor_multiplier_5"
    },
    player_tier_armor_multiplier_6 = { name = "Impact Plate Lv6", desc = "35% armor bonus.",
      "player_tier_armor_multiplier_6"
    },
    player_armor_regen_timer_multiplier_passive = { name = "Tank", desc = "10% faster armor recovery.",
      "player_armor_regen_timer_multiplier_passive"
    },
    temporary_armor_break_invulnerable_1 = { name = "Hardy", desc = "Immunity for 2s on armor break.",
      "temporary_armor_break_invulnerable_1"
    },
    team_passive_armor_regen_time_multiplier = { name = "Liquid Armor", desc = "10% faster armor recovery (crew).",
      "team_passive_armor_regen_time_multiplier"
    },
    
    -- Rogue
    player_passive_dodge_chance_1 = { name = "Evasive Lv1", desc = "+15% dodge chance.",
      "player_passive_dodge_chance_1"
    },
    player_passive_dodge_chance_2 = { name = "Evasive Lv2", desc = "+30% dodge chance.",
      "player_passive_dodge_chance_2"
    },
    player_passive_dodge_chance_3 = { name = "Evasive Lv3", desc = "+45% dodge chance.",
      "player_passive_dodge_chance_3"
    },
    player_camouflage_multiplier = { name = "Elusive", desc = "Target priority reduced by 15%.",
      "player_camouflage_multiplier"
    },
    weapon_passive_armor_piercing_chance = { name = "Killer Instinct", desc = "25% chance to pierce enemy armor.",
      "weapon_passive_armor_piercing_chance"
    },
    weapon_passive_swap_speed_multiplier_1 = { name = "Holster", desc = "80% faster weapon switch speed.",
      "weapon_passive_swap_speed_multiplier_1"
    },
    -- Hitman
    player_perk_armor_regen_timer_multiplier_1 = { name = "Recovery Lv1", desc = "5% faster armor recovery.",
      "player_perk_armor_regen_timer_multiplier_1"
    },
    player_perk_armor_regen_timer_multiplier_2 = { name = "Recovery Lv2", desc = "15% faster armor recovery.",
      "player_perk_armor_regen_timer_multiplier_2"
    },
    player_perk_armor_regen_timer_multiplier_3 = { name = "Recovery Lv3", desc = "25% faster armor recovery.",
      "player_perk_armor_regen_timer_multiplier_3"
    },
    player_perk_armor_regen_timer_multiplier_4 = { name = "Recovery Lv4", desc = "35% faster armor recovery.",
      "player_perk_armor_regen_timer_multiplier_4"
    },
    player_perk_armor_regen_timer_multiplier_5 = { name = "Recovery Lv5", desc = "45% faster armor recovery.",
      "player_perk_armor_regen_timer_multiplier_5"
    },
    player_passive_always_regen_armor_1 = { name = "Tooth and Claw", desc = "Armor recovery cannot be delayed.",
      "player_passive_always_regen_armor_1"
    },
    -- Crook
    player_level_2_dodge_addend_1 = { name = "LBV Composure Lv1", desc = "+5% dodge chance (lightweight ballistic vest).",
      "player_level_2_dodge_addend_1"
    },
    player_level_2_dodge_addend_2 = { name = "LBV Composure Lv2", desc = "+15% dodge chance (lightweight ballistic vest).",
      "player_level_2_dodge_addend_2"
    },
    player_level_2_dodge_addend_3 = { name = "LBV Composure Lv3", desc = "+25% dodge chance (lightweight ballistic vest).",
      "player_level_2_dodge_addend_3"
    },
    player_level_2_armor_multiplier_1 = { name = "LBV Impact Lv1", desc = "20% armor bonus (lightweight ballistic vest).",
      "player_level_2_armor_multiplier_1"
    },
    player_level_2_armor_multiplier_2 = { name = "LBV Impact Lv2", desc = "40% armor bonus (lightweight ballistic vest).",
      "player_level_2_armor_multiplier_2"
    },
    player_level_2_armor_multiplier_3 = { name = "LBV Impact Lv3", desc = "65% armor bonus (lightweight ballistic vest).",
      "player_level_2_armor_multiplier_3"
    },
    player_level_3_dodge_addend_1 = { name = "Vest Composure Lv1", desc = "+5% dodge chance (ballistic vest).",
      "player_level_3_dodge_addend_1"
    },
    player_level_3_dodge_addend_2 = { name = "Vest Composure Lv2", desc = "+15% dodge chance (ballistic vest).",
      "player_level_3_dodge_addend_2"
    },
    player_level_3_dodge_addend_3 = { name = "Vest Composure Lv3", desc = "+25% dodge chance (ballistic vest).",
      "player_level_3_dodge_addend_3"
    },
    player_level_3_armor_multiplier_1 = { name = "Vest Impact Lv1", desc = "20% armor bonus (ballistic vest).",
      "player_level_3_armor_multiplier_1"
    },
    player_level_3_armor_multiplier_2 = { name = "Vest Impact Lv2", desc = "40% armor bonus (ballistic vest).",
      "player_level_3_armor_multiplier_2"
    },
    player_level_3_armor_multiplier_3 = { name = "Vest Impact Lv3", desc = "65% armor bonus (ballistic vest).",
      "player_level_3_armor_multiplier_3"
    },
    player_level_4_dodge_addend_1 = { name = "HBV Composure Lv1", desc = "+5% dodge chance (heavy ballistic vest).",
      "player_level_4_dodge_addend_1"
    },
    player_level_4_dodge_addend_2 = { name = "HBV Composure Lv2", desc = "+15% dodge chance (heavy ballistic vest).",
      "player_level_4_dodge_addend_2"
    },
    player_level_4_dodge_addend_3 = { name = "HBV Composure Lv3", desc = "+25% dodge chance (heavy ballistic vest).",
      "player_level_4_dodge_addend_3"
    },
    player_armor_regen_timer_multiplier_tier = { name = "Composure", desc = "10% faster armor recovery.",
      "player_armor_regen_timer_multiplier_tier"
    },
    
    -- Burglar
    burglar_dodge_1 = { name = "INVALID", desc = "+20% dodge chance.",
      "player_tier_dodge_chance_1"
    },
    burglar_dodge_2 = { name = "INVALID", desc = "+25% dodge chance.",
      "player_tier_dodge_chance_2"
    },
    burglar_dodge_3 = { name = "INVALID", desc = "+30% dodge chance.",
      "player_tier_dodge_chance_3"
    },
    burglar_prio_red_1 = { name = "INVALID", desc = "Target priority reduced by 10% while crouching and stationary.",
      "player_stand_still_crouch_camouflage_bonus_1"
    },
    burglar_prio_red_2 = { name = "INVALID", desc = "Target priority reduced by 15% while crouching and stationary.",
      "player_stand_still_crouch_camouflage_bonus_2"
    },
    burglar_prio_red_3 = { name = "INVALID", desc = "Target priority reduced by 20% while crouching and stationary.",
      "player_stand_still_crouch_camouflage_bonus_3"
    },
    burglar_bag_speed = { name = "INVALID", desc = "20% faster body bag speed.",
      "player_corpse_dispose_speed_multiplier"
    },
    burglar_lockpick_speed = { name = "INVALID", desc = "20% faster lockpick speed.",
      "player_pick_lock_speed_multiplier"
    },
    burglar_pager_speed = { name = "INVALID", desc = "10% faster pager answering speed.",
      "player_alarm_pager_speed_multiplier"
    },
    burglar_recovery = { name = "INVALID", desc = "20% faster armor recovery while crouching and stationary.",
      "player_armor_regen_timer_stand_still_multiplier"
    },
    
    -- Infiltrator
    infil_overdog = { name = "INVALID", desc = "12% damage reduction when 3+ enemies within 18m.",
      "player_damage_dampener_outnumbered_strong"
    },
    infil_single_dog_1 = { name = "INVALID", desc = "8% damage reduction when an enemy is within 18m.",
      "player_damage_dampener_close_contact_1"
    },
    infil_single_dog_2 = { name = "INVALID", desc = "16% damage reduction when an enemy is within 18m.",
      "player_damage_dampener_close_contact_2"
    },
    infil_single_dog_3 = { name = "INVALID", desc = "24% damage reduction when an enemy is within 18m.",
      "player_damage_dampener_close_contact_3"
    },
    infil_melee_boost = { name = "INVALID", desc = "10x damage on melee hits performed within 1 second.",
      "melee_stacking_hit_damage_multiplier_1"
    },
    infil_melee_timer = { name = "INVALID", desc = "Psychopath timer increased to 7 seconds.",
      "melee_stacking_hit_expire_t"
    },
    infil_melee_heal = { name = "INVALID", desc = "Heal 20% on melee hit (10s cooldown).",
      "player_melee_life_leech"
    },
    
    -- Sociopath
    socio_armor_1 = { name = "INVALID", desc = "+30 armor on kill.",
      "player_killshot_regen_armor_bonus"
    },
    socio_heal = { name = "INVALID", desc = "Heal 10% on melee kill.",
      "player_melee_kill_life_leech"
    },
    socio_armor_2 = { name = "INVALID", desc = "+30 armor on kills within 18m (1s cooldown).",
      "player_killshot_close_regen_armor_bonus"
    },
    socio_panic = { name = "INVALID", desc = "75% chance to cause panic on kills within 18m (1s cooldown).",
      "player_killshot_close_panic_chance"
    },
    
    -- Gambler
    temporary_loose_ammo_restore_health_1 = { name = "Medical Supplies Lv1", desc = "Heal 16-24 health on ammo pickup.",
      "temporary_loose_ammo_restore_health_1"
    },
    temporary_loose_ammo_restore_health_2 = { name = "Medical Supplies Lv2", desc = "Heal 24-32 health on ammo pickup.",
      "temporary_loose_ammo_restore_health_2"
    },
    temporary_loose_ammo_restore_health_3 = { name = "Medical Supplies Lv3", desc = "Heal 32-40 health on ammo pickup.",
      "temporary_loose_ammo_restore_health_3"
    },
    
    -- Grinder
    grind_hot_1 = { name = "INVALID", desc = "+1 health every 0.3s for 3s on damage dealt (1.5s cooldown, req. suit/lightweight ballistic vest).",
      "player_damage_to_hot_1"
    },
    grind_hot_2 = { name = "INVALID", desc = "+2 health every 0.3s for 3s on damage dealt (1.5s cooldown, req. suit/lightweight ballistic vest).",
      "player_damage_to_hot_2"
    },
    grind_hot_3 = { name = "INVALID", desc = "+3 health every 0.3s for 3s on damage dealt (1.5s cooldown, req. suit/lightweight ballistic vest).",
      "player_damage_to_hot_3"
    },
    grind_hot_4 = { name = "INVALID", desc = "+4 health every 0.3s for 3s on damage dealt (1.5s cooldown, req. suit/lightweight ballistic vest).",
      "player_damage_to_hot_4"
    },
    grind_ap_1 = { name = "INVALID", desc = "10% chance to pierce enemy armor.",
      "player_armor_piercing_chance_1"
    },
    grind_ap_2 = { name = "INVALID", desc = "30% chance to pierce enemy armor.",
      "player_armor_piercing_chance_2"
    },
    grind_hot_duration = { name = "INVALID", desc = "'Dopamine' lasts 40% longer.",
      "player_damage_to_hot_extra_ticks"
    },
    
    -- Yakuza
    yakuza_recovery_1 = { name = "INVALID", desc = "Armor recovery scales with health lost (up to 20% faster).",
      "player_armor_regen_damage_health_ratio_multiplier_1"
    },
    yakuza_recovery_2 = { name = "INVALID", desc = "Armor recovery scales with health lost (up to 40% faster).",
      "player_armor_regen_damage_health_ratio_multiplier_2"
    },
    yakuza_recovery_3 = { name = "INVALID", desc = "Armor recovery scales with health lost (up to 60% faster).",
      "player_armor_regen_damage_health_ratio_multiplier_3"
    },
    yakuza_speed = { name = "INVALID", desc = "Movement speed scales with health lost (up to 20% faster).",
      "player_movement_speed_damage_health_ratio_multiplier"
    },
    yakuza_threshold = { name = "INVALID", desc = "'Irezumi' effects start from 50% health instead of 25%.",
      "player_armor_regen_damage_health_ratio_threshold_multiplier", "player_movement_speed_damage_health_ratio_threshold_multiplier"
    },
    
    -- Ex-Pres
    player_armor_health_store_amount_1 = { name = "Break Lv1", desc = "Store 4 health per kill that is consumed on armor recovery.",
      "player_armor_health_store_amount_1"
    },
    player_armor_health_store_amount_2 = { name = "Break Lv2", desc = "Store 8 health per kill that is consumed on armor recovery.",
      "player_armor_health_store_amount_2"
    },
    player_armor_health_store_amount_3 = { name = "Break Lv3", desc = "Store 12 health per kill that is consumed on armor recovery.",
      "player_armor_health_store_amount_3"
    },
    player_armor_max_health_store_multiplier = { name = "Life of Ice", desc = "'Break' can store 50% more health.",
      "player_armor_max_health_store_multiplier"
    },
    player_kill_change_regenerate_speed = { name = "Perfect Line", desc = "Kills increase speed of next armor recovery. Weaker armors give more speed.",
      "player_kill_change_regenerate_speed"
    },
    
    -- Maniac
    player_cocaine_stacking_1 = { name = "Excitement", desc = "Every 4 seconds gain 1 damage absorption (up to 20) for every 30 damage dealt, decaying after 8 seconds.",
      "player_cocaine_stacking_1"
    },
    player_cocaine_stacks_decay_multiplier_1 = { name = "Fervor", desc = "Decay from 'Excitement' is reduced.",
      "player_cocaine_stacks_decay_multiplier_1"
    },
    player_sync_cocaine_upgrade_level_1 = { name = "Recklessness", desc = "Damage needed for 'Excitement' is reduced to 25 (max 24 absorption).",
      "player_sync_cocaine_upgrade_level_1"
    },
    player_cocaine_stack_absorption_multiplier_1 = { name = "Insanity", desc = "Damage absorption from 'Excitement' is doubled.",
      "player_cocaine_stack_absorption_multiplier_1"
    },
    
    -- Anarchist
    anarch_main = { name = "INVALID", desc = "Armor continuously recovers. Weaker armors recover faster.",
      "player_armor_grinding_1"
    },
    anarch_armor_1 = { name = "INVALID", desc = "Health reduced by 50%, armor increased by 100% of max health.",
      "player_armor_increase_1", "player_health_decrease_1"
    },
    anarch_armor_2 = { name = "INVALID", desc = "Health reduced by 50%, armor increased by 110% of max health.",
      "player_armor_increase_2", "player_health_decrease_1"
    },
    anarch_armor_3 = { name = "INVALID", desc = "Health reduced by 50%, armor increased by 120% of max health.",
      "player_armor_increase_3", "player_health_decrease_1"
    },
    anarch_bullseye = { name = "INVALID", desc = "+10 armor on damage dealt (1.5s cooldown).",
      "player_damage_to_armor_1"
    },
    
    -- Biker
    biker_main = { name = "INVALID", desc = "+5 health/armor on kill (up to 4 times in 4 seconds).",
      "player_wild_health_amount_1", "player_wild_armor_amount_1"
    },
    biker_armor_plus = { name = "INVALID", desc = "+1 armor on kill per 10% health lost.",
      "player_less_health_wild_armor_1"
    },
    biker_health_cd = { name = "INVALID", desc = "'Prospect' cooldown reduced by 0.1s per 10% health lost.",
      "player_less_health_wild_cooldown_1"
    },
    biker_health_plus = { name = "INVALID", desc = "+1 health on kill per 10% armor lost.",
      "player_less_armor_wild_health_1"
    },
    biker_armor_cd = { name = "INVALID", desc = "'Prospect' cooldown reduced by 0.1s per 10% armor lost.",
      "player_less_armor_wild_cooldown_1"
    },
    
    -- Kingpin
    kingpin_injector = { name = "INVALID", desc = "Can equip injector.",
      "chico_injector", "temporary_chico_injector_1"
    },
    kingpin_prio = { name = "INVALID", desc = "Target priority increased while injector is active.",
      "player_chico_preferred_target"
    },
    kingpin_immunity = { name = "INVALID", desc = "Injector heals additional 25% of all damage taken below 50% health while active.",
      "player_chico_injector_low_health_multiplier"
    },
    kingpin_cd = { name = "INVALID", desc = "Injector cooldown reduced by 1s for every 5 health gained at max health while active.",
      "player_chico_injector_health_to_speed"
    },
    
    -- Sicario
    smoke_screen_grenade = { name = "Smoker", desc = "Can equip smoke bomb.",
      "smoke_screen_grenade"
    },
    player_dodge_shot_gain = { name = "Twitch", desc = "+20% dodge chance when shot. Resets on dodge (4s cooldown).",
      "player_dodge_shot_gain"
    },
    player_dodge_replenish_armor = { name = "Agility Shield", desc = "Dodging recovers armor.",
      "player_dodge_replenish_armor"
    },
    player_sicario_multiplier = { name = "Unseen Shadow", desc = "Smoke bomb effects are doubled.",
      "player_sicario_multiplier"
    },
    
    -- Stoic
    damage_control = { name = "Virtue", desc = "75% damage reduction. Damage is applied over 12 seconds.",
      "damage_control", "player_damage_control_passive"
    },
    player_damage_control_cooldown_drain_1 = { name = "Imperturbable Lv1", desc = "Hip flask cooldown reduced by 1s on kill.",
      "player_damage_control_cooldown_drain_1"
    },
    player_damage_control_cooldown_drain_2 = { name = "Imperturbable Lv2", desc = "Hip flask cooldown reduced by 2s on kill when below 35% health.",
      "player_damage_control_cooldown_drain_2"
    },
    player_armor_to_health_conversion = { name = "Unmoved", desc = "Armor is converted into health.",
      "player_armor_to_health_conversion"
    },
    player_damage_control_auto_shrug = { name = "", desc = "Lingering damage from 'Virtue' is negated after not taking damage for 4s.",
      "player_damage_control_auto_shrug"
    },
    player_damage_control_healing = { name = "", desc = "50% of lingering damage from 'Virtue' is healed when damage is negated.",
      "player_damage_control_healing"
    },
    
    -- Tag Team
    tag_team_base = { name = "INVALID", desc = "Can equip gas dispenser.",
      "tag_team", "player_tag_team_base"
    },
    tag_team_cd_1 = { name = "INVALID", desc = "Gas dispenser cooldown reduced by 2s on kill.",
      "player_tag_team_cooldown_drain_1"
    },
    tag_team_cd_2 = { name = "INVALID", desc = "Gas dispenser tag kills reduce cooldown by 2s on kill.",
      "player_tag_team_cooldown_drain_2"
    },
    tag_team_absorption = { name = "INVALID", desc = "+2 damage absorption on kill (up to 20) while gas dispenser is active.",
      "player_tag_team_damage_absorption"
    },
    
    -- Hacker
    pocket_ecm_jammer = { name = "Code Glitch", desc = "Unlock the pocket ECM.",
      "pocket_ecm_jammer", "player_pocket_ecm_jammer_base"
    },
    player_pocket_ecm_heal_on_kill_1 = { name = "Bit Decay", desc = "+20 health on kill while pocket ECM is active.",
      "player_pocket_ecm_heal_on_kill_1"
    },
    player_pocket_ecm_kill_dodge_1 = { name = "Kluge", desc = "+20% dodge chance on kill for 30s while pocket ECM is active.",
      "player_pocket_ecm_kill_dodge_1"
    },
    
    -- Leech
    copr_ability = { name = "Momentum", desc = "Unlocks the leech ampule.",
      "copr_ability", "temporary_copr_ability_1", "player_copr_static_damage_ratio_1", "player_copr_kill_life_leech_1",
      "player_copr_activate_bonus_health_ratio_1", "player_copr_teammate_heal_1"
    },
    temporary_copr_ability_2 = { name = "", desc = "Leech ampule lasts 10 seconds.",
      "temporary_copr_ability_2"
    },
    player_copr_static_damage_ratio_2 = { name = "", desc = "Leech ampule splits health into segments of 10%.",
      "player_copr_static_damage_ratio_2", "player_copr_kill_life_leech_2"
    },
    player_copr_out_of_health_move_slow_1 = { name = "Indomitable", desc = "Going down reduces movement speed by 80% while leech ampule is active.",
      "player_copr_out_of_health_move_slow_1"
    },
    player_copr_speed_up_on_kill_1 = { name = "", desc = "Kills reduce leech ampule cooldown by 1s.",
      "player_copr_speed_up_on_kill_1"
    },
    player_activate_ability_downed = { name = "Symbiosis", desc = "Leech ampule can be used while down, but you will go back down unless you revive a teammate or use a doctor bag.",
      "player_activate_ability_downed"
    },
    
    -- Copycat
    mrwi_health_multiplier_1 = { name = "Thriving", desc = "20% health bonus",
      "mrwi_health_multiplier_1"
    },
    mrwi_health_multiplier_2 = { name = "Thriving", desc = "20% health bonus",
      "mrwi_health_multiplier_2"
    },
    mrwi_health_multiplier_3 = { name = "Thriving", desc = "20% health bonus",
      "mrwi_health_multiplier_3"
    },
    mrwi_health_multiplier_4 = { name = "Thriving", desc = "20% health bonus",
      "mrwi_health_multiplier_4"
    },
    mrwi_armor_multiplier_1 = { name = "Toughen Up", desc = "5% armor bonus.",
      "mrwi_armor_multiplier_1"
    },
    mrwi_armor_multiplier_2 = { name = "Toughen Up", desc = "5% armor bonus.",
      "mrwi_armor_multiplier_2"
    },
    mrwi_armor_multiplier_3 = { name = "Toughen Up", desc = "5% armor bonus.",
      "mrwi_armor_multiplier_3"
    },
    mrwi_armor_multiplier_4 = { name = "Toughen Up", desc = "5% armor bonus.",
      "mrwi_armor_multiplier_4"
    },
    mrwi_dodge_chance_1 = { name = "Cat-Like Reflex", desc = "+5% dodge chance.",
      "mrwi_dodge_chance_1"
    },
    mrwi_dodge_chance_2 = { name = "Cat-Like Reflex", desc = "+5% dodge chance.",
      "mrwi_dodge_chance_2"
    },
    mrwi_dodge_chance_3 = { name = "Cat-Like Reflex", desc = "+5% dodge chance.",
      "mrwi_dodge_chance_3"
    },
    mrwi_dodge_chance_4 = { name = "Cat-Like Reflex", desc = "+5% dodge chance.",
      "mrwi_dodge_chance_4"
    },
    mrwi_crouch_speed_multiplier_1 = { name = "Fleet Footed", desc = "Crouch speed increased by 10%.",
      "mrwi_crouch_speed_multiplier_1"
    },
    mrwi_crouch_speed_multiplier_2 = { name = "Fleet Footed", desc = "Crouch speed increased by 10%.",
      "mrwi_crouch_speed_multiplier_2"
    },
    mrwi_crouch_speed_multiplier_3 = { name = "Fleet Footed", desc = "Crouch speed increased by 10%.",
      "mrwi_crouch_speed_multiplier_3"
    },
    mrwi_crouch_speed_multiplier_4 = { name = "Fleet Footed", desc = "Crouch speed increased by 10%.",
      "mrwi_crouch_speed_multiplier_4"
    },
    mrwi_carry_speed_multiplier_1 = { name = "Haul Ass", desc = "Move 10% faster while carrying a bag.",
      "mrwi_carry_speed_multiplier_1"
    },
    mrwi_carry_speed_multiplier_2 = { name = "Haul Ass", desc = "Move 10% faster while carrying a bag.",
      "mrwi_carry_speed_multiplier_2"
    },
    mrwi_carry_speed_multiplier_3 = { name = "Haul Ass", desc = "Move 10% faster while carrying a bag.",
      "mrwi_carry_speed_multiplier_3"
    },
    mrwi_carry_speed_multiplier_4 = { name = "Haul Ass", desc = "Move 10% faster while carrying a bag.",
      "mrwi_carry_speed_multiplier_4"
    },
    player_primary_reload_secondary_1 = { name = "Tactical Reload", desc = "Secondary reloads after 10 kills with primary.",
      "player_primary_reload_secondary_1"
    },
    player_secondary_reload_primary_1 = { name = "Tactical Reload", desc = "Primary reloads after 10 kills with secondary.",
      "player_secondary_reload_primary_1"
    },
    weapon_mrwi_swap_speed_multiplier_1 = { name = "Tactical Switch", desc = "160% faster weapon switch speed for 3s after 'Tactical Reload' is triggered.",
      "weapon_mrwi_swap_speed_multiplier_1"
    },
    player_headshot_regen_health_bonus_1 = { name = "Head Game", desc = "+10 health on headshot (2s cooldown).",
      "player_headshot_regen_health_bonus_1"
    },
    player_dodge_ricochet_bullets = { name = "Ricochet", desc = "Dodged bullets damage the enemy that fired them.",
      "player_dodge_ricochet_bullets"
    },
    temporary_mrwi_health_invulnerable_1 = { name = "Grace Period", desc = "Immunity for 2s when health goes below 50% (15s cooldown).",
      "temporary_mrwi_health_invulnerable_1"
    }
  },

  stats = {
  
    -- Default Upgrades
    player_walk_speed_multiplier = { name = "Shinobi", desc = "Walk speed increased by 25%. Crouch speed increased by 10%.",
      "player_walk_speed_multiplier", "player_crouch_speed_multiplier"
    },
    carry_interact_speed_multiplier_1 = { name = "Fast Hands Lv1", desc = "Interact with baggable loot 25% faster.",
      "carry_interact_speed_multiplier_1"
    },
    carry_interact_speed_multiplier_2 = { name = "Fast Hands Lv2", desc = "Interact with baggable loot 75% faster.",
      "carry_interact_speed_multiplier_2"
    },
    carry_movement_speed_multiplier = { name = "Transporter", desc = "Move 50% faster while carrying a bag.",
      "carry_movement_speed_multiplier"
    },
    player_fall_damage_multiplier = { name = "", desc = "Take 75% less damage from falls.",
      "player_fall_damage_multiplier"
    },
    player_corpse_dispose_amount_1 = { name = "Winston Wolfe Lv1", desc = "Can hold up to 2 body bags.",
      "player_corpse_dispose_amount_1"
    },
    player_corpse_dispose_amount_2 = { name = "Winston Wolfe Lv2", desc = "Can hold up to 3 body bags.",
      "player_corpse_dispose_amount_2"
    },
    striker_reload_speed_default = { name = "Lighter Cylinder", desc = "Street Sweeper reloads 15% faster.",
      "striker_reload_speed_default"
    },
    akimbo_recoil_index_addend_1 = { name = "Ambidexterity Lv1", desc = "+8 stability (akimbo).",
      "akimbo_recoil_index_addend_1"
    },
    akimbo_recoil_index_addend_2 = { name = "Ambidexterity Lv2", desc = "+16 stability (akimbo).",
      "akimbo_recoil_index_addend_2"
    },
    akimbo_recoil_index_addend_3 = { name = "Ambidexterity Lv3", desc = "+24 stability (akimbo).",
      "akimbo_recoil_index_addend_3"
    },
    akimbo_recoil_index_addend_4 = { name = "Ambidexterity Lv4", desc = "+32 stability (akimbo).",
      "akimbo_recoil_index_addend_4"
    },
    
    -- Mastermind Skills
    first_aid_kit_quantity_increase_1 = { name = "Walking Pharmacy Lv1", desc = "11 FAKs.",
      "first_aid_kit_quantity_increase_1"
    },
    first_aid_kit_quantity_increase_2 = { name = "Walking Pharmacy Lv2", desc = "14 FAKs.",
      "first_aid_kit_quantity_increase_2"
    },
    doctor_bag_quantity = { name = "Deep Pockets", desc = "+1 doctor bag.",
      "doctor_bag_quantity"
    },
    doctor_bag_amount_increase1 = { name = "Stockpile", desc = "Doctor bags get 2 additional charges.",
      "doctor_bag_amount_increase1"
    },
    player_revive_interaction_speed_multiplier = { name = "Code Blue", desc = "100% faster revive speed.",
      "player_revive_interaction_speed_multiplier"
    },
    cable_tie_quantity = { name = "Cable Ties", desc = "+4.",
      "cable_tie_quantity"
    },
    cable_tie_interact_speed_multiplier = { name = "Manipulator", desc = "75% faster cable tie speed.",
      "cable_tie_interact_speed_multiplier"
    },
    player_intimidate_range_mul = { name = "Confident", desc = "Shout distance increased by 50%.",
      "player_intimidate_range_mul"
    },
    player_civ_intimidation_mul = { name = "", desc = "Civs remain intimidated for 50% longer.",
      "player_civ_intimidation_mul"
    },
    player_stability_increase_bonus_1 = { name = "Stability", desc = "+8.",
      "player_stability_increase_bonus_1"
    },
    player_not_moving_accuracy_increase_bonus_1 = { name = "Accuracy", desc = "+16 while stationary.",
      "player_not_moving_accuracy_increase_bonus_1"
    },
    weapon_enter_steelsight_speed_multiplier = { name = "Target Acquisition", desc = "Faster ADS speed.",
      "weapon_enter_steelsight_speed_multiplier", "shotgun_enter_steelsight_speed_multiplier"
    },
    player_steelsight_normal_movement_speed = { name = "Movement Speed", desc = "Unaffected by ADS.",
      "player_steelsight_normal_movement_speed"
    },
    lmg_zoom_increase = { name = "ADS Zoom", desc = "Increased by 25% (SMGs/LMGs/ARs/snipers/pistols).",
      "lmg_zoom_increase", "assault_rifle_zoom_increase", "snp_zoom_increase", "smg_zoom_increase", "pistol_zoom_increase"
    },
    assault_rifle_move_spread_index_addend = { name = "Accuracy", desc = "+16 while moving (SMGs/ARs/snipers).",
      "assault_rifle_move_spread_index_addend", "snp_move_spread_index_addend", "smg_move_spread_index_addend"
    },
    weapon_single_spread_index_addend = { name = "Accuracy", desc = "+8 while ADS (single shot SMGs/ARs/snipers).",
      "weapon_single_spread_index_addend"
    },
    single_shot_accuracy_inc_1 = { name = "Accuracy", desc = "20% bonus while ADS (single shot SMGs/ARs/snipers).",
      "single_shot_accuracy_inc_1"
    },
    assault_rifle_reload_speed_multiplier = { name = "Kilmer", desc = "Reload SMGs/ARs/snipers 15% faster.",
      "assault_rifle_reload_speed_multiplier", "smg_reload_speed_multiplier", "snp_reload_speed_multiplier"
    },
    
    -- Enforcer Skills
    shotgun_reload_speed_multiplier_1 = { name = "Shotgun CQB Lv1", desc = "Reload shotguns 15% faster.",
      "shotgun_reload_speed_multiplier_1"
    },
    shotgun_reload_speed_multiplier_2 = { name = "Shotgun CQB Lv2", desc = "Reload shotguns 50% faster.",
      "shotgun_reload_speed_multiplier_2"
    },
    shotgun_recoil_index_addend = { name = "Stability", desc = "+8 (shotguns).",
      "shotgun_recoil_index_addend"
    },
    shotgun_damage_multiplier_1 = { name = "Shotgun Impact Lv1", desc = "5% damage bonus (shotguns).",
      "shotgun_damage_multiplier_1"
    },
    shotgun_damage_multiplier_2 = { name = "Shotgun Impact Lv2", desc = "10% damage bonus (shotguns).",
      "shotgun_damage_multiplier_2"
    },
    shotgun_steelsight_accuracy_inc_1 = { name = "Accuracy", desc = "40% bonus while ADS (shotguns)",
      "shotgun_steelsight_accuracy_inc_1"
    },
    shotgun_steelsight_range_inc_1 = { name = "Far Away", desc = "50% increased effective range while ADS (shotguns).",
      "shotgun_steelsight_range_inc_1"
    },
    shotgun_hip_rate_of_fire_1 = { name = "Slamfire", desc = "35% fire rate bonus (single shot shotguns).",
      "shotgun_hip_rate_of_fire_1"
    },
    shotgun_magazine_capacity_inc_1 = { name = "", desc = "+15 mag size (mag-fed shotguns).",
      "shotgun_magazine_capacity_inc_1"
    },
    weapon_swap_speed_multiplier = { name = "", desc = "80% faster weapon switch speed.",
      "weapon_swap_speed_multiplier"
    },
    player_armor_regen_time_mul_1 = { name = "", desc = "15% faster armor recovery.",
      "player_armor_regen_time_mul_1"
    },
    team_armor_regen_time_multiplier = { name = "", desc = "25% faster armor recovery for crew.",
      "team_armor_regen_time_multiplier"
    },
    player_flashbang_multiplier_2 = { name = "Stun Resistance", desc = "75% flashbang resistance.",
      "player_flashbang_multiplier_2"
    },
    player_level_2_armor_addend = { name = "", desc = "+20 armor (lightweight ballistic vest).",
      "player_level_2_armor_addend"
    },
    player_level_3_armor_addend = { name = "", desc = "+20 armor (ballistic vest).",
      "player_level_3_armor_addend"
    },
    player_level_4_armor_addend = { name = "", desc = "+20 armor (heavy ballistic vest).",
      "player_level_4_armor_addend"
    },
    carry_throw_distance_multiplier = { name = "Catapult", desc = "+50% bag throw distance.",
      "carry_throw_distance_multiplier"
    },
    player_armor_multiplier = { name = "Bulletproof", desc = "30% armor bonus.",
      "player_armor_multiplier"
    },
    player_increased_pickup_area_1 = { name = "", desc = "Ammo pickup range increased by 50%.",
      "player_increased_pickup_area_1"
    },
    saw_extra_ammo_multiplier = { name = "", desc = "+1 saw blade.",
      "saw_extra_ammo_multiplier"
    },
    player_saw_speed_multiplier_1 = { name = "Faster Motor Lv1", desc = "5% fire rate bonus (saw).",
      "player_saw_speed_multiplier_1"
    },
    player_saw_speed_multiplier_2 = { name = "Faster Motor Lv2", desc = "35% fire rate bonus (saw).",
      "player_saw_speed_multiplier_2"
    },
    saw_lock_damage_multiplier_1 = { name = "Carbon Blade Lv1", desc = "Saw deals 20% more damage against locks.",
      "saw_lock_damage_multiplier_1"
    },
    saw_lock_damage_multiplier_2 = { name = "Carbon Blade Lv2", desc = "Saw deals 40% more damage against locks.",
      "saw_lock_damage_multiplier_2"
    },
    ammo_bag_quantity = { name = "Deep Pockets", desc = "+1 ammo bag.",
      "ammo_bag_quantity"
    },
    ammo_bag_ammo_increase1 = { name = "Stockpile", desc = "Ammo bags hold 50% more ammo.",
      "ammo_bag_ammo_increase1"
    },
    saw_enemy_slicer = { name = "Saw Massacre", desc = "Saw is twice as efficient against enemies.",
      "saw_enemy_slicer"
    },
    extra_ammo_multiplier1 = { name = "Fully Loaded", desc = "Ammo capacity increased by 25%.",
      "extra_ammo_multiplier1"
    },
    
    -- Technician Skills
    sentry_gun_cost_reduction_1 = { name = "Eco Sentry Lv1", desc = "Sentry ammo cost reduced by 5%.",
      "sentry_gun_cost_reduction_1"
    },
    sentry_gun_cost_reduction_2 = { name = "Eco Sentry Lv2", desc = "Sentry ammo cost reduced by 10%.",
      "sentry_gun_cost_reduction_2"
    },
    sentry_gun_spread_multiplier = { name = "Targeting Package", desc = "Sentry gets a 100% accuracy bonus.",
      "sentry_gun_spread_multiplier"
    },
    sentry_gun_rot_speed_multiplier = { name = "Improved Servo", desc = "Sentry rotates 150% faster.",
      "sentry_gun_rot_speed_multiplier"
    },
    sentry_gun_extra_ammo_multiplier_1 = { name = "Ammo Cache", desc = "Sentry ammo capacity increased by 50%.",
      "sentry_gun_extra_ammo_multiplier_1"
    },
    sentry_gun_armor_multiplier = { name = "Armor Plating", desc = "Sentry health increased by 150%.",
      "sentry_gun_armor_multiplier"
    },
    deploy_interact_faster_1 = { name = "", desc = "100% faster deployable interactions.",
      "deploy_interact_faster_1"
    },
    sentry_gun_quantity_1 = { name = "Tower Defense Lv1", desc = "2 sentries.",
      "sentry_gun_quantity_1"
    },
    sentry_gun_quantity_2 = { name = "Tower Defense Lv2", desc = "4 sentries.",
      "sentry_gun_quantity_2"
    },
    player_drill_fix_interaction_speed_multiplier = { name = "Toolkit", desc = "Repair drills and saws 25% faster.",
      "player_drill_fix_interaction_speed_multiplier"
    },
    player_trip_mine_deploy_time_multiplier_2 = { name = "Demolition Man", desc = "Deploy trip mines 20% faster.",
      "player_trip_mine_deploy_time_multiplier_2"
    },
    trip_mine_explosion_size_multiplier_1 = { name = "Tactical Mines", desc = "Trip mine explosions are 30% bigger.",
      "trip_mine_explosion_size_multiplier_1"
    },
    trip_mine_explosion_size_multiplier_2 = { name = "Tactical Mines", desc = "Trip mine explosions are 70% bigger.",
      "trip_mine_explosion_size_multiplier_2"
    },
    trip_mine_damage_multiplier_1 = { name = "Combat Engineering", desc = "50% damage bonus (trip mines).",
      "trip_mine_damage_multiplier_1"
    },
    shape_charge_quantity_increase_1 = { name = "Shaped Charge Lv1", desc = "4 shaped charges.",
      "shape_charge_quantity_increase_1"
    },
    shape_charge_quantity_increase_2 = { name = "Shaped Charge Lv2", desc = "6 shaped charges.",
      "shape_charge_quantity_increase_2"
    },
    trip_mine_quantity_increase_1 = { name = "More Firepower Lv1", desc = "7 trip mines.",
      "trip_mine_quantity_increase_1"
    },
    trip_mine_quantity_increase_2 = { name = "More Firepower Lv2", desc = "14 trip mines.",
      "trip_mine_quantity_increase_2"
    },
    player_weapon_accuracy_increase_1 = { name = "Accuracy", desc = "+8.",
      "player_weapon_accuracy_increase_1"
    },
    player_stability_increase_bonus_2 = { name = "Stability", desc = "+16",
      "player_stability_increase_bonus_2"
    },
    player_hip_fire_accuracy_inc_1 = { name = "Accuracy", desc = "+12 (hipfire).",
      "player_hip_fire_accuracy_inc_1"
    },
    player_weapon_movement_stability_1 = { name = "Stability", desc = "Movement penalty reduced by 20%.",
      "player_weapon_movement_stability_1"
    },
    player_weapon_movement_stability_1 = { name = "Surefire", desc = "+15 mag size (SMGs/LMGs/ARs).",
      "player_automatic_mag_increase_1"
    },
    
    -- Ghost Skills
    player_suspicion_bonus = { name = "Chameleon", desc = "25% reduced detection in casing mode.",
      "player_suspicion_bonus"
    },
    bodybags_bag_quantity = { name = "Deep Pockets", desc = "+1 body bag case.",
      "bodybags_bag_quantity"
    },
    player_cleaner_cost_multiplier = { name = "Cleaner Costs", desc = "75% reduction.",
      "player_cleaner_cost_multiplier"
    },
    player_pick_lock_easy_speed_multiplier = { name = "Dextrous", desc = "100% faster lockpick speed.",
      "player_pick_lock_easy_speed_multiplier"
    },
    ecm_jammer_duration_multiplier = { name = "ECM Specialist Lv1", desc = "ECM jamming duration increased by 25%.",
      "ecm_jammer_duration_multiplier"
    },
    ecm_jammer_duration_multiplier_2 = { name = "ECM Specialist Lv2", desc = "ECM jamming duration increased by 50%.",
      "ecm_jammer_duration_multiplier_2", "ecm_jammer_duration_multiplier"
    },
    ecm_jammer_feedback_duration_boost = { name = "ECM Overdrive Lv1", desc = "ECM feedback duration increased by 25%.",
      "ecm_jammer_feedback_duration_boost"
    },
    ecm_jammer_feedback_duration_boost_2 = { name = "ECM Overdrive Lv2", desc = "ECM feedback duration increased by 50%.",
      "ecm_jammer_feedback_duration_boost_2", "ecm_jammer_feedback_duration_boost"
    },
    ecm_jammer_quantity_increase_1 = { name = "ECM Lv1", desc = "2 ECM jammers.",
      "ecm_jammer_quantity_increase_1"
    },
    ecm_jammer_quantity_increase_2 = { name = "ECM Lv2", desc = "4 ECM jammers.",
      "ecm_jammer_quantity_increase_2"
    },
    player_run_speed_multiplier = { name = "Sprinter", desc = "+10% dodge chance while sprinting and 25% faster sprint speed/stamina recovery.",
      "player_run_speed_multiplier", "player_run_dodge_chance", "player_stamina_regen_timer_multiplier", "player_stamina_regen_multiplier"
    },
    player_movement_speed_multiplier = { name = "Nimble", desc = "10% faster movement speed.",
      "player_movement_speed_multiplier"
    },
    player_climb_speed_multiplier_1 = { name = "Gym Rat Lv1", desc = "20% faster climbing speed.",
      "player_climb_speed_multiplier_1"
    },
    player_climb_speed_multiplier_2 = { name = "Gym Rat Lv2", desc = "75% faster climbing speed.",
      "player_climb_speed_multiplier_2"
    },
    player_melee_concealment_modifier = { name = "Concealment", desc = "+2 (melee).",
      "player_melee_concealment_modifier"
    },
    player_ballistic_vest_concealment_1 = { name = "Concealment", desc = "+4 (ballistic vests).",
      "player_ballistic_vest_concealment_1"
    },
    player_camouflage_bonus_1 = { name = "Optical Illusion Lv1", desc = "Target priority reduced by 15%.",
      "player_camouflage_bonus_1"
    },
    player_camouflage_bonus_2 = { name = "Optical Illusion Lv2", desc = "Target priority reduced by 35%.",
      "player_camouflage_bonus_2"
    },
    player_silencer_concealment_penalty_decrease_1 = { name = "Concealment", desc = "+1 (silencers), -2 silencer penalty.",
      "player_silencer_concealment_penalty_decrease_1", "player_silencer_concealment_increase_1"
    },
    weapon_silencer_recoil_index_addend = { name = "Stability", desc = "+8 (silencers).",
      "weapon_silencer_recoil_index_addend"
    },
    weapon_silencer_enter_steelsight_speed_multiplier = { name = "The Professional", desc = "100% faster ADS speed (silencers).",
      "weapon_silencer_enter_steelsight_speed_multiplier"
    },
    weapon_silencer_spread_index_addend = { name = "Accuracy", desc = "+12 (silencers).",
      "weapon_silencer_spread_index_addend"
    },
    weapon_silencer_spread_index_addend = { name = "Strategist", desc = "Mark duration increased by 100%.",
      "player_mark_enemy_time_multiplier"
    },
    
    -- Fugitive Skills
    pistol_swap_speed_multiplier = { name = "Equilibrium", desc = "33% faster weapon switch speed (pistols).",
      "pistol_swap_speed_multiplier"
    },
    pistol_spread_index_addend = { name = "Accuracy", desc = "+8 (pistols).",
      "pistol_spread_index_addend"
    },
    pistol_magazine_capacity_inc_1 = { name = "Gun Nut", desc = "+5 mag size (pistols).",
      "pistol_magazine_capacity_inc_1"
    },
    pistol_fire_rate_multiplier = { name = "Draw!", desc = "50% fire rate bonus (pistols).",
      "pistol_fire_rate_multiplier"
    },
    akimbo_extra_ammo_multiplier_1 = { name = "Akimbo Lv1", desc = "Ammo capacity increased by 50%.",
      "akimbo_extra_ammo_multiplier_1"
    },
    akimbo_extra_ammo_multiplier_2 = { name = "Akimbo Lv2", desc = "Ammo capacity increased by 100%.",
      "akimbo_extra_ammo_multiplier_2"
    },
    pistol_damage_addend_1 = { name = "One Handed Talent Lv1", desc = "+5 pistol damage.",
      "pistol_damage_addend_1"
    },
    pistol_damage_addend_2 = { name = "One Handed Talent Lv2", desc = "+15 pistol damage.",
      "pistol_damage_addend_2"
    },
    pistol_reload_speed_multiplier = { name = "Gunslinger", desc = "Reload pistols 50% faster.",
      "pistol_reload_speed_multiplier"
    },
    player_bleed_out_health_multiplier = { name = "More Blood to Bleed", desc = "50% more bleedout health.",
      "player_bleed_out_health_multiplier"
    },
    player_additional_lives_1 = { name = "Nine Lives Lv1", desc = "One more down.",
      "player_additional_lives_1"
    },
    player_additional_lives_2 = { name = "Nine Lives Lv2", desc = "Three more downs.",
      "player_additional_lives_2"
    },
    player_revived_health_regain_1 = { name = "", desc = "40% more health when revived.",
      "player_revived_health_regain_1"
    },
    player_melee_damage_dampener = { name = "Because of Training", desc = "Take 50% less melee damage.",
      "player_melee_damage_dampener"
    },
    player_melee_knockdown_mul = { name = "Martial Arts", desc = "50% knockdown bonus (melee).",
      "player_melee_knockdown_mul"
    },
    player_non_special_melee_multiplier = { name = "Pumping Iron", desc = "100% bonus damage (melee).",
      "player_non_special_melee_multiplier", "player_melee_damage_multiplier"
    },
    
    -- Removed Skills
    player_damage_shake_multiplier = { name = "Tough Guy", desc = "50% less camera shake from damage.",
      "player_damage_shake_multiplier"
    },
    shotgun_hip_fire_spread_index_addend = { name = "Accuracy", desc = "20% hipfire bonus (shotguns).",
      "shotgun_hip_fire_spread_index_addend"
    },
    weapon_hip_fire_spread_index_addend = { name = "Accuracy", desc = "20% hipfire bonus.",
      "weapon_hip_fire_spread_index_addend"
    },
    weapon_clip_ammo_increase_1 = { name = "Mag Plus Lv1", desc = "+5 mag size.",
      "weapon_clip_ammo_increase_1"
    },
    weapon_clip_ammo_increase_2 = { name = "Mag Plus Lv2", desc = "+15 mag size.",
      "weapon_clip_ammo_increase_2"
    },
    smg_fire_rate_multiplier = { name = "SMG Specialist", desc = "20% fire rate bonus (SMGs).",
      "smg_fire_rate_multiplier"
    },
    player_respawn_time_multiplier = { name = "Master Trader", desc = "Custody timer is halved.",
      "player_respawn_time_multiplier"
    },
    player_on_zipline_dodge_chance = { name = "Daredevil", desc = "+15% dodge chance while ziplining.",
      "player_on_zipline_dodge_chance"
    },
    player_crouch_dodge_chance_1 = { name = "Duck and Cover Lv1", desc = "+5% dodge chance while crouched.",
      "player_crouch_dodge_chance_1"
    },
    player_crouch_dodge_chance_2 = { name = "Duck and Cover Lv2", desc = "+15% dodge chance while crouched.",
      "player_crouch_dodge_chance_2"
    },
    player_stamina_multiplier = { name = "Endurance", desc = "100% stamina bonus.",
      "player_stamina_multiplier"
    },
    weapon_silencer_armor_piercing_chance_1 = { name = "Silent Killer Lv1", desc = "20% chance to pierce enemy armor (silencers).",
      "weapon_silencer_armor_piercing_chance_1"
    },
    weapon_silencer_armor_piercing_chance_2 = { name = "Silent Killer Lv2", desc = "40% chance to pierce enemy armor (silencers).",
      "weapon_silencer_armor_piercing_chance_2"
    },
    
    -- Unused Skills
    player_critical_hit_chance_1 = { name = "Hypocritical", desc = "+25% crit chance.",
      "player_critical_hit_chance_1"
    },
    player_health_multiplier = { name = "Vitality", desc = "10% health bonus.",
      "player_health_multiplier"
    },
    player_passive_armor_multiplier_1 = { name = "Lv1", desc = "10% armor bonus.",
      "player_passive_armor_multiplier_1"
    },
    player_passive_armor_multiplier_2 = { name = "Lv2", desc = "25% armor bonus.",
      "player_passive_armor_multiplier_2"
    },
    player_armor_regen_timer_multiplier = { name = "", desc = "15% faster armor recovery.",
      "player_armor_regen_timer_multiplier"
    },
    player_concealment_bonus_1 = { name = "Concealment", desc = "+5.",
      "player_concealment_bonus_1"
    },
    player_melee_sharp_damage_multiplier = { name = "Taste My Steel", desc = "200% damage bonus (sharp melee).",
      "player_melee_sharp_damage_multiplier"
    },
    player_passive_suppression_bonus_1 = { name = "Oppressor Lv1", desc = "10% threat bonus.",
      "player_passive_suppression_bonus_1"
    },
    player_passive_suppression_bonus_2 = { name = "Oppressor Lv2", desc = "20% threat bonus.",
      "player_passive_suppression_bonus_2"
    },
    player_suppression_bonus = { name = "Looming Presence", desc = "75% threat bonus.",
      "player_suppression_bonus"
    },
    player_electrocution_resistance = { name = "Rubber Lining", desc = "75% electrocution resistance.",
      "player_electrocution_resistance"
    },
    player_tased_recover_multiplier = { name = "", desc = "50% player_tased_recover_multiplier",
      "player_tased_recover_multiplier"
    },
    player_secured_bags_speed_multiplier = { name = "secured_bags_speed_multiplier", desc = "+2%.",
      "player_secured_bags_speed_multiplier"
    },
    player_secured_bags_money_multiplier = { name = "", desc = "2% money bonus from secured bags.",
      "player_secured_bags_money_multiplier"
    },
    player_damage_dampener = { name = "", desc = "5% damage reduction.",
      "player_damage_dampener"
    },
    player_sentry_gun_deploy_time_multiplier = { name = "", desc = "Deploy sentries 50% faster.",
      "player_sentry_gun_deploy_time_multiplier"
    },
    player_assets_cost_multiplier = { name = "Nebula Plus", desc = "Assets cost 87.5% less.",
      "player_assets_cost_multiplier", "player_assets_cost_multiplier_b", "passive_player_assets_cost_multiplier"
    },
    player_tape_loop_interact_distance_mul_1 = { name = "Remote Loop", desc = "Can loop cameras from 40% further away.",
      "player_tape_loop_interact_distance_mul_1"
    },
    cable_tie_quantity_2 = { name = "Cable Ties", desc = "+4 cable ties.",
      "cable_tie_quantity_2"
    },
    sentry_gun_damage_multiplier = { name = "", desc = "Sentry damage increased by 150%.",
      "sentry_gun_damage_multiplier"
    },
    saw_fire_rate_multiplier_1 = { name = "Saw Overdrive Lv1", desc = "25% fire rate bonus (saw).",
      "saw_fire_rate_multiplier_1"
    },
    saw_fire_rate_multiplier_2 = { name = "Saw Overdrive Lv2", desc = "50% fire rate bonus (saw).",
      "saw_fire_rate_multiplier_2"
    },
    saw_swap_speed_multiplier = { name = "Saw Bag", desc = "80% faster saw switch speed.",
      "saw_swap_speed_multiplier"
    },
    saw_reload_speed_multiplier = { name = "Blade Pouch", desc = "Reload saws 50% faster.",
      "saw_reload_speed_multiplier"
    },
    assault_rifle_recoil_index_addend = { name = "Stability", desc = "+8 (ARs).",
      "assault_rifle_recoil_index_addend"
    },
    lmg_recoil_index_addend = { name = "Stability", desc = "+4 (LMGs).",
      "lmg_recoil_index_addend"
    },
    snp_recoil_index_addend = { name = "Stability", desc = "+8 (snipers).",
      "snp_recoil_index_addend"
    },
    weapon_modded_damage_multiplier = { name = "Refurbished Parts", desc = "10% damage/accuracy/stability bonus (weapons with mods).",
      "weapon_modded_damage_multiplier", "weapon_modded_spread_multiplier", "weapon_modded_recoil_multiplier"
    },
    weapon_single_spread_multiplier = { name = "Accuracy", desc = "20% bonus (single shot).",
      "weapon_single_spread_multiplier"
    }, 
    weapon_silencer_spread_multiplier = { name = "Accuracy", desc = "50% bonus (silencers).",
      "weapon_silencer_spread_multiplier"
    },
    weapon_silencer_recoil_multiplier = { name = "Stability", desc = "50% bonus (silencers).",
      "weapon_silencer_recoil_multiplier"
    },
    weapon_passive_reload_speed_multiplier = { name = "Reload Drills", desc = "Reload 10% faster.",
      "weapon_passive_reload_speed_multiplier"
    },
    weapon_passive_recoil_multiplier_2 = { name = "Stability", desc = "10% bonus.",
      "weapon_passive_recoil_multiplier_2"
    },
    weapon_spread_multiplier = { name = "Accuracy", desc = "10% bonus.",
      "weapon_spread_multiplier"
    },
    weapon_fire_rate_multiplier = { name = "Auto Conversion", desc = "100% fire rate bonus.",
      "weapon_fire_rate_multiplier"
    },
    pistol_damage_multiplier = { name = "Damage", desc = "50% bonus (pistols).",
      "pistol_damage_multiplier"
    },
    pistol_spread_multiplier = { name = "Accuracy", desc = "10% bonus (pistols).",
      "pistol_spread_multiplier"
    },
    pistol_exit_run_speed_multiplier = { name = "Readiness", desc = "Stop sprinting 25% faster (pistols).",
      "pistol_exit_run_speed_multiplier"
    },
    pistol_hip_fire_spread_multiplier = { name = "Accuracy", desc = "20% hipfire bonus (pistols).",
      "pistol_hip_fire_spread_multiplier"
    },
    assault_rifle_recoil_multiplier = { name = "Stability", desc = "25% bonus (ARs).",
      "assault_rifle_recoil_multiplier"
    },
    assault_rifle_move_spread_multiplier = { name = "Accuracy", desc = "50% bonus while moving (ARs).",
      "assault_rifle_move_spread_multiplier"
    },
    assault_rifle_hip_fire_spread_multiplier = { name = "Accuracy", desc = "20% hipfire bonus (ARs).",
      "assault_rifle_hip_fire_spread_multiplier"
    },
    lmg_recoil_multiplier = { name = "Stability", desc = "25% bonus (LMGs).",
      "lmg_recoil_multiplier"
    },
    lmg_reload_speed_multiplier = { name = "Ergonomic Design", desc = "Reload LMGs 25% faster.",
      "lmg_reload_speed_multiplier"
    },
    lmg_move_spread_multiplier = { name = "Accuracy", desc = "50% bonus while moving (LMGs).",
      "lmg_move_spread_multiplier"
    },
    lmg_hip_fire_spread_multiplier = { name = "Accuracy", desc = "20% hipfire bonus (LMGs).",
      "lmg_hip_fire_spread_multiplier"
    },
    snp_move_spread_multiplier = { name = "Accuracy", desc = "50% bonus while moving (snipers).",
      "snp_move_spread_multiplier"
    },
    snp_hip_fire_spread_multiplier = { name = "Accuracy", desc = "20% hipfire bonus (snipers).",
      "snp_hip_fire_spread_multiplier"
    },
    smg_hip_fire_spread_multiplier = { name = "Accuracy", desc = "20% hipfire bonus (SMGs).",
      "smg_hip_fire_spread_multiplier"
    },
    shotgun_recoil_multiplier = { name = "Stability", desc = "25% bonus (shotguns).",
      "shotgun_recoil_multiplier"
    },
    shotgun_hip_fire_spread_multiplier = { name = "Accuracy", desc = "20% hipfire bonus (shotguns).",
      "shotgun_hip_fire_spread_multiplier"
    },
    akimbo_damage_multiplier_1 = { name = "Damage", desc = "50% bonus (akimbo).",
      "akimbo_damage_multiplier_1" 
    }
  }
}

-- UPGRADES NOT INCLUDED BECAUSE THEY HAVEN'T BEEN TESTED:
-- team_pistol_recoil_index_addend team_pistol_suppression_recoil_index_addend team_weapon_recoil_index_addend
-- team_weapon_suppression_recoil_index_addend player_damage_shake_addend player_suppressed_bonus
-- player_uncover_progress_mul player_uncover_progress_decay_mul 

-- UPGRADES NOT INCLUDED BECAUSE THEY ONLY AFFECT MULTIPLAYER:
-- player_revive_health_boost player_revive_damage_reduction_level_1 player_revive_damage_reduction_level_2
-- player_morale_boost player_sync_cocaine_stacks team_pocket_ecm_heal_on_kill_1 player_loose_ammo_restore_health_give_team

-- JOKERS:
-- player_minion_master_speed_multiplier player_minion_master_health_multiplier
-- player_passive_convert_enemies_health_multiplier_1 player_passive_convert_enemies_health_multiplier_2