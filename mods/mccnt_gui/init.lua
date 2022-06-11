minetest.register_on_joinplayer(function(player)
	player:hud_set_hotbar_itemcount(1)

	player:hud_set_hotbar_image("blank.png")
	player:hud_set_hotbar_selected_image("blank.png")

	player:set_inventory_formspec("")

	player:get_inventory():set_stack("main", 1, ItemStack("minecraft:block"))
end)

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	return true
end)
