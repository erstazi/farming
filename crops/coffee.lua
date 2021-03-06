
local S = farming.intllib

-- coffee
minetest.register_craftitem("farming:coffee_beans", {
	description = S("Coffee Beans"),
	inventory_image = "farming_coffee_beans.png",
	groups = {seed = 2, food_coffee = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:coffee_1")
	end
})

-- cup of coffee
minetest.register_node("farming:coffee_cup", {
	description = S("Cold Cup of Coffee"),
	drawtype = "torchlike", --"plantlike",
	tiles = {"farming_coffee_cup.png"},
	inventory_image = "farming_coffee_cup.png",
	wield_image = "farming_coffee_cup.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, drink = 1},
	on_use = minetest.item_eat(2, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults()
})

minetest.register_alias("farming:drinking_cup", "vessels:drinking_glass")

minetest.register_craft( {
	output = "farming:coffee_cup",
	type = "shapeless",
	recipe = {"vessels:drinking_glass", "group:food_coffee",
		"bucket:bucket_water"},
	replacements = {
		{"bucket:bucket_water", "bucket:bucket_empty"},
	}
})

-- hot cup of coffee
minetest.register_node("farming:coffee_cup_hot", {
	description = S("Hot Cup of Coffee"),
	drawtype = "torchlike", --"plantlike",
	tiles = {"farming_coffee_cup_hot.png"},
	inventory_image = "farming_coffee_cup_hot.png",
	wield_image = "farming_coffee_cup_hot.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(3, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 5,
	output = "farming:coffee_cup_hot",
	recipe = "farming:coffee_cup"
})

-- coffee with milk
minetest.register_node("farming:coffee_milk", {
	description = S("Coffee with Milk"),
	drawtype = "torchlike", --"plantlike",
	tiles = {"farming_coffee_milk_hot.png"},
	inventory_image = "farming_coffee_milk_hot.png",
	wield_image = "farming_coffee_milk_hot.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(3, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "farming:coffee_milk",
	type = "shapeless",
	recipe = {"farming:coffee_cup_hot", "group:food_milk"},
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
	}
})

-- caramel coffee
minetest.register_node("farming:coffee_caramel", {
	description = S("Caramel Latte"),
	drawtype = "torchlike", --"plantlike",
	tiles = {"farming_coffee_caramel_hot.png"},
	inventory_image = "farming_coffee_caramel_hot.png",
	wield_image = "farming_coffee_caramel_hot.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "farming:coffee_caramel",
	type = "shapeless",
	recipe = {
        "farming:coffee_cup_hot", "group:food_milk", "group:food_sugar",
        "farming:caramel", "group:food_cocoa"
    },
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
	}
})

-- cappuccino
minetest.register_node("farming:cappuccino", {
	description = S("Cappuccino"),
	drawtype = "torchlike", --"plantlike",
	tiles = {"farming_coffee_cappuccino_hot.png"},
	inventory_image = "farming_coffee_cappuccino_hot.png",
	wield_image = "farming_coffee_cappuccino_hot.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "farming:cappuccino",
	type = "shapeless",
	recipe = {
        "farming:coffee_cup_hot", "group:food_milk", "group:food_cocoa"
    },
    replacements = {
		{"mobs:bucket_milk", "bucket:bucket_empty"},
	}
})

-- carajillo (hot coffee with brandy)
minetest.register_node("farming:carajillo", {
	description = S("Carajillo (hot coffee with brandy)"),
	drawtype = "torchlike", --"plantlike",
	tiles = {"farming_coffee_carajillo_hot.png"},
	inventory_image = "farming_coffee_carajillo_hot.png",
	wield_image = "farming_coffee_carajillo_hot.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(4, "vessels:drinking_glass"),
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "farming:carajillo",
	type = "shapeless",
	recipe = {"farming:coffee_cup_hot", "group:food_brandy"},
})

-- coffee definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_coffee_1.png"},
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
minetest.register_node("farming:coffee_1", table.copy(def))

-- stage 2
def.tiles = {"farming_coffee_2.png"}
minetest.register_node("farming:coffee_2", table.copy(def))

-- stage 3
def.tiles = {"farming_coffee_3.png"}
minetest.register_node("farming:coffee_3", table.copy(def))

-- stage 4
def.tiles = {"farming_coffee_4.png"}
minetest.register_node("farming:coffee_4", table.copy(def))

-- stage 5 (final)
def.tiles = {"farming_coffee_5.png"}
def.groups.growing = nil
def.drop = {
	items = {
		{items = {"farming:coffee_beans 2"}, rarity = 1},
		{items = {"farming:coffee_beans 2"}, rarity = 2},
		{items = {"farming:coffee_beans 2"}, rarity = 3}
	}
}
minetest.register_node("farming:coffee_5", table.copy(def))

-- add to registered_plants
farming.registered_plants["farming:coffee"] = {
	crop = "farming:coffee",
	seed = "farming:coffee_beans",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}
