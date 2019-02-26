
local S = farming.intllib

-- wooden bowl

minetest.register_craftitem("farming:bowl", {
	description = S("Wooden Bowl"),
	inventory_image = "farming_bowl.png",
	groups = {food_bowl = 1, flammable = 2},
})

minetest.register_craft({
	output = "farming:bowl 4",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:bowl",
	burntime = 10,
})

-- mortar and pestle

minetest.register_craftitem("farming:mortar_pestle", {
	description = S("Mortar and Pestle"),
	inventory_image = "farming_mortar_pestle.png",
	groups = {food_mortar_pestle = 1, flammable = 2},
})

minetest.register_craft({
	output = "farming:mortar_pestle",
	recipe = {
		{"default:stone", "group:stick", "default:stone"},
		{"", "default:stone", ""},
	}
})
