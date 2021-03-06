
local S = farming.intllib

--= A nice addition from Ademant's grain mod :)

-- Rye

farming.register_plant("farming:rye", {
	description = S("Rye seed"),
	paramtype2 = "meshoptions",
	inventory_image = "farming_rye_seed.png",
	steps = 8,
	place_param2 = 3
})

minetest.override_item("farming:rye", {
	description = S("Rye"),
	groups = {food_rye = 1, flammable = 4}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:rye", "farming:rye", "farming:rye", "farming:rye"
	},
})

-- Oats

farming.register_plant("farming:oat", {
	description = S("Oat seed"),
	paramtype2 = "meshoptions",
	inventory_image = "farming_oat_seed.png",
	steps = 8,
	place_param2 = 3
})

minetest.override_item("farming:oat", {
	description = S("Oats"),
	groups = {food_oats = 1, flammable = 4}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:oat", "farming:oat", "farming:oat", "farming:oat"
	},
})

-- Rice

farming.register_plant("farming:rice", {
	description = S("Rice grains"),
	paramtype2 = "meshoptions",
	inventory_image = "farming_rice_seed.png",
	steps = 8,
	place_param2 = 3
})

minetest.override_item("farming:rice", {
	description = S("Rice"),
	groups = {food_rice = 1, flammable = 4}
})

minetest.register_craftitem("farming:rice_bread", {
	description = S("Rice Bread"),
	inventory_image = "farming_rice_bread.png",
	on_use = minetest.item_eat(5),
	groups = {food_rice_bread = 1, flammable = 2}
})

minetest.register_craftitem("farming:rice_flour", {
	description = S("Rice Flour"),
	inventory_image = "farming_rice_flour.png",
	groups = {food_rice_flour = 1, flammable = 1}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:rice_flour",
	recipe = {
		"farming:rice", "farming:rice", "farming:rice", "farming:rice"
	},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:rice_bread",
	recipe = "farming:rice_flour"
})

-- Onigiri or rice ball
minetest.register_craftitem("farming:rice_ball", {
	description = S("Rice Ball"),
	inventory_image = "farming_rice_ball.png",
	wield_image = "farming_rice_ball.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
	output = "farming:rice_ball 2",
	recipe = {
		{"", "group:food_rice", ""},
		{"group:food_rice", "group:food_rice", "group:food_rice"},
		{"", "group:food_seaweed", ""}
	}
})

-- Multigrain flour

minetest.register_craftitem("farming:flour_multigrain", {
	description = S("Multigrain Flour"),
	inventory_image = "farming_flour_multigrain.png",
	groups = {food_flour = 1, flammable = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour_multigrain",
	recipe = {
		"farming:wheat", "farming:barley", "farming:oat", "farming:rye"
	},
})

-- Multigrain bread

minetest.register_craftitem("farming:bread_multigrain", {
	description = S("Multigrain Bread"),
	inventory_image = "farming_bread_multigrain.png",
	on_use = minetest.item_eat(7),
	groups = {food_bread = 1, flammable = 2}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:bread_multigrain",
	recipe = "farming:flour_multigrain"
})

-- Fuels

minetest.register_craft({
	type = "fuel",
	recipe = "farming:rice_bread",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:bread_multigrain",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:rye",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:oat",
	burntime = 1
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:rice",
	burntime = 1
})
