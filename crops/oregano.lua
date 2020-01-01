local S = farming.intllib

-- item definition
minetest.register_craftitem("farming:oregano", {
	description = S("Oregano"),
	inventory_image = "farming_oregano.png"
})

-- seed definition
minetest.register_node("farming:seed_oregano", {
	description = S("Oregano Seed"),
	tiles = {"farming_oregano_seed.png"},
	inventory_image = "farming_oregano_seed.png",
	wield_image = "farming_oregano_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = true,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:oregano_1")
	end,
})

-- crop definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_oregano_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop =  "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 4, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:oregano_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_oregano_2.png"}
minetest.register_node("farming:oregano_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_oregano_3.png"}
minetest.register_node("farming:oregano_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_oregano_4.png"}
minetest.register_node("farming:oregano_4", table.copy(crop_def))

-- stage 5 (final)
crop_def.tiles = {"farming_oregano_5.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {"farming:oregano"}, rarity = 1},
		{items = {"farming:oregano"}, rarity = 2},
		{items = {"farming:oregano"}, rarity = 3},
		{items = {"farming:seed_oregano"}, rarity = 1},
		{items = {"farming:seed_oregano"}, rarity = 2},
		{items = {"farming:seed_oregano"}, rarity = 3}
	}
}
minetest.register_node("farming:oregano_5", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:oregano"] = {
	crop = "farming:oregano",
	seed = "farming:oregano_seed",
	minlight = 13,
	maxlight = 15,
	steps = 5
}

-- Pizza and varieties
minetest.register_craftitem("farming:pizza_dough", {
    description = S("Pizza dough"),
    inventory_image = "farming_pizza_dough.png",
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:pizza_dough",
    recipe = {
        "farming:salt", "farming:flour", "farming:flour", "farming:flour"
    }
})

---- Neapolitan Pizza
minetest.register_craftitem("farming:pizza_neapolitan", {
    description = S("Neapolitan Pizza"),
    inventory_image = "farming_pizza_neapolitan.png",
    on_use = minetest.item_eat(6),
})

if minetest.get_modpath("mobs") and minetest.get_modpath("mobs_animal") then
    minetest.register_craft({
        type = "shapeless",
        output = "farming:pizza_neapolitan",
        recipe = {
            "farming:pizza_dough", "farming:tomato", "farming:garlic_clove",
            "group:food_cheese", "farming:oregano"
        }
    })
else
    minetest.register_craft({
        type = "shapeless",
        output = "farming:pizza_neapolitan",
        recipe = {
            "farming:pizza_dough", "farming:tomato", "farming:garlic_clove",
            "farming:oregano"
        }
    })
end

---- Hawaiian Pizza
minetest.register_craftitem("farming:pizza_hawaiian", {
    description = S("Hawaiian Pizza"),
    inventory_image = "farming_pizza_hawaiian.png",
    on_use = minetest.item_eat(6),
})

if minetest.get_modpath("mobs") and minetest.get_modpath("mobs_animal") then
    minetest.register_craft({
        type = "shapeless",
        output = "farming:pizza_hawaiian",
        recipe = {
            "farming:pizza_dough", "farming:tomato", "group:food_cheese",
            "group:food_pork", "farming:pineapple_ring", "farming:oregano"
        }
    })
else
    minetest.register_craft({
        type = "shapeless",
        output = "farming:pizza_hawaiian",
        recipe = {
            "farming:pizza_dough", "farming:tomato", "farming:pineapple_ring",
            "farming:oregano"
        }
    })
end

---- Carbonara Pizza
minetest.register_craftitem("farming:pizza_carbonara", {
    description = S("Carbonara Pizza"),
    inventory_image = "farming_pizza_carbonara.png",
    on_use = minetest.item_eat(6),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:pizza_carbonara",
    recipe = {
        "farming:pizza_dough", "farming:oregano", "group:food_milk",
        "group:food_cheese", "group:food_pork", "flowers:mushroom_brown"
    },
    replacements = {{"mobs:bucket_milk", "bucket:bucket_empty"}}
})

---- Meatlovers Pizza
minetest.register_craftitem("farming:pizza_meatlovers", {
    description = S("Meatlovers Pizza"),
    inventory_image = "farming_pizza_meatlovers.png",
    on_use = minetest.item_eat(7),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:pizza_meatlovers",
    recipe = {
        "farming:pizza_dough", "farming:oregano", "mobs:meat",
        "group:food_chicken", "group:food_pork", "group:food_cheese",
        "farming:tomato"
    }
})
