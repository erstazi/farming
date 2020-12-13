
local S = farming.intllib

--= Sugar

minetest.register_craftitem("farming:sugar", {
	description = S("Sugar"),
	inventory_image = "farming_sugar.png",
	groups = {food_sugar = 1, flammable = 3}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "farming:sugar 2",
	recipe = "default:papyrus"
})

-- Sugar caramel

minetest.register_craftitem("farming:caramel", {
	description = S("Caramel"),
	inventory_image = "farming_caramel.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 6,
	output = "farming:caramel",
	recipe = "group:food_sugar",
})


--= Salt

minetest.register_node("farming:salt", {
	description = S("Salt"),
	inventory_image = "farming_salt.png",
	wield_image = "farming_salt.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	tiles = {"farming_salt.png"},
	groups = {food_salt = 1, vessel = 1, dig_immediate = 3,
			attached_node = 1},
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:salt",
	recipe = "bucket:bucket_water",
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

--= Rose Water

minetest.register_node("farming:rose_water", {
	description = S("Rose Water"),
	inventory_image = "farming_rose_water.png",
	wield_image = "farming_rose_water.png",
	drawtype = "plantlike",
	visual_scale = 0.8,
	paramtype = "light",
	tiles = {"farming_rose_water.png"},
	groups = {food_rose_water = 1, vessel = 1, dig_immediate = 3,
			attached_node = 1},
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	}
})

minetest.register_craft({
	output = "farming:rose_water",
	recipe = {
		{"flowers:rose", "flowers:rose", "flowers:rose"},
		{"flowers:rose", "flowers:rose", "flowers:rose"},
		{"group:water_bucket", "vessels:glass_bottle", ""},
	},
	replacements = {
		{"group:water_bucket", "bucket:bucket_empty"}
	}
})

if minetest.get_modpath("bucket_wooden") then
	minetest.register_craft({
		output = "farming:rose_water",
		recipe = {
			{"flowers:rose", "flowers:rose", "flowers:rose"},
			{"flowers:rose", "flowers:rose", "flowers:rose"},
			{"group:water_bucket_wooden", "vessels:glass_bottle"}
		},
		replacements = {
			{"group:water_bucket_wooden", "bucket_wooden:bucket_empty"}
		}
	})
end

--= Turkish Delight

minetest.register_craftitem("farming:turkish_delight", {
	description = S("Turkish Delight"),
	inventory_image = "farming_turkish_delight.png",
	groups = {flammable = 3},
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	output = "farming:turkish_delight 4",
	recipe = {
		{"group:food_gelatin", "group:food_sugar", "group:food_gelatin"},
		{"group:food_sugar", "group:food_rose_water", "group:food_sugar"},
		{"group:food_cornstarch", "group:food_sugar", "dye:pink"}
	},
	replacements = {
		{"group:food_cornstarch", "farming:bowl"},
		{"group:food_rose_water", "vessels:glass_bottle"}
	}
})

--= Garlic Bread

minetest.register_craftitem("farming:garlic_bread", {
	description = S("Garlic Bread"),
	inventory_image = "farming_garlic_bread.png",
	groups = {flammable = 3},
	on_use = minetest.item_eat(2)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:garlic_bread",
	recipe = {"group:food_toast", "group:food_garlic_clove", "group:food_garlic_clove"}
})

--= Donuts (thanks to Bockwurst for making the donut images)

minetest.register_craftitem("farming:donut", {
	description = S("Donut"),
	inventory_image = "farming_donut.png",
	on_use = minetest.item_eat(4)
})

minetest.register_craft({
	output = "farming:donut 3",
	recipe = {
		{"", "group:food_wheat", ""},
		{"group:food_wheat", "group:food_sugar", "group:food_wheat"},
		{"", "group:food_wheat", ""}
	}
})

minetest.register_craftitem("farming:donut_chocolate", {
	description = S("Chocolate Donut"),
	inventory_image = "farming_donut_chocolate.png",
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "farming:donut_chocolate",
	recipe = {
		{"group:food_cocoa"},
		{"farming:donut"}
	}
})

minetest.register_craftitem("farming:donut_apple", {
	description = S("Apple Donut"),
	inventory_image = "farming_donut_apple.png",
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "farming:donut_apple",
	recipe = {
		{"default:apple"},
		{"farming:donut"}
	}
})

--= Porridge Oats

minetest.register_craftitem("farming:porridge", {
	description = S("Porridge"),
	inventory_image = "farming_porridge.png",
	on_use = minetest.item_eat(6, "farming:bowl")
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:porridge",
	recipe = {
		"group:food_oats", "group:food_oats", "group:food_oats",
		"group:food_oats", "group:food_bowl", "group:food_milk_glass"
	},
	replacements = {
		{"mobs:glass_milk", "vessels:drinking_glass"},
		{"farming:soy_milk", "vessels:drinking_glass"}
	}
})

--= Jaffa Cake

minetest.register_craftitem("farming:jaffa_cake", {
	description = S("Jaffa Cake"),
	inventory_image = "farming_jaffa_cake.png",
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:jaffa_cake",
	recipe = {
		"group:food_egg", "group:food_sugar", "group:food_flour",
        "group:food_cocoa", "group:food_orange", "group:food_milk"
	},
    replacements = {{"mobs:bucket_milk", "bucket:bucket_empty"}}
})

-- Patatas a la importancia

minetest.register_craftitem("farming:patatas_importancia", {
    description = S("Patatas a la importancia"),
    inventory_image = "farming_patatas_importancia.png",
    on_use = minetest.item_eat(8, "farming:bowl"),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:patatas_importancia",
    recipe = {
        "farming:potato", "group:food_parsley", "farming:potato",
        "group:food_egg", "group:food_flour",  "farming:onion",
        "farming:garlic_clove", "group:food_bowl"
    },
})

-- Potato omelet

minetest.register_craftitem("farming:potato_omelet", {
    description = S("Potato omelet"),
    inventory_image = "farming_potato_omelet.png",
    on_use = minetest.item_eat(6, "farming:bowl"),
})

minetest.register_craft({
    type = "shapeless",
    output = "farming:potato_omelet",
    recipe = {"group:food_egg", "farming:potato", "group:food_onion",
              "group:food_bowl"},
})

-- Meat burger

minetest.register_craftitem("farming:burger_meat", {
	description = S("Meat Burger"),
	inventory_image = "farming_burger_meat.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:burger_meat",
	recipe = {
		"farming:bread", "group:food_meat", "group:food_cheese",
        "group:food_tomato", "group:food_cucumber", "group:food_onion",
        "group:food_lettuce"
	}
})

-- Paella

minetest.register_craftitem("farming:paella", {
	description = S("Paella"),
	inventory_image = "farming_paella.png",
	on_use = minetest.item_eat(8, "farming:bowl"),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:paella",
	recipe = {
		"group:food_rice", "dye:orange", "farming:pepper_r",
        "group:food_peas", "group:food_chicken", "group:food_bowl"
	}
})

-- Gazpacho

minetest.register_craftitem("farming:gazpacho_torta", {
	description = S("Torta de Gazpacho"),
	inventory_image = "farming_gazpacho_torta.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:gazpacho_torta",
	recipe = {"farming:salt", "farming:flour", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

minetest.register_craftitem("farming:gazpacho", {
	description = S("Gazpacho"),
	inventory_image = "farming_gazpacho.png",
	on_use = minetest.item_eat(8, "farming:bowl"),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:gazpacho",
	recipe = {
		"farming:gazpacho_torta", "group:food_garlic_clove", "farming:pepper",
        "farming:pepper_r", "group:food_parsley", "group:food_bowl"
	}
})

-- Olive oil

minetest.register_node("farming:olive_oil", {
	description = S("Olive Oil"),
	drawtype = "plantlike",
	tiles = {"olive_oil.png"},
	inventory_image = "olive_oil.png",
	wield_image = "olive_oil.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, food_oil = 1},
	sounds = default.node_sound_glass_defaults(),
    
})

minetest.register_craft({
	output = "farming:olive_oil",
	recipe = {
		{ "vessels:glass_bottle", "ethereal:olive", "ethereal:olive"},
		{ "ethereal:olive", "ethereal:olive", ""},
	}
})

-- Mayonnaise

minetest.register_node("farming:mayonnaise", {
	description = S("Mayonnaise"),
    drawtype = "plantlike",
    tiles = {"farming_mayo.png"},
	inventory_image = "farming_mayo.png",
    wield_image = "farming_mayo.png",
    paramtype = "light",
	is_ground_content = false,
	walkable = false,
	on_use = minetest.item_eat(3),
    selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.45, 0.25}
	},
    groups = {food_mayonnaise = 1, vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:mayonnaise",
	recipe = {"farming:olive_oil", "group:food_lemon",
              "group:food_egg", "farming:salt"
    },
    replacements = {{"farming:olive_oil", "vessels:glass_bottle"}}
})


-- Flan

minetest.register_craftitem("farming:flan", {
	description = S("Vanilla Flan"),
	inventory_image = "vanilla_flan.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flan",
	recipe = {
		"group:food_sugar", "group:food_milk", "farming:caramel",
        "group:food_egg", "group:food_egg", "farming:vanilla_extract"
	},
    replacements = {{"mobs:bucket_milk", "bucket:bucket_empty"}}
})


-- Russian salad
minetest.register_craftitem("farming:russian_salad", {
	description = S("Russian Salad"),
	inventory_image = "farming_russian_salad.png",
	on_use = minetest.item_eat(9, "farming:bowl"),
})

minetest.register_craft({
	output = "farming:russian_salad",
	recipe = {
		{"group:food_carrot", "group:food_peas", "farming:baked_potato"},
		{"group:food_egg", "canned_food:canned_cucumber_plus", "group:food_mayonnaise"},
		{"", "group:food_bowl", ""},
	},
    replacements = {{"canned_food:canned_cucumber_plus", "vessels:glass_bottle"}}
})

-- Heretic russian salad (spanish)
minetest.register_craftitem("farming:ensaladilla_rusa", {
	description = S("Ensaladilla Rusa"),
	inventory_image = "farming_russian_salad_2.png",
	on_use = minetest.item_eat(9, "farming:bowl"),
})

minetest.register_craft({
	output = "farming:ensaladilla_rusa",
	recipe = {
		{"group:food_carrot", "group:food_peas", "farming:baked_potato"},
		{"group:food_egg", "ethereal:pickled_olives", "group:food_mayonnaise"},
		{"group:food_tuna_canned", "group:food_bowl", "farming:olive_oil"}
	},
    replacements = {
		{"farming:olive_oil", "vessels:glass_bottle"},
		{"ethereal:tuna_canned", "ethereal:tuna_canned_empty"}
	}
})

-- Apple Pie

minetest.register_craftitem("farming:apple_pie", {
	description = S("Apple Pie"),
	inventory_image = "farming_apple_pie.png",
	on_use = minetest.item_eat(6)
})

minetest.register_craft({
	output = "farming:apple_pie",
	type = "shapeless",
	recipe = {
		"group:food_flour", "group:food_sugar",	"group:food_apple"
	}
})

-- Cactus Juice
minetest.register_node("farming:cactus_juice", {
	description = S("Cactus Juice"),
	drawtype = "plantlike",
	tiles = {"farming_cactus_juice.png"},
	inventory_image = "farming_cactus_juice.png",
	wield_image = "farming_cactus_juice.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	on_use = function(itemstack, user, pointed_thing)
		if user then
			if math.random(5) == 1 then
				return minetest.do_item_eat(-1, "vessels:drinking_glass",
						itemstack, user, pointed_thing)
			else
				return minetest.do_item_eat(2, "vessels:drinking_glass",
						itemstack, user, pointed_thing)
			end
		end
	end,
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1, drink = 1},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_craft({
	output = "farming:cactus_juice 2",
	type = "shapeless",
	recipe = {
		"vessels:drinking_glass", "vessels:drinking_glass",	"default:cactus"
	}
})

-- Pasta

minetest.register_craftitem("farming:pasta", {
	description = S("Pasta"),
	inventory_image = "farming_pasta.png",
	groups = {food_pasta = 1}
})

if minetest.get_modpath("mobs_animal") or minetest.get_modpath("xanadu")then
minetest.register_craft({
	output = "farming:pasta",
	type = "shapeless",
	recipe = {
		"group:food_flour", "group:food_butter"
	}
})
else
minetest.register_craft({
	output = "farming:pasta",
	type = "shapeless",
	recipe = {
		"group:food_flour", "group:food_oil"
	},
	replacements = {
		{"group:food_oil", "vessels:glass_bottle"}
	}
})
end

-- Spaghetti

minetest.register_craftitem("farming:spaghetti", {
	description = S("Spaghetti"),
	inventory_image = "farming_spaghetti.png",
	on_use = minetest.item_eat(8)
})

minetest.register_craft({
	output = "farming:spaghetti",
	type = "shapeless",
	recipe = {
		"group:food_pasta", "group:food_tomato",
		"group:food_garlic_clove", "group:food_garlic_clove"
	}
})

-- Korean Bibimbap

minetest.register_craftitem("farming:bibimbap", {
	description = S("Bibimbap"),
	inventory_image = "farming_bibimbap.png",
	on_use = minetest.item_eat(8, "farming:bowl")
})

if minetest.get_modpath("mobs_animal") or minetest.get_modpath("xanadu")then
minetest.register_craft({
	output = "farming:bibimbap",
	type = "shapeless",
	recipe = {
		"group:food_bowl", "group:food_egg", "group:food_rice",
		"group:food_chicken_raw", "group:food_cabbage", "group:food_carrot",
		"group:food_chili_pepper"
	}
})
else
minetest.register_craft({
	output = "farming:bibimbap",
	type = "shapeless",
	recipe = {
		"group:food_bowl", "group:food_mushroom", "group:food_rice",
		"group:food_cabbage", "group:food_carrot", "group:food_mushroom",
		"group:food_chili_pepper"
	}
})
end

-- Burger

minetest.register_craftitem("farming:burger", {
	description = S("Meat Burger"),
	inventory_image = "farming_burger_meat.png",
	on_use = minetest.item_eat(16),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:burger",
	recipe = {
		"farming:bread", "group:food_meat", "group:food_cheese",
		"group:food_tomato", "group:food_cucumber", "group:food_onion",
		"group:food_lettuce"
	}
})

-- Salad

minetest.register_craftitem("farming:salad", {
	description = S("Salad"),
	inventory_image = "farming_salad.png",
	on_use = minetest.item_eat(8, "farming:bowl")
})

minetest.register_craft({
	output = "farming:salad",
	type = "shapeless",
	recipe = {
		"group:food_bowl", "group:food_tomato", "group:food_cucumber",
		"group:food_lettuce", "group:food_oil"
	},
})

-- Triple Berry Smoothie

minetest.register_craftitem("farming:smoothie_berry", {
	description = S("Triple Berry Smoothie"),
	inventory_image = "farming_berry_smoothie.png",
	on_use = minetest.item_eat(6, "vessels:drinking_glass"),
	groups = {vessel = 1, drink = 1}
})

minetest.register_craft({
	output = "farming:smoothie_berry",
	type = "shapeless",
	recipe = {
		"group:food_raspberries", "group:food_blackberry",
		"group:food_strawberry", "group:food_banana",
		"vessels:drinking_glass"
	}
})
