local S = farming.intllib

-- vanilla
minetest.register_craftitem("farming:vanilla", {
	description = S("Vanilla"),
	inventory_image = "farming_vanilla.png",
	groups = {food_vanilla = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:vanilla_1")
	end,
	on_use = minetest.item_eat(2),
})

-- crop definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_vanilla_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:vanilla_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_vanilla_2.png"}
minetest.register_node("farming:vanilla_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_vanilla_3.png"}
minetest.register_node("farming:vanilla_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_vanilla_4.png"}
minetest.register_node("farming:vanilla_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_vanilla_5.png"}
minetest.register_node("farming:vanilla_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_vanilla_6.png"}
crop_def.visual_scale = 1.9
minetest.register_node("farming:vanilla_6", table.copy(crop_def))

-- stage 7
crop_def.tiles = {"farming_vanilla_7.png"}
crop_def.drop = {
	items = {
		{items = {'farming:vanilla'}, rarity = 1},
		{items = {'farming:vanilla'}, rarity = 2},
		{items = {'farming:vanilla'}, rarity = 3},
	}
}
minetest.register_node("farming:vanilla_7", table.copy(crop_def))

-- stage 8 (final)
crop_def.tiles = {"farming_vanilla_8.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:vanilla 2'}, rarity = 1},
		{items = {'farming:vanilla 2'}, rarity = 2},
		{items = {'farming:vanilla 2'}, rarity = 2},
        {items = {'farming:vanilla 2'}, rarity = 3},
	}
}
minetest.register_node("farming:vanilla_8", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:vanilla"] = {
	crop = "farming:vanilla",
	seed = "farming:vanilla",
	minlight = 13,
	maxlight = 15,
	steps = 8
}
