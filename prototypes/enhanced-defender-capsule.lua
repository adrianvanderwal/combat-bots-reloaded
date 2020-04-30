local enhanced_robot = table.deepcopy(data.raw["combat-robot"].defender)
local enhanced_item = table.deepcopy(data.raw.item["defender-capsule"])
local enhanced_recipe = table.deepcopy(data.raw.recipe["defender-capsule"])

-- change name, change ammo_type, change order
enhanced_item.name = "enhanced-defender-capsule"
enhanced_item.capsule_action.attack_parameters.ammo_type.action.action_delivery.projectile = "enhanced-defender-capsule"
enhanced_item.subgroup.order = enhanced_item.subgroup.order .. "-b"

enhanced_recipe.name = "enhanced-defender-capsule"
enhanced_recipe.ingredients =
  {
    {"defender", 5},
    {"uranium-rounds-magazine", 3},
    {"advanced-electronic-circuit", 3},
  }
enhanced_recipe.result = "enhanced-defender-capsule"

enhanced_robot.name = "enhaced-defender"
enhanced_robot.attack_parameters.ammo_type.action.action_delivery.target_effects =
{
  {
    type = "create-entity",
    entity_name = "explosion-hit",
    offsets = {{0, 1}},
    offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
  },
  {
    type = "damage",
    damage = { amount = 24 , type = "physical"}
  }
}

data.raw.technology["uranium-ammo"].effects =
{
  {
    type = "unlock-recipe",
    recipe = "uranium-rounds-magazine"
  },
  {
    type = "unlock-recipe",
    recipe = "uranium-cannon-shell"
  },
  {
    type = "unlock-recipe",
    recipe = "explosive-uranium-cannon-shell"
  },
  {
    type = "unlock-recipe",
    recipe = "enhanced-defender-capsule"
  }
}

data:extend{
  enhanced_robot,
  enhanced_item,
  enhanced_recipe
}