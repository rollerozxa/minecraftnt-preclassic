
local blocks = {
	grass = {
		description = "Grass",
		tiles = { terrain(0) }
	},
	cobblestone = {
		description = "Cobblestone",
		tiles = { terrain(1) }
	}
}

for name, def in pairs(blocks) do
	if not def.groups then def.groups = {} end
	if not def.unbreakable then
		def.groups.instantly = 3
	end

	def.drop = ""

	def.stack_max = 1

	minetest.register_node(":minecraft:"..name, def)
end

minetest.register_craftitem(":minecraft:block", {
	inventory_image = "blank.png",
	wield_scale = {x = 0, y = 0, z = 0},
	on_place = function(itemstack, user, pointed_thing)
		local nodename = "minecraft:cobblestone"
		if pointed_thing.above.y == 0 then
			nodename = "minecraft:grass"
		end

		minetest.set_node(pointed_thing.above, { name = nodename })
	end,
	on_drop = function(itemstack, dropper, pos)
		return itemstack
	end
})

