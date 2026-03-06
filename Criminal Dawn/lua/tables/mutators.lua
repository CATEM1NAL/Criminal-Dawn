managers.mutators:reset_all_mutators()

local MutatorTable = { 
  "CloakerEffect", "EnemyDamage", "EnemyHealth", "EnemyReplacer",
  "Titandozers", "Hydra", "ShotgunTweak"
}

local peers_table = managers.network and managers.network:session() and managers.network:session():peers()
if table.size(peers_table or {}) > 0 then
  table.insert(MutatorTable, "FriendlyFire")
end

for i = 1, #apd2_data.game.heists - 1 + apd2_data.x.mutators do
  local CurrentIndex = math.random(#MutatorTable)
  local CurrentMutator = MutatorTable[CurrentIndex]
  
  if CurrentMutator then
    managers.mutators:set_enabled("Mutator" .. CurrentMutator)
    table.remove(MutatorTable, CurrentIndex)
  end
end

-- Generate mutator effects
--local AlternateArsenal = 1.5 + math.random() * (2 - 1.5)
--local BecauseOfTraining = 1.5 + math.random() * (2 - 1.5)
local AlternateArsenal = 1.5
local BecauseOfTraining = 1.5

local CloneArmy = { "taser", "medic" }
CloneArmy = CloneArmy[math.random(#CloneArmy)]

--local CreepsRadius = 2 + math.random() * (6 - 2)
--local CreepsNuke = math.random() < 0.5
--local CreepsDelay = 0 + math.random() * (3 - 0)

--local Hydra = math.random(1, 2)
local Hydra = 1

local ShotgunStrength = 1 + math.random() * (5 - 1)
local MotherBain = math.random() < 0.5

-- Assign random properties!
managers.mutators:get_mutator_from_id("MutatorEnemyHealth"):set_value("health_multiplier", BecauseOfTraining)
managers.mutators:get_mutator_from_id("MutatorEnemyDamage"):set_value("damage_multiplier", AlternateArsenal)
managers.mutators:get_mutator_from_id("MutatorShotgunTweak"):set_value("pull_strength", ShotgunStrength)
managers.mutators:get_mutator_from_id("MutatorShotgunTweak"):set_value("mothership", MotherBain)
managers.mutators:get_mutator_from_id("MutatorHydra"):set_value("max_unit_depth", Hydra)
managers.mutators:get_mutator_from_id("MutatorEnemyReplacer"):set_value("override_enemy", CloneArmy)
managers.mutators:get_mutator_from_id("MutatorCloakerEffect"):set_value("kick_effect", "random")