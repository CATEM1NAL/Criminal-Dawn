-- Table used by lua/managers/menu.lua
apd2_mutators = { 
  "CloakerEffect", "EnemyDamage", "EnemyHealth", "EnemyReplacer",
  "Titandozers", "MediDozer", "Hydra", "ShieldDozers", "ShotgunTweak" 
}

-- Creating empty tables to ensure value injection works
MutatorCloakerEffect._values = {}
MutatorEnemyDamage._values = {}
MutatorEnemyHealth._values = {}
MutatorEnemyReplacer._values = {}
MutatorExplodingEnemies._values = {}
MutatorHydra._values = {}
MutatorShotgunTweak._values = {}

-- Register all values
MutatorCloakerEffect:register_value("kick_effect", nil, "ke")
MutatorEnemyDamage:register_value("damage_multiplier", nil, "dm")
MutatorEnemyHealth:register_value("health_multiplier", nil, "hm")
MutatorEnemyReplacer:register_value("override_enemy", nil, "oe")
-- MutatorExplodingEnemies:register_value("explosion_size", nil, "es")
-- MutatorExplodingEnemies:register_value("nuclear_dozers", nil, "nd")
-- MutatorExplodingEnemies:register_value("explosion_delay", nil, "ed")
MutatorHydra:register_value("max_unit_depth", nil, "md")
MutatorShotgunTweak:register_value("pull_strength", nil, "ps")
MutatorShotgunTweak:register_value("mothership", nil, "ms")

-- Generate the mutator effects
local AlternateArsenal = 1.01 + math.random() * (10 - 1.01)
local BecauseOfTraining = 1.01 + math.random() * (3 - 1.01)

local CloneArmy = { "taser", "shield", "medic" }
CloneArmy = CloneArmy[math.random(#CloneArmy)]

-- local CreepsRadius = 2 + math.random() * (6 - 2)
-- local CreepsNuke = math.random() < 0.5
-- local CreepsDelay = 0 + math.random() * (3 - 0)

local Hydra = math.random(1, 2)

local ShotgunStrength = 1 + math.random() * (5 - 1)
local MotherBain = math.random() < 0.5

-- Assign random properties!
MutatorCloakerEffect:set_value("kick_effect", "random")
MutatorEnemyDamage:set_value("damage_multiplier", AlternateArsenal)
MutatorEnemyHealth:set_value("health_multiplier", BecauseOfTraining)
MutatorEnemyReplacer:set_value("override_enemy", CloneArmy)
-- MutatorExplodingEnemies:set_value("explosion_size", CreepsRadius)
-- MutatorExplodingEnemies:set_value("nuclear_dozers", CreepsNuke)
-- MutatorExplodingEnemies:set_value("explosion_delay", CreepsDelay)
MutatorHydra:set_value("max_unit_depth", Hydra)
MutatorShotgunTweak:set_value("pull_strength", ShotgunStrength)
MutatorShotgunTweak:set_value("mothership", MotherBain)