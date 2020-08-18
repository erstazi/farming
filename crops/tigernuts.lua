local S = farming.intllib

-- tigernuts
minetest.register_craftitem("farming:tigernuts", {
	description = S("Tigernuts"),
	inventory_image = "farming_tigernuts.png",
	groups = {seed = 2, food_tigernuts = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:tigernut_1")
	end
})

-- orxata de xufa
minetest.register_node("farming:orxata_glass", {
	description = S("Orxata de Xufa"),
	drawtype = "plantlike",
	tiles = {"farming_orxata_glass.png"},
	inventory_image = "farming_orxata_glass.png",
	wield_image = "farming_orxata_glass.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, drink = 1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_craft({
	output = "farming:orxata_glass",
	type = "shapeless",
	recipe = {
		"vessels:drinking_glass", "group:food_tigernuts", "group:food_tigernuts",
		"group:food_tigernuts", "group:food_sugar", "bucket:bucket_water" 
	},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"}
	}
})

-- bottle of orxata
minetest.register_node("farming:orxata_bottle", {
	description = S("Bottle of Orxata"),
	drawtype = "plantlike",
	tiles = {"farming_orxata_bottle.png"},
	inventory_image = "farming_orxata_bottle.png",
	wield_image = "farming_orxata_bottle.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_craft({
	output = "farming:orxata_bottle",
	type = "shapeless",
	recipe = {
		"vessels:glass_bottle", "farming:orxata_glass", "farming:orxata_glass",
		"farming:orxata_glass", "farming:orxata_glass", "farming:orxata_glass",
	}
})

minetest.register_craft({
	output = "farming:orxata_glass 5",
	type = "shapeless",
	recipe = {
		"farming:orxata_bottle"
	},
	replacements = {
		{"farming:orxata_bottle", "vessels:glass_bottle"}
	}
})

-- crop definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_tigernut_1.png"},
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
minetest.register_node("farming:tigernut_1", table.copy(def))

-- stage 2
def.tiles = {"farming_tigernut_2.png"}
minetest.register_node("farming:tigernut_2", table.copy(def))

-- stage 3
def.tiles = {"farming_tigernut_3.png"}
minetest.register_node("farming:tigernut_3", table.copy(def))

-- stage 4
def.tiles = {"farming_tigernut_4.png"}
minetest.register_node("farming:tigernut_4", table.copy(def))

-- stage 5
def.tiles = {"farming_tigernut_5.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"farming:tigernuts 2"}, rarity = 1},
		{items = {"farming:tigernuts 1"}, rarity = 3}
	}
}
minetest.register_node("farming:tigernut_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["farming:tigernuts"] = {
	crop = "farming:tigernuts",
	seed = "farming:tigernuts",
	minlight = 13,
	maxlight = 15,
	steps = 5
}
