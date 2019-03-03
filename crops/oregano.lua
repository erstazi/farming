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
    description = S("Napolitan Pizza"),
    inventory_image = "farming_pizza_neapolitan.png",
    on_use = minetest.item_eat(6),
})

if minetest.get_modpath("mobs") then
    minetest.register_craft({
        type = "shapeless",
        output = "farming:pizza_neapolitan",
        recipe = {
            "farming:pizza_dough", "farming:tomato", "farming:garlic_clove",
            "mobs:cheese", "farming:oregano"
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
