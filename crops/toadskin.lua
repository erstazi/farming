
local S = farming.intllib

-- Melón piel de sapo (aka Toadskin or Santa Claus melon)
minetest.register_craftitem("farming:toadskin_slice", {
	description = S("Toadskin Melon Slice"),
	inventory_image = "farming_pieldesapo_slice.png",
	groups = {seed = 2, food_toadskin_slice = 1, flammable = 3},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:toadskin_1")
	end,
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
    type = "shapeless",
	output = "farming:toadskin_7",
	recipe = {"farming:toadskin_slice", "farming:toadskin_slice", "farming:toadskin_slice",
              "farming:toadskin_slice", "farming:toadskin_slice"},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:toadskin_slice 5",
	recipe = {"farming:toadskin_7"},
})

-- melon definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_pieldesapo_1.png"},
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
minetest.register_node("farming:toadskin_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_pieldesapo_2.png"}
minetest.register_node("farming:toadskin_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_pieldesapo_3.png"}
minetest.register_node("farming:toadskin_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_pieldesapo_4.png"}
minetest.register_node("farming:toadskin_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_pieldesapo_5.png"}
minetest.register_node("farming:toadskin_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_pieldesapo_6.png"}
minetest.register_node("farming:toadskin_6", table.copy(crop_def))

-- stage 7
crop_def.drawtype = "nodebox"
crop_def.description = S("Toadskin Melon")
crop_def.tiles = {"farming_pieldesapo_top.png", "farming_pieldesapo_top.png", "farming_pieldesapo_side.png"}
crop_def.selection_box = {-.5, -.5, -.5, .5, .5, .5}
crop_def.walkable = true
crop_def.groups = {
	food_toadskin = 1, snappy = 2, oddly_breakable_by_hand = 1,
	flammable = 2, plant = 1
}

crop_def.drop = "farming:toadskin_7"
minetest.register_node("farming:toadskin_7", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:toadskin"] = {
	crop = "farming:toadskin",
	seed = "farming:toadskin_slice",
	minlight = 13,
	maxlight = 15,
	steps = 7
}
