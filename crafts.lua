minetest.register_craft({
    output = "mobs:glass_milk 4",
    recipe = {
        { "vessels:drinking_glass", "vessels:drinking_glass" },
        { "vessels:drinking_glass", "vessels:drinking_glass" },
        { "mobs:bucket_milk", "" }
    },
    replacements = { { "mobs:bucket_milk", "bucket:bucket_empty" } }
})

minetest.register_craft({
    output = "mobs:bucket_milk",
    recipe = {
        { "group:food_milk_glass", "group:food_milk_glass" },
        { "group:food_milk_glass", "group:food_milk_glass" },
        { "bucket:bucket_empty", "" }
    },
    replacements = {
        { "group:food_milk_glass", "vessels:drinking_glass 4" }
    }
})

if minetest.get_modpath("farming") and farming and farming.mod then
    minetest.register_craft({
        type = "shapeless",
        output = "mobs_animal:butter",
        recipe = { "mobs_animal:bucket_milk", "farming:salt" },
        replacements = { { "mobs_animal:bucket_milk", "bucket:bucket_empty" } }
    })
else
    -- some saplings are high in sodium so makes a good replacement item
    minetest.register_craft({
        type = "shapeless",
        output = "mobs_animal:butter",
        recipe = { "mobs_animal:bucket_milk", "default:sapling" },
        replacements = { { "mobs_animal:bucket_milk", "bucket:bucket_empty" } }
    })
end

minetest.register_craft({
    type = "cooking",
    output = "mobs_animal:cheese",
    recipe = "mobs_animal:bucket_milk",
    cooktime = 5,
    replacements = { { "mobs_animal:bucket_milk", "bucket:bucket_empty" } }
})

minetest.register_craft({
    output = "mobs_animal:cheeseblock",
    recipe = {
        { "group:food_cheese", "group:food_cheese", "group:food_cheese" },
        { "group:food_cheese", "group:food_cheese", "group:food_cheese" },
        { "group:food_cheese", "group:food_cheese", "group:food_cheese" },
    }
})

minetest.register_craft({
    output = "mobs_animal:cheese 9",
    recipe = {
        { "mobs_animal:cheeseblock" },
    }
})
