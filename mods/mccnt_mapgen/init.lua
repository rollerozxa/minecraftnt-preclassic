
local data = {}

local mg = {
	blocks = {
		grass = minetest.get_content_id("minecraft:grass"),
		dirt = minetest.get_content_id("minecraft:cobblestone"),
	},
	size = 128,
	depth = 64
}

if minetest.get_mapgen_setting('mg_name') == "singlenode" then

minetest.register_on_generated(function(minp, maxp, blockseed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	vm:get_data(data)

	for z = minp.z, maxp.z do
	for y = minp.y, maxp.y do
		local posi = area:index(minp.x, y, z)
		for x = minp.x, maxp.x do
			if (x >= -mg.size and x <= mg.size) and (z >= -mg.size and z <= mg.size) then
				if y >= -mg.depth and y <= -1 then
					data[posi] = mg.blocks.dirt
				elseif y == 0 then
					data[posi] = mg.blocks.grass
				end
			end

			posi = posi + 1
		end
	end end

	vm:set_data(data)
	vm:write_to_map()
end)

end
