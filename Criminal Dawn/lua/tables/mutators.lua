managers.mutators:reset_all_mutators()

local MutatorTable = { 
  "CloakerEffect", "EnemyDamage", "EnemyHealth", "Titandozers", "ShotgunTweak"
  --,"EnemyReplacer", "MediDozer", "ShieldDozers", "ExplodingEnemies", "Hydra"
}
-- Second line is just not fun to play with or causes crashes, uncomment at your own peril

local peers_table = managers.network and managers.network:session() and managers.network:session():peers()
if table.size(peers_table or {}) > 0 then
  table.insert(MutatorTable, "FriendlyFire")
end

for i = 1, #Global.CrimDawn.data.game.heists - 1 + Global.CrimDawn.data.x.mutators do
  if next(MutatorTable) then
    local CurrentIndex = math.random(#MutatorTable)
    local CurrentMutator = MutatorTable[CurrentIndex]
    
    if CurrentMutator then
      managers.mutators:set_enabled("Mutator" .. CurrentMutator)
      table.remove(MutatorTable, CurrentIndex)
    end
  end
end

-- Assign random properties!
managers.mutators:get_mutator_from_id("MutatorEnemyHealth"):set_value("health_multiplier", 1.5)
managers.mutators:get_mutator_from_id("MutatorEnemyDamage"):set_value("damage_multiplier", 1.5)
managers.mutators:get_mutator_from_id("MutatorCloakerEffect"):set_value("kick_effect", "random")
managers.mutators:get_mutator_from_id("MutatorShotgunTweak"):set_value("pull_strength", 1 + math.random() * (5 - 1))
managers.mutators:get_mutator_from_id("MutatorShotgunTweak"):set_value("mothership", math.random() < 0.5)
managers.mutators:get_mutator_from_id("MutatorFriendlyFire"):set_value("damage_multiplier", 3)
--managers.mutators:get_mutator_from_id("MutatorEnemyReplacer"):set_value("override_enemy", ({ "taser", "medic" })[math.random(2)])
--managers.mutators:get_mutator_from_id("MutatorExplodingEnemies"):set_value("explosion_size", 2 + math.random() * (6 - 2))
--managers.mutators:get_mutator_from_id("MutatorExplodingEnemies"):set_value("nuclear_dozers", math.random() < 0.5)
--managers.mutators:get_mutator_from_id("MutatorExplodingEnemies"):set_value("explosion_delay", 0 + math.random() * (3 - 0))
--managers.mutators:get_mutator_from_id("MutatorHydra"):set_value("max_unit_depth", 1)