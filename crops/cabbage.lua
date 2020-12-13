
local S = farming.intllib

-- cabbage
minetest.register_craftitem("farming:cabbage", {
	description = S("Cabbage"),
	inventory_image = "farming_cabbage.png",
	groups = {seed = 2, food_cabbage = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:cabbage_1")
	end,
	on_use = minetest.item_eat(1)
})

local def = {
	drawtype = "plantlike",
	tiles = {"farming_cabbage_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
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

-- sauerkraut (thanks to h-v-smacker's for canned_food XCF template - https://github.com/h-v-smacker/canned_food)
minetest.register_node("farming:sauerkraut", {
	description = S("Sauerkraut"),
	drawtype = "plantlike",
	tiles = {"farming_sauerkraut.png"},
	inventory_image = "farming_sauerkraut.png",
	wield_image = "farming_sauerkraut.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	on_use = minetest.item_eat(5),
	sounds = default.node_sound_glass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = { dig_immediate = 3, attached_node = 1 }
})

if minetest.get_modpath("wine") == nil then
    minetest.register_craft({
	type = "shapeless",
	output = "farming:sauerkraut",
	recipe = {
		"vessels:glass_bottle", "farming:cabbage"
	}
})
end

-- stage 1
minetest.register_node("farming:cabbage_1", table.copy(def))

-- stage 2
def.tiles = {"farming_cabbage_2.png"}
minetest.register_node("farming:cabbage_2", table.copy(def))

-- stage 3
def.tiles = {"farming_cabbage_3.png"}
minetest.register_node("farming:cabbage_3", table.copy(def))

-- stage 4
def.tiles = {"farming_cabbage_4.png"}
minetest.register_node("farming:cabbage_4", table.copy(def))

-- stage 5
def.tiles = {"farming_cabbage_5.png"}
minetest.register_node("farming:cabbage_5", table.copy(def))

-- stage 6
def.tiles = {"farming_cabbage_6.png"}
def.groups.growing = nil
def.drop = {
	max_items = 2, items = {
		{items = {"farming:cabbage 2"}, rarity = 1},
		{items = {"farming:cabbage 1"}, rarity = 2}
	}
}
minetest.register_node("farming:cabbage_6", table.copy(def))

-- add to registered_plants
farming.registered_plants["farming:cabbage"] = {
	crop = "farming:cabbage",
	seed = "farming:cabbage",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 6
}
