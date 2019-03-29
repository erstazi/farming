local S = farming.intllib

-- item definition
minetest.register_craftitem("farming:lettuce", {
	description = S("Lettuce"),
	inventory_image = "farming_lettuce.png",
	groups = {food_lettuce = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:lettuce_1")
	end,
	on_use = minetest.item_eat(4),
})

-- crop definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_lettuce_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop =  "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:lettuce_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_lettuce_2.png"}
minetest.register_node("farming:lettuce_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_lettuce_3.png"}
minetest.register_node("farming:lettuce_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_lettuce_4.png"}
minetest.register_node("farming:lettuce_4", table.copy(crop_def))

-- stage 5 (final)
crop_def.tiles = {"farming_lettuce_5.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:lettuce 2'}, rarity = 1},
		{items = {'farming:lettuce 2'}, rarity = 2},
	}
}
minetest.register_node("farming:lettuce_5", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:lettuce"] = {
	crop = "farming:lettuce",
	seed = "farming:lettuce",
	minlight = 13,
	maxlight = 15,
	steps = 5
}
