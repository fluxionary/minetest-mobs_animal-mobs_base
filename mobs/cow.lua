-- Cow by sirrobzeroone

local S = mobs_animal.S

mobs_base.api.register_mob("mobs_animal:cow", {
    type = "animal",
    passive = false,
    attack_type = "dogfight",
    attack_npcs = false,
    reach = 2,
    damage = 4,
    hp_min = 5,
    hp_max = 20,
    armor = 200,
    collisionbox = { -0.4, -0.01, -0.4, 0.4, 1.2, 0.4 },
    visual = "mesh",
    mesh = "mobs_animal_cow.b3d",
    textures = {
        { "mobs_animal_cow.png" },
        { "mobs_animal_cow2.png" },
    },
    makes_footstep_sound = true,
    sounds = {
        random = "mobs_animal_cow",
    },
    walk_velocity = 1,
    run_velocity = 2,
    jump = true,
    jump_height = 6,
    pushable = true,
    drops = {
        { name = "mobs:meat_raw", chance = 1, min = 1, max = 3 },
        { name = "mobs:leather", chance = 1, min = 0, max = 2 },
    },
    water_damage = 0,
    lava_damage = 5,
    light_damage = 0,
    animation = {
        stand_start = 0,
        stand_end = 30,
        stand_speed = 20,
        stand1_start = 35,
        stand1_end = 75,
        stand1_speed = 20,
        walk_start = 85,
        walk_end = 114,
        walk_speed = 20,
        run_start = 120,
        run_end = 140,
        run_speed = 30,
        punch_start = 145,
        punch_end = 160,
        punch_speed = 20,
        die_start = 165,
        die_end = 185,
        die_speed = 10,
        die_loop = false,
    },
    follow = {
        "farming:wheat", "default:grass_1", "farming:barley",
        "farming:oat", "farming:rye"
    },
    view_range = 8,
    replace_rate = 10,
    replace_what = {
        { "group:grass", "air", 0 },
        { "default:dirt_with_grass", "default:dirt", -1 }
    },
    --	stay_near = {{"farming:straw", "group:grass"}, 10},
    fear_height = 2,
    on_rightclick = function(self, clicker)

        -- feed or tame
        if mobs_base.api.feed_tame(self, clicker, 8, true, true) then

            -- if fed 7x wheat or grass then cow can be milked again
            if self.food and self.food > 6 then
                self.gotten = false
            end

            return
        end

        if mobs_base.api.protect(self, clicker) then
            return
        end
        if mobs_base.api.capture_mob(self, clicker, 0, 5, 60, false, nil) then
            return
        end

        local tool = clicker:get_wielded_item()
        local name = clicker:get_player_name()

        -- milk cow with empty bucket
        if tool:get_name() == "bucket:bucket_empty" then

            --if self.gotten == true
            if self.child == true then
                return
            end

            if self.gotten == true then
                minetest.chat_send_player(name,
                        S("Cow already milked!"))
                return
            end

            local inv = clicker:get_inventory()

            tool:take_item()
            clicker:set_wielded_item(tool)

            if inv:room_for_item("main", { name = "mobs_animal:bucket_milk" }) then
                clicker:get_inventory():add_item("main", "mobs_animal:bucket_milk")
            else
                local pos = self.object:get_pos()
                pos.y = pos.y + 0.5
                minetest.add_item(pos, { name = "mobs_animal:bucket_milk" })
            end

            self.gotten = true -- milked

            return
        end
    end,

    on_replace = function(self, pos, oldnode, newnode)

        self.food = (self.food or 0) + 1

        -- if cow replaces 8x grass then it can be milked again
        if self.food >= 8 then
            self.food = 0
            self.gotten = false
        end
    end,
})

mobs_base.api.spawn({
    name = "mobs_animal:cow",
    nodes = { "default:dirt_with_grass", "ethereal:green_dirt" },
    neighbors = { "group:grass" },
    min_light = 14,
    interval = 60,
    chance = 8000, -- 15000
    min_height = 5,
    max_height = 200,
    day_toggle = true,
})

mobs_base.api.register_egg("mobs_animal:cow", S("Cow"), "mobs_animal_cow_inv.png")











