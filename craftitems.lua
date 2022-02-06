local S = mobs_animal.S

-- bucket of milk
minetest.register_craftitem("mobs_animal:bucket_milk", {
    description = S("Bucket of Milk"),
    inventory_image = "mobs_animal_bucket_milk.png",
    stack_max = 1,
    on_use = minetest.item_eat(8, "bucket:bucket_empty"),
    groups = { food_milk = 1, flammable = 3, drink = 1 },
})

-- glass of milk
minetest.register_craftitem("mobs_animal:glass_milk", {
    description = S("Glass of Milk"),
    inventory_image = "mobs_animal_glass_milk.png",
    on_use = minetest.item_eat(2, "vessels:drinking_glass"),
    groups = { food_milk_glass = 1, flammable = 3, vessel = 1, drink = 1 },
})
-- cheese wedge
minetest.register_craftitem("mobs_animal:cheese", {
    description = S("Cheese"),
    inventory_image = "mobs_animal_cheese.png",
    on_use = minetest.item_eat(4),
    groups = { food_cheese = 1, flammable = 2 },
})
-- cheese block
minetest.register_node("mobs_animal:cheeseblock", {
    description = S("Cheese Block"),
    tiles = { "mobs_animal_cheeseblock.png" },
    is_ground_content = false,
    groups = { oddly_breakable_by_hand = 3 },
    sounds = default.node_sound_dirt_defaults()
})
-- butter
minetest.register_craftitem("mobs_animal:butter", {
    description = S("Butter"),
    inventory_image = "mobs_animal_butter.png",
    on_use = minetest.item_eat(1),
    groups = { food_butter = 1, flammable = 2 }
})

